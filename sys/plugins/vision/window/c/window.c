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
const char *WINNAME="Window app"; /* --TODO: use exe name */
#endif

#ifdef WIN32
static HWND new_window_handle;
static int new_window_x, new_window_y, new_window_width, new_window_height;
static int new_window_decorate;
static void * new_window_parent;

void new_window(void) {
  /* --TODO: replace CLASSNAME with ATOM registred with GlobalAddAtom, see RegisterClass too */
  /* --TODO: add WS_CLIPCHILDREN ? WS_CLIPSIBLINGS ? */
  window_description *desc;

  if (new_window_parent)
    new_window_handle = CreateWindow(CLASSNAME, WINNAME, WS_CHILD,
				     new_window_x, new_window_y,
				     new_window_width, new_window_height,
				     (HWND)new_window_parent, NULL,
				     main_hInstance, NULL);
  else
    if (new_window_decorate)
      new_window_handle = CreateWindow(CLASSNAME, WINNAME, WS_OVERLAPPEDWINDOW,
				       CW_USEDEFAULT, CW_USEDEFAULT,
				       new_window_width + decorated_window_width_offset,
				       new_window_height + decorated_window_height_offset,
				       NULL, NULL, main_hInstance, NULL);
    else
      {
	LONG style;
      new_window_handle = CreateWindowEx(WS_EX_TOOLWINDOW, CLASSNAME, WINNAME,
					 WS_POPUP | WS_CLIPCHILDREN |
					 WS_CLIPSIBLINGS,
					 new_window_x, new_window_y,
					 new_window_width, new_window_height,
					 NULL, NULL, main_hInstance, NULL);
       style = GetWindowLong (new_window_handle, GWL_STYLE);

       /*style &= (WS_OVERLAPPED|WS_POPUP|WS_CHILD|WS_MINIMIZE|WS_VISIBLE|WS_DISABLED
	    |WS_CLIPSIBLINGS|WS_CLIPCHILDREN|WS_MAXIMIZE|WS_CAPTION|WS_BORDER
	    |WS_SYSMENU);
   SetWindowLong (new_window_handle, GWL_STYLE, style);
  SetWindowPos (new_window_handle, HWND_TOPMOST , 0, 0, 0, 0,
		 SWP_NOACTIVATE | SWP_NOMOVE |
		 SWP_NOSIZE);*/
		 }
  /*  new_window_handle = CreateWindow(CLASSNAME, WINNAME, WS_POPUP |
				       WS_CLIPCHILDREN | WS_CLIPSIBLINGS,
				       CW_USEDEFAULT, CW_USEDEFAULT,
				       new_window_width,
				       new_window_height,
				       NULL, NULL, main_hInstance, NULL);
  */
  vision_check(new_window_handle);
  if (!new_window_handle) display_error(GetLastError());
  desc = malloc(sizeof(window_description));
  desc->Current = new_window_handle;

  desc->background = CreateSolidBrush(RGB(255, 255, 255));
  vision_check(desc->background);
  desc->decorated = new_window_decorate;
  desc->parent = (new_window_parent?(window_description*)GetWindowLong((HWND)new_window_parent, GWL_USERDATA):&screen_desc);
  desc->marked = 0;
  SetWindowLong(new_window_handle, GWL_USERDATA, (long int)desc);
  /* signal work done */
  vision_check_call(ReleaseSemaphore(sem_thread_finished_work, 1, NULL));
}


void move_window(HWND window, int x, int y, int w, int h, BOOL b) {
  first_free_cmd->cmd_type = MOVE_WINDOW;
  first_free_cmd->param1 = (int)window;
  first_free_cmd->param2 = x;
  first_free_cmd->param3 = y;
  first_free_cmd->param4 = w;
  first_free_cmd->param5 = h;
  first_free_cmd->param6 = b;
  if (first_free_cmd->next == first_cmd) {
    struct cmd_list *new_cell = malloc(sizeof(struct cmd_list));
    new_cell->next = first_free_cmd->next;
    first_free_cmd->next = new_cell;
    first_free_cmd = new_cell; /* don't merge with previous line,
				* first_free_cmd is the last change done and
				* then the consumer may use this cell */
  } else {
    first_free_cmd = first_free_cmd->next;
  }
  vision_check_call(ReleaseSemaphore(sem_cmd_ready, 1, NULL));
}
#endif

