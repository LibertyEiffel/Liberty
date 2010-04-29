/*
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2005: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
*/
#ifdef WIN32
HINSTANCE main_hInstance;
int main_nCmdShow;
const char *CLASSNAME="Vision window";
MSG last_message;
HDC hdc;
HWND hwnd;
PAINTSTRUCT paintstruct;
RECT windowRect;
DWORD message_thread_id;
DWORD main_thread_id;
static HANDLE message_thread_handle;
int decorated_window_x_offset;
int decorated_window_y_offset;
int decorated_window_width_offset;
int decorated_window_height_offset;
HANDLE sem_paint;
HANDLE sem_new_window;
HANDLE sem_thread_finished_work;
HANDLE sems_wait_end_paint[3];
#  ifndef WM_MOUSELEAVE
#    define WM_MOUSELEAVE	0x2a3
#  endif
#  define WM_MOUSEENTER	(WM_USER + 5)
HWND pointer_window=NULL;
int button_swapped;

/* This list is a ring. It is "empty" when first_message == first_free. */
/* empty means "no message enqueued". Cells remains to avoid malloc/free. */ 
/* Used for messages sent from the message's thread to the main thread. */
struct message_list {struct message_list * next; MSG msg;};
volatile static struct message_list *first_message;
volatile static struct message_list *first_free;

/* This list is a ring. It is "empty" when first_cmd == first_free_cmd. */
/* empty means "no message enqueued". Cells remains to avoid malloc/free. */ 
/* Used for commands sent from the main thread to the message's thread. */
volatile struct cmd_list *first_cmd;
volatile struct cmd_list *first_free_cmd;
HANDLE sem_cmd_ready;
HANDLE sems_wait_cmd[2];
window_description screen_desc;

#else
#  include <X11/Xcms.h>
Display *dpy;            /* X server connection */
int red_mask, green_mask, blue_mask;
int red_shift, blue_shift, green_shift;
XEvent last_event;
int vision_error_handler(Display *disp, XErrorEvent *err);
Atom atom_DELWIN = 0;
Atom atom_PROTOCOLS = 0;
#endif

#ifdef WIN32
static DWORD WINAPI MessageCallBackThread(LPVOID unused);

static void vision_handler(se_handler_action_t action, void *data) {
  switch(action) {
  case SE_HANDLE_NO_MORE_MEMORY:
  case SE_HANDLE_RUNTIME_ERROR:
  case SE_HANDLE_DIE_WITH_CODE:
  case SE_HANDLE_NORMAL_EXIT:
    CloseHandle(message_thread_handle);
  }
}

static void run_first_cmd(void) {
  vision_check(first_cmd != first_free_cmd); /* non empty list */
  switch (first_cmd->cmd_type) {
  case SET_TITLE:
    if (!*(char*)first_cmd->param2)
      vision_check_call(SetWindowText ((HWND)first_cmd->param1, " "));
  else
    vision_check_call(SetWindowText ((HWND)first_cmd->param1,
				     (char *)first_cmd->param2));
    break;
  case CLEAR_AREA:
    vision_check_call(InvalidateRect((HWND)first_cmd->param1,
				      (RECT*)(&(first_cmd->param2)), TRUE));
    break;
  case MAP_WINDOW:
    ShowWindow((HWND)(first_cmd->param1), first_cmd->param2);
    break;
  case MOVE_WINDOW:
    vision_check_call(MoveWindow((HWND)first_cmd->param1, 
				  first_cmd->param2, first_cmd->param3,
				  first_cmd->param4, first_cmd->param5,
				  first_cmd->param6));
    break;
  case SET_FOCUS:
    vision_check_call(SetFocus((HWND)first_cmd->param1));
    break;
  }
  first_cmd = first_cmd->next;
}

void emit_event(int event, HWND window) {
  MSG *msg = (MSG*)&(first_free->msg);
  
  msg->hwnd = window;
  msg->message = event;
  msg->time = timeGetTime();
  vision_check_call(GetCursorPos(&(msg->pt)));
  if (first_free->next == first_message) {
    struct message_list *new_cell = malloc(sizeof(struct message_list));
    new_cell->next = first_free->next;
    first_free->next = new_cell;
    first_free = new_cell; /* don't merge with previous line, first_free
			    * is the last change done and
			    * then the consumer may use this cell */
  } else {
    first_free = first_free->next;
  }
  vision_check_call(ReleaseSemaphore(sem_msg_ready, 1, NULL));
}

