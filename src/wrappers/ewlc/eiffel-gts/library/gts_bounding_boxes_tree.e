note
	description: "Axis-aligned bounding-box trees."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTS team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GTS_BOUNDING_BOXES_TREE
	-- TODO: require wrappping of Glib's n-ary tree. Once implemented 
	-- remove the invariant implemented: False.

	-- Axis-aligned bounding box trees can be used for
	-- intersection/collision detection using `traverse_overlapping',
	-- or to compute the minimum distance between an object and a
	-- collection of others using `point_distance', `segment_distance',
	-- `triangle_distance' or `surface_distance'.

inherit SHARED_C_STRUCT

insert 
	GTS_BOUNDING_BOXES_TREE_EXTERNALS

create {ANY}  from_external_pointer

feature {} -- Creation
	
--   GtsBBox

--  typedef struct {
--    GtsObject object;
--    gpointer bounded;
--    gdouble x1, y1, z1;
--    gdouble x2, y2, z2;
--  } GtsBBox;

--    The bounding box structure.

--     GtsObject object;  Parent object.
--     gpointer bounded;  Bounded object.
--     gdouble x1;        x coordinate of the lower-left front corner.
--     gdouble y1;        y coordinate of the lower-left front corner.
--     gdouble z1;        z coordinate of the lower-left front corner.
--     gdouble x2;        x coordinate of the upper-right back corner.
--     gdouble y2;        y coordinate of the upper-right back corner.
--     gdouble z2;        z coordinate of the upper-right back corner.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_class ()

--  GtsBBoxClass* gts_bbox_class                (void);

--     Returns :  the GtsBBoxClass.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_new ()

--  GtsBBox*    gts_bbox_new                    (GtsBBoxClass *klass,
--                                               gpointer bounded,
--                                               gdouble x1,
--                                               gdouble y1,
--                                               gdouble z1,
--                                               gdouble x2,
--                                               gdouble y2,
--                                               gdouble z2);

--     klass :    a GtsBBoxClass.
--     bounded :  the object to be bounded.
--     x1 :       x-coordinate of the lower left corner.
--     y1 :       y-coordinate of the lower left corner.
--     z1 :       z-coordinate of the lower left corner.
--     x2 :       x-coordinate of the upper right corner.
--     y2 :       y-coordinate of the upper right corner.
--     z2 :       z-coordinate of the upper right corner.
--     Returns :  a new GtsBBox.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_set ()

--  void        gts_bbox_set                    (GtsBBox *bbox,
--                                               gpointer bounded,
--                                               gdouble x1,
--                                               gdouble y1,
--                                               gdouble z1,
--                                               gdouble x2,
--                                               gdouble y2,
--                                               gdouble z2);

--    Sets fields of bbox.

--     bbox :     a GtsBBox.
--     bounded :  the object to be bounded.
--     x1 :       x-coordinate of the lower left corner.
--     y1 :       y-coordinate of the lower left corner.
--     z1 :       z-coordinate of the lower left corner.
--     x2 :       x-coordinate of the upper right corner.
--     y2 :       y-coordinate of the upper right corner.
--     z2 :       z-coordinate of the upper right corner.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_segment ()

--  GtsBBox*    gts_bbox_segment                (GtsBBoxClass *klass,
--                                               GtsSegment *s);

--     klass :    a GtsBBoxClass.
--     s :        a GtsSegment.
--     Returns :  a new GtsBBox bounding box of s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_triangle ()

--  GtsBBox*    gts_bbox_triangle               (GtsBBoxClass *klass,
--                                               GtsTriangle *t);

--     klass :    a GtsBBoxClass.
--     t :        a GtsTriangle.
--     Returns :  a new GtsBBox bounding box of t.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_surface ()

--  GtsBBox*    gts_bbox_surface                (GtsBBoxClass *klass,
--                                               GtsSurface *surface);

--     klass :    a GtsBBoxClass.
--     surface :  a GtsSurface.
--     Returns :  a new GtsBBox bounding box of surface.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_points ()

