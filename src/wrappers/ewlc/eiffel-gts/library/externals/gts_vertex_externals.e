note
	description: "External calls for GTS_VERTEX"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_VERTEX_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	-- #include <gts.h>

	--  #define     GTS_VERTEX_CLASS                (klass)
	-- #define     GTS_VERTEX                      (obj)
	-- #define     GTS_IS_VERTEX                   (obj)

	gts_vertex_class: POINTER is
			-- GtsVertexClass* gts_vertex_class (void);
		external "C use <gts.h>"
		end
	
	gts_vertex_new (a_klass: POINTER; an_x, an_y, a_z: REAL): POINTER is
			-- GtsVertex* gts_vertex_new (GtsVertexClass *klass, gdouble x, gdouble
			-- y, gdouble z);
		external "C use <gts.h>"
		end
	
	gts_vertex_is_unattached (a_vertex: POINTER): INTEGER is
			-- gboolean gts_vertex_is_unattached (GtsVertex *v);
		external "C use <gts.h>"
		end

	gts_vertex_is_boundary (a_vertex, a_surface: POINTER): INTEGER is
			-- gboolean gts_vertex_is_boundary (GtsVertex *v, GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_vertex_is_contact (a_vertex: POINTER; do_sever: INTEGER): INTEGER is
			-- guint gts_vertex_is_contact (GtsVertex *v, gboolean sever);
			-- TODO: should be NATURAL since it is guint
		external "C use <gts.h>"
		end

	gts_vertices_are_connected (a_vertex, another_vertex: POINTER): POINTER is
			-- GtsSegment* gts_vertices_are_connected (GtsVertex *v1, GtsVertex
			-- *v2);
		external "C use <gts.h>"
		end
	
	gts_vertex_replace (a_vertex, a_replacement: POINTER) is
			-- void gts_vertex_replace (GtsVertex *v, GtsVertex *with);
		external "C use <gts.h>"
		end

	gts_vertex_neighbors (a_vertex, a_list, a_surface: POINTER): POINTER is
			-- GSList* gts_vertex_neighbors (GtsVertex *v, GSList *list, GtsSurface
			-- *surface);
		external "C use <gts.h>"
		end
 
	gts_vertex_triangles (a_vertex, a_list: POINTER): POINTER is
			-- GSList* gts_vertex_triangles (GtsVertex *v, GSList *list);
		external "C use <gts.h>"
		end

	gts_vertex_faces (a_vertex, a_surface, a_slist: POINTER): POINTER is
			-- GSList* gts_vertex_faces (GtsVertex *v, GtsSurface *surface, GSList
			-- *list);
		external "C use <gts.h>"
		end
	
	gts_vertex_fan_oriented (a_vertex, a_surface: POINTER): POINTER is
			-- GSList* gts_vertex_fan_oriented (GtsVertex *v, GtsSurface *surface);
		external "C use <gts.h>"
		end

	gts_vertex_encroaches_edge (a_vertex, an_edge: POINTER): INTEGER is
			-- gboolean gts_vertex_encroaches_edge (GtsVertex *v, GtsEdge *e);
		external "C use <gts.h>"
		end
	
	gts_vertices_from_segments (some_segments: POINTER): POINTER is
			-- GSList* gts_vertices_from_segments (GSList *segments);
		external "C use <gts.h>"
		end
	
	gts_vertices_merge (some_vertices: POINTER; an_epsilon: REAL; a_check_function: POINTER): POINTER is
			-- GList* gts_vertices_merge (GList *vertices, gdouble epsilon,
			-- gboolean (*check) (GtsVertex *, GtsVertex *));
		external "C use <gts.h>"
		end

end
