indexing
	description: "[
					  Wrapper for a generic C structure, that is shared with external
					  code, handle will not be freed on dispose of the
					  Eiffel wrapper object, if is_shared is true
				  ]"
	copyright: "(C) 2006"
	author: "Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"


deferred class SHARED_C_STRUCT

inherit
	C_STRUCT
		-- undefine make
		-- rename make as allocate_struct
		-- Note: otherwise G_LIST and many other classes should be
		-- declared deferred. Note: NULL is the valid empty
		-- GSList. Such a a feature could be useful or necessary
		-- sometimes in order to allocate memory for a shared C
		-- structure.
		redefine
			from_external_pointer, dispose
		end

insert
	SHARED_WRAPPERS_DICTIONARY

feature {WRAPPER, WRAPPER_HANDLER} -- Access to C features
	from_external_pointer (a_ptr: POINTER) is
		do
			Precursor(a_ptr)
			store_eiffel_wrapper
			set_shared
		ensure then
 			stored: is_eiffel_wrapper_stored
		end
	
	is_shared: BOOLEAN
			-- Does anybody else (Eiffel or non-Eiffel) have a reference 
			-- to `handle'? If False, then the C-object will be 
			-- destroyed when the the Eiffel object will be collected 
			-- (via destroy object). If True the C-object will not be destroyed.

	set_shared is
		do
			is_shared := True
		end

	unset_shared, set_unshared is
		do
			is_shared := False
		end

feature {} -- Storing wrapper pointer into wrapped object

	store_eiffel_wrapper is
		local
			a: ANY
		do
			a := Current -- Workaround for SE bug
			wrappers.add (a.to_pointer, handle)
		ensure stored: is_eiffel_wrapper_stored
		end

	unstore_eiffel_wrapper is
			-- Remove the "reference" to Current from the underlying
			-- wrapped object. Note: the reference is not necessarily
			-- stored into the wrapped object itself. The default
			-- implementation for SHARED_C_STRUCT stores it into a shared
			-- dictionary.
		require
			not_null: is_not_null
		do
			wrappers.remove (handle)
		end

	is_eiffel_wrapper_stored: BOOLEAN is
			-- Is a "reference" of the Current Eiffel wrapper object
			-- stored in the underlying wrapped object? 
		do
			Result := wrappers.has(handle)
			debug
				if Result and then to_pointer/=wrappers.at(handle) then
					print ("Warning! The reference (")
					print (wrappers.at(handle).out)
					print (") stored in the wrappers dictionary for the wrapped object (")
					print (handle.out)
					print (") is not equal to the address of Current (")
					print (to_pointer.out)
					print ("). Really bad things will happen...%N")
				end
			end
		end
	
feature {} -- Destroying
	dispose is
			-- Action to be executed just before garbage collection reclaims an 
			-- object; frees the memory pointed by `handle'
		do
			if not is_shared then
				free (handle)
			end
			unstore_eiffel_wrapper
			handle:= default_pointer
		ensure then
			now_null: is_null
		end
end