static void generate_leave_enter_events(window_description* from,
					window_description* to){
  if (to->marked) {
    /* End recursivity case */
    window_description* wnd = from;
    to->marked = 0;
    if (wnd) {
      while(wnd->marked) {
	emit_event(WM_MOUSELEAVE, wnd->Current);
	wnd->marked = 0;
	wnd = wnd->parent;
      };
      wnd = wnd->parent;
    }
    while(wnd) {
      wnd->marked = 0;
      wnd = wnd->parent;
    };
  } else {
    /* recursive call */
    generate_leave_enter_events(from, to->parent);
    emit_event(WM_MOUSEENTER, to->Current);
  }
}



static DWORD WINAPI MessageCallBackThread(LPVOID unused) {
  /* --TODO: ExitThread ? CloseHandle in the main thread ? */
  MSG local_message;
  BOOL status;
  
  /* Send "ready" message */
  vision_check_call(PostThreadMessage(main_thread_id, WM_USER+2, 0, 0));

  while(1){
    status = MsgWaitForMultipleObjects(2, sems_wait_cmd, FALSE,
				       INFINITE, QS_ALLINPUT);
    if (status == WAIT_OBJECT_0 + 2) {
      while(PeekMessage(&local_message, NULL, 0, 0, PM_REMOVE))
	DispatchMessage(&local_message);
    } else if (status == WAIT_OBJECT_0) {
      run_first_cmd();
    } else {
      vision_check(status == WAIT_OBJECT_0 + 1);
      /* Request to create new window */
      new_window();
    }
  }
  return 0;
}

void display_error(int num) {
  LPVOID lpMsgBuf;

  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM, NULL, num, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), (LPTSTR) &lpMsgBuf, 0, NULL);
  MessageBox(NULL, lpMsgBuf, "GetLastError", MB_OK|MB_ICONINFORMATION);
  LocalFree(lpMsgBuf);
}

