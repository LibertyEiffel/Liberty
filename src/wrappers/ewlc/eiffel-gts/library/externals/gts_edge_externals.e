note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_EDGE_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	-- #define     GTS_EDGE_CLASS                  (klass)
	-- #define     GTS_EDGE                        (obj)

	gts_is_edge (an_obj: POINTER): INTEGER is
			-- #define GTS_IS_EDGE (obj)
		external "C use <gts.h>"
		alias "GTS_IS_EDGE"
		end
	
	gts_edge_class: POINTER is
			-- GtsEdgeClass* gts_edge_class (void);
		external "C use <gts.h>"
		end

	gts_edge_new (a_class, a_v1, a_v2: POINTER): POINTER is
			-- GtsEdge* gts_edge_new (GtsEdgeClass *klass, GtsVertex *v1,
			-- GtsVertex *v2);
		external "C use <gts.h>"
		end

	gts_edge_replace (an_edge, another: POINTER) is
			-- void gts_edge_replace (GtsEdge *e, GtsEdge *with);
		external "C use <gts.h>"
		end
	
	gts_edge_is_unattached (an_edge: POINTER): INTEGER is
			-- #define gts_edge_is_unattached (s)
		external "C macro use <gts.h>"
		end
	
	gts_edge_is_duplicate (an_edge: POINTER): POINTER is
			-- GtsEdge* gts_edge_is_duplicate (GtsEdge *e);
		external "C use <gts.h>"
		end

	gts_edge_has_parent_surface (an_edge, a_surface: POINTER): POINTER is
			-- GtsFace* gts_edge_has_parent_surface (GtsEdge *e, GtsSurface
			-- *surface);
		external "C use <gts.h>"
		end

	gts_edge_has_any_parent_surface (an_edge: POINTER): POINTER is
			-- GtsFace* gts_edge_has_any_parent_surface (GtsEdge *e);
		external "C use <gts.h>"
		end

	gts_edge_is_boundary (an_edge, a_surface: POINTER): POINTER is
			-- GtsFace* gts_edge_is_boundary (GtsEdge *e, GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_edge_is_contact (an_edge: POINTER): INTEGER is
			-- guint gts_edge_is_contact (GtsEdge *e);
			-- TODO: Should be NATURAL, since it's a guint
		external "C use <gts.h>"
		end

	gts_edge_belongs_to_tetrahedron (an_edge: POINTER): INTEGER is
			-- gboolean gts_edge_belongs_to_tetrahedron (GtsEdge *e);
		external "C use <gts.h>"
		end

	gts_edge_face_number (an_edge, a_surface: POINTER): INTEGER is
			-- guint gts_edge_face_number (GtsEdge *e, GtsSurface *s);
			-- TODO: should be NATURAL, since it's a guint
		external "C use <gts.h>"
		end

	gts_edge_manifold_faces (an_edge, a_surface, f1_handle, f2_handle: POINTER): INTEGER is
			-- gboolean gts_edge_manifold_faces (GtsEdge *e, GtsSurface *s, GtsFace
			-- **f1, GtsFace **f2);
		external "C use <gts.h>"
		end

	-- gboolean (*GtsEncroachFunc) (GtsVertex *v, GtsEdge *e, GtsSurface *s, gpointer data);
	
	gts_edge_is_encroached (an_edge, a_surface, an_encroach_function, some_data: POINTER): POINTER is
			-- GtsVertex* gts_edge_is_encroached (GtsEdge *e, GtsSurface *s,
			-- GtsEncroachFunc encroaches, gpointer data);
		external "C use <gts.h>"
		end

	gts_edges_merge (some_edges: POINTER): POINTER is
			-- GList* gts_edges_merge (GList *edges);
		external "C use <gts.h>"
		end

	gts_edges_from_vertices (some_vertices, a_parent_surface: POINTER): POINTER is
			-- GSList* gts_edges_from_vertices (GSList *vertices, GtsSurface *parent);
		external "C use <gts.h>"
		end

	gts_edge_swap (an_edge, a_surface: POINTER) is
			-- void gts_edge_swap (GtsEdge *e, GtsSurface *s);
		external "C use <gts.h>"
		end

end
