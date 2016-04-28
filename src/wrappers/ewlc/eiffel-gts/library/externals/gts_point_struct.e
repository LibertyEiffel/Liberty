note
	description: "Access to GtsPoint C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_POINT_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Structure getter/setter calls
--  typedef struct {
--    GtsObject object;

--    gdouble x, y, z; /* must be contiguous (cast to robust functions) */
--  } GtsPoint;

	get_x (a_struct: POINTER): REAL is
		external "C struct GtsPoint get x use <gts.h>"
		end

	set_x_internal (a_struct: POINTER; a_x: REAL) is
		external "C struct GtsPoint set x use <gts.h>"
		end

	get_y (a_struct: POINTER): REAL is
		external "C struct GtsPoint get y use <gts.h>"
		end

	set_y_internal (a_struct: POINTER; a_y: REAL) is
		external "C struct GtsPoint set y use <gts.h>"
		end

	get_z (a_struct: POINTER): REAL is
		external "C struct GtsPoint get z use <gts.h>"
		end

	set_z_internal (a_struct: POINTER; a_z: REAL) is
		external "C struct GtsPoint set z use <gts.h>"
		end
end