LRESULT CALLBACK WndProc(HWND hWnd, unsigned int iMessage, WPARAM wParam, LPARAM lParam)
{
  MSG * msg;

  switch (iMessage) {
  case WM_SIZING:
    {
      int edge = wParam;
      RECT *rect = (LPRECT)lParam;
      window_description *desc = (window_description*)GetWindowLong((HWND)hWnd, GWL_USERDATA);
      int width = rect->right - rect->left;
      int height = rect->bottom - rect->top;
      
      if (edge % 3 == 1) { /* Left border control */
	if (width < desc->min_width)
	  rect->left -= (desc->min_width - width);
	else if (width > desc->max_width)
	  rect->left += (width - desc->max_width);
      } else if (edge % 3 == 2) { /* Right border control */
	if (width < desc->min_width)
	  rect->right += (desc->min_width - width);
	else if (width > desc->max_width)
	  rect->right -= (width - desc->max_width);
      }
      
      if (edge >= 6) { /* Bottom border control */
	if (height < desc->min_height)
	  rect->bottom += (desc->min_height - height);
	else if (height > desc->max_height)
	  rect->bottom -= (height - desc->max_height);
      } else if (edge >= 3) { /* Top border control */
	if (height < desc->min_height)
	  rect->top -= (desc->min_height - height);
	else if (height > desc->max_height)
	  rect->top += (height - desc->max_height);
      }
      
      return TRUE;
    }
  case WM_ERASEBKGND:
    return 0;
  case WM_PAINT:
    hwnd = hWnd;
    hdc = BeginPaint(hWnd, &paintstruct);
    vision_check(hdc);
    break;
    /* no return !!! */
  case WM_MOUSEMOVE:
    if (hWnd != pointer_window) {
      window_description* from=NULL;
      window_description* to;
      RECT rect;
      vision_check_call(GetClientRect(hWnd, &rect));
      if (!(LOWORD(lParam)<0 || LOWORD(lParam)>=rect.right || HIWORD(lParam)<0 || HIWORD(lParam)>=rect.bottom)) {      
	if (pointer_window) {
	  window_description* wnd;
	  from = wnd = (window_description*)GetWindowLong((HWND)pointer_window,
							  GWL_USERDATA);
	  do {
	    wnd->marked = 1;
	    wnd = wnd->parent;
	  } while (wnd);
	} else
	  screen_desc.marked = 1;
	to = (window_description*)GetWindowLong(hWnd, GWL_USERDATA);
	generate_leave_enter_events(from, to);
	pointer_window = hWnd;
      }
    } else {
      RECT rect;
      vision_check_call(GetClientRect(hWnd, &rect));
      if (LOWORD(lParam)<0 || LOWORD(lParam)>=rect.right || HIWORD(lParam)<0 || HIWORD(lParam)>=rect.bottom)
	{
	  window_description* wnd;
	  wnd = (window_description*)GetWindowLong((HWND)pointer_window,
						   GWL_USERDATA);
	  emit_event(WM_MOUSELEAVE, hWnd);
	  pointer_window = wnd->parent->Current; 
	}
    }
    break;
    /* no return !!! */
  case WM_KILLFOCUS: /* --TODO: it's keyboard focus. Useful ? */
    break;
    /* no return !!! */
  case WM_NCACTIVATE:
    if ((BOOL)wParam)
      return DefWindowProc(hWnd, iMessage, wParam, lParam);
    else
      return TRUE;
  case WM_ACTIVATE:
   if (LOWORD(wParam))
      return DefWindowProc(hWnd, iMessage, wParam, lParam);
    else {
      window_description* desc;
      desc = (window_description*)GetWindowLong((HWND) lParam, GWL_USERDATA);
      /* --TODO: check if this window belongs to this program instead of just testing if desc is not null (list all toplevel windows?) */
      if (!desc || desc->decorated) {
	DefWindowProc(hWnd, WM_NCACTIVATE, FALSE, lParam);
	return DefWindowProc(hWnd, iMessage, wParam, lParam);
      } else
	return FALSE;
   }
  case WM_LBUTTONDOWN:
  case WM_MBUTTONDOWN:
  case WM_RBUTTONDOWN:
    SetCapture(hWnd);
    break;
    /* no return !!! */
  case WM_LBUTTONUP:
  case WM_MBUTTONUP:
  case WM_RBUTTONUP:
    ReleaseCapture();
    break;
    /* no return !!! */
  case WM_MOUSEWHEEL:
    {
      /* Search window under mouse cursor and convert coordinates */
      POINT p;
      p.x = (short) LOWORD(lParam);
      p.y = (short) HIWORD(lParam);
      hWnd = WindowFromPoint(p);
      ScreenToClient(hWnd, &p);
      lParam = POINTTOPOINTS(p);
    }
    break;
    /* no return !!! */
  case WM_KEYDOWN:
  case WM_KEYUP:
  case WM_SETFOCUS:
  case WM_SHOWWINDOW:
  case WM_CLOSE:
  case WM_QUIT:
  case WM_DESTROY:
  case WM_MOVE:
  case WM_SIZE:
    break;
  default:
    return DefWindowProc(hWnd, iMessage, wParam, lParam);
  }
  msg = (MSG*)&(first_free->msg);
  
  msg->hwnd = hWnd;
  msg->message = iMessage;
  msg->wParam = wParam;
  msg->lParam = lParam;
  msg->time = timeGetTime();
  vision_check_call(GetCursorPos(&(msg->pt)));
  
  if (first_free->next == first_message) {
    struct message_list *new_cell = malloc(sizeof(struct message_list));
    new_cell->next = first_free->next;
    first_free->next = new_cell;
    first_free = new_cell; /* don't merge with previous line, first_free
			    * is the last change done and
			    * then the consumer may use this cell */
  } else {
    first_free = first_free->next;
  }
  vision_check_call(ReleaseSemaphore(sem_msg_ready, 1, NULL));
  if (iMessage == WM_PAINT) {
    int status;
    
    /* Wait for "endpaint" message from appli */
    do {
      status = WaitForMultipleObjects(3, sems_wait_end_paint,
				      FALSE, INFINITE);
      vision_check(status != WAIT_FAILED);
      if (status == WAIT_OBJECT_0 + 2) {
	run_first_cmd();
      } else if (status == WAIT_OBJECT_0 + 1) {
	/* Request to create new window */
	new_window();
      }
    } while (status != WAIT_OBJECT_0);
    EndPaint(hWnd, &paintstruct);
    hwnd = NULL;
    hdc = NULL;
  }
  return 0;
}
#else
int vision_error_handler(Display *disp, XErrorEvent *err) {
  char buf[128];

  /* in case the error occurred during the Grab command... */
  XUngrabServer(disp);
  XUngrabButton(disp, (unsigned int) AnyButton, 0, DefaultRootWindow(disp));
  se_print_run_time_stack();
  XGetErrorText(disp, err->error_code, buf, 128);
  fprintf(SE_ERR,"X Error: %s.\n",buf);
  fprintf(SE_ERR,"  Major Opcode:  %d\n",err->request_code);
    
  exit(-1);
}
#endif