void * basic_window_create(int x, int y, int width, int height, void * parent, int decorate)
{
#ifdef WIN32
  new_window_x = x;
  new_window_y = y;
  new_window_width = width;
  new_window_height = height;
  new_window_parent = parent;
  new_window_decorate = decorate;

  vision_check_call(ReleaseSemaphore(sem_new_window, 1, NULL));
  /* Wait for "ready" message from the thread */
  vision_check_call(WaitForSingleObject(sem_thread_finished_work, INFINITE) == WAIT_OBJECT_0);
  return (void *)new_window_handle;
#else
    Window      win;            /* Window ID */
    unsigned long fg, bg, bd;   /* Pixel values */
    unsigned long bw;           /* Border width */
    XSizeHints  xsh;            /* Size hints for window manager */

    /*XSetWindowAttributes attr;*/
   /*
     * Select colors for the border,  the window background,  and the
     * foreground.
     */
    bd = WhitePixel(dpy, DefaultScreen(dpy));
    bg = BlackPixel(dpy, DefaultScreen(dpy));
    fg = WhitePixel(dpy, DefaultScreen(dpy));

    /*
     * Set the border width of the window,  and the gap between the text
     * and the edge of the window, "pad".
     */
    bw = 0;

    /*
     * Deal with providing the window with an initial position & size.
     * Fill out the XSizeHints struct to inform the window manager. See
     * Sections 9.1.6 & 10.3.
     */
    xsh.flags = (PPosition | PSize);
    xsh.height = height;
    xsh.width = width;
    xsh.x = x;
    xsh.y = y; /*(DisplayHeight(dpy, DefaultScreen(dpy)) - xsh.height) / 2;*/

    /*
     * Create the Window with the information in the XSizeHints, the
     * border width,  and the border & background pixels. See Section 3.3.
     */

    /*
      DIALOG:
      XSetTransientForHint (xdisplay, xid, xparent);
    */


    win = XCreateSimpleWindow(dpy,
			      parent?(Window)parent:DefaultRootWindow(dpy),
                              xsh.x, xsh.y, xsh.width, xsh.height,
                              bw, bd, bg);
    if (!decorate) {
      XSetWindowAttributes xattributes;
      long xattributes_mask;

      xattributes.save_under = True;
      xattributes.override_redirect = True;
      xattributes.cursor = None;
      xattributes_mask = CWCursor | CWSaveUnder | CWOverrideRedirect;
      XChangeWindowAttributes(dpy, win, xattributes_mask, &xattributes);
    }
    /*
     * {
     * Atom mwmhints;
     * MwmHints hints;
     *
     * mwmhints = XInternAtom(dpy, _XA_MWM_HINTS, False);
     * hints.decorations = 0;
     * hints.flags = MWM_HINTS_DECORATIONS;
     * XChangeProperty(dpy, win, mwmhints, mwmhints, 32,
     *            PropModeReplace, (unsigned char *)&hints, 4);
     * }
     */
    /*    attr.background_pixel = bg;
	  attr.border_pixel = bd;
	  attr.backing_store = NotUseful;
	  attr.save_under = 0;
	  
	  win = XCreateWindow(dpy,
	  parent?(Window)parent:DefaultRootWindow(dpy),
	  xsh.x, xsh.y, xsh.width, xsh.height,
	  bw, CopyFromParent, CopyFromParent, CopyFromParent,CWBackPixel | CWBorderPixel | CWBackingStore | CWSaveUnder, &attr);
    */
    /*printf("Fenetre parente : %d, nouvelle fenetre : %d\n",parent,win);*/
    /*
     * Set the standard properties for the window managers. See Section
     * 9.1.
     */
    /*XSetStandardProperties(dpy, win, STRING, STRING, None, argv, argc, &xsh);
     *XSetWMHints(dpy, win, &xwmh);
     */
    /*
     * Ensure that the window's colormap field points to the default
     * colormap,  so that the window manager knows the correct colormap to
     * use for the window.  See Section 3.2.9. Also,  set the window's Bit
     * Gravity to reduce Expose events.
     */
    /* xswa.colormap = DefaultColormap(dpy, DefaultScreen(dpy));
     * xswa.bit_gravity = CenterGravity;
     * XChangeWindowAttributes(dpy, win, (CWColormap | CWBitGravity), &xswa);
     */
    /*
     * Create the GC for writing the text.  See Section 5.3.
     */
    /* gcv.font = fontstruct->fid;
     * gcv.foreground = fg;
     * gcv.background = bg;
     * gc = XCreateGC(dpy, win, (GCFont | GCForeground | GCBackground), &gcv);
     */

    /*
     * Specify the event types we're interested in.  See
     * Sections 8.5 & 8.4.5.1
     */
    XSelectInput(dpy, win, KeyPressMask|KeyReleaseMask |
		 ButtonPressMask|ButtonReleaseMask|
		 EnterWindowMask|LeaveWindowMask|
		 PointerMotionMask|
		 Button1MotionMask|Button2MotionMask|Button3MotionMask|
		 Button4MotionMask|Button5MotionMask|ButtonMotionMask|
		 KeymapStateMask|ExposureMask|VisibilityChangeMask|
		 StructureNotifyMask|
		 /*ResizeRedirectMask|*/
		 /*SubstructureNotifyMask|*/
		 /*SubstructureRedirectMask|*/
		 FocusChangeMask|PropertyChangeMask|ColormapChangeMask
		 /*|OwnerGrabButtonMask*/ );

    /*ExposureMask | KeyPressMask | ButtonPressMask
     * | EnterWindowMask | LeaveWindowMask | PointerMotionMask
     * | KeyPressMask );
     */


    if (!parent) {
      if (!atom_DELWIN)
	atom_DELWIN = XInternAtom (dpy, "WM_DELETE_WINDOW", False);
      
      /* the following fakes 'XSetWMProtocols(dpy, win, &atom_DELWIN,1);' */
      
      if (!atom_PROTOCOLS)
	atom_PROTOCOLS = XInternAtom (dpy, "WM_PROTOCOLS", False);
      
      if (atom_PROTOCOLS)
	XChangeProperty(dpy, win, atom_PROTOCOLS, XA_ATOM, 32,
			PropModeReplace, (unsigned char *) &atom_DELWIN, 1);
    }

    return (void *)win;
#endif
}