--  GtsBBox*    gts_bbox_points                 (GtsBBoxClass *klass,
--                                               GSList *points);

--     klass :    a GtsBBoxClass.
--     points :   a list of GtsPoint.
--     Returns :  a new GtsBBox bounding box of points.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_bboxes ()

--  GtsBBox*    gts_bbox_bboxes                 (GtsBBoxClass *klass,
--                                               GSList *bboxes);

--     klass :    a GtsBBoxClass.
--     bboxes :   a list of GtsBBox.
--     Returns :  a new GtsBBox bounding box of all the bounding boxes in bboxes.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_draw ()

--  void        gts_bbox_draw                   (GtsBBox *bb,
--                                               FILE *fptr);

--    Writes in file fptr an OOGL (Geomview) description of bb.

--     bb :    a GtsBBox.
--     fptr :  a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_point_is_inside()

--  #define     gts_bbox_point_is_inside(bbox, p)

--    Evaluates to TRUE if p is inside (or on the boundary) of bbox, FALSE otherwise.

--     bbox :  a GtsBBox.
--     p :     a GtsPoint.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bboxes_are_overlapping ()

--  gboolean    gts_bboxes_are_overlapping      (GtsBBox *bb1,
--                                               GtsBBox *bb2);

--     bb1 :      a GtsBBox.
--     bb2 :      a GtsBBox.
--     Returns :  TRUE if the bounding boxes bb1 and bb2 are overlapping (including just touching), FALSE
--                otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_diagonal2 ()

--  gdouble     gts_bbox_diagonal2              (GtsBBox *bb);

--     bb :       a GtsBBox.
--     Returns :  the squared length of the diagonal of bb.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_point_distance2 ()

--  void        gts_bbox_point_distance2        (GtsBBox *bb,
--                                               GtsPoint *p,
--                                               gdouble *min,
--                                               gdouble *max);

--    Sets min and max to lower and upper bounds for the square of the Euclidean distance between the object
--    contained in bb and p. For these bounds to make any sense the bounding box must be "tight" i.e. each of the
--    6 faces of the box must at least be touched by one point of the bounded object.

--     bb :   a GtsBBox.
--     p :    a GtsPoint.
--     min :  a pointer on a gdouble.
--     max :  a pointer on a gdouble.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_is_stabbed ()

--  gboolean    gts_bbox_is_stabbed             (GtsBBox *bb,
--                                               GtsPoint *p);

--     bb :       a GtsBBox.
--     p :        a GtsPoint.
--     Returns :  TRUE if the ray starting at p and ending at (+infty, p->y, p->z) intersects with bb, FALSE
--                otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bbox_overlaps_triangle ()

--  gboolean    gts_bbox_overlaps_triangle      (GtsBBox *bb,
--                                               GtsTriangle *t);

