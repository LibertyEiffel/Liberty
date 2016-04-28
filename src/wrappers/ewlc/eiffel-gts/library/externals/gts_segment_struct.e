note
	description: "Access to GtsSegment C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SEGMENT_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Structure getter/setter calls
	-- GtsSegment
	
	-- typedef struct {GtsObject object; GtsVertex * v1; GtsVertex *
	-- v2; } GtsSegment;

	-- The segment object.
	
	-- GtsObject object;	The parent object.

	-- GtsVertex *v1; First endpoint of the segment.

	-- GtsVertex *v2; Second endpoint of the segment.
	
	get_v1 (a_struct: POINTER): POINTER is
		external "C struct GtsSegment get v1 use <gts.h>"
		end

	set_v1 (a_struct: POINTER; a_v1: POINTER) is
		external "C struct GtsSegment set v1 use <gts.h>"
		end

	get_v2 (a_struct: POINTER): POINTER is
		external "C struct GtsSegment get v2 use <gts.h>"
		end

	set_v2 (a_struct: POINTER; a_v2: POINTER) is
		external "C struct GtsSegment set v2 use <gts.h>"
		end

end