extern void * basic_window_get_drawing_widget(void *window){
#ifdef WIN32
  /* --TODO: change into macro */
  return hdc;
#else
  return window;
#endif
}

char* basic_window_get_title(void *window){
#ifdef WIN32
  char *result=NULL;
  int size = GetWindowTextLength((HWND)window);
  if (size++) {
    result = malloc(size);
    GetWindowText((HWND)window, result, size);
  }
  return result;
#else
  char *title;
  if (!XFetchName(dpy,(Window)window,&title))
    return NULL;
  else
    return title;
#endif
}

void basic_window_free_title(void *title){
#ifdef WIN32
  free(title);
#else
  XFree(title);
#endif
}

void basic_window_set_title(void *window, void *title){
#ifdef WIN32
  first_free_cmd->cmd_type = SET_TITLE;
  first_free_cmd->param1 = (int)window;
  first_free_cmd->param2 = (int)title;
  if (first_free_cmd->next == first_cmd) {
    struct cmd_list *new_cell = malloc(sizeof(struct cmd_list));
    new_cell->next = first_free_cmd->next;
    first_free_cmd->next = new_cell;
    first_free_cmd = new_cell; /* don't merge with previous line,
				* first_free_cmd is the last change done and
				* then the consumer may use this cell */
  } else {
    first_free_cmd = first_free_cmd->next;
  }
  vision_check_call(ReleaseSemaphore(sem_cmd_ready, 1, NULL));
#else
  XStoreName(dpy,(Window)window,(char *)title);
#endif
}

void basic_window_set_bg_color(void *window, void *color){
#ifdef WIN32
  /* --TODO: handle pixmap background */
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  DeleteObject (desc->background);
  desc->background = CreateSolidBrush((COLORREF)color);
  vision_check(desc->background);
#else
  XSetWindowBackground(dpy,(Window)window,(unsigned long)color);
#endif
}

