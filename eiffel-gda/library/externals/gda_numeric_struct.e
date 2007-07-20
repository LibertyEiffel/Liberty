indexing
	description: "Access to GdaNumeric C structure"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_NUMERIC_STRUCT

inherit ANY undefine is_equal, copy end


feature {} -- Structure getter/setter calls
--  typedef struct {
--          gchar *number;
--          glong precision;
--          glong width;
--  } GdaNumeric;

--          gchar *number;
-- 	get_$field (a_struct: POINTER): $type is
-- 		external "C struct $struct get $field use <libgda/libgda.h>"
-- 		end

-- 	set_$field (a_struct: POINTER; a_$field: $type) is
-- 		external "C struct $struct set $field use <libgda/libgda.h>"
-- 		end

-- --          glong precision;
-- 	get_$field (a_struct: POINTER): $type is
-- 		external "C struct $struct get $field use <libgda/libgda.h>"
-- 		end

-- 	set_$field (a_struct: POINTER; a_$field: $type) is
-- 		external "C struct $struct set $field use <libgda/libgda.h>"
-- 		end

-- --          glong width;
-- 	get_$field (a_struct: POINTER): $type is
-- 		external "C struct $struct get $field use <libgda/libgda.h>"
-- 		end

-- 	set_$field (a_struct: POINTER; a_$field: $type) is
-- 		external "C struct $struct set $field use <libgda/libgda.h>"
-- 		end

feature {} -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaNumeric)"
		end

end
