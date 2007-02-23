indexing
	description: "Wrapper for a generic C structure"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>, Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

deferred class C_STRUCT

inherit
	WRAPPER

insert EXCEPTIONS
		export {} all
		undefine is_equal, copy
		end

feature {} -- Initialization

	allocate is
			-- Allocate an initialized structure
		do
			handle := calloc (1, struct_size)
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

feature -- Copying

	copy (other: like Current) is
		do
			if other.handle.is_not_null then
				allocate
				handle := memcpy (handle, other.handle, struct_size)
			else
				-- both objects have a NULL handle
			end
		end

	is_equal (another: like Current): BOOLEAN is
		do
			Result:= Current.handle = another.handle
		end

feature {} -- Access to C features

	-- struct_size should be exported to WRAPPER, to be able to check size 
	-- before copying
	struct_size: INTEGER is
			-- sizeof (wrapped_structure), speaking in C. TODO: shall be a NATURAL
		deferred
		ensure positive: Result > 0 -- TODO: having NATURAL it is plainly useless
		end

feature {} -- Handling wrappers

	-- NOTE: C_STRUCT's are considered to be "owned" by the Eiffel
	-- code, and the Eiffel side should keep then longest lived
	-- reference to this struct.  This allows us to forget about
	-- wrapping for this objects.  If you have to share this struct
	-- and/or will have pointers to it around that will outlive the
	-- wrapper, please use SHARED_C_STRUCT

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
			free (handle)
		end

feature {} -- External calls

	calloc (a_number, a_size: INTEGER): POINTER is
		external "C use <stdlib.h>"
		alias "se_calloc"
		ensure Result.is_not_null
		end

	free (a_ptr: POINTER) is
		external "C use <stdlib.h>"
		end

	memcpy (a_dest, a_src: POINTER; a_size: INTEGER): POINTER is
			-- void *memcpy(void *dest, const void *src, size_t n);
		external "C use <stdlib.h>"
		end

	memcmp(a, b: POINTER; len: INTEGER): INTEGER is
		external "C use <string.h>"
		end
			

end -- class C_STRUCT
