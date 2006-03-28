indexing
	description: "Deferred empty class handling low-level C interfaces. Its heirs will fully expose each other their internals"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class WRAPPER

inherit
	DISPOSABLE
	undefine
		is_equal,
		copy,
		fill_tagged_out_memory
	end
	
feature {WRAPPER} -- syntactic sugar
	Null: POINTER is
			-- NULL. Just a shorthand for `default_pointer' more
			-- understandable by C programmers.
		obsolete "Use default_pointer or POINTER.is_not_null."
		external "C macro"
		alias "NULL"
			-- Another possible implementation is
			-- once Result := default_pointer end
			-- or just Null: POINTER is do end
		end
	
feature {WRAPPER} -- Implementation
	from_external_pointer (a_ptr: POINTER) is
		do
			handle := a_ptr
		end

	from_pointer (a_ptr: POINTER) is
		obsolete "use from_external_pointer instead"
		do
			from_external_pointer(a_ptr)
		end
	
	handle: POINTER
			-- Pointer to the underlying C "thing" (i.e. a struct)
end
	
