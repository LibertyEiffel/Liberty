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
#define basic_guikit_point_size sizeof(XPoint)
#define basic_guikit_arc_size sizeof(XArc)

#define basic_guikit_point_get_x(point) (((point)==NULL) ? 0 : ((XPoint*)point)->x)
#define basic_guikit_point_get_y(point) (((point)==NULL) ? 0 : ((XPoint*)point)->y)

#define basic_guikit_arc_get_x(arc)      (((arc)==NULL) ? 0 : ((XArc*)arc)->x)
#define basic_guikit_arc_get_y(arc)      (((arc)==NULL) ? 0 : ((XArc*)arc)->y)
#define basic_guikit_arc_get_width(arc)  (((arc)==NULL) ? 0 : ((XArc*)arc)->width)
#define basic_guikit_arc_get_height(arc) (((arc)==NULL) ? 0 : ((XArc*)arc)->height)
#define basic_guikit_arc_get_angle1(arc) (((arc)==NULL) ? 0 : ((XArc*)arc)->angle1)
#define basic_guikit_arc_get_angle2(arc) (((arc)==NULL) ? 0 : ((XArc*)arc)->angle2)

extern void basic_guikit_point(XPoint* out, int x, int y);
extern void basic_guikit_arc(XArc* out, int x, int y, int width, int height, int angle1, int angle2);

extern void basic_guikit_drawlines(void* peer, void* points, int npoints, int dx, int dy);
extern void basic_guikit_fillpolygon(void* peer, void* points, int npoints, int dx, int dy);
extern void basic_guikit_drawarcs(void* peer, void* arcs, int narcs, int dx, int dy);
extern void basic_guikit_fillarcs(void* peer, void* arcs, int narcs, int dx, int dy);

