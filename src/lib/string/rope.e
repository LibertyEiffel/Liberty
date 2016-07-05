-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ROPE
   --
   -- A string of characters allowing for efficient concatenation.
   --
   -- See also LAZY_STRING, FIXED_STRING, and STRING
   --
   -- http://en.wikipedia.org/Rope_(computer_science)
   -- http://pcplus.techradar.com/node/3079/

   --|NOTE: this class works on the assumption that lower = 1 (see ABSTRACT_STRING invariant)

inherit
   ABSTRACT_STRING
      redefine
         new_iterator, infix "<", out_in_tagged_out_memory
      end

create {ANY}
   from_strings

feature {ANY} -- Creation
   from_strings (left_string, right_string: ABSTRACT_STRING)
      require
         left_string /= Void
         right_string /= Void
      do
         left := left_string
         right := right_string
      end

   copy (another: like Current)
      do
         from_strings(another.left, another.right)
      end

feature {ANY}
   count: INTEGER
      do
         Result := left.count + right.count
      end

   item (an_index: INTEGER): CHARACTER
         -- Random access is an O(count) operation for a ROPE.
      do
         if an_index <= split_index then
            Result := left.item(an_index)
         else
            Result := right.item(an_index - split_index)
         end
      end

   substring (start_index, end_index: INTEGER): like Current
      local
         left_substring, right_substring: ABSTRACT_STRING
      do
         if end_index <= split_index then
            left_substring := left.substring(start_index, end_index)
            right_substring := once ""
         elseif start_index > split_index then
            left_substring := once ""
            right_substring := right.substring(start_index - split_index, end_index - split_index)
         else
            left_substring := left.substring(start_index, split_index)
            right_substring := right.substring(1, end_index - split_index)
         end
         create Result.from_strings(left_substring, right_substring)
      end

   occurrences (c: CHARACTER): INTEGER
      do
         Result := left.occurrences(c) + right.occurrences(c)
      end

feature {ANY}
   infix "<" (other: ABSTRACT_STRING): BOOLEAN
      local
         i: INTEGER; done: BOOLEAN
      do
         from
            i := lower
            check
               i = other.lower
            end
         until
            done or else i > upper or else i > other.upper
         loop
            if item(i) /= other.item(i) then
               Result := item(i) < other.item(i)
               done := True
            end
            i := i + 1
         end
      end

   is_equal (other: ABSTRACT_STRING): BOOLEAN
         -- O(min(count,other.count))
      do
         Result := same_as(other)
      end

   hash_code: INTEGER
      do
         Result := computed_hash_code
      end

   same_as (other: ABSTRACT_STRING): BOOLEAN
         -- O(min(count,other.count))
      local
         i: INTEGER
      do
         from
            i := lower
            check
               i = other.lower
            end
            Result := True
         until
            not Result or else i > upper or else i > other.upper
         loop
            Result := item(i) = other.item(i)
            i := i + 1
         end
      end

   first: CHARACTER
      do
         Result := left.first
      end

   last: CHARACTER
      do
         Result := right.last
      end

   has, fast_has (c: CHARACTER): BOOLEAN
      do
         Result := left.has(c) or else right.has(c)
      end

   index_of, fast_index_of (c: CHARACTER; start_index: INTEGER): INTEGER
      do
         if start_index > split_index then
            Result := right.index_of(c, start_index - split_index) + split_index
         else
            Result := left.index_of(c, start_index)
            if not left.valid_index(Result) then
               Result := right.index_of(c, right.lower) + split_index
            end
         end
      end

   reverse_index_of, fast_reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER
      do
         if start_index <= split_index then
            Result := left.reverse_index_of(c, start_index)
         else
            Result := right.reverse_index_of(c, start_index - split_index)
            if right.valid_index(Result) then
               Result := Result + split_index
            else
               Result := left.reverse_index_of(c, left.upper)
            end
         end
      end

   out_in_tagged_out_memory
      do
         tagged_out_memory.append(left)
         tagged_out_memory.append(right)
      end

   fill_tagged_out_memory
      do
         tagged_out_memory.append(once "[left: ")
         left.fill_tagged_out_memory
         tagged_out_memory.append(once " | right: ")
         right.fill_tagged_out_memory
         tagged_out_memory.append(once "]")
      end

feature {ANY} -- Concatenation
   infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING
         -- A newly allocated string containing Current and `another'
         -- concatenated. Implementation may choose any effective heir of
         -- ABSTRACT_STRING.
      do
         if another.is_empty then
            Result := Current
         elseif is_empty then
            Result := another
         elseif left.is_empty then
            Result := right | another
         elseif right.is_empty then
            Result := left | another
         else
            Result := Current | another
         end
      end

feature {ANY} -- Iterating and other features
   new_iterator: ITERATOR[CHARACTER]
      do
         create {ITERATOR_ON_ROPE} Result.make(Current)
      end

   intern: FIXED_STRING
      do
         Result := out.intern
      end

feature {ANY} -- Interfacing with C string:
   to_external: POINTER
      do
         Result := out.to_external
      end

feature {ANY}
   recycle
      do
         left := once ""
         right := left
      end

feature {ABSTRACT_STRING, ITERATOR_ON_ROPE} -- Implementation
   left, right: ABSTRACT_STRING
         -- The left and right parts of the ROPE

feature {} -- Split index
   split_index: INTEGER
         -- The index where the rope is split. It corresponds to the length of the left part of the ROPE.
      do
         Result := left.upper
      ensure
         definition: Result = left.upper
      end

invariant
   left /= Void
   right /= Void

end -- class ROPE
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
