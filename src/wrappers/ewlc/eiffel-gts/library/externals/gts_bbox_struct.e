note
	description: "Access to $struct C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_BBOX_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Structure getter/setter calls

--   GtsBBox

--  typedef struct {
--    GtsObject object;
--    gpointer bounded;
--    gdouble x1, y1, z1;
--    gdouble x2, y2, z2;
--  } GtsBBox;

--    The bounding box structure.

--     GtsObject object;  Parent object.
--     gpointer bounded;  Bounded object.
--     gdouble x1;        x coordinate of the lower-left front corner.
--     gdouble y1;        y coordinate of the lower-left front corner.
--     gdouble z1;        z coordinate of the lower-left front corner.
--     gdouble x2;        x coordinate of the upper-right back corner.
--     gdouble y2;        y coordinate of the upper-right back corner.
--     gdouble z2;        z coordinate of the upper-right back corner.
--   GtsBBox

--  typedef struct {
--    GtsObject object;
--    gpointer bounded;
--    gdouble x1, y1, z1;
--    gdouble x2, y2, z2;
--  } GtsBBox;

--    The bounding box structure.

--     GtsObject object;  Parent object.
--     gpointer bounded;  Bounded object.
--     gdouble x1;        x coordinate of the lower-left front corner.
--     gdouble y1;        y coordinate of the lower-left front corner.
--     gdouble z1;        z coordinate of the lower-left front corner.
--     gdouble x2;        x coordinate of the upper-right back corner.
--     gdouble y2;        y coordinate of the upper-right back corner.
--     gdouble z2;        z coordinate of the upper-right back corner.

--	get_$field (a_struct: POINTER): $type is
-- 		external "C struct $struct get $field use <$include>"
-- 		end

-- 	set_$field (a_struct: POINTER; a_$field: $type) is
-- 		external "C struct $struct set $field use <$include>"
-- 		end

-- feature -- size
-- 	struct_size: INTEGER is
-- 		external "C inline use <$include>"
-- 		alias "sizeof($struct)"
-- 		end

end
