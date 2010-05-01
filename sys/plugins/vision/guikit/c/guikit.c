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
void basic_guikit_point(XPoint* out, int x, int y) {
  out->x = (short)x;
  out->y = (short)y;
}

void basic_guikit_arc(XArc* out, int x, int y, int width, int height, int angle1, int angle2) {
  out->x = (short)x;
  out->y = (short)y;
  out->width  = (unsigned int)width;
  out->height = (unsigned int)height;
  out->angle1 = angle1;
  out->angle2 = angle2;
}

static void basic_guikit_translate_points(void* points, int npoints, int dx, int dy) {
  int i;
  XPoint* p = ((XPoint*)points) + npoints;
  if (dx != 0 || dy != 0) {
    for (i = npoints; i --> 0;) {
      --p;
      p->x += dx;
      p->y += dy;
    }
  }
}

static void basic_guikit_translate_arcs(void* arcs, int narcs, int dx, int dy) {
  int i;
  XArc* p = ((XArc*)arcs) + narcs;
  if (dx != 0 || dy != 0) {
    for (i = narcs; i --> 0;) {
      --p;
      p->x += dx;
      p->y += dy;
    }
  }
}

void basic_guikit_drawlines(void* peer, void* points, int npoints, int dx, int dy) {
  /* Beware X server max request size! */

  basic_guikit_translate_points(points, npoints, dx, dy);
  XDrawLines(dpy, (Drawable)peer, DefaultGC(dpy, DefaultScreen(dpy)), (XPoint*)points, npoints, CoordModeOrigin);
}

void basic_guikit_fillpolygon(void* peer, void* points, int npoints, int dx, int dy) {
  /* Beware X server max request size! */

  basic_guikit_translate_points(points, npoints, dx, dy);
  XFillPolygon(dpy, (Drawable)peer, DefaultGC(dpy, DefaultScreen(dpy)), (XPoint*)points, npoints, Complex, CoordModeOrigin);
}

void basic_guikit_drawarcs(void* peer, void* arcs, int narcs, int dx, int dy) {
  /* Beware X server max request size! */

  basic_guikit_translate_arcs(arcs, narcs, dx, dy);
  XDrawArcs(dpy, (Drawable)peer, DefaultGC(dpy, DefaultScreen(dpy)), (XArc*)arcs, narcs);
}

void basic_guikit_fillarcs(void* peer, void* arcs, int narcs, int dx, int dy) {
  /* Beware X server max request size! */

  basic_guikit_translate_arcs(arcs, narcs, dx, dy);
  XFillArcs(dpy, (Drawable)peer, DefaultGC(dpy, DefaultScreen(dpy)), (XArc*)arcs, narcs);
}

