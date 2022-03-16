note
   description:
      "Utility class to reference and dereference C pointers."
   copyright:
      "[
               Copyright (C) 2005-2022: Paolo Redaelli

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
deferred class POINTER_HANDLING

insert
   ANY
      undefine copy, is_equal, fill_tagged_out_memory
      end

feature {WRAPPER} -- Pointer referencing and de-referencing
   address_of (a_pointer: POINTER): POINTER
      external "C inline"
      alias "(& ($a_pointer))"
      end

   content_of (a_pointer: POINTER): POINTER
         -- The pointer referenced by `a_pointer' which has to be a
         -- pointer to a pointer (i.e.: void **). Note: the type
         -- cannot be checked by Eiffel AFAIK. Paolo 2006-05-08q.
      external "C inline"
      alias "(* ($a_pointer))"
      end

feature {WRAPPER} -- Dealing with "char **" return types
	strings_array_from (a_pointer: POINTER): FAST_ARRAY[FIXED_STRING]
		-- Build a FAST_ARRAY of STRINGs from `a_pointer' which must be of a
		-- NULL-terminated array of C strings, that is a "char**" String
		-- contents and array itself are copied.
	local l: INTEGER_32; n: NATIVE_ARRAY[POINTER]
	do
		-- Find actual array size to avoid several reallocation of Result
		n := n.from_pointer(a_pointer) -- remember that NATIVE_ARRAY is an expanded type
		from l:=0 until n.item(l).is_null
		loop 
			l:=l+1
		end
		create Result.make(l)
		-- Copying contents
		from l:=0 until l>Result.upper
		loop
			Result.put(create {FIXED_STRING}.from_external_copy(n.item(l)),l)
			l:=l+1
		end
	end

	sized_strings_array_from (a_pointer: POINTER; a_size: INTEGER_32): FAST_ARRAY[FIXED_STRING]
		-- Build a FAST_ARRAY of STRINGs from `a_pointer' which must be of a
		-- array of C strings of `a_size' elements. The actual C type must be
		-- "char**" String contents and array itself are copied.
	local i: INTEGER_32; n: NATIVE_ARRAY[POINTER]
	do
		create Result.make(a_size)
		-- Copying contents
		n := n.from_pointer (a_pointer) -- remember, NATIVE_ARRAY is expanded
		from i:=0 until i>Result.upper
		loop
			Result.put(create {FIXED_STRING}.from_external_copy(n.item(i)),i)
			i:=i+1
		end
	end
end -- class POINTER_HANDLING