void basic_window_set_bg_pixmap(void *window, void *pixmap){
#ifdef WIN32
  /* --TODO: review this function for window 95 pixmap limited to 8x8. */
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  DeleteObject (desc->background);
  desc->background = CreatePatternBrush((HBITMAP)pixmap);
  vision_check(desc->background);

#if 0
  use part of this code in basic_vision for background painting

  RECT rect;
  HBRUSH hbr;
  HDC hdc_bg;
  HBITMAP oldbitmap;

  GetClipBox (hdc, &rect);
  /*  if (version windows != 95 || (pixmap->width <= 8 && pixmap->height <= 8)) */
    {
      /* use brush only with small pixmap with Windows 95 (other version support any size).*/
      hbr = CreatePatternBrush (pixmap);
      FillRect (hdc, &rect, hbr);
      DeleteObject (hbr);
    }
    /*  else*/
    {
      /* use BitBlt */
      int i, j;
      hdc_bg = CreateCompatibleDC (hdc);
      oldbitmap = SelectObject (hdc_bg, pixmap);
      i = 0;
      /*      while (i < rect.right)
	{
	  j = 0;
	  while (j < rect.bottom)
	    {
	      if (i+pixmap->width >= rect.left && j+pixmap->height >= rect.top)
		{
		  BitBlt (hdc, i, j, pixmap->width, pixmap->height,
			  bgdc, 0, 0, SRCCOPY);
		}
	      j += pixmap->height;
	    }
	  i += pixmap->width;
	}
      */
      SelectObject (hdc_bg, oldbitmap);
      DeleteDC (hdc_bg);
    }

#endif

#else
  XSetWindowBackgroundPixmap(dpy,(Window)window,(Pixmap) pixmap);
#endif
}

void basic_window_clear_no_expose(void *window) {
  /* clear window (restore background) without expose event */
#ifdef WIN32
  HDC hdc = GetDC((HWND)window);
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  RECT area;
  vision_check_call(GetClientRect((HWND)window, &area));
  /* --TODO: handle pixmap case */
  vision_check_call(FillRect(hdc, &area, desc->background));
  vision_check_call(ReleaseDC((HWND)window, hdc));
#else
  XClearWindow(dpy,(Window)window);
#endif
}

void basic_window_clear_area_no_expose(void *window, int x, int y, int w, int h){
  /* clear area (restore background) without expose event */
#ifdef WIN32
  HDC hdc = GetDC((HWND)window);
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  RECT area;
  area.left = x;
  area.top = y;
  area.right = x + w;
  area.bottom = y + h;
  /* --TODO: handle pixmap case */
  vision_check_call(FillRect(hdc, &area, desc->background));
  vision_check_call(ReleaseDC((HWND)window, hdc));
#else
  XClearArea(dpy,(Window)window, x, y, w, h, False);
#endif
}

void basic_window_clear_area(void *window, int x, int y, int w, int h){
  /* clear window (restore background) and emit expose event on this area */
#ifdef WIN32
  first_free_cmd->cmd_type = CLEAR_AREA;
  first_free_cmd->param1 = (int)window;
  first_free_cmd->param2 = x;
  first_free_cmd->param3 = y;
  first_free_cmd->param4 = x + w;
  first_free_cmd->param5 = y + h;
  if (first_free_cmd->next == first_cmd) {
    struct cmd_list *new_cell = malloc(sizeof(struct cmd_list));
    new_cell->next = first_free_cmd->next;
    first_free_cmd->next = new_cell;
    first_free_cmd = new_cell; /* don't merge with previous line,
				* first_free_cmd is the last change done and
				* then the consumer may use this cell */
  } else {
    first_free_cmd = first_free_cmd->next;
  }
  vision_check_call(ReleaseSemaphore(sem_cmd_ready, 1, NULL));
#else
  XClearArea(dpy,(Window)window, x, y, w, h, True);
#endif
}

void basic_window_set_kbd_focus(void *window){
  /*--TODO: remove set_kbd_focus? */
#ifdef WIN32
  first_free_cmd->cmd_type = SET_FOCUS;
  first_free_cmd->param1 = (int)window;
  if (first_free_cmd->next == first_cmd) {
    struct cmd_list *new_cell = malloc(sizeof(struct cmd_list));
    new_cell->next = first_free_cmd->next;
    first_free_cmd->next = new_cell;
    first_free_cmd = new_cell; /* don't merge with previous line,
				* first_free_cmd is the last change done and
				* then the consumer may use this cell */
  } else {
    first_free_cmd = first_free_cmd->next;
  }
  vision_check_call(ReleaseSemaphore(sem_cmd_ready, 1, NULL));
#else

#endif
}

