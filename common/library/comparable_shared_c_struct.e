indexing
	description: "Comparable wrappers of structures stored into containers."
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"

deferred class COMPARABLE_SHARED_C_STRUCT
	-- A comparable wrapper
inherit
	SHARED_C_STRUCT undefine is_equal end
	COMPARABLE undefine copy, is_equal end
end
