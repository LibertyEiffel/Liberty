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
void * _basic_style_new(void) {
#ifdef WIN32
  struct style * result = malloc(sizeof(struct style));

  result->color = RGB(0, 0, 0);
  result->width = 0;
  result->font = GetStockObject(SYSTEM_FONT);

  return (void *)result;
#else
  /* GC R;
   * XGCValues val;
   */
  return XCreateGC(dpy, DefaultRootWindow (dpy), 0, NULL);
  /* XGetGCValues(dpy, DefaultGC(dpy,DefaultScreen(dpy)), GCFont, &val);
   * basic_style_set_font(R, (void *)(val.font));
   * return R;
   */
#endif
}

void basic_style_set_color(void * style, void * color) {
#ifdef WIN32
  ((struct style*)style)->color = (COLORREF)color;
#else
  XGCValues val;
  val.foreground = (unsigned long)color;
  XChangeGC(dpy, style, GCForeground, &val);
#endif
}

void basic_style_set_line_width(void * style, int width) {
#ifdef WIN32
  ((struct style*)style)->width = width;
#else
  XGCValues val;
  val.line_width = (width > 1) ? width : 0;
  XChangeGC(dpy, style, GCLineWidth, &val);
#endif
}

void basic_style_set_font(void * style, void * font) {
#ifdef WIN32
  ((struct style*)style)->font = (HFONT)font;
#else
  XGCValues val;
  val.font = (Font)font;
  XChangeGC(dpy, style, GCFont, &val);
  /*XSetFont(dpy, style, (Font)font);*/
#endif
}

void basic_style_free(void * style) {
#ifdef WIN32
  free(style);
#else
  XFreeGC(dpy, style);
#endif
}

