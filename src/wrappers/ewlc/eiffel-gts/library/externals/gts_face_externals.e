note
	description: "External calls for GTS_FACE"
	copyright: "Copyright (C) 2007-2022: Paolo Redaelli, GTS developers"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_FACE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- 
	-- typedef struct {
	--   GtsTriangle triangle;
	--   GSList * surfaces;
	-- } GtsFace;

	-- The face object.

	-- GtsTriangle triangle; The parent object.
	-- GSList *surfaces;	A list of GtsSurface using this face.

	get_surfaces (a_face: POINTER): POINTER
		external "C struct GtsFace get surfaces use <gts.h>"
		end
		
feature {} -- External calls
	gts_face_class_cast (a_class: POINTER): POINTER
			-- GTS_FACE_CLASS
		external "C macro use <gts.h>"
		alias "GTS_FACE_CLASS"
		end
 
	gts_face (a_pointer: POINTER): POINTER
			-- GTS_FACE
		external "C macro use <gts.h>"
		alias "GTS_FACE"
		end
 
	-- GtsFaceClass; GtsFace;

	gts_face_class: POINTER
			-- GtsFaceClass* gts_face_class (void);
		external "C use <gts.h>"
		end

	gts_face_new (a_class, first_edge, second_edge, third_edge: POINTER): POINTER
			-- GtsFace* gts_face_new (GtsFaceClass *klass, GtsEdge *e1,
			-- GtsEdge *e2, GtsEdge *e3);
		external "C use <gts.h>"
		end

	gts_face_has_parent_surface (a_face, a_surface: POINTER): INTEGER
			-- gboolean gts_face_has_parent_surface (GtsFace *f,
			-- GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_face_neighbor_number (a_face, a_surface: POINTER): INTEGER
			-- guint gts_face_neighbor_number(GtsFace *f, GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_face_neighbors (a_face, a_surface: POINTER): POINTER
			-- GSList* gts_face_neighbors (GtsFace *f, GtsSurface *s);
		external "C use <gts.h>"
		end

	gts_face_foreach_neighbor (a_face, a_surface, a_func, some_data: POINTER)
			-- void gts_face_foreach_neighbor (GtsFace *f, GtsSurface *s,
			-- GtsFunc func, gpointer data);
		external "C use <gts.h>"
		end

	gts_face_is_compatible (a_face, a_surface: POINTER): INTEGER
			-- gboolean gts_face_is_compatible(GtsFace *f,GtsSurface *s);
		external "C use <gts.h>"
		end
	
	gts_faces_from_edges (some_edges, a_surface: POINTER): POINTER
			-- GSList* gts_faces_from_edges(GSList *edges,GtsSurface *s);
		external "C use <gts.h>"
		end
end
