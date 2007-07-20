indexing
	description: "Comparable wrappers of structures stored into containers."
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"

deferred class COMPARABLE_SHARED_C_STRUCT
	-- A comparable wrapper
inherit
	SHARED_C_STRUCT
	COMPARABLE undefine copy, is_equal end
feature 
	infix "<" (other: like Current): BOOLEAN is
			-- Default comparison of wrappers made comparing the memory 
			-- address of the underlying wrapped data structure.
		do
			Result:=(Current.handle.hash_code < other.handle.hash_code)
		end

end
