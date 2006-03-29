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
		copy
	end
	
insert
	EXCEPTIONS
		undefine
			copy
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
	
feature {ANY} -- Implementation
	is_null: BOOLEAN is
		do
			Result := handle.is_null
		ensure
			definition: Result = handle.is_null
		end

	is_not_null: BOOLEAN is
		do
			Result := handle.is_not_null
		ensure
			definition: Result = handle.is_not_null
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	set_handle (a_ptr: POINTER) is
		do
			if a_ptr.is_null then
				raise_exception(No_more_memory)
			end
			handle := a_ptr
		ensure
			definition: handle = a_ptr
			not_null: handle.is_not_null
		end
	
	clear_handle is
		local
			null: POINTER
		do
			handle := null
		ensure
			is_null
		end
	
	handle: POINTER
		-- Pointer to the underlying C "thing" (i.e. a struct)
end
	
