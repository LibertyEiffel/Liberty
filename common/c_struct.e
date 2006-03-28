indexing
	description: "Wrapper for a generic C structure"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"


deferred class C_STRUCT

inherit
	WRAPPER undefine is_equal, copy, fill_tagged_out_memory end
		-- Note: use the following instead of "MEMORY redefine dispose
		-- end" to define dispose
	ANY undefine is_equal, copy, fill_tagged_out_memory end
	
insert EXCEPTIONS export {NONE} all undefine is_equal, copy, fill_tagged_out_memory end
	
feature {NONE} -- Initialization
	make is
			-- Allocate an initialized structure
		do
			handle := calloc (1,size)
			if handle.is_null then raise_exception (No_more_memory) end
		ensure memory_allocated: handle.is_not_null
		end

feature -- Queries
	exists: BOOLEAN is
			--  Does Current wrap an existing object? Speaking in C: is handle not NULL?
		do
			Result := handle.is_not_null
		end

feature {NONE} -- Access to C features
	size: INTEGER is
			-- sizeof (wrapped_structure), speaking in C. TODO: shall be a NATURAL
		deferred
		ensure positive: Result > 0 -- TODO: having NATURAL it is plainly useless
		end

	is_shared: BOOLEAN 
			-- Does anybody else (Eiffel or non-Eiffel) have a reference 
			-- to `handle'? If False, then the C-object will be 
			-- destroyed when the the Eiffel object will be collected 
			-- (via destroy object). If True the C-object will not be destroyed.

feature {NONE} -- Destroying
	dispose is
			-- Action to be executed just before garbage collection reclaims an 
			-- object; frees the memory pointed by `handle'
		obsolete "C_STRUCT dispose doesn't free underlying C handle. Explict and know memory leak"
		do
			free (handle) -- if necessary
			handle:= Null 
			-- Not useful handle := default_pointer -- i.e. NULL for C people
			-- Note: we can liberally call g_free; infact if handle is NULL it
			-- simply returns.
		ensure doesnt_exists: not exists
		end
	
feature
	calloc (a_number,a_size: INTEGER): POINTER is
		external "C use <stdlib.h>"
		alias "se_calloc"
		ensure Result.is_not_null
		end

	free (a_ptr: POINTER) is
		external "C use <stdlib.h>"
		end
end