#ifndef WIN32
int higher_bit(int val) {
  int i=0;
  while (val >= 0) {
    val = val << 1;
    i++;
  }
  return 32-i;
}
#endif

int _basic_vision_init(void) {
#ifdef WIN32

  WNDCLASS WndClass;
  NONCLIENTMETRICS ncm;

  main_hInstance = (HINSTANCE)GetModuleHandle(NULL);
  main_nCmdShow = SW_SHOWDEFAULT; /* First window display mode: minimized, normal, 
			     * maximized, hide, ... */

  /* Initialize the lists to empty state. */
  first_message = first_free = malloc(sizeof(struct message_list));
  first_free->next = (struct message_list *)first_message;
  first_cmd = first_free_cmd = malloc(sizeof(struct cmd_list));
  first_free_cmd->next = (struct cmd_list *)first_cmd;
  sem_paint = CreateSemaphore(NULL, 0, 1, NULL);
  sem_new_window = CreateSemaphore(NULL, 0, 1, NULL);
  sem_thread_finished_work = CreateSemaphore(NULL, 0, 1, NULL);
  sem_msg_ready = CreateSemaphore(NULL, 0, INT32_MAX, NULL);
  sem_cmd_ready = CreateSemaphore(NULL, 0, INT32_MAX, NULL);
  sems_wait_end_paint[0] = sem_paint;
  sems_wait_end_paint[1] = sem_new_window;
  sems_wait_end_paint[2] = sem_cmd_ready;
  sems_wait_cmd[0] = sem_cmd_ready;
  sems_wait_cmd[1] = sem_new_window;
  screen_desc.Current = NULL;
  screen_desc.parent = NULL;
  button_swapped = GetSystemMetrics(SM_SWAPBUTTON);
  vision_check(sem_paint);
  vision_check(sem_new_window);
  vision_check(sem_msg_ready);
  vision_check(sem_cmd_ready);
  
  ncm.cbSize = sizeof(ncm);
  vision_check_call(SystemParametersInfo(SPI_GETNONCLIENTMETRICS,
					  sizeof(ncm), &ncm, 0));
  decorated_window_x_offset = GetSystemMetrics(SM_CXFRAME);
  decorated_window_width_offset = 2* decorated_window_x_offset;
  decorated_window_y_offset = ncm.iCaptionHeight+decorated_window_x_offset+1;
  decorated_window_height_offset = decorated_window_y_offset + decorated_window_x_offset;

  main_thread_id = GetCurrentThreadId();
  message_thread_handle = CreateThread(NULL,100 /* ??? */,
				       MessageCallBackThread,
				       NULL, 0, &message_thread_id);
  vision_check(message_thread_handle);
  vision_check(message_thread_id);

  /* Wait for "ready" message from the thread */
  vision_check_call(GetMessage(&last_message, NULL, WM_USER+2, WM_USER+2));
  register_handler(vision_handler);
  memset(&WndClass, 0, sizeof(WndClass));
  WndClass.cbClsExtra = 0;
  WndClass.cbWndExtra = sizeof(window_description *); /* extra bytes allocated for window instance <= 40 for Win95, advice: no more than 4 */
  WndClass.hbrBackground = GetStockObject(BLACK_BRUSH);
  WndClass.hCursor = LoadCursor(NULL, IDC_ARROW);
  WndClass.hIcon = LoadIcon(main_hInstance, NULL);
  WndClass.hInstance = main_hInstance;
  WndClass.lpfnWndProc = WndProc;
  WndClass.lpszClassName = CLASSNAME;
  WndClass.style = CS_HREDRAW | CS_VREDRAW; /* --TODO: 0 to suppress complete redraw on WM_SIZE and WM_MOVE */ /* use CS_PARENTDC? */
  if(!RegisterClass(&WndClass))
    exit(0);

  return -1;
#else
    Visual *visual;
    /*
     * Open the display using the $DISPLAY environment variable to locate
     * the X server.  See Section 2.1.
     */
    if ((dpy = XOpenDisplay(NULL)) == NULL) {
        fprintf(stderr, "Can't open \"%s\"\n", XDisplayName(NULL));
	return (0);
    }
#  ifdef VISION_DEBUG
    XSynchronize(dpy, True);
#  endif
    XSetErrorHandler(vision_error_handler);

    visual = DefaultVisual(dpy,DefaultScreen(dpy));
    red_mask = visual->red_mask;
    green_mask = visual->green_mask;
    blue_mask = visual->blue_mask;
    if (red_mask) {
      red_shift = higher_bit(red_mask) - 16;
      blue_shift = higher_bit(blue_mask) - 16;
      green_shift = higher_bit(green_mask) - 16;
    }

    return(ConnectionNumber(dpy));
#endif
}

