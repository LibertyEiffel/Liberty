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
EIF_POINTER basic_image_create(int w, int h, int d, void *data, EIF_POINTER * drawable) {
#ifdef WIN32
#else

#if 0
  XImage *image;
  image = calloc(1,sizeof(XImage));
  if (image == NULL) {
    fprintf(stderr,"Not enough memory for malloc\n");
    exit(1);
  }
  image->width = w;
  image->height = h;
  image->format = XYPixmap;
  image->data = data;
  image->byte_order = LSBFirst; /* ????????????? */
  image->bitmap_unit = d;
  image->bitmap_bit_order = MSBFirst;
  image->bitmap_pad = 32;
  image->depth = d;
  /*  image->bytes_per_line = w * (d>>3);*/
  if (!XInitImage(image)) {
    fprintf(stderr,"XInitImage error\n");
    exit(1);
  }
  printf("bytes_per_line = %d\n",image->bytes_per_line);
  *drawable = (EIF_POINTER)image;
  return (EIF_POINTER)image;
#else
  
#endif
  XImage *image;
  image = XCreateImage(dpy, DefaultVisual(dpy,DefaultScreen (dpy)), d,
		       ZPixmap, 0, data, w, h, 32, 0);
  if (image == NULL) {fprintf(stderr,"XCreateImage failed\n");exit(1);}
  /*  image->bitmap_bit_order = MSBFirst;
      image->byte_order = MSBFirst;*/
  return image;
#endif
}

void basic_image_draw(void * d, XImage *img, int x, int y, int w, int h) {
#ifdef WIN32
#else
  GC gc=DefaultGC (dpy, DefaultScreen (dpy)); 
  XPutImage(dpy, (Drawable)d, gc, img, 0, 0, x, y, w, h);
#endif
}
