indexing
	description: "Deferred empty class handling low-level C interfaces. Its heirs will fully expose each other their internals"
	copyright: "(C) 2005 Paolo Redaelli "
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
	-- Wrappers conform to ANY. Why? Sometimes we need to get them via a
	-- POINTER.to_any operation
	ANY
		undefine
			is_equal, -- we really should redefine is_equal and copy for all wrapper classes
			copy
		end

insert
	WRAPPER_HANDLER -- to access `null_or', `null_or_string', exceptions' strings and external calls

	POINTER_HANDLING -- to access `address_of' and `content_of'

feature {WRAPPER, WRAPPER_HANDLER} -- Implementation
	dummy is
			-- Creation feature for dummy object. Sometime an Eiffel
			-- wrapper shall be created without having a real wrapped
			-- object, i.e. as an archetype in COLLECTIONs or when an
			-- effective G_OBJECT heir dummy object is registered to
			-- create a link between a GType and its Eiffel wrapper
			-- class.
		do
		end
	
	from_external_pointer (a_ptr: POINTER) is
		do
			handle := a_ptr
		ensure
			handle = a_ptr
		end

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
	
	reference: POINTER is
			-- The address of `handle'. Usuful to be passed to C
			-- functions that asks for pointer to pointer to struct
			-- (i.e. "GError **error")
		do
			Result:=address_of(handle)
		end

feature {} -- External calls
	calloc (a_number, a_size: INTEGER): POINTER is
			-- void *calloc(size_t nmemb, size_t size);
			--
			-- calloc() allocates memory for an array of nmemb elements
			-- of size bytes each and returns a pointer to the allocated
			-- memory. The memory is set to zero.
		external "C use <stdlib.h>"
		alias "se_calloc"
		ensure Result.is_not_null
		end

	free (a_ptr: POINTER) is
			-- Standard C function to free memory:
			-- void free(void *ptr);
			--
			-- free() frees the memory space pointed to by ptr, which
			-- must have been returned by a previous call to malloc(),
			-- calloc() or realloc(). Otherwise, or if free(ptr) has
			-- already been called before, undefined behaviour occurs.
			-- If ptr is NULL, no operation is performed.
			--

			-- Redefine this feature when a wrapped "class" provide its
			-- own specialized function.
		external "C use <stdlib.h>"
		end

end -- class WRAPPER
