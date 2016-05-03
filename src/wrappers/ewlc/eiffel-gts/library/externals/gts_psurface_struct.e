note
	description: "Access to GtsPSurface C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_PSURFACE_STRUCT
	--  typedef struct {
	--    GtsObject object;
	
	--    GtsSurface * s;
	--    GPtrArray * split;
	--    GtsSplitClass * split_class;
	--    guint pos, min;
	
	--    GPtrArray * vertices;
	--    GPtrArray * faces;
	--  } GtsPSurface;

inherit ANY undefine is_equal, copy end

feature {} -- Structure getter/setter calls
   -- GtsSurface * s;
	get_s (a_struct: POINTER): POINTER is
		external "C struct GtsPSurface get s use <gts.h>"
		end

	set_s (a_struct: POINTER; a_s: POINTER) is
		external "C struct GtsPSurface set s use <gts.h>"
		end

   -- GPtrArray * split;
	get_split (a_struct: POINTER): POINTER is
		external "C struct GtsPSurface get split use <gts.h>"
		end

	set_split (a_struct: POINTER; a_split: POINTER) is
		external "C struct GtsPSurface set split use <gts.h>"
		end
	
   -- GtsSplitClass * split_class;
	get_split_class (a_struct: POINTER): POINTER is
		external "C struct GtsPSurface get split_class use <gts.h>"
		end

	set_split_class (a_struct: POINTER; a_split_class: POINTER) is
		external "C struct GtsPSurface set split_class use <gts.h>"
		end

	get_pos (a_struct: POINTER): INTEGER is
			-- TODO: should be NATURAL, since it is a guint
		external "C struct GtsPSurface get pos use <gts.h>"
		end
	
	set_pos (a_struct: POINTER; a_pos: INTEGER) is
			-- TODO: a_pos should be NATURAL, since it is a guint
		external "C struct GtsPSurface set pos use <gts.h>"
		end
	
	get_min (a_struct: POINTER): INTEGER is
			-- TODO: should be NATURAL, since it is a guint
		external "C struct GtsPSurface get min use <gts.h>"
		end
	
	set_min (a_struct: POINTER; a_min: INTEGER) is
			-- TODO: a_min should be NATURAL, since it is a guint
		external "C struct GtsPSurface set min use <gts.h>"			
		end
	
	get_vertices (a_struct: POINTER): POINTER is
		external "C struct GtsPSurface get vertices use <gts.h>"
		end
	
	set_vertices (a_struct: POINTER; a_vertices: POINTER) is
		external "C struct GtsPSurface set vertices use <gts.h>"
		end

	get_faces (a_struct: POINTER): POINTER is
		external "C struct GtsPSurface get faces use <gts.h>"
		end

	set_faces (a_struct: POINTER; a_faces: POINTER) is
		external "C struct GtsPSurface set faces use <gts.h>"
		end


end
