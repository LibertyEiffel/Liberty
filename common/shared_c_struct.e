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
		undefine
			make--, copy -- should copy be redefined in the subclasses?
		redefine
			dispose
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Access to C features
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

feature {} -- Destroying

	dispose is
			-- Action to be executed just before garbage collection reclaims an 
			-- object; frees the memory pointed by `handle'
		do
			if not is_shared then
				free (handle) -- if necessary
			end
			handle:= default_pointer
		ensure then
			now_null: is_null
		end

end
