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
		export {} all
		undefine
			is_equal,
			copy
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	from_external_pointer (a_ptr: POINTER) is
		do
			handle := a_ptr
			store_eiffel_wrapper
		ensure
			handle = a_ptr
			stored: is_eiffel_wrapper_stored
		end

	from_pointer (a_ptr: POINTER) is
		obsolete "use from_external_pointer instead"
		do
			from_external_pointer(a_ptr)
		end

feature {} -- Storing wrapper pointer into wrapped object

	store_eiffel_wrapper is
		deferred
		ensure stored: is_eiffel_wrapper_stored
		end

	unstore_eiffel_wrapper is
			-- Remove the "reference" to Current from the underlying
			-- wrapped object. Note: the reference is not necessaraly
			-- stored into the wrapped object itself. In fact the default
			-- implementation - for example - store it into a shared
			-- dictionary.
		require
			not_null: is_not_null
		deferred
		end

	is_eiffel_wrapper_stored: BOOLEAN is
			-- Is a "reference" of the Current Eiffel wrapper object
			-- stored in the underlying wrapped object? 

			-- Note for wrappers developers: do not rely on this
			-- implementation. Heirs will redefine how the storage is
			-- made.
		deferred
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

-- 	is_equal (another: like Current): BOOLEAN is
-- 		do
-- 			handle := another.handle
-- 		end
	
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
	
