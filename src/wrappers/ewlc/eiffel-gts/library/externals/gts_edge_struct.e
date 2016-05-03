note
	description: "Access to GtsEdge C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_EDGE_STRUCT

inherit ANY undefine is_equal, copy end


	-- typedef struct { GtsSegment segment; GSList * triangles; } GtsEdge;
	-- The edge object.

	-- GtsSegment segment;	The parent object.

	-- GSList *triangles; List of GtsTriangle using this edge.


feature {} -- Structure getter/setter calls
	get_triangles (a_struct: POINTER): POINTER is
		external "C struct GtsEdge get triangles use <gts.h>"
		end

	set_triangles (a_struct: POINTER; a_triangles: POINTER) is
		external "C struct GtsEdge set triangles use <gts.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gts.h>"
		alias "sizeof(GtsEdge)"
		end

end
