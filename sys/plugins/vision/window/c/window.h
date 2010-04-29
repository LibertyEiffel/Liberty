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
extern void new_window(void);

typedef struct window_description_s window_description;
struct window_description_s {
  HWND Current;
  HBRUSH background;
  HBITMAP background_pixmap; /* if non-void, use this pixmap for background 
				painting. Useful for Win95 only */
  struct window_description_s *parent;
  int marked;
  int min_width;
  int max_width;
  int min_height;
  int max_height;
  int decorated;
};

extern window_description screen_desc;

#  define basic_window_root_id NULL
#else
#  define basic_window_root_id ((void*)DefaultRootWindow(dpy))
#endif


extern void * basic_window_create(int x, int y, int width, int height, void * parent, int decorate);

extern void * basic_window_get_drawing_widget(void *window);

extern char* basic_window_get_title(void *window);

extern void basic_window_free_title(void *title);

extern void basic_window_set_title(void *window, void *title);

extern void basic_window_set_bg_color(void *window, void *color);

extern void basic_window_set_bg_pixmap(void *window, void *pixmap);

extern void basic_window_clear_no_expose(void *window);

extern void basic_window_clear_area_no_expose(void *window, int x, int y, int w, int h);

extern void basic_window_clear_area(void *window, int x, int y, int w, int h);

extern void basic_window_set_kbd_focus(void *window);

extern void basic_window_map(void *window);

extern void basic_window_unmap(void *window);

extern void basic_window_set_geometry(void *window,int x, int y, int w, int h);
     
extern void basic_window_set_requisition(void *window, int min_w, int min_h, int max_w, int max_h);

extern void basic_window_set_position(void *window, int x, int y);
   
extern void basic_window_set_size(void *window, int x, int y, int width, int height);