int _basic_vision_character() {
  /* --TODO: unicode result ! */
  int res;

#ifdef WIN32
  char chars[2];
  unsigned char keystate[256];
  GetKeyboardState(keystate);
  ToAscii((int)last_message.wParam,(HIWORD(last_message.lParam)) & 0xFF,
	  keystate,(LPWORD)chars,0);
  res = (int)chars[0];
#else
  XKeyEvent* key_event = (XKeyEvent*)&last_event;
  char r;

  if(XLookupString(key_event, &r, 1, NULL, NULL))
    res = (int)r;
  else
    res= 0;
#endif
  return res;
}

int _basic_vision_key() {
  int res;

#ifdef WIN32
  res = _basic_vision_character();
#else
  XKeyEvent* key_event = (XKeyEvent*)&last_event;

  res = (int)XKeycodeToKeysym(dpy, key_event->keycode, 0);
  if(res == NoSymbol)
    res = 0;
#endif
  return res;
}

int basic_vision_get_keysym(char* string) {
  int res = 0;
#ifdef WIN32
#else
  res = (int)XStringToKeysym(string);
  if(res == NoSymbol)
	  res = 0;
#endif
  return res;
}

#ifdef WIN32
static int exist_message(UINT type, HWND window) {
  struct message_list *msg = (struct message_list *)first_message;

  while (msg != first_free)
    {
      if ((msg->msg.message == type) && (msg->msg.hwnd == window))
	return 1;
      msg = msg->next;
    }
  return 0;
}
#endif

static int get_next_event(void);
int _basic_vision_next_event(void) {
  int result;
  while((result=get_next_event())==-2);
  return result;
}

