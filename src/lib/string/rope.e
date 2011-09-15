class ROPE
   --
   -- A string of characters allowing for efficient concatenation.
   --
   -- See also FIXED_STRING and STRING
   -- http://en.wikipedia.org/Rope_(computer_science) and
   -- http://pcplus.techradar.com/node/3079/

   -- Known bugs: using out with temporary

inherit
   ABSTRACT_STRING
      redefine
         new_iterator, infix "<", out_in_tagged_out_memory
      end

creation {ANY}
   from_strings

feature {ANY} -- Creation
   from_strings (left_string, right_string: ABSTRACT_STRING) is
      do
         left := left_string
         right := right_string
      end

   copy (another: like Current) is
      do
         left := another.left
         right := another.right
      end

feature {ANY}
   count: INTEGER is
      do
         Result := left.count + right.count
      end

   item (an_index: INTEGER): CHARACTER is
         -- Random access is an O(count) operation for a ROPE.
      do
         if an_index <= split_index then
            Result := left.item(an_index)
         else
            Result := right.item(an_index - split_index)
         end
      end

   substring (start_index, end_index: INTEGER): like Current is
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

   occurrences (c: CHARACTER): INTEGER is
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            if item(i) = c then
               Result := Result + 1
            end
            i := i + 1
         end
      end

feature {ANY}
   infix "<" (other: ABSTRACT_STRING): BOOLEAN is
      local
         i: INTEGER; done: BOOLEAN
      do
         from
            i := lower
            check
               i = other.lower
            end
         until
            done or else i > upper or else  i > other.upper
         loop
            if item(i) /= other.item(i) then
               Result := item(i) < other.item(i)
               done := True
            end
            i := i + 1
         end
      end

   is_equal (other: ABSTRACT_STRING): BOOLEAN is
         -- O(min(count,other.count))
      do
         Result := same_as(other)
      end

   hash_code: INTEGER is
      do
         Result := computed_hash_code
      end

   same_as (other: ABSTRACT_STRING): BOOLEAN is
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
            not Result or else i > upper or else  i > other.upper
         loop
            Result := item(i) = other.item(i)
            i := i + 1
         end
      end

   first: CHARACTER is
      do
         Result := left.first
      end

   last: CHARACTER is
      do
         Result := right.last
      end

   has, fast_has (c: CHARACTER): BOOLEAN is
      local
         i: INTEGER
      do
         from
            i := lower
         until
            Result or i > upper
         loop
            Result := item(i) = c
            i:= i + 1
         end
      end

   index_of, fast_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
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

   reverse_index_of, fast_reverse_index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
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

   out_in_tagged_out_memory is
      do
         fill_tagged_out_memory
      end

   fill_tagged_out_memory is
      do
         left.fill_tagged_out_memory
         right.fill_tagged_out_memory
      end

feature {ANY} -- Concatenation
   infix "&" (another: ABSTRACT_STRING): ABSTRACT_STRING is
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
   new_iterator: ITERATOR[CHARACTER] is
      do
         create {ITERATOR_ON_ROPE} Result.make(Current)
      end

   intern: FIXED_STRING is
      do
         Result := out.intern
      end

feature {ANY} -- Interfacing with C string:
   to_external: POINTER is
      do
         Result := out.to_external
      end

feature {ANY}
   recycle is
      do
         left := once ""
         right := once ""
      end

feature {ABSTRACT_STRING, ITERATOR_ON_ROPE} -- Implementation
   split_index: INTEGER is
         -- The index where the rope is split. It corresponds to the length of ther left part of the ROPE.
      do
         Result := left.upper
      ensure
         definition: Result = left.upper
      end

   left, right: ABSTRACT_STRING
         -- The left and right parts of the ROPE

invariant
   left /= Void
   right /= Void

end -- class ROPE
