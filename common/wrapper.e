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
	-- Wrappers conform to ANY. Why? Sometimes we need to get them via a
	-- POINTER.to_any operation
	ANY
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

	null_or (a_wrapper: WRAPPER): POINTER is
			-- The handle of `a_wrapper', or the default_pointer if 
			-- `a_wrapper' is Void
		do
			if a_wrapper/=Void then Result:=a_wrapper.handle end
		ensure
			definition: Result = default_pointer or else
			            a_wrapper/=Void implies Result = a_wrapper.handle
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
			-- void free(void *ptr);
			--
			-- free() frees the memory space pointed to by ptr, which
			-- must have been returned by a previous call to malloc(),
			-- calloc() or realloc(). Otherwise, or if free(ptr) has
			-- already been called before, undefined behaviour occurs.
			-- If ptr is NULL, no operation is performed.
		external "C use <stdlib.h>"
		end

	memcpy (a_dest, a_src: POINTER; a_size: INTEGER): POINTER is
			-- void *memcpy(void *dest, const void *src, size_t n);
			-- 
			-- The memcpy() function copies n bytes from memory area src
			-- to memory area dest. The memory areas should not overlap.
			-- Use memmove(3) if the memory areas do overlap.
		external "C use <stdlib.h>"
		end

	memcmp(a, b: POINTER; len: INTEGER): INTEGER is
			-- int memcmp(const void *s1, const void *s2, size_t n);
			-- 
			-- The memcmp() function compares the first n bytes of
			-- the memory areas s1 and s2. It returns an integer less than, equal to,
			-- or greater than zero if s1 is found, respectively, to be less
			-- than, to match, or be greater than s2.
			external "C use <string.h>"
			end

end -- class WRAPPER
