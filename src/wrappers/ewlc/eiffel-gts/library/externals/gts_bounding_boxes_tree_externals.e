note
	description: "External calls for GTS_BOUNDING_BOXES_TREE"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_BOUNDING_BOXES_TREE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gts_bbox_class: POINTER is
			-- GtsBBoxClass* gts_bbox_class (void);
		external "C use <gts.h>"
		end

	gts_bbox_new (a_klass, a_bounded: POINTER;  a_x1, a_y1, a_z1, a_x2, a_y2, a_z2: REAL): POINTER is
			-- GtsBBox* gts_bbox_new (GtsBBoxClass *klass, gpointer
			-- bounded, gdouble x1, gdouble y1, gdouble z1, gdouble x2,
			-- gdouble y2, gdouble z2);
		external "C use <gts.h>"
		end

	gts_bbox_set (a_bbox, a_bounded: POINTER; a_x1, a_y1, a_z1, a_x2, a_y2, a_z2: REAL) is
			-- void gts_bbox_set (GtsBBox *bbox, gpointer bounded,
			-- gdouble x1, gdouble y1, gdouble z1, gdouble x2, gdouble
			-- y2, gdouble z2);
		external "C use <gts.h>"
		end
	
	gts_bbox_segment (a_class, a_s: POINTER): POINTER is
			-- GtsBBox* gts_bbox_segment (GtsBBoxClass *klass, GtsSegment
			-- *s);
		external "C use <gts.h>"
		end

	gts_bbox_triangle (a_class, a_t: POINTER): POINTER is
			-- GtsBBox* gts_bbox_triangle (GtsBBoxClass *klass,
			-- GtsTriangle *t);
		external "C use <gts.h>"
		end

	gts_bbox_surface (a_class, a_surface: POINTER): POINTER is
			-- GtsBBox* gts_bbox_surface (GtsBBoxClass *klass, GtsSurface
			-- *surface);
		external "C use <gts.h>"
		end

	gts_bbox_points (a_class, a_points: POINTER): POINTER is
			-- GtsBBox* gts_bbox_points (GtsBBoxClass *klass, GSList
			-- *points);
		external "C use <gts.h>"
		end

	gts_bbox_bboxes (a_class, a_bboxes: POINTER): POINTER is
			-- GtsBBox* gts_bbox_bboxes (GtsBBoxClass *klass, GSList *bboxes);
		external "C use <gts.h>"
		end

	gts_bbox_draw (a_bb, a_fptr: POINTER) is
			-- void gts_bbox_draw (GtsBBox *bb, FILE *fptr);
		external "C use <gts.h>"
		end

	gts_bbox_point_is_inside (bbox, p: POINTER): INTEGER is
		-- #define gts_bbox_point_is_inside (bbox, p)
		external "C macro use <gts.h>"
		end

	gts_bboxes_are_overlapping (a_bb1, a_bb2: POINTER): INTEGER is
			-- gboolean gts_bboxes_are_overlapping (GtsBBox *bb1, GtsBBox
			-- *bb2);
		external "C use <gts.h>"
		end

	gts_bbox_diagonal2 (a_bb: POINTER): REAL is
			-- gdouble gts_bbox_diagonal2 (GtsBBox *bb);
		external "C use <gts.h>"
		end

	gts_bbox_point_distance2 (a_bb, a_p, a_min, a_max: POINTER) is
			-- void gts_bbox_point_distance2 (GtsBBox *bb, GtsPoint *p,
			-- gdouble *min, gdouble *max);
		external "C use <gts.h>"
		end

	gts_bbox_is_stabbed (a_bb, a_p: POINTER): INTEGER is
			-- gboolean gts_bbox_is_stabbed (GtsBBox *bb, GtsPoint *p);
		external "C use <gts.h>"
		end

	gts_bbox_overlaps_triangle (a_bb, a_t: POINTER): INTEGER is
			-- gboolean gts_bbox_overlaps_triangle (GtsBBox *bb, GtsTriangle *t);
		external "C use <gts.h>"
		end

	-- void (*GtsBBTreeTraverseFunc) (GtsBBox *bb1, GtsBBox *bb2,
	-- gpointer data);
	
	gts_bb_tree_new (a_bboxes: POINTER): POINTER is
			-- GNode* gts_bb_tree_new (GSList *bboxes);
		external "C use <gts.h>"
		end

	gts_bb_tree_surface (a_s: POINTER): POINTER is
			-- GNode* gts_bb_tree_surface (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_bb_tree_overlap (a_tree, a_bbox: POINTER): POINTER is
			-- GSList* gts_bb_tree_overlap (GNode *tree, GtsBBox *bbox);
		external "C use <gts.h>"
		end

	gts_bb_tree_is_overlapping (a_tree, a_bbox: POINTER): INTEGER is
			-- gboolean gts_bb_tree_is_overlapping (GNode *tree, GtsBBox
			-- *bbox);
		external "C use <gts.h>"
		end

	gts_bb_tree_traverse_overlapping (a_tree1, a_tree2, a_gtsbbtreetraversefunc, some_data: POINTER) is
			-- void gts_bb_tree_traverse_overlapping (GNode *tree1, GNode
			-- *tree2, GtsBBTreeTraverseFunc func, gpointer data);
		external "C use <gts.h>"
		end

	gts_bb_tree_draw (a_tree: POINTER; a_depth: INTEGER; a_fptr: POINTER) is
			-- void gts_bb_tree_draw (GNode *tree, guint depth, FILE 
			-- *fptr);

			-- TODO: `a_depth' should be NATURAL, since it is a guint
		external "C use <gts.h>"
		end

	gts_bb_tree_destroy (a_tree: POINTER; free_leaves: INTEGER) is
			-- void gts_bb_tree_destroy (GNode *tree, gboolean free_leaves);
		external "C use <gts.h>"
		end

	-- gdouble (*GtsBBoxDistFunc) (GtsPoint *p, gpointer bounded);
	
	-- GtsPoint* (*GtsBBoxClosestFunc) (GtsPoint *p, gpointer bounded);
	
	 gts_bb_tree_point_distance (a_tree, a_p, a_gts_bbox_distance_func, bbox_ptr: POINTER): REAL is
			-- gdouble gts_bb_tree_point_distance (GNode *tree, GtsPoint *p, GtsBBoxDistFunc distance, GtsBBox **bbox);
		external "C use <gts.h>"
		end

	gts_bb_tree_point_closest (a_tree, a_p, a_gts_bbox_closest_func, a_distance: POINTER): POINTER is
			-- GtsPoint* gts_bb_tree_point_closest (GNode *tree, GtsPoint
			-- *p, GtsBBoxClosestFunc closest, gdouble *distance);
		external "C use <gts.h>"
		end

	gts_bb_tree_segment_distance (a_tree, a_s, a_gts_bboxdistance_func: POINTER; a_delta: REAL; a_range: POINTER) is
			-- void gts_bb_tree_segment_distance (GNode *tree, GtsSegment
			-- *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange
			-- *range);
		external "C use <gts.h>"
		end

	gts_bb_tree_triangle_distance (a_tree, a_t, a_gts_bbox_distance_func: POINTER; a_delta: REAL; a_range: POINTER) is
			-- void gts_bb_tree_triangle_distance (GNode *tree,
			-- GtsTriangle *t, GtsBBoxDistFunc distance, gdouble delta,
			-- GtsRange *range);
		external "C use <gts.h>"
		end

	gts_bb_tree_point_closest_bboxes (a_tree, a_p: POINTER): POINTER is
			-- GSList* gts_bb_tree_point_closest_bboxes(GNode *tree,
			-- GtsPoint *p);
		external "C use <gts.h>"
		end

	gts_bb_tree_surface_boundary_distance (a_tree, a_s, a_gtsbboxdistfunc: POINTER; a_delta: REAL; a_range: POINTER) is
			-- void gts_bb_tree_surface_boundary_distance (GNode *tree,
			-- GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta,
			-- GtsRange *range);
		external "C use <gts.h>"
		end

	gts_bb_tree_surface_distance (a_tree, a_s, a_gtsbboxdistfunc: POINTER; a_delta: REAL; a_range: POINTER) is
			-- void gts_bb_tree_surface_distance (GNode *tree, GtsSurface
			-- *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange
			-- *range);
		external "C use <gts.h>"
		end
	
	gts_bb_tree_stabbed (a_tree, a_p: POINTER): POINTER is
			-- GSList* gts_bb_tree_stabbed (GNode *tree, GtsPoint *p);
		external "C use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsBBox)"
		end
end
