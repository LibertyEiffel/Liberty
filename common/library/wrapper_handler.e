indexing
	description: "A class that can handle WRAPPER's internals"
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class WRAPPER_HANDLER

inherit
	ANY
		undefine
			is_equal,
			copy,
			fill_tagged_out_memory
		end

insert
	EXCEPTIONS
		export {} all
		undefine
			is_equal,
			copy,
			fill_tagged_out_memory
		end

feature {} -- Low-level functions
	null_or (a_wrapper: WRAPPER): POINTER is
			-- The handle of `a_wrapper', or the default_pointer if 
			-- `a_wrapper' is Void
		do
			if a_wrapper/=Void then Result:=a_wrapper.handle end
		ensure
			definition: Result = default_pointer or else
							(a_wrapper/=Void and then Result = a_wrapper.handle)
		end

	null_or_string(a_string: STRING): POINTER is
			-- 
		do
			if a_string/=Void 
			 then Result:=a_string.to_external
			else
				check Result.is_null end 
			end
		ensure definition:
			definition: ((Result = default_pointer) or
							 (a_string/=Void implies Result=a_string.to_external))
		end
feature {} -- Wrapper related exceptions
	pointer_to_unwrapped_deferred_object: STRING is
		"A C function returned a pointer to an unwrapped object which is wrapped by a deferred class. It is not possible to create a correct wrapper."
	retrieved_object_mismatch: STRING is
		"Retrieved_object_mismatch: the Eiffel wrapper associated with a pointer is not an actual wrapper for the object referred by that pointer "
	no_proper_wrapper_available: STRING is
		"The Eiffel wrapper library encountered an unwrapped object pointer. Its type, obtained by the run-time of the wrapped library and its parent types have no available wrapper. The Eiffel library is unable to handle this object. This is a bug, please inform the developers of the program."
	
	unimplemented is
		do
			sedb_breakpoint
			std_error.put_string
			("[
			  An unimplemented feature has been called.
			  Please notify this bug to the developer of the application or to the
			  Eiffel Wrapper Library Collection project, writing to the mailing list
			  eiffel-libraries-devel@gna.org

														 Happy hacking and thanks in advance.
																					 The EWLC  team.

			  The error occurred in the type
			  ]")
			std_error.put_string(generating_type)
			std_error.put_line(".")
			crash
		end

feature {} -- External calls
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
