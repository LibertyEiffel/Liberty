indexing
	description: "External calls for GTS_BOUNDING_BOX"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_BOUNDING_BOX_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
-- #define GTS_BBOX_CLASS (klass)
-- #define GTS_BBOX (obj)
-- #define GTS_IS_BBOX (obj)
-- GtsBBoxClass;
-- GtsBBox;

	gts_bbox_class (void): POINTER is
			--  GtsBBoxClass* gts_bbox_class (void);
		external "C use <gts.h>"
		end

	gts_bbox_new (klass, bounded_ptr: POINTER; x1, y1, z1, x2, y2, z2: REAL): POINTER is
			-- GtsBBox* gts_bbox_new (GtsBBoxClass *klass, gpointer
			-- bounded, gdouble x1, gdouble y1, gdouble z1, gdouble x2,
			-- gdouble y2, gdouble z2);
		external "C use <gts.h>"
		end

	gts_bbox_set (a_bbox, bounded_ptr: POINTER; x1, y1, z1, x2, y2, z2: REAL) is
			-- void gts_bbox_set (GtsBBox *bbox, gpointer bounded,
			-- gdouble x1, gdouble y1, gdouble z1, gdouble x2, gdouble
			-- y2, gdouble z2);
		external "C use <gts.h>"
		end

	gts_bbox_segment (klass, a_gtssegment: POINTER): POINTER is
			--  GtsBBox* gts_bbox_segment (GtsBBoxClass *klass, GtsSegment *s);
		external "C use <gts.h>"
		end
	
	gts_bbox_triangle (klass, a_gtstriangle: POINTER): POINTER is
			--  GtsBBox* gts_bbox_triangle (GtsBBoxClass *klass, GtsTriangle *t);
		external "C use <gts.h>"
		end

	gts_bbox_surface (klass, a_gtssurface: POINTER): POINTER is
			-- GtsBBox* gts_bbox_surface (GtsBBoxClass *klass, GtsSurface
			-- *surface);
		external "C use <gts.h>"
		end
	
	gts_bbox_points (klass, some_points: POINTER): POINTER is
			--  GtsBBox* gts_bbox_points (GtsBBoxClass *klass, GSList *points);
		external "C use <gts.h>"
		end
	
	gts_bbox_bboxes (klass, some_bboxes: POINTER): POINTER is
			--  GtsBBox* gts_bbox_bboxes (GtsBBoxClass *klass, GSList *bboxes);
		external "C use <gts.h>"
		end
	
	gts_bbox_draw (a_bb, a_fptr: POINTER) is
			--  void gts_bbox_draw (GtsBBox *bb, FILE *fptr);
		external "C use <gts.h>"
		end
	
	gts_bbox_point_is_inside (bbox, p: POINTER): INTEGER is
			-- #define gts_bbox_point_is_inside (bbox, p)
		external "C macro use <gts.h>"
		end

	gts_bboxes_are_overlapping (a_bb1, a_bb2: POINTER): INTEGER is
			--  gboolean gts_bboxes_are_overlapping (GtsBBox *bb1, GtsBBox *bb2);
		external "C use <gts.h>"
		end

	gts_bbox_diagonal2 (a_bb: POINTER): REAL is
			--  gdouble gts_bbox_diagonal2 (GtsBBox *bb);
		external "C use <gts.h>"
		end
	
	gts_bbox_point_distance2 (a_bb, a_p, a_double_min, a_double_max: POINTER) is
			-- void gts_bbox_point_distance2 (GtsBBox *bb, GtsPoint *p,
			-- gdouble *min, gdouble *max);
		external "C use <gts.h>"
		end
	
	gts_bbox_is_stabbed (a_bb, a_gtspoint: POINTER): INTEGER is
			--  gboolean gts_bbox_is_stabbed (GtsBBox *bb, GtsPoint *p);
		external "C use <gts.h>"
		end

	gts_bbox_overlaps_triangle (a_bb, a_gtstriangle: POINTER): INTEGER is
			--  gboolean gts_bbox_overlaps_triangle (GtsBBox *bb, GtsTriangle *t);
		external "C use <gts.h>"
		end
	
	-- void (*GtsBBTreeTraverseFunc) (GtsBBox *bb1, GtsBBox *bb2, gpointer data);
	
	gts_bb_tree_new (some_bboxes): POINTER is
			--  GNode* gts_bb_tree_new (GSList *bboxes);
		external "C use <gts.h>"
		end

  gts_bb_tree_surface (GtsSurface *s): POINTER is
			--  GNode* gts_bb_tree_surface (GtsSurface *s);
		external "C use <gts.h>"
		end

  gts_bb_tree_overlap (GNode *tree, GtsBBox *bbox): POINTER is
			--  GSList* gts_bb_tree_overlap (GNode *tree, GtsBBox *bbox);
		external "C use <gts.h>"
		end

 gboolean gts_bb_tree_is_overlapping (GNode *tree, GtsBBox *bbox) is
			--  gboolean gts_bb_tree_is_overlapping (GNode *tree, GtsBBox *bbox);
		external "C use <gts.h>"
		end

 void gts_bb_tree_traverse_overlapping
 (GNode *tree1, GNode *tree2, GtsBBTreeTraverseFunc func, gpointer data) is
			--  (GNode *tree1, GNode *tree2, GtsBBTreeTraverseFunc func, gpointer data);
		external "C use <gts.h>"
		end

 void gts_bb_tree_draw (GNode *tree, guint depth, FILE *fptr) is
			--  void gts_bb_tree_draw (GNode *tree, guint depth, FILE *fptr);
		external "C use <gts.h>"
		end

 void gts_bb_tree_destroy (GNode *tree, gboolean free_leaves) is
			--  void gts_bb_tree_destroy (GNode *tree, gboolean free_leaves);
		external "C use <gts.h>"
		end


 gdouble (*GtsBBoxDistFunc) (GtsPoint *p, gpointer bounded) is
			--  gdouble (*GtsBBoxDistFunc) (GtsPoint *p, gpointer bounded);
		external "C use <gts.h>"
		end

  (*GtsBBoxClosestFunc) (GtsPoint *p, gpointer bounded): POINTER is
			--  GtsPoint* (*GtsBBoxClosestFunc) (GtsPoint *p, gpointer bounded);
		external "C use <gts.h>"
		end

 gdouble gts_bb_tree_point_distance (GNode *tree, GtsPoint *p, GtsBBoxDistFunc distance, GtsBBox **bbox) is
			--  gdouble gts_bb_tree_point_distance (GNode *tree, GtsPoint *p, GtsBBoxDistFunc distance, GtsBBox **bbox);
		external "C use <gts.h>"
		end

  gts_bb_tree_point_closest (GNode *tree, GtsPoint *p, GtsBBoxClosestFunc closest, gdouble *distance): POINTER is
			--  GtsPoint* gts_bb_tree_point_closest (GNode *tree, GtsPoint *p, GtsBBoxClosestFunc closest, gdouble *distance);
		external "C use <gts.h>"
		end

 void gts_bb_tree_segment_distance (GNode *tree, GtsSegment *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range) is
			--  void gts_bb_tree_segment_distance (GNode *tree, GtsSegment *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end

 void gts_bb_tree_triangle_distance (GNode *tree, GtsTriangle *t, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range) is
			--  void gts_bb_tree_triangle_distance (GNode *tree, GtsTriangle *t, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end

 GSList* gts_bb_tree_point_closest_bboxes
 (GNode *tree, GtsPoint *p) is
			--  (GNode *tree, GtsPoint *p);
		external "C use <gts.h>"
		end

 void gts_bb_tree_surface_boundary_distance
 (GNode *tree, GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range) is
			--  (GNode *tree, GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end

 void gts_bb_tree_surface_distance (GNode *tree, GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range) is
			--  void gts_bb_tree_surface_distance (GNode *tree, GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end


  gts_bb_tree_stabbed (GNode *tree, GtsPoint *p): POINTER is
			--  GSList* gts_bb_tree_stabbed (GNode *tree, GtsPoint *p);
		external "C use <gts.h>"
		end


feature -- size

	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsBBox)"
		end
end
