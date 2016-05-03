note
	description: "Access to GtsSurface C structure"
	copyright: "Copyright (C) 2007 Paolo Redaelli, GTS developers"
	license: "LGPL v2 or later"

deferred class GTS_SURFACE_STRUCT
	-- GtsSurface
	
	-- typedef struct {
	--   GtsObject object;
	
	-- #ifdef USE_SURFACE_BTREE
	--   GTree * faces;
	-- #else /* not USE_SURFACE_BTREE */
	--   GHashTable * faces;
	-- #endif /* not USE_SURFACE_BTREE */
	--   GtsFaceClass * face_class;
	--   GtsEdgeClass * edge_class;
	--   GtsVertexClass * vertex_class;
	--   gboolean keep_faces;
	-- } GtsSurface;
 
inherit ANY undefine is_equal, copy end

feature {} -- Structure getter/setter calls
	get_object_internal (a_struct: POINTER): POINTER is
			-- GtsObject object;
		external "C struct GtsSurface get object use <gts.h>"
		end

	set_object_internal (a_struct: POINTER; a_object: POINTER) is
		external "C struct GtsSurface set object use <gts.h>"
		end

	use_surface_btree: INTEGER is
		external "C macro use <gts.h>"
		alias "USE_SURFACE_BTREE"
		end
	
	get_faces_internal (a_struct: POINTER): POINTER is
			-- #ifdef USE_SURFACE_BTREE
			--   GTree * faces;
			-- #else /* not USE_SURFACE_BTREE */
			--   GHashTable * faces;
			-- #endif /* not USE_SURFACE_BTREE */
		external "C struct GtsSurface get faces use <gts.h>"
		end

	set_faces_internal (a_struct: POINTER; a_faces: POINTER) is
		external "C struct GtsSurface set faces use <gts.h>"
		end

  get_face_class_internal (a_struct: POINTER): POINTER is
			-- GtsFaceClass * face_class;
		external "C struct GtsSurface get face_class use <gts.h>"
		end

	set_face_class_internal (a_struct: POINTER; a_face_class: POINTER) is
		external "C struct GtsSurface set face_class use <gts.h>"
		end


  get_edge_class_internal (a_struct: POINTER): POINTER is
			--  GtsEdgeClass * edge_class;
		external "C struct GtsSurface get edge_class use <gts.h>"
		end

	set_edge_class_internal (a_struct: POINTER; a_edge_class: POINTER) is
		external "C struct GtsSurface set edge_class use <gts.h>"
		end

  get_vertex_class_internal (a_struct: POINTER): POINTER is
			-- GtsVertexClass * vertex_class;
		external "C struct GtsSurface get vertex_class use <gts.h>"
		end
	
	set_vertex_class_internal (a_struct: POINTER; a_vertex_class: POINTER) is
		external "C struct GtsSurface set vertex_class use <gts.h>"
		end


	get_keep_faces_internal (a_struct: POINTER): INTEGER is
			--		  gboolean keep_faces;
		external "C struct GtsSurface get keep_faces use <gts.h>"
		end
	
	set_keep_faces_internal (a_struct: POINTER; a_keep_faces: INTEGER) is
		external "C struct GtsSurface set keep_faces use <gts.h>"
		end

	-- Note: struct_size is defined in GTS_SURFACE
end