static int get_next_event(void) {
  /* return event number, -1 if no event is available, -2 if new call to
   * this function is needed. */
#ifdef WIN32
  if (last_message.message==WM_PAINT) {
    SetBkMode(hdc, TRANSPARENT);
    TextOut(hdc, 0, 0, " ", 1); /* THIS IS AWFUL HACK FOR WINDOWS 2000 */
    /* --TODO: search if some "flushing" is required for Windows 2000 */
    vision_check_call(ReleaseSemaphore(sem_paint, 1, NULL));
    last_message.message = -1;
  }
  if (first_message != first_free){ /* non empty list */
    last_message = first_message->msg;
    first_message = first_message->next;
    vision_check_call(WaitForSingleObject(sem_msg_ready, INFINITE) == WAIT_OBJECT_0); /* never wait, only decrease sem value here */
  } else {
    return -1;
  }
  /*printf("Message %d received\n",last_message.message);*/
  switch (last_message.message)
    {
    case WM_KEYDOWN:
      last_message.hwnd = pointer_window;
      return 2;
    case WM_KEYUP:
      last_message.hwnd = pointer_window;
      return 3;
    case WM_MOUSEENTER:
      return 7;
    case WM_MOUSELEAVE:
      return 8;
    case WM_SETFOCUS: /* --TODO: it's keyboard focus. Useful ? */
      return -2; /*9*/
    case WM_KILLFOCUS:  /* --TODO: it's keyboard focus. Useful ? */
      return -2; /*10*/
    case WM_PAINT:
      if (paintstruct.fErase)
	{
	  window_description *desc = (window_description*)GetWindowLong((HWND)last_message.hwnd, GWL_USERDATA);
	  /* --TODO: handle pixmap case */
	  vision_check_call(FillRect(hdc, &(paintstruct.rcPaint),
				      desc->background));
	}
      return 12;
      /* unmaped ? */
    case WM_SHOWWINDOW:
      return 19;
    case WM_LBUTTONDOWN:
      return 40;
    case WM_MBUTTONDOWN:
      return 41;
    case WM_RBUTTONDOWN:
      return 42;
    case WM_MOUSEWHEEL:
      return ((short)HIWORD(last_message.wParam)>0)?43:44; /* --TODO: 120 value...*/
    case WM_LBUTTONUP:
      return 50;
    case WM_MBUTTONUP:
      return 51;
    case WM_RBUTTONUP:
      return 52;
      /* fully_visible ? */
      /* partially_visible ? */
      /* not_visible ? */
    case WM_CLOSE:
      /* user requested to close the window, call DestroyWindow if agree */
      return 63;
    case WM_QUIT:
      /* application requested to terminate via PostQuitMessage */
      printf("Quit !!! \n");
      return 63;
    case WM_DESTROY:
      /* window is being destroyed. --TODO:process clipboard ! */
      printf("Destroy !!! \n");
      return 63;
    case WM_MOUSEMOVE:
      return 100;
    case WM_MOVE:
      /* --TODO: remove ? */
      if (exist_message(WM_MOVE, last_message.hwnd)) return -2;
      windowRect.left = (int) LOWORD(last_message.lParam);
      windowRect.top = (int) HIWORD(last_message.lParam);
      return 102;
    case WM_SIZE:
      /* --TODO: remove ? */
      if (exist_message(WM_SIZE, last_message.hwnd)) return -2;
      windowRect.right = (int) LOWORD(last_message.lParam);
      windowRect.bottom = (int) HIWORD(last_message.lParam);
      return 103;
    case 280:
      DefWindowProc(last_message.hwnd, last_message.message, last_message.wParam, last_message.lParam);
      return -2; /* ??????? */
    default:
      fprintf(stderr,"Event number %d not handled.\n", last_message.message);
      DefWindowProc(last_message.hwnd, last_message.message, last_message.wParam, last_message.lParam);
      return -2;
    }
#else
  XEvent peek;

  /*  if (XEventsQueued(dpy,QueuedAlready)) { */
  /*if (XEventsQueued(dpy,QueuedAfterReading)) { */
  if (XEventsQueued(dpy,QueuedAfterFlush)) {
    XNextEvent(dpy,&last_event);
    switch (last_event.type)
      {
      case 4:
	/* For button press, events 40, 41, ... */
	return 39+((XButtonEvent*)&last_event)->button;
      case 5:
	/* For button release, events 50, 51, ... */
	return 49+((XButtonEvent*)&last_event)->button;
      case 6:
	return 100;
      case 7:
	if (((XCrossingEvent*)&last_event)->detail == NotifyInferior)
	  return -2;
	else
	  return 7;
      case 8:
	if (((XCrossingEvent*)&last_event)->detail == NotifyInferior)
	  return -2;
	else
	  return 8;
      case 9:
      case 10:
	((XFocusChangeEvent*)&last_event)->window = DefaultRootWindow(dpy);
	return(last_event.type);
      case 15:
	return 60+((XVisibilityEvent*)&last_event)->state;
      case 22:
	while (XCheckTypedWindowEvent(dpy, last_event.xany.window,
				      22, &last_event))
	  ;
	return 101;
	/*      case 25:
	 *{
	 *XResizeRequestEvent*e=(XResizeRequestEvent*)&last_event;
	 *printf("Request : %d, %d\n",e->width,e->height); 
	 *XResizeWindow(dpy, e->window, e->width, (e->height+4)&~7);
	 *}
	 *
	 *return 25;
	 */
      case 33: /* ClientMessage */
	if ((((XClientMessageEvent*)&last_event)->message_type==atom_PROTOCOLS)
	    &&
	    (((XClientMessageEvent *)&last_event)->data.l[0] == atom_DELWIN)) {
	  /* it's a WM_DELETE_WINDOW event */
	  return 63;
	}

	return 33;
      case 3:
	if(XPending(dpy)) {
         /* If the next event is a KeyPressed, than we have a repeat */
          XPeekEvent(dpy, &peek);
          if(peek.type == 2 && peek.xkey.keycode == last_event.xkey.keycode && peek.xkey.time == last_event.xkey.time) {
            XNextEvent(dpy, &peek);
            return 2;
          }
	  return 3;
	}
      default:
	if (last_event.type >= LASTEvent) {
	  return 110; /* Extension */
	} else {
	  return last_event.type;
	}
      }
  } else return -1;
#endif
}


