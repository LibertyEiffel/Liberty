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
		is_equal, -- we really should redefine is_equal and copy for all wrapper classes
		copy
	end
	
insert
	EXCEPTIONS
		undefine
			is_equal,
			copy
		end

feature {WRAPPER} -- syntactic sugar
	Null: POINTER is
			-- NULL. Just a shorthand for `default_pointer' more
			-- understandable by C programmers.
		obsolete "Use default_pointer or is_not_null."
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

feature {}
	clear_handle is
		obsolete "??? Do we need this? Will it do more then just hnalde := default_pointer?"
		do
			handle := default_pointer
		end
		
	-- TODO: what is WRAPPER_HANDLER?
feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	set_handle (a_ptr: POINTER) is
			-- Set a non-null handle. Raises an No_more_memory exception 
			-- if a_ptr.is_null. Use this, if you want to check the 
			-- result of some external allocation function.
		do
			if a_ptr.is_null then
				raise_exception(No_more_memory)
			end
			handle := a_ptr
		ensure
			definition: handle = a_ptr
			not_null: handle.is_not_null
		end
	
	handle: POINTER
		-- Pointer to the underlying C "thing" (i.e. a struct)
end
	