void basic_window_map(void *window) {
#ifdef WIN32
  first_free_cmd->cmd_type = MAP_WINDOW;
  first_free_cmd->param1 = (int)window;
  first_free_cmd->param2 = main_nCmdShow;
  if (first_free_cmd->next == first_cmd) {
    struct cmd_list *new_cell = malloc(sizeof(struct cmd_list));
    new_cell->next = first_free_cmd->next;
    first_free_cmd->next = new_cell;
    first_free_cmd = new_cell; /* don't merge with previous line,
				* first_free_cmd is the last change done and
				* then the consumer may use this cell */
  } else {
    first_free_cmd = first_free_cmd->next;
  }
  vision_check_call(ReleaseSemaphore(sem_cmd_ready, 1, NULL));
  /*UpdateWindow((HWND)window);*/ /* --TODO: really needed ? */
  main_nCmdShow = SW_SHOW;
#else
  XMapWindow(dpy,(Window)window);
#endif
}

void basic_window_unmap(void *window) {
#ifdef WIN32
  first_free_cmd->cmd_type = MAP_WINDOW;
  first_free_cmd->param1 = (int)window;
  first_free_cmd->param2 = SW_HIDE;
  if (first_free_cmd->next == first_cmd) {
    struct cmd_list *new_cell = malloc(sizeof(struct cmd_list));
    new_cell->next = first_free_cmd->next;
    first_free_cmd->next = new_cell;
    first_free_cmd = new_cell; /* don't merge with previous line,
				* first_free_cmd is the last change done and
				* then the consumer may use this cell */
  } else {
    first_free_cmd = first_free_cmd->next;
  }
  vision_check_call(ReleaseSemaphore(sem_cmd_ready, 1, NULL));
#else
  XUnmapWindow(dpy,(Window)window);
#endif
}

void basic_window_set_geometry(void *window,int x, int y, int w, int h){
#ifdef WIN32
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  if (desc->decorated)
    move_window((HWND)window, x - decorated_window_x_offset,
		y - decorated_window_y_offset,
		w + decorated_window_width_offset,
		h + decorated_window_height_offset, TRUE);
  else
    move_window((HWND)window, x, y, w, h, TRUE);
#else
  XMoveResizeWindow(dpy, (Window)window, x, y, w, h);
#endif
}
     
void basic_window_set_requisition(void *window, int min_w, int min_h, int max_w, int max_h){
#ifdef WIN32
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  desc->min_width = min_w + decorated_window_width_offset;
  desc->max_width = max_w + decorated_window_width_offset;
  desc->min_height = min_h + decorated_window_height_offset;
  desc->max_height = max_h + decorated_window_height_offset;
#else
  XSizeHints hints;
  hints.flags = PMinSize|PMaxSize;
  hints.min_width = min_w;
  hints.max_width = max_w;
  hints.min_height = min_h;
  hints.max_height = max_h;
  XSetWMNormalHints(dpy, (Window)window, &hints);
#endif
}

void basic_window_set_position(void *window, int x, int y){
#ifdef WIN32
  RECT size;
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  vision_check_call(GetClientRect((HWND)window, &size));
  if (desc->decorated)
    move_window((HWND)window, x - decorated_window_x_offset,
		y - decorated_window_y_offset,
		size.right + decorated_window_width_offset,
		size.bottom + decorated_window_height_offset, TRUE);
  else
    move_window((HWND)window, x, y, size.right, size.bottom, TRUE);
#else
  XMoveWindow(dpy, (Window)window, x, y);
#endif
}
   
void basic_window_set_size(void *window,int x, int y, int width, int height){
#ifdef WIN32
  window_description *desc = (window_description*)GetWindowLong((HWND)window, GWL_USERDATA);
  if (desc->decorated)
    move_window((HWND)window, x - decorated_window_x_offset,
		y - decorated_window_y_offset,
		width + decorated_window_width_offset,
		height + decorated_window_height_offset, TRUE);
  else
    move_window((HWND)window, x, y, width, height, TRUE);
#else
  XResizeWindow(dpy, (Window)window, width, height);
#endif
}
