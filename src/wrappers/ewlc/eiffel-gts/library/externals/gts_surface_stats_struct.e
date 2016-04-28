note
	description: "Access to GtsSurfaceStats C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SURFACE_STATS_STRUCT
	--    Connectivity statistics.

inherit ANY undefine is_equal, copy end
	
feature {} -- Structure getter/setter calls

	get_n_faces (a_struct: POINTER): INTEGER is
		external "C struct GtsSurfaceStats get n_faces use <gts.h>"
		end

	set_n_faces (a_struct: POINTER; a_n_faces: INTEGER) is
		external "C struct GtsSurfaceStats set n_faces use <gts.h>"
		end

	--    guint n_incompatible_faces;
	get_n_incompatible_faces (a_struct: POINTER): INTEGER is
		external "C struct GtsSurfaceStats get n_incompatible_faces use <gts.h>"
		end

	set_n_incompatible_faces (a_struct: POINTER; a_n_incompatible_faces: INTEGER) is
		external "C struct GtsSurfaceStats set n_incompatible_faces use <gts.h>"
		end
--    guint n_duplicate_faces;
	get_n_duplicate_faces (a_struct: POINTER): INTEGER is
		external "C struct GtsSurfaceStats get n_duplicate_faces use <gts.h>"
		end

	set_n_duplicate_faces (a_struct: POINTER; a_n_duplicate_faces: INTEGER) is
		external "C struct GtsSurfaceStats set n_duplicate_faces use <gts.h>"
		end
	
--    guint n_duplicate_edges;
	get_n_duplicate_edges (a_struct: POINTER): INTEGER is
		external "C struct GtsSurfaceStats get n_duplicate_edges use <gts.h>"
		end

	set_n_duplicate_edges (a_struct: POINTER; a_n_duplicate_edges: INTEGER) is
		external "C struct GtsSurfaceStats set n_duplicate_edges use <gts.h>"
		end
	
--    guint n_boundary_edges;
	get_n_boundary_edges (a_struct: POINTER): INTEGER is
		external "C struct GtsSurfaceStats get n_boundary_edges use <gts.h>"
		end

	set_n_boundary_edges (a_struct: POINTER; a_n_boundary_edges: INTEGER) is
		external "C struct GtsSurfaceStats set n_boundary_edges use <gts.h>"
		end
	
--    guint n_non_manifold_edges;
	get_n_non_manifold_edges (a_struct: POINTER): INTEGER is
		external "C struct GtsSurfaceStats get n_non_manifold_edges use <gts.h>"
		end

	set_n_non_manifold_edges (a_struct: POINTER; a_n_non_manifold_edges: INTEGER) is
		external "C struct GtsSurfaceStats set n_non_manifold_edges use <gts.h>"
		end
	
	--    GtsRange edges_per_vertex;
	get_edges_per_vertex (a_struct: POINTER): POINTER is
		external "C struct GtsSurfaceStats get edges_per_vertex use <gts.h>"
		end

	set_edges_per_vertex (a_struct: POINTER; a_edges_per_vertex: POINTER) is
		external "C struct GtsSurfaceStats set edges_per_vertex use <gts.h>"
		end

	--    GtsRange faces_per_edge;
	get_faces_per_edge (a_struct: POINTER): POINTER is
		external "C struct GtsSurfaceStats get faces_per_edge use <gts.h>"
		end

	set_faces_per_edge (a_struct: POINTER; a_faces_per_edge: POINTER) is
		external "C struct GtsSurfaceStats set faces_per_edge use <gts.h>"
		end
	
	--    GtsSurface * parent;
	get_parent (a_struct: POINTER): POINTER is
		external "C struct GtsSurfaceStats get parent use <gts.h>"
		end

	set_parent (a_struct: POINTER; a_parent: POINTER) is
		external "C struct GtsSurfaceStats set parent use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsSurfaceStats)"
		end

end