#ifndef WIN32
/* X help function */
struct color_dist{
  int index; /* color index in colormap */
  int distance; /* distance from searched color */
};

static int color_cmp(const void* a, const void* b) {
  return (((struct color_dist *)a)->distance - ((struct color_dist *)b)->distance);
}

#define nb_col 256 /* visual dependant ? */

static void * search_X_color(int *r, int *g, int *b) { 
  static XColor * c_map = NULL;
  static struct color_dist * distances = NULL;
  XColor *xcol;
  int status;
  int i;
  int x, y, z;
  int rmean;

  if (!c_map) c_map = malloc(nb_col*sizeof(XColor));
  if (!distances) distances = malloc(nb_col*sizeof(struct color_dist));
  for (i=0; i<nb_col; i++) c_map[i].pixel=i;
  XQueryColors(dpy, DefaultColormap(dpy,DefaultScreen(dpy)), c_map, nb_col);
  for (i=0; i<nb_col; i++) {
    distances[i].index=i;
    rmean = (*r + c_map[i].red)>>5;
    x=(*r - c_map[i].red)>>4;
    y=(*g - c_map[i].green)>>4;
    z=(*b - c_map[i].blue)>>4;
    distances[i].distance=(((((8192+rmean)*x)>>10)*x)>>2) + 4*y*y + (((((12287-rmean)*z)>>10)*z)>>2);
  }
  qsort(distances, nb_col, sizeof(struct color_dist), color_cmp);
  /*  printf("searched : %d %d %d, found : %d %d %d\n",*r >> 8, *g >> 8, *b >> 8, c_map[distances->index].red >> 8, c_map[distances->index].green >> 8, c_map[distances->index].blue >> 8); */
  
  for (status=0, i=0; (status==0) && (i<nb_col); i++) {
    xcol = c_map+distances[i].index;
    status = XAllocColor(dpy,DefaultColormap(dpy,DefaultScreen(dpy)), xcol);
  }
  if (!status) fprintf(stderr, "ERROR: unable to use color...\n");
  *r = xcol->red; 
  *g = xcol->green; 
  *b = xcol->blue; 
  return (void*)xcol->pixel;
}


