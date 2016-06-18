note
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

	gts_bbox_class: POINTER
			--  GtsBBoxClass* gts_bbox_class (void);
		external "C use <gts.h>"
		end

	gts_bbox_new (klass, bounded_ptr: POINTER; x1, y1, z1, x2, y2, z2: REAL): POINTER
			-- GtsBBox* gts_bbox_new (GtsBBoxClass *klass, gpointer
			-- bounded, gdouble x1, gdouble y1, gdouble z1, gdouble x2,
			-- gdouble y2, gdouble z2);
		external "C use <gts.h>"
		end

	gts_bbox_set (a_bbox, bounded_ptr: POINTER; x1, y1, z1, x2, y2, z2: REAL)
			-- void gts_bbox_set (GtsBBox *bbox, gpointer bounded,
			-- gdouble x1, gdouble y1, gdouble z1, gdouble x2, gdouble
			-- y2, gdouble z2);
		external "C use <gts.h>"
		end

	gts_bbox_segment (klass, a_gtssegment: POINTER): POINTER
			--  GtsBBox* gts_bbox_segment (GtsBBoxClass *klass, GtsSegment *s);
		external "C use <gts.h>"
		end
	
	gts_bbox_triangle (klass, a_gtstriangle: POINTER): POINTER
			--  GtsBBox* gts_bbox_triangle (GtsBBoxClass *klass, GtsTriangle *t);
		external "C use <gts.h>"
		end

	gts_bbox_surface (klass, a_gtssurface: POINTER): POINTER
			-- GtsBBox* gts_bbox_surface (GtsBBoxClass *klass, GtsSurface
			-- *surface);
		external "C use <gts.h>"
		end
	
	gts_bbox_points (klass, some_points: POINTER): POINTER
			--  GtsBBox* gts_bbox_points (GtsBBoxClass *klass, GSList *points);
		external "C use <gts.h>"
		end
	
	gts_bbox_bboxes (klass, some_bboxes: POINTER): POINTER
			--  GtsBBox* gts_bbox_bboxes (GtsBBoxClass *klass, GSList *bboxes);
		external "C use <gts.h>"
		end
	
	gts_bbox_draw (a_bb, a_fptr: POINTER)
			--  void gts_bbox_draw (GtsBBox *bb, FILE *fptr);
		external "C use <gts.h>"
		end
	
	gts_bbox_point_is_inside (bbox, p: POINTER): INTEGER
			-- #define gts_bbox_point_is_inside (bbox, p)
		external "C macro use <gts.h>"
		end

	gts_bboxes_are_overlapping (a_bb1, a_bb2: POINTER): INTEGER
			--  gboolean gts_bboxes_are_overlapping (GtsBBox *bb1, GtsBBox *bb2);
		external "C use <gts.h>"
		end

	gts_bbox_diagonal2 (a_bb: POINTER): REAL
			--  gdouble gts_bbox_diagonal2 (GtsBBox *bb);
		external "C use <gts.h>"
		end
	
	gts_bbox_point_distance2 (a_bb, a_p, a_double_min, a_double_max: POINTER)
			-- void gts_bbox_point_distance2 (GtsBBox *bb, GtsPoint *p,
			-- gdouble *min, gdouble *max);
		external "C use <gts.h>"
		end
	
	gts_bbox_is_stabbed (a_bb, a_gtspoint: POINTER): INTEGER
			--  gboolean gts_bbox_is_stabbed (GtsBBox *bb, GtsPoint *p);
		external "C use <gts.h>"
		end

	gts_bbox_overlaps_triangle (a_bb, a_gtstriangle: POINTER): INTEGER
			--  gboolean gts_bbox_overlaps_triangle (GtsBBox *bb, GtsTriangle *t);
		external "C use <gts.h>"
		end
	
	-- void (*GtsBBTreeTraverseFunc) (GtsBBox *bb1, GtsBBox *bb2, gpointer data);
	
	gts_bb_tree_new (some_bboxes: POINTER): POINTER
			--  GNode* gts_bb_tree_new (GSList *bboxes);
		external "C use <gts.h>"
		end

  gts_bb_tree_surface (a_surface: POINTER): POINTER
			--  GNode* gts_bb_tree_surface (GtsSurface *s);
		external "C use <gts.h>"
		end

  gts_bb_tree_overlap (a_node, a_bbox: POINTER): POINTER
			--  GSList* gts_bb_tree_overlap (GNode *tree, GtsBBox *bbox);
		external "C use <gts.h>"
		end

	gts_bb_tree_is_overlapping (a_node, a_bbox: POINTER): INTEGER
			--  gboolean gts_bb_tree_is_overlapping (GNode *tree, GtsBBox *bbox);
		external "C use <gts.h>"
		end

	gts_bb_tree_traverse_overlapping (a_node1, a_node2, a_bbtreetraversefunc, some_data: POINTER)
			--  void gts_bb_tree_traverse_overlapping (GNode *tree1,
			--  GNode *tree2, GtsBBTreeTraverseFunc func, gpointer data);
		external "C use <gts.h>"
		end

	 gts_bb_tree_draw (a_node: POINTER; a_depth: INTEGER; a_fptr: POINTER)
			--  void gts_bb_tree_draw (GNode *tree, guint depth, FILE *fptr);
		require natural_depth: a_depth >= 0
		external "C use <gts.h>"
		end

	gts_bb_tree_destroy (a_node: POINTER; free_leaves_bool: INTEGER)
			--  void gts_bb_tree_destroy (GNode *tree, gboolean free_leaves);
		external "C use <gts.h>"
		end

	--  gdouble (*GtsBBoxDistFunc) (GtsPoint *p, gpointer bounded);
	--  GtsPoint* (*GtsBBoxClosestFunc) (GtsPoint *p, gpointer bounded);
	
	gts_bb_tree_point_distance (a_node, a_point, a_boxdistfunc, a_bbox_ref: POINTER): REAL
			--  gdouble gts_bb_tree_point_distance (GNode *tree, GtsPoint *p, GtsBBoxDistFunc distance, GtsBBox **bbox);
		external "C use <gts.h>"
		end

	gts_bb_tree_point_closest (a_node, a_point, a_box_dist_func: POINTER; a_delta: REAL; a_range: POINTER)
			--  GtsPoint* gts_bb_tree_point_closest (GNode *tree, GtsPoint *p, GtsBBoxClosestFunc closest, gdouble *distance);
		external "C use <gts.h>"
		end

	gts_bb_tree_segment_distance (a_node, a_segment, a_box_dist_func: POINTER; a_delta: REAL; a_range: POINTER)
			--  void gts_bb_tree_segment_distance (GNode *tree, GtsSegment *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end
	
	 gts_bb_tree_triangle_distance (a_node, a_triangle, a_box_dist_func: POINTER; a_delta: REAL; a_range: POINTER)
			--  void gts_bb_tree_triangle_distance (GNode *tree, GtsTriangle *t, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end

	gts_bb_tree_point_closest_bboxes (a_node, a_point: POINTER): POINTER
			-- 	GSList* gts_bb_tree_point_closest_bboxes (GNode *tree, GtsPoint *p);
		external "C use <gts.h>"
		end

	 gts_bb_tree_surface_boundary_distance (a_node, a_surface, a_box_dist_func: POINTER; a_delta: REAL; a_range: POINTER)
			-- void gts_bb_tree_surface_boundary_distance (GNode *tree, GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end

	gts_bb_tree_surface_distance (a_node, a_surface, a_box_dist_func: POINTER; a_delta: REAL; a_range: POINTER)
			--  void gts_bb_tree_surface_distance (GNode *tree, GtsSurface *s, GtsBBoxDistFunc distance, gdouble delta, GtsRange *range);
		external "C use <gts.h>"
		end

	gts_bb_tree_stabbed (a_node, a_point: POINTER): POINTER
			--  GSList* gts_bb_tree_stabbed (GNode *tree, GtsPoint *p);
		external "C use <gts.h>"
		end


feature {} -- size

	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsBBox)"
		end
end
