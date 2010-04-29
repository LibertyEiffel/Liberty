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
void *basic_font_new(char *font_name){
#ifdef WIN32
  /* --TODO: font creation */
  return (void *)GetStockObject(SYSTEM_FONT);
#else
  return (void *)XLoadFont (dpy, font_name);
#endif
}
/*
--   c_inline_c("{GContext gc;XFontStruct *font;%N%
--      %gc=XGContextFromGC(DefaultGC(dpy,DefaultScreen(dpy)));%N%
--      %font=XQueryFont(dpy,gc); R = font;}%N");
*/

int basic_font_exist(void * desc){
#ifdef WIN32
  printf("Not yet implemented, file=%s, line=%d\n",__FILE__,__LINE__);
  exit(0);
  return 0;
#else
  char ** N;int v;
  N = XListFonts(dpy, desc, 1,&v);
  XFreeFontNames(N);
  return N != NULL;
#endif
}

void * basic_font_properties(void * font_id){
  /* --TODO: memory management */
#ifdef WIN32
  TEXTMETRIC *tm = malloc(sizeof(TEXTMETRIC));

  /* --TODO: optimize ! */
  HDC hdc = CreateCompatibleDC(NULL);
  SelectObject(hdc, (HFONT)font_id);
  GetTextMetrics(hdc, tm);
  DeleteDC(hdc);

  return tm;
#else
  return XQueryFont(dpy,(Font)font_id);
#endif
}

int basic_font_height(void *f){
#ifdef WIN32
  return ((TEXTMETRIC *)f)->tmHeight+((TEXTMETRIC *)f)->tmExternalLeading;
#else
  /* --TODO: use XFontStruct fields ?*/
  int a,b,c;XCharStruct xcs;
  XTextExtents((XFontStruct*)f,"ff",2,&a,&b,&c,&xcs); /* --TODO:CHECK the text */
  return b+c;
#endif
}

int basic_font_ascent(void *f){
#ifdef WIN32
  return ((TEXTMETRIC *)f)->tmAscent+((TEXTMETRIC *)f)->tmExternalLeading;
#else
  /* --TODO: use field ascent */
  int a,b,c;XCharStruct xcs;
  XTextExtents((XFontStruct*)f,"",0,&a,&b,&c,&xcs);
  return b;
#endif
}

int basic_font_text_width(void *f, void * font_id, void *str, int size){
#ifdef WIN32
  SIZE res;
  /* --TODO: optimize ! */
  HDC hdc = CreateCompatibleDC(NULL);
  SelectObject(hdc, (HFONT)font_id);
  GetTextExtentPoint32W(hdc, str, size, &res);
  DeleteDC(hdc);

  return res.cx;
#else
#  if BYTE_ORDER == BIG_ENDIAN
  return XTextWidth16((XFontStruct*)f, (XChar2b*)str, size);
#  else
  static uint16_t swap_buffer[1024];
  copy_swap_16((uint16_t*)str, swap_buffer, (size>1024)?1024:size);
  return XTextWidth16((XFontStruct*)f, (XChar2b*)swap_buffer, size);
#  endif
#endif
}