--    This is a wrapper around the fast overlap test of Tomas Akenine-Moller
--    (http://www.cs.lth.se/home/Tomas_Akenine_Moller/).

--     bb :       a GtsBBox.
--     t :        a GtsTriangle.
--     Returns :  TRUE if bb overlaps with t, FALSE otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   GtsBBTreeTraverseFunc ()

--  void        (*GtsBBTreeTraverseFunc)        (GtsBBox *bb1,
--                                               GtsBBox *bb2,
--                                               gpointer data);

--    User function called for each pair of overlapping bounding boxes. See gts_bb_tree_traverse_overlapping().

--     bb1 :   a GtsBBox.
--     bb2 :   another GtsBBox.
--     data :  user data passed to the function.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_new ()

--  GNode*      gts_bb_tree_new                 (GSList *bboxes);

--    Builds a new hierarchy of bounding boxes for bboxes. At each level, the GNode->data field contains a
--    GtsBBox bounding box of all the children. The tree is binary and is built by repeatedly cutting in two
--    approximately equal halves the bounding boxes at each level until a leaf node (i.e. a bounding box given in
--    bboxes) is reached. In order to minimize the depth of the tree, the cutting direction is always chosen as
--    perpendicular to the longest dimension of the bounding box.

--     bboxes :   a list of GtsBBox.
--     Returns :  a new hierarchy of bounding boxes.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_surface ()

--  GNode*      gts_bb_tree_surface             (GtsSurface *s);

--     s :        a GtsSurface.
--     Returns :  a new hierarchy of bounding boxes bounding the faces of s.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_overlap ()

--  GSList*     gts_bb_tree_overlap             (GNode *tree,
--                                               GtsBBox *bbox);

--     tree :     a bounding box tree.
--     bbox :     a GtsBBox.
--     Returns :  a list of bounding boxes, leaves of tree which overlap bbox.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_is_overlapping ()

--  gboolean    gts_bb_tree_is_overlapping      (GNode *tree,
--                                               GtsBBox *bbox);

--     tree :     a bounding box tree.
--     bbox :     a GtsBBox.
--     Returns :  TRUE if any leaf of tree overlaps bbox, FALSE otherwise.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_traverse_overlapping ()

--  void        gts_bb_tree_traverse_overlapping
--                                              (GNode *tree1,
--                                               GNode *tree2,
--                                               GtsBBTreeTraverseFunc func,
--                                               gpointer data);

--    Calls func for each overlapping pair of leaves of tree1 and tree2.

--     tree1 :  a bounding box tree.
--     tree2 :  a bounding box tree.
--     func :   a GtsBBTreeTraverseFunc.
--     data :   user data to be passed to func.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_draw ()

--  void        gts_bb_tree_draw                (GNode *tree,
--                                               guint depth,
--                                               FILE *fptr);

--    Write in fptr an OOGL (Geomview) description of tree for the depth specified by depth.

--     tree :   a bounding box tree.
--     depth :  a specified depth.
--     fptr :   a file pointer.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_destroy ()

--  void        gts_bb_tree_destroy             (GNode *tree,
--                                               gboolean free_leaves);

--    Destroys all the bounding boxes created by tree and destroys the tree itself. If free_leaves is set to
--    TRUE, destroys boxes given by the user when creating the tree (i.e. leaves of the tree).

--     tree :         a bounding box tree.
--     free_leaves :  if TRUE the bounding boxes given by the user are freed.

--    -----------------------------------------------------------------------------------------------------------

--   GtsBBoxDistFunc ()

--  gdouble     (*GtsBBoxDistFunc)              (GtsPoint *p,
--                                               gpointer bounded);

--    User function returning the (minimum) distance between the object defined by bounded and point p.

--     p :        a GtsPoint.
--     bounded :  an object bounded by a GtsBBox.
--     Returns :  the distance between p and bounded.

--    -----------------------------------------------------------------------------------------------------------

--   GtsBBoxClosestFunc ()

--  GtsPoint*   (*GtsBBoxClosestFunc)           (GtsPoint *p,
--                                               gpointer bounded);

--    User function returning a GtsPoint belonging to the object defined by bounded and closest to p.

--     p :        a GtsPoint.
--     bounded :  an object bounded by a GtsBBox.
--     Returns :  a GtsPoint.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_point_distance ()

--  gdouble     gts_bb_tree_point_distance      (GNode *tree,
--                                               GtsPoint *p,
--                                               GtsBBoxDistFunc distance,
--                                               GtsBBox **bbox);

--     tree :      a bounding box tree.
--     p :         a GtsPoint.
--     distance :  a GtsBBoxDistFunc.
--     bbox :      if not NULL is set to the bounding box containing the closest object.
--     Returns :   the distance as evaluated by distance between p and the closest object in tree.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_point_closest ()

--  GtsPoint*   gts_bb_tree_point_closest       (GNode *tree,
--                                               GtsPoint *p,
--                                               GtsBBoxClosestFunc closest,
--                                               gdouble *distance);

--     tree :      a bounding box tree.
--     p :         a GtsPoint.
--     closest :   a GtsBBoxClosestFunc.
--     distance :  if not NULL is set to the distance between p and the new GtsPoint.
--     Returns :   a new GtsPoint, closest point to p and belonging to an object of tree.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_segment_distance ()

--  void        gts_bb_tree_segment_distance    (GNode *tree,
--                                               GtsSegment *s,
--                                               GtsBBoxDistFunc distance,
--                                               gdouble delta,
--                                               GtsRange *range);

--    Given a segment s, points are sampled regularly on its length using delta as increment. The distance from
--    each of these points to the closest object of tree is computed using distance and the
--    gts_bb_tree_point_distance() function. The fields of range are filled with the number of points sampled,
--    the minimum, average and maximum value and the standard deviation.

--     tree :      a bounding box tree.
--     s :         a GtsSegment.
--     distance :  a GtsBBoxDistFunc.
--     delta :     spatial scale of the sampling to be used.
--     range :     a GtsRange to be filled with the results.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_triangle_distance ()

--  void        gts_bb_tree_triangle_distance   (GNode *tree,
--                                               GtsTriangle *t,
--                                               GtsBBoxDistFunc distance,
--                                               gdouble delta,
--                                               GtsRange *range);

--    Given a triangle t, points are sampled regularly on its surface using delta as increment. The distance from
--    each of these points to the closest object of tree is computed using distance and the
--    gts_bb_tree_point_distance() function. The fields of range are filled with the number of points sampled,
--    the minimum, average and maximum value and the standard deviation.

--     tree :      a bounding box tree.
--     t :         a GtsTriangle.
--     distance :  a GtsBBoxDistFunc.
--     delta :     spatial scale of the sampling to be used.
--     range :     a GtsRange to be filled with the results.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_point_closest_bboxes ()

--  GSList*     gts_bb_tree_point_closest_bboxes
--                                              (GNode *tree,
--                                               GtsPoint *p);

--     tree :     a bounding box tree.
--     p :        a GtsPoint.
--     Returns :  a list of GtsBBox. One of the bounding boxes is assured to contain the object of tree closest
--                to p.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_surface_boundary_distance ()

--  void        gts_bb_tree_surface_boundary_distance
--                                              (GNode *tree,
--                                               GtsSurface *s,
--                                               GtsBBoxDistFunc distance,
--                                               gdouble delta,
--                                               GtsRange *range);

--    Calls gts_bb_tree_segment_distance() for each edge boundary of s. The fields of range are filled with the
--    minimum, maximum and average distance. The average distance is defined as the sum of the average distances
--    for each boundary edge weighthed by their length and divided by the total length of the boundaries. The
--    standard deviation is defined accordingly. The n field of range is filled with the number of sampled points
--    used.

--     tree :      a bounding box tree.
--     s :         a GtsSurface.
--     distance :  a GtsBBoxDistFunc.
--     delta :     a sampling increment defined as the percentage of the diagonal of the root bounding box of
--                 tree.
--     range :     a GtsRange to be filled with the results.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_surface_distance ()

--  void        gts_bb_tree_surface_distance    (GNode *tree,
--                                               GtsSurface *s,
--                                               GtsBBoxDistFunc distance,
--                                               gdouble delta,
--                                               GtsRange *range);

--    Calls gts_bb_tree_triangle_distance() for each face of s. The fields of range are filled with the minimum,
--    maximum and average distance. The average distance is defined as the sum of the average distances for each
--    triangle weighthed by their area and divided by the total area of the surface. The standard deviation is
--    defined accordingly. The n field of range is filled with the number of sampled points used.

--     tree :      a bounding box tree.
--     s :         a GtsSurface.
--     distance :  a GtsBBoxDistFunc.
--     delta :     a sampling increment defined as the percentage of the diagonal of the root bounding box of
--                 tree.
--     range :     a GtsRange to be filled with the results.

--    -----------------------------------------------------------------------------------------------------------

--   gts_bb_tree_stabbed ()

--  GSList*     gts_bb_tree_stabbed             (GNode *tree,
--                                               GtsPoint *p);

--     tree :     a bounding box tree.
--     p :        a GtsPoint.
--     Returns :  a list of bounding boxes, leaves of tree which are stabbed by the ray defined by p (see
--                gts_bbox_is_stabbed()).

invariant implemented: False
end --  class GTS_BOUNDING_BOXES_TREE
