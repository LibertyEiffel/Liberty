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
HGDIOBJ default_hbitmap; /* --TODO: verify it doesn't change! */
#endif

EIF_POINTER basic_pixmap_create(int w, int h, EIF_POINTER * drawable) {
#ifdef WIN32
  HBITMAP hbitmap;
  HDC screen = GetDC(NULL);

  *drawable = (EIF_POINTER)CreateCompatibleDC(screen);
  hbitmap = CreateCompatibleBitmap(screen, w, h);
  default_hbitmap = SelectObject(*drawable, hbitmap);
  ReleaseDC(NULL, screen);
  return (EIF_POINTER) hbitmap;
#else
  Pixmap image;
  image = XCreatePixmap(dpy, DefaultRootWindow(dpy), w, h, 
			DefaultDepthOfScreen(DefaultScreenOfDisplay(dpy)));
  *drawable = (EIF_POINTER) image;
  return (EIF_POINTER) image;
#endif
}

extern void basic_pixmap_free(EIF_POINTER pixmap, EIF_POINTER drawable){
#ifdef WIN32
  SelectObject((HDC)drawable, default_hbitmap);
  DeleteObject((HBITMAP)pixmap);
  DeleteDC((HDC)drawable);
#else
  XFreePixmap(dpy, (Pixmap)pixmap);
#endif
}


void basic_pixmap_draw(EIF_POINTER drawable_dest, EIF_POINTER drawable_pixmap, int src_x, int src_y, int dest_x, int dest_y, int w, int h) {
#ifdef WIN32
  BitBlt((HDC)drawable_dest, dest_x, dest_y, w, h, (HDC)drawable_pixmap, src_x, src_y, SRCCOPY);
#else
  GC gc=DefaultGC (dpy, DefaultScreen (dpy)); 
  XCopyArea(dpy,(Drawable)drawable_pixmap,(Drawable)drawable_dest, gc, src_x, src_y, w, h, dest_x, dest_y);
#endif
}
