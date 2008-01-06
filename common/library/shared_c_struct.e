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
			copy, from_external_pointer, dispose
		end

insert
	SHARED_WRAPPERS_DICTIONARY

feature {WRAPPER, WRAPPER_HANDLER} -- Access to C features
	
	from_external_pointer (a_ptr: POINTER) is
		do
			Precursor(a_ptr)
			-- store_eiffel_wrapper
			set_shared
		-- ensure then stored: is_eiffel_wrapper_stored
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

feature -- Copying

	copy (another: like Current) is
		do
			handle := another.handle
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Destroying

	dispose is
			-- Action to be executed just before garbage collection reclaims an 
			-- object; frees the memory pointed by `handle'
		do
			if is_not_null then
				if not is_shared then
					free (handle)
				end
				-- unstore_eiffel_wrapper
				handle := default_pointer
			end
		ensure then
			now_null: is_null
		end

end -- class SHARED_C_STRUCT
