note
	description: "Access to GtsSurfaceQualityStats C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTS_SURFACE_QUALITY_STATS_STRUCT

inherit ANY undefine is_equal, copy end
	
feature {} -- Structure getter/setter calls
--   GtsSurfaceQualityStats

--  typedef struct {
--    GtsRange face_quality;
--    GtsRange face_area;
--    GtsRange edge_length;
--    GtsRange edge_angle;
--    GtsSurface * parent;
--  } GtsSurfaceQualityStats;

-- 	get_$field (a_struct: POINTER): $type is
-- 		external "C struct $struct get $field use <$include>"
-- 		end

-- 	set_$field (a_struct: POINTER; a_$field: $type) is
-- 		external "C struct $struct set $field use <$include>"
-- 		end

feature {} -- size
	struct_size: INTEGER
		external "C inline use <gts.h>"
		alias "sizeof(GtsSurfaceQualityStats)"
		end

end
