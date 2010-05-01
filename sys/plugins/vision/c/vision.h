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
#  include <winuser.h>
#  include <mmsystem.h>  /* needed for timeGetTime() */
void vision_init(void);
#  ifndef WM_MOUSEWHEEL
#    define WM_MOUSEWHEEL 0x20A
#  endif
#else
#  include <X11/Xlib.h>
#  include <X11/Xutil.h>
#  include <X11/Xatom.h>
#endif

#ifndef VISION_DEBUG
#  define vision_check_call(x) (x)
#  define vision_check(x)
#else

/* Executes x; if it returns zero, exits. */
#define vision_check_call(x) \
  do { \
    if (!(x)) { \
      fprintf(stderr, "Call failed line %d in %s (call was: \"%s\")\n", __LINE__, __FILE__, #x); exit(1); \
    } \
  } while (0)

/* If x is non-zero, exits. */
#define vision_check(x) \
  do { \
    if (!(x)) { \
      fprintf(stderr, "Check failed line %d in %s (test was: \"%s\")\n", __LINE__, __FILE__, #x); exit(1); \
    } \
  } while (0)

#endif


#define basic_vision_init          _basic_vision_init()
#define basic_vision_next_event    _basic_vision_next_event()
#define basic_vision_character     _basic_vision_character()
#define basic_vision_key           _basic_vision_key()
extern int _basic_vision_init(void);
extern int _basic_vision_next_event(void);
extern int _basic_vision_character(void);
extern int basic_vision_get_keysym(char*);
extern void *basic_vision_get_color(int *r, int *g, int *b);

#ifdef WIN32
  extern HDC hdc;
  extern const char *CLASSNAME;
  extern HINSTANCE main_hInstance;
  extern int main_nCmdShow;
  extern MSG last_message;
  extern HANDLE sem_thread_finished_work;
  extern HANDLE sem_new_window;
  extern void display_error(int num);
  enum commands {CREATE_WINDOW = 1, SET_TITLE, CLEAR_AREA, MAP_WINDOW, MOVE_WINDOW, SET_FOCUS};
  struct cmd_list {struct cmd_list * next; enum commands cmd_type; int param1; int param2; int param3; int param4; int param5; int param6;};
  extern volatile struct cmd_list *first_cmd;
  extern volatile struct cmd_list *first_free_cmd;
  extern HANDLE sem_cmd_ready;

  /* paint message informations */
  extern PAINTSTRUCT paintstruct;

  extern RECT windowRect; /* new window size definition */
  extern DWORD message_thread_id;
  extern int decorated_window_x_offset;
  extern int decorated_window_y_offset;
  extern int decorated_window_width_offset;
  extern int decorated_window_height_offset;

#  define basic_vision_real_event     (last_message.message)
#  define basic_vision_flush          ((void)0)
#  define basic_vision_display_width  (GetSystemMetrics(SM_CXSCREEN))
#  define basic_vision_display_height (GetSystemMetrics(SM_CYSCREEN))
#  define basic_vision_event_widget ((void *)(last_message.hwnd))
#  define basic_vision_pointer_x      ((short)LOWORD(last_message.lParam))
#  define basic_vision_pointer_y      ((short)HIWORD(last_message.lParam))
#  define basic_vision_pointer_x_root (last_message.pt.x)
#  define basic_vision_pointer_y_root (last_message.pt.y)
#  define basic_vision_event_time     (last_message.time)
#  define basic_vision_expose_x       (paintstruct.rcPaint.left)
#  define basic_vision_expose_y       (paintstruct.rcPaint.top)
#  define basic_vision_expose_width   (paintstruct.rcPaint.right-paintstruct.rcPaint.left)
#  define basic_vision_expose_height  (paintstruct.rcPaint.bottom-paintstruct.rcPaint.top)
#  define basic_vision_geometry_x      (windowRect.left)
#  define basic_vision_geometry_y      (windowRect.top)
#  define basic_vision_geometry_width  (windowRect.right)
#  define basic_vision_geometry_height (windowRect.bottom)
#  define basic_vision_geometry_border (GetSystemMetrics(SM_CXBORDER)) /* --TODO: X and Y may have different values */
#  define basic_vision_is_left_down    (GetAsyncKeyState(button_swapped?VK_RBUTTON:VK_LBUTTON)>>15)
#  define basic_vision_is_middle_down  (GetAsyncKeyState(VK_MBUTTON)>>15)
#  define basic_vision_is_right_down   (GetAsyncKeyState(button_swapped?VK_LBUTTON:VK_RBUTTON)>>15)

#  define basic_vision_extension_device_id (fprintf(stderr, "No extension currently available for Windows.\n"))

extern int button_swapped;

#else
  extern Display *dpy;            /* X server connection */
  extern XEvent last_event;

  extern Atom atom_DELWIN;
  extern Atom atom_PROTOCOLS;

#  define basic_vision_real_event      (last_event.type)
#  define basic_vision_flush           XFlush(dpy)
#  define basic_vision_display_width   (DisplayWidth(dpy,DefaultScreen(dpy)))
#  define basic_vision_display_height  (DisplayHeight(dpy,DefaultScreen(dpy)))
#  define basic_vision_event_widget    ((void *)(last_event.xany.window))
#  define basic_vision_pointer_x       (((XButtonEvent*)&last_event)->x)
#  define basic_vision_pointer_y       (((XButtonEvent*)&last_event)->y)
#  define basic_vision_pointer_x_root  (((XButtonEvent*)&last_event)->x_root)
#  define basic_vision_pointer_y_root  (((XButtonEvent*)&last_event)->y_root)
#  define basic_vision_event_time      (((XButtonEvent*)&last_event)->time)
#  define basic_vision_expose_x        (((XExposeEvent*)&last_event)->x)
#  define basic_vision_expose_y        (((XExposeEvent*)&last_event)->y)
#  define basic_vision_expose_width    (((XExposeEvent*)&last_event)->width)
#  define basic_vision_expose_height   (((XExposeEvent*)&last_event)->height)
#  define basic_vision_geometry_x      (((XConfigureEvent*)&last_event)->x)
#  define basic_vision_geometry_y      (((XConfigureEvent*)&last_event)->y)
#  define basic_vision_geometry_width  (((XConfigureEvent*)&last_event)->width)
#  define basic_vision_geometry_height (((XConfigureEvent*)&last_event)->height)
#  define basic_vision_geometry_border (((XConfigureEvent*)&last_event)->border_width)
#  define basic_vision_is_left_down    ((((XCrossingEvent*)&last_event)->state & Button1Mask) != 0 )
#  define basic_vision_is_middle_down  ((((XCrossingEvent*)&last_event)->state & Button2Mask) != 0 )
#  define basic_vision_is_right_down   ((((XCrossingEvent*)&last_event)->state & Button3Mask) != 0 )

/* For X Input extension */
#  define basic_vision_extension_device_id (((XMotionEvent*)&last_event)->root) /* TRICK (should be deviceid of Device Events */

#endif

int vision_available(void);
