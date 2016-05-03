note
	description: "Wrapper for a generic C structure allocated with g_malloc0"
	copyright: "(C) 2008 Pablo Moisset"

deferred class G_STRUCT

inherit
	C_STRUCT
		redefine
			allocate, free_handle
		end
insert
	GLIB_MEMORY_ALLOCATION
--		undefine
--			copy, is_equal
--		end

feature {} -- allocation

	allocate is
			-- Allocate an initialized structure
		do
			handle := g_try_malloc0 (struct_size)
			if handle.is_null then raise_exception (No_more_memory) end
		ensure then memory_allocated: handle.is_not_null
		end
	-- wrapping for this objects.  If you have to share this struct
	-- and/or will have pointers to it around that will outlive the
	-- wrapper, please use SHARED_G_STRUCT

feature {ANY} -- Destroying

	dispose  is
			-- Frees the external pointer. Shall be called just before 
			-- the garbage collector removes the wrapper object.
		do
			g_free (handle) -- if necessary. g_free(NULL) is a NOP
			handle:= default_pointer -- null
		end

	free_handle is
			-- release the external memory
		do
			g_free (handle)
		end

end -- class G_STRUCT
