note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SURFACE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
-- #include <gts.h>

-- #define GTS_SURFACE_CLASS (klass)
-- #define GTS_SURFACE (obj)
-- #define GTS_IS_SURFACE (obj)
-- GtsSurfaceClass;
-- GtsSurface;

	gts_surface_class: POINTER is
			-- GtsSurfaceClass* gts_surface_class (void);
		external "C use <gts.h>"
		end

	gts_surface_new (a_klass, a_face_class, a_edge_class, a_vertex_class: POINTER): POINTER is
			-- GtsSurface* gts_surface_new (GtsSurfaceClass *klass,
			-- GtsFaceClass *face_class, GtsEdgeClass *edge_class,
			-- GtsVertexClass *vertex_class);
		external "C use <gts.h>"
		end
	
	gts_surface_add_face (an_s, a_f: POINTER) is
			-- void gts_surface_add_face (GtsSurface *s, GtsFace *f);
		external "C use <gts.h>"
		end

	gts_surface_remove_face (an_s, a_f: POINTER) is
			-- void gts_surface_remove_face (GtsSurface *s, GtsFace *f);
		external "C use <gts.h>"
		end

	gts_surface_copy (an_s1, an_s2: POINTER) is
			-- GtsSurface* gts_surface_copy (GtsSurface *s1, GtsSurface *s2);

			-- Note: the fingerprint of this feature has been changed
			-- because Result is systematically equal to s1, a common C
			-- style that mimicks OO languages.
		external "C use <gts.h>"
		end

	gts_surface_merge (an_s, a_with: POINTER) is
			-- void gts_surface_merge (GtsSurface *s, GtsSurface *with);
		external "C use <gts.h>"
		end

	gts_surface_read (a_surface, a_f: POINTER): INTEGER is
			-- guint gts_surface_read (GtsSurface *surface, GtsFile *f);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_surface_is_manifold (a_s: POINTER): INTEGER is
			-- gboolean gts_surface_is_manifold (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_surface_is_orientable (a_s: POINTER): INTEGER is
			-- gboolean gts_surface_is_orientable (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_surface_is_closed (a_s: POINTER): INTEGER is
			-- gboolean gts_surface_is_closed (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_surface_vertex_number (a_s: POINTER): INTEGER is
			-- guint gts_surface_vertex_number (GtsSurface *s);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_surface_edge_number (a_s: POINTER): INTEGER is
			-- guint gts_surface_edge_number (GtsSurface *s);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_surface_face_number (a_s: POINTER): INTEGER is
			-- guint gts_surface_face_number (GtsSurface *s);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_surface_boundary (a_surface: POINTER): POINTER is
			-- GSList* gts_surface_boundary (GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_surface_area (a_s: POINTER): REAL is
			-- gdouble gts_surface_area (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_surface_volume (a_s: POINTER): REAL is
			-- gdouble gts_surface_volume (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_surface_center_of_mass (a_s, a_cm: POINTER): REAL is
			-- gdouble gts_surface_center_of_mass (GtsSurface *s, GtsVector cm);
		external "C use <gts.h>"
		alias "gts_surface_center_of_mass($a_s, *($a_cm))"
		end

	gts_surface_center_of_area (a_s, a_cm: POINTER): REAL is
			-- gdouble gts_surface_center_of_area (GtsSurface *s, GtsVector cm);
		external "C use <gts.h>"
		alias "gts_surface_center_of_area($a_s, *(a_cm))"
		end

	-- GtsSurfaceStats;

	-- GtsSurfaceQualityStats;
	
	gts_surface_stats (a_s, some_stats: POINTER) is
			-- void gts_surface_stats (GtsSurface *s, GtsSurfaceStats
			-- *stats);
		external "C use <gts.h>"
		end

	gts_surface_quality_stats (a_s, some_stats: POINTER) is
			-- void gts_surface_quality_stats (GtsSurface *s,
			-- GtsSurfaceQualityStats *stats);
		external "C use <gts.h>"
		end

	gts_surface_print_stats (a_s, a_fptr: POINTER) is
			-- void gts_surface_print_stats (GtsSurface *s, FILE *fptr);
		external "C use <gts.h>"
		end

	gts_surface_write (a_s, a_fptr: POINTER) is
			-- void gts_surface_write (GtsSurface *s, FILE *fptr);
		external "C use <gts.h>"
		end

	gts_surface_write_oogl (a_s, a_fptr: POINTER) is
			-- void gts_surface_write_oogl (GtsSurface *s, FILE *fptr);
		external "C use <gts.h>"
		end

	gts_surface_write_oogl_boundary (a_s, a_fptr: POINTER) is
			-- void gts_surface_write_oogl_boundary (GtsSurface *s, FILE *fptr);
		external "C use <gts.h>"
		end

	gts_surface_write_vtk (a_s, a_fptr: POINTER) is
			-- void gts_surface_write_vtk (GtsSurface *s, FILE *fptr);
		external "C use <gts.h>"
		end

	-- gint (*GtsFunc) (gpointer item, gpointer data);
	
	gts_surface_foreach_vertex (a_s, a_func, some_data: POINTER) is
			-- void gts_surface_foreach_vertex (GtsSurface *s, GtsFunc
			-- func, gpointer data);
		external "C use <gts.h>"
		end

	gts_surface_foreach_edge (a_s, a_func, some_data: POINTER) is
			-- void gts_surface_foreach_edge (GtsSurface *s, GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end

	gts_surface_foreach_face (a_s, a_func, some_data: POINTER) is
			-- void gts_surface_foreach_face (GtsSurface *s, GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end

	gts_surface_foreach_face_remove (a_s, a_func, some_data: POINTER): INTEGER is
			-- guint gts_surface_foreach_face_remove (GtsSurface *s, GtsFunc func, gpointer data);

			-- TODO: Result should be NATURAL since it is a guint
		external "C use <gts.h>"
		end

	gts_surface_foreach_intersecting_face(an_s, a_gts_bb_tree_traverse_func, some_data: POINTER): INTEGER is
			-- gboolean gts_surface_foreach_intersecting_face(GtsSurface
			-- *s, GtsBBTreeTraverseFunc func, gpointer data);
		external "C use <gts.h>"
		end
	
	gts_surface_distance (a_s1, a_s2: POINTER; a_delta: REAL; a_face_range, a_boundary_range: POINTER) is
			-- void gts_surface_distance (GtsSurface *s1, GtsSurface *s2,
			-- gdouble delta, GtsRange *face_range, GtsRange
			-- *boundary_range);
		external "C use <gts.h>"
		end

	gts_surface_strip (a_s: POINTER): POINTER is
			-- GSList* gts_surface_strip (GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_surface_tessellate (a_s, a_refine_func, some_refine_data: POINTER) is
			-- void gts_surface_tessellate (GtsSurface *s, GtsRefineFunc refine_func, gpointer refine_data);
		external "C use <gts.h>"
		end

	gts_surface_generate_sphere (a_s: POINTER; a_geodesation_order: INTEGER): POINTER is
			-- GtsSurface* gts_surface_generate_sphere (GtsSurface *s, guint geodesation_order);

			-- TODO: `a_geodesation_order' should be NATURAL, since it is
			-- a guint.
		external "C use <gts.h>"
		end

	gts_surface_split (a_s: POINTER): POINTER is
			-- GSList* gts_surface_split (GtsSurface *s);
		external "C use <gts.h>"
		end

feature {} -- External calls for boolean operations
	gts_surface_intersection (a_surface, another_surface, a_faces_tree, another_faces_tree: POINTER): POINTER is
			-- GSList* gts_surface_intersection (GtsSurface *s1,
			-- GtsSurface *s2, GNode *faces_tree1, GNode *faces_tree2);
		external "C use <gts.h>"
		end
	
end
