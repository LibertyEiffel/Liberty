indexing
	description: "A class that can handle WRAPPER's internals"
	copyright: "[
					Copyright (C) 2005 Paolo Redaelli
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

deferred class WRAPPER_HANDLER
	-- A class that can access some internal representation of a WRAPPER.

inherit
	ANY
		undefine
			is_equal,
			copy,
			out_in_tagged_out_memory,
			fill_tagged_out_memory
		end

insert
	EXCEPTIONS
		export {} all
		undefine
			is_equal,
			copy,
			out_in_tagged_out_memory,
			fill_tagged_out_memory
		end

feature {} -- Utility features 
	null_or (a_wrapper: WRAPPER): POINTER is
			-- The handle of `a_wrapper', or the default_pointer if 
			-- `a_wrapper' is Void
		do
			if a_wrapper/=Void then Result:=a_wrapper.handle end
		ensure
			definition: Result = default_pointer or else
							(a_wrapper/=Void and then Result = a_wrapper.handle)
		end

	null_or_string (a_string: ABSTRACT_STRING): POINTER is
		-- A pointer to a memory area containing the content of `a_string' or
		-- default_pointer if `a_string' is Void. The memory area may be the
		-- internal buffer of `a_string' or a newly allocated one.
		do
			if a_string/=Void 
			 then Result:=a_string.to_external
			else
				check Result.is_null end 
			end
		ensure definition: ((Result = default_pointer) or
							 (a_string/=Void implies Result=a_string.to_external))
		end

	null_or_array (a_collection: WRAPPER_COLLECTION[WRAPPER]): POINTER is
		-- A pointer to the contenct of `a_collection' or NULL (default_pointer) if `a_collection' is Void
		do
			if a_collection/=Void then
				Result:=a_collection.as_c_array.to_pointer
			end
		ensure definition: a_collection=Void implies Result.is_null and a_collection/=Void implies Result.is_not_null
		end
	
	collection_to_c_array (a_collection: COLLECTION[WRAPPER]): FAST_ARRAY[POINTER] is
		-- An array containing the pointers to the objects wrapped by `a_collection' wrappers. 
	require 
		a_collection/=Void
		not a_collection.is_empty
	local i: ITERATOR[WRAPPER]
	do
		create Result.with_capacity(a_collection.count)
		from i:=a_collection.new_iterator; i.start 
		until i.is_off loop
			Result.add_last(i.item.handle); i.next
		end
	end


feature {} -- Wrapper related exceptions
	pointer_to_unwrapped_deferred_object: STRING is
		"A C function returned a pointer to an unwrapped object which is wrapped by a deferred class. It is not possible to create a correct wrapper."
	retrieved_object_mismatch: STRING is
		"Retrieved_object_mismatch: the Eiffel wrapper associated with a pointer is not an actual wrapper for the object referred by that pointer "
	copying_an_uncopyable: STRING is
		"Trying to copy an uncopyable wrapper: such objects are usually shortly lived" 

feature {} -- External calls

	se_calloc (a_number, a_size: INTEGER): POINTER is
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
end
