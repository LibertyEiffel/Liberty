-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class TRISTATE
--
-- Yes, No, Maybe tri-state operators. Convert to and from booleans.
-- All boolean operators are implemented with "maybe" management.
--
--| TODO: make it native to have a real semi-evaluation of `and then' and `or else'

insert
   TRISTATE_VALUES
      redefine
         is_equal, out_in_tagged_out_memory
      end

feature {ANY} -- Expressions:
   to_boolean: BOOLEAN
      require
         certain_state: not is_equal(maybe)
      do
         Result := value = yes_value
      end

   from_boolean (b: BOOLEAN): TRISTATE
      do
         if b then
            Result := with_value(yes_value)
         else
            Result := with_value(no_value)
         end
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.value = value
      end

   prefix "not": TRISTATE
      do
         inspect
            value
         when yes_value then
            Result := no
         when no_value then
            Result := yes
         else
            Result := maybe
         end
      end

   infix "and" (other: TRISTATE): TRISTATE
      do
         Result := Current and then other
      end

   infix "or" (other: TRISTATE): TRISTATE
      do
         Result := Current or else other
      end

   infix "and then" (other: TRISTATE): TRISTATE
      do
         if value = maybe_value or else other.value = maybe_value then
            Result := maybe
         else
            Result := from_boolean(to_boolean and then other.to_boolean)
         end
      end

   infix "or else" (other: TRISTATE): TRISTATE
      do
         if value = maybe_value or else other.value = maybe_value then
            Result := maybe
         else
            Result := from_boolean(to_boolean or else other.to_boolean)
         end
      end

   infix "implies" (other: TRISTATE): TRISTATE
      do
         Result := (not Current) or else other
      end

   infix "xor" (other: TRISTATE): TRISTATE
      do
         if value = maybe_value or else other.value = maybe_value then
            Result := maybe
         else
            Result := from_boolean(to_boolean xor other.to_boolean)
         end
      end

   out_in_tagged_out_memory
      do
         inspect
            value
         when yes_value then
            tagged_out_memory.append(once "yes")
         when no_value then
            tagged_out_memory.append(once "no")
         when maybe_value then
            tagged_out_memory.append(once "maybe")
         end
      end

feature {TRISTATE, TRISTATE_VALUES}
   with_value (a_value: like value): TRISTATE
      do
         value := a_value
         Result := Current
      end

   value: INTEGER_8

   yes_value: INTEGER_8 1
   no_value: INTEGER_8 -1
   maybe_value: INTEGER_8 0

end -- class TRISTATE
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
