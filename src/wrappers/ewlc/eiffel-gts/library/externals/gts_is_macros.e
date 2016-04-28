note
	description: "Testing the type of an GTS object referrred by a pointer."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_IS_MACROS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gts_is_object (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_OBJECT"
		end

	gts_is_point (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_POINT"
		end

	gts_is_vertex (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_VERTEX"
		end

	gts_is_vertex_normal (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_VERTEX_NORMAL"
		end

	gts_is_color_vertex (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_COLOR_VERTEX"
		end

	gts_is_segment (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_SEGMENT"
		end

	gts_is_edge (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_EDGE"
		end

	gts_is_triangle (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_TRIANGLE"
		end

	gts_is_face (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_FACE"
		end

	gts_is_bbox (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_BBOX"
		end

	gts_is_surface (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_SURFACE"
		end


	gts_is_surface_inter (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_SURFACE_INTER"
		end

	gts_is_split (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_SPLIT"
		end

	gts_is_psurface (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_PSURFACE"
		end

	gts_is_hsplit (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_HSPLIT"
		end

	gts_is_hsurface (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_HSURFACE"
		end

	gts_is_constraint (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_CONSTRAINT"
		end

	gts_is_list_face (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_LIST_FACE"
		end

	gts_is_nvertex (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_NVERTEX"
		end

	gts_is_nedge (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_NEDGE"
		end

	gts_is_nface (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_NFACE"
		end

	gts_is_cluster (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_CLUSTER"
		end

	gts_is_cluster_grid (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_CLUSTER_GRID"
		end

	gts_is_containee (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_CONTAINEE"
		end

	gts_is_slist_containee (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_SLIST_CONTAINEE"
		end

	gts_is_container (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_CONTAINER"
		end

	gts_is_hash_container (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_HASH_CONTAINER"
		end

	gts_is_slist_container (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_SLIST_CONTAINER"
		end

	gts_is_gnode (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_GNODE"
		end

	gts_is_ngnode (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_NGNODE"
		end

	gts_is_wgnode (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_WGNODE"
		end

	gts_is_pnode (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_PNODE"
		end

	gts_is_fnode (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_FNODE"
		end

	gts_is_gedge (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_GEDGE"
		end

	gts_is_pgedge (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_PGEDGE"
		end

	gts_is_wgedge (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_WGEDGE"
		end

	gts_is_graph (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_GRAPH"
		end

	gts_is_wgraph (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_WGRAPH"
		end

	gts_is_gnode_split (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_GNODE_SPLIT"
		end

	gts_is_pgraph (a_pointer: POINTER): INTEGER is
		external "C macro use <gts.h>"
		alias "GTS_IS_PGRAPH"
		end
end
