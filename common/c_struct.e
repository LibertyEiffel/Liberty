indexing
	description: "Wrapper for a generic C structure"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>, Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"


deferred class C_STRUCT

inherit
	WRAPPER

	-- redefine copy
insert EXCEPTIONS export {NONE} all undefine is_equal end
	
feature {} -- Initialization
	make is
			-- Allocate an initialized structure
		do
			handle := calloc (1, size)
			if handle.is_null then raise_exception (No_more_memory) end
		ensure memory_allocated: handle.is_not_null
		end

feature -- Queries
	exists: BOOLEAN is
			--  Does Current wrap an existing object? Speaking in C: is handle not 
			--  NULL?
		obsolete "use is_not_null instead"
		do
			Result := is_not_null
		end
	-- TODO: implement copy using memcpy
	
feature {WRAPPER} -- Access to C features
	-- size should be exported to WRAPPER, to be able to check size 
	-- before copying
	size: INTEGER is
			-- sizeof (wrapped_structure), speaking in C. TODO: shall be a NATURAL
		deferred
		ensure positive: Result > 0 -- TODO: having NATURAL it is plainly useless
		end

feature {} -- Destroying
	dispose, force_free_handle  is
			-- Frees the external pointer. Shall be called just before 
			-- the garbage collector removes the wrapper object.
		do
			free (handle) -- if necessary. free(NULL) is a NOP
			handle:= default_pointer -- null
		ensure
			cleared: is_null
		end

	free_handle is
			-- release the external memory
		do
			free(handle)
		end
	
feature {}
	calloc (a_number, a_size: INTEGER): POINTER is
		external "C use <stdlib.h>"
		alias "se_calloc"
		ensure Result.is_not_null
		end

	free (a_ptr: POINTER) is
		external "C use <stdlib.h>"
		end
end

