-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LAZY_STRING
	-- A string made with the output of an agent function given at creation time. 

	-- The agent function will be run only when actually required, for example
	-- accessing the elements of the string or iterating over it; the result
	-- of the agent function will be cached for further usage.
inherit
   ABSTRACT_STRING
      redefine
         immutable, copy_slice_to_native, new_iterator, lazy_out, prefix "&"
      end

create {ANY}
   make

feature {ANY} -- redefinitions
   fill_tagged_out_memory is
      do
         tagged_out_memory.append(once "[lazy outter: ")
         tagged_out_memory.append(outter.out)
         tagged_out_memory.append(once "]")
      end

   immutable: BOOLEAN is True

   new_iterator: ITERATOR[CHARACTER] is
      do
         Result := lazy_out_.new_iterator
      end

   lazy_out, prefix "&": ABSTRACT_STRING is
      do
         Result := Current
      end

feature {ANY} -- from ABSTRACT_STRING
   copy (other: like Current) is
      do
         check False end
      end

   item (i: INTEGER): CHARACTER is
      do
         Result := lazy_out_.item(i)
      end

   is_equal, same_as (other: ABSTRACT_STRING): BOOLEAN is
      do
         Result := lazy_out_.is_equal(other)
      end

   occurrences (c: CHARACTER): INTEGER is
      do
         Result := lazy_out_.occurrences(c)
      end

   infix "&" (other: ABSTRACT_STRING): ABSTRACT_STRING is
      do
         create {ROPE} Result.from_strings(Current, other)
      end

   first: CHARACTER is
      do
         Result := lazy_out_.first
      end

   last: CHARACTER is
      do
         Result := lazy_out_.last
      end

   substring (start_index, end_index: INTEGER): like Current is
      do
         create Result.make(agent substring_out(Current, start_index, end_index))
      end

   intern: FIXED_STRING is
      do
         Result := lazy_out_.intern
      end

   to_external: POINTER is
      do
         Result := lazy_out_.to_external
      end

feature {ANY} -- from SEARCHABLE
   has (x: like item): BOOLEAN is
      do
         Result := lazy_out_.has(x)
      end

   fast_has (x: like item): BOOLEAN is
      do
         Result := lazy_out_.fast_has(x)
      end

   index_of (element: like item; start_index: INTEGER): INTEGER is
      do
         Result := lazy_out_.index_of(element, start_index)
      end

   reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
      do
         Result := lazy_out_.reverse_index_of(element, start_index)
      end

   fast_index_of (element: like item; start_index: INTEGER): INTEGER is
      do
         Result := lazy_out_.fast_index_of(element, start_index)
      end

   fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
      do
         Result := lazy_out_.fast_reverse_index_of(element, start_index)
      end

feature {ANY} -- from HOARD
   count: INTEGER is
      do
         Result := lazy_out_.count
      end

feature {ANY} -- from HASHABLE
   hash_code: INTEGER is
      do
         Result := lazy_out_.hash_code
      end

feature {RECYCLING_POOL}
   recycle is
      do
      end

feature {STRING_HANDLER}
   copy_slice_to_native (start_index, end_index: INTEGER; target: NATIVE_ARRAY[CHARACTER]; target_offset: INTEGER) is
      do
         lazy_out_.copy_slice_to_native(start_index, end_index, target, target_offset)
      end

feature {}
   make (a_outter: like outter) is
      require
         a_outter /= Void
      do
         outter := a_outter
      ensure
         outter = a_outter
      end

   substring_out (a_lazy_string: like Current; start_index, end_index: INTEGER): ABSTRACT_STRING is
      do
         Result := a_lazy_string.lazy_out_.substring(start_index, end_index)
      end

   outter: FUNCTION[TUPLE, ABSTRACT_STRING]

   lazy_out_memory: WEAK_REFERENCE[ABSTRACT_STRING]

feature {LAZY_STRING}
   lazy_out_: ABSTRACT_STRING is
      do
         if lazy_out_memory /= Void then
            Result := lazy_out_memory.item
         end
         if Result = Void then
            Result := outter.item([])
         end
         if lazy_out_memory = Void then
            create lazy_out_memory.set_item(Result)
         else
            lazy_out_memory.set_item(Result)
         end
      end

invariant
   immutable

end -- class LAZY_STRING
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