static int search_X_color2(int *r, int *g, int *b) { 
  static XcmsColor * c_map = NULL;
  static XColor * rgb_c_map = NULL;
  static struct color_dist * distances = NULL;
  XcmsColor search;
  XColor xcol;
  int status;
  int i;

  if (!distances) distances = malloc(nb_col*sizeof(struct color_dist));
  if (!c_map) {
    c_map = malloc(nb_col*sizeof(XcmsColor));
    for (i=0; i<nb_col; i++) c_map[i].pixel=i;
    XcmsQueryColors(dpy, DefaultColormap(dpy,DefaultScreen(dpy)), c_map, nb_col, XcmsTekHVCFormat);
  }
  if (!rgb_c_map) {
    rgb_c_map = malloc(nb_col*sizeof(XColor));
    for (i=0; i<nb_col; i++) rgb_c_map[i].pixel=i;
    XQueryColors(dpy, DefaultColormap(dpy,DefaultScreen(dpy)), rgb_c_map, nb_col);
  }

  search.format = XcmsRGBFormat;
  search.spec.RGB.red = *r;
  search.spec.RGB.green = *g;
  search.spec.RGB.blue = *b;
  printf("rgb %d %d %d  ", *r, *g, *b);
  XcmsConvertColors(XcmsDefaultCCC(dpy,DefaultScreen(dpy)),&search,1,XcmsTekHVCFormat,NULL);
  printf("hvc %f %f %f  ", search.spec.TekHVC.H, search.spec.TekHVC.V, search.spec.TekHVC.C);
  for (i=0; i<nb_col; i++) {
    float d=0;
    distances[i].index=i;
    d = abs(search.spec.TekHVC.H - c_map[i].spec.TekHVC.H);
    if (d>180) d = 360.0 - d;
    if (d<0) exit(0);
    d = d * abs(search.spec.TekHVC.C)/10;
    d += abs(search.spec.TekHVC.C - c_map[i].spec.TekHVC.C);
    d += abs(search.spec.TekHVC.V - c_map[i].spec.TekHVC.V);
    distances[i].distance = (int)d;
  }
  qsort(distances, nb_col, sizeof(struct color_dist), color_cmp);
  for (status=0, i=0; (status==0) && (i<nb_col); i++) {
    /*    xcol = c_map[distances[i].index];
    xcol.format = XcmsTekHVCFormat;
    status = XcmsAllocColor(dpy,DefaultColormap(dpy,DefaultScreen(dpy)), &xcol,XcmsRGBFormat);*/
    xcol = rgb_c_map[distances[i].index];
    status = XAllocColor(dpy,DefaultColormap(dpy,DefaultScreen(dpy)), &xcol);

  }
  i--;
  printf("d = %d, i = %d, hvc %f %f %f  ",distances[i].distance, i, c_map[distances[i].index].spec.TekHVC.H, c_map[distances[i].index].spec.TekHVC.V, c_map[distances[i].index].spec.TekHVC.C);
  if (!status) fprintf(stderr, "ERROR: unable to use color...\n");
  /*  *r = xcol.spec.RGB.red; 
  *g = xcol.spec.RGB.green; 
  *b = xcol.spec.RGB.blue; */
  *r = xcol.red; 
  *g = xcol.green; 
  *b = xcol.blue; 
  printf("rgb %d %d %d\n", *r, *g, *b); 
  return xcol.pixel;
}

static void * get_color_from_server(int *r, int *g, int *b) { 
  XColor xcol;
  int status;
  xcol.red = *r;
  xcol.green = *g;
  xcol.blue = *b;

  status = XAllocColor(dpy,DefaultColormap(dpy,DefaultScreen(dpy)),&xcol);
  *r = xcol.red;
  *g = xcol.green;
  *b = xcol.blue;
  if (status)
    return (void*)(xcol.pixel);
  else{
    xcol.red = (((int)(((*r>>8) + 25)/51))*51)<<8;
    xcol.green = (((int)(((*g>>8) + 25)/51))*51)<<8;
    xcol.blue = (((int)(((*b>>8) + 25)/51))*51)<<8;
    status = XAllocColor(dpy,DefaultColormap(dpy,DefaultScreen(dpy)),&xcol);
    if (status)
      return (void*)(xcol.pixel);
    else
      return search_X_color(r, g, b);
  }
}
#endif


void *basic_vision_get_color(int *r, int *g, int *b) {
#ifdef WIN32
  return (void*)RGB((*r>>8), (*g>>8), (*b>>8));
#else
   if (red_mask)
    return (void*)(long)((((red_shift>0)?(*r)<<red_shift:(*r)>>-red_shift)&red_mask) |
      (((green_shift>0)?(*g)<<green_shift:(*g)>>-green_shift)&green_mask) | 
      (((blue_shift>0)?(*b)<<blue_shift:(*b)>>-blue_shift)&blue_mask));
  else
    return get_color_from_server(r, g, b);
#endif
}

/*
XGrabPointer(dpy, win, 0, ButtonPressMask|ButtonReleaseMask|EnterWindowMask|LeaveWindowMask| PointerMotionMask|Button1MotionMask|Button2MotionMask|Button3MotionMask|Button4MotionMask|Button5MotionMask|ButtonMotionMask, GrabModeAsync, GrabModeAsync, None , None, 0)
*/

int vision_available(void) {
#ifdef WIN32
  return 1;
#else
  return getenv("DISPLAY") != NULL;
#endif
}
