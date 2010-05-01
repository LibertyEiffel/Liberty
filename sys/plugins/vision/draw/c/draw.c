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
#  ifdef VISION_DEBUG
HDC HDC_from_drawable(void *drawable){
  if (drawable)
    return((HDC)(drawable));
  else {
    printf("error, use breakpoint file=%s, line=%d\n",__FILE__,__LINE__);
    return(NULL);
  }
}
#  else
/* --TODO: remove this macro and set drawing_widget to hdc when paint? */
#    define HDC_from_drawable(drawable) (drawable)
#  endif
#endif

void basic_draw_point(void * drawable, void * style, int x1, int y1) {
#ifdef WIN32
  SetPixel(HDC_from_drawable(drawable), x1, y1, ((struct style*)style)->color);
#else
  XDrawPoint(dpy,(Drawable)drawable, (GC)style, x1, y1);
#endif
}

void basic_draw_line(void * drawable, void * style, int x1, int y1, int x2, int y2) {
#ifdef WIN32
  HDC hdc1 = HDC_from_drawable(drawable);
  HPEN pen = CreatePen(PS_SOLID, ((struct style*)style)->width, 
		       ((struct style*)style)->color);
  HGDIOBJ old_pen = SelectObject(hdc1, pen);
  MoveToEx(hdc1, x1, y1, NULL);
  LineTo(hdc1, x2, y2);
  SetPixel(hdc1, x2, y2, ((struct style*)style)->color);
  DeleteObject(SelectObject(hdc1, old_pen));
#else
  XDrawLine(dpy,(Drawable)drawable, (GC)style, x1, y1, x2, y2);
#endif
}

void basic_draw_rectangle(void * drawable, void * style, int x1, int y1, int w, int h) {
#ifdef WIN32
  HDC hdc1 = HDC_from_drawable(drawable);
  int x2 = x1 + w - 1;
  int y2 = y1 + h - 1;
  HPEN pen = CreatePen(PS_SOLID, ((struct style*)style)->width, 
		       ((struct style*)style)->color);
  HGDIOBJ old_pen = SelectObject(hdc1, pen);
  MoveToEx(hdc1, x1, y1, NULL);
  LineTo(hdc1, x2, y1);
  LineTo(hdc1, x2, y2);
  LineTo(hdc1, x1, y2);
  LineTo(hdc1, x1, y1);
  DeleteObject(SelectObject(hdc1, old_pen));
#else
  XDrawRectangle(dpy,(Drawable)drawable, (GC)style, x1, y1, w - 1, h - 1);
#endif
}

void basic_draw_arc(void * drawable, void * style, int x1, int y1, int w, int h, double a1, double a2) {
#ifdef WIN32
  HDC hdc1 = HDC_from_drawable(drawable);
  HPEN pen = CreatePen(PS_SOLID, ((struct style*)style)->width, 
		       ((struct style*)style)->color);
  HGDIOBJ old_pen = SelectObject(hdc1, pen);
  SetBkMode(hdc1, TRANSPARENT);
  Arc(hdc1, x1, y1, x1 + w, y1 + h,
      x1 + (((int)((cos(a1)+1)*w))>>1), y1 + (((int)((sin(a1)+1)*h))>>1),
      x1 + (((int)((cos(a2)+1)*w))>>1), y1 + (((int)((sin(a2)+1)*h))>>1));
  DeleteObject(SelectObject(hdc1, old_pen));
#else
  XDrawArc(dpy,(Drawable)drawable, (GC)style, x1, y1, w, h, (int)(a1*64), (int)((a2-a1)*64));
#endif
}

void basic_draw_fill_rectangle(void * drawable, void * style, int x1, int y1, int w, int h) {
#ifdef WIN32
  HDC hdc1 = HDC_from_drawable(drawable);
  RECT rect;
  HBRUSH brush = CreateSolidBrush(((struct style*)style)->color);
  rect.left = x1;
  rect.top = y1;
  rect.right = x1 + w;
  rect.bottom = y1 + h;
  vision_check_call(FillRect(hdc1, &rect, brush));
  DeleteObject(brush);
#else
  XFillRectangle(dpy,(Drawable)drawable, (GC)style, x1, y1, w, h);
#endif
}

void basic_draw_fill_arc(void * drawable, void * style, int x1, int y1, int w, int h, double a1, double a2) {
#ifdef WIN32
  HDC hdc1 = HDC_from_drawable(drawable);
  HPEN pen = CreatePen(PS_SOLID, ((struct style*)style)->width, 
		       ((struct style*)style)->color);
  HGDIOBJ old_pen = SelectObject(hdc1, pen);
  HBRUSH brush = CreateSolidBrush(((struct style*)style)->color);
  HGDIOBJ old_brush = SelectObject(hdc1, brush);
  SetBkMode(hdc1, OPAQUE);
  Arc(hdc1, x1, y1, x1 + w, y1 + h,
      x1 + (((int)((cos(a1)+1)*w))>>1), y1 + (((int)((sin(a1)+1)*h))>>1),
      x1 + (((int)((cos(a2)+1)*w))>>1), y1 + (((int)((sin(a2)+1)*h))>>1));
  DeleteObject(SelectObject(hdc1, old_pen));
  DeleteObject(SelectObject(hdc1, old_brush));
#else
  XFillArc(dpy,(Drawable)drawable, (GC)style, x1, y1, w, h, (int)(a1*64), (int)((a2-a1)*64));
#endif
}

void basic_draw_text(void * drawable, void * style, int x, int y, int base_line, int16_t*text, int length) {
#ifdef WIN32
  HDC hdc1 = HDC_from_drawable(drawable);
  HGDIOBJ old_font = SelectObject(hdc1, ((struct style*)style)->font);

  SetTextColor(hdc1, ((struct style*)style)->color);
  vision_check_call(SetBkMode(hdc1, TRANSPARENT));
  vision_check_call(TextOutW(hdc1, x, y, (WCHAR*)text, length));
  SelectObject(hdc1, old_font);
#else
  /*XDrawString(dpy,(Drawable)drawable, (GC)style, x, y, text, length);*/
  /*XmbDrawString(dpy,(Drawable)drawable,
   *XCreateFontSet(dpy,"", NULL, NULL, NULL),
   *	(GC)style, x, y, text, length);
   */
#  if BYTE_ORDER == BIG_ENDIAN
  XDrawString16(dpy,(Drawable)drawable, (GC)style, x, y+base_line, (XChar2b *)text, length);
#  else
  static uint16_t swap_buffer[1024];
  copy_swap_16((uint16_t*)text, swap_buffer, (length>1024)?1024:length);
  XDrawString16(dpy,(Drawable)drawable, (GC)style, x, y+base_line, (XChar2b *)swap_buffer, length);
#  endif
#endif
}
