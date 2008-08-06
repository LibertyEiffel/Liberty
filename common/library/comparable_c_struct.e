indexing
	description: "Comparable wrappers of structures stored into containers."
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"

deferred class COMPARABLE_C_STRUCT
	-- A comparable wrapper
inherit
	COMPARABLE_WRAPPER undefine copy, is_equal end
	C_STRUCT undefine is_equal end
end
