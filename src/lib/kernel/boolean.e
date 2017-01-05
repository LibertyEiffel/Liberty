-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class BOOLEAN
   --
   -- Note: An Eiffel BOOLEAN is mapped as a C char or as a Java byte.
   --

insert
   ANY
      redefine out_in_tagged_out_memory, fill_tagged_out_memory
      end

feature {ANY}
   infix "and" (other: BOOLEAN): BOOLEAN
         -- `and' of Current with `other'.
         --
         -- Note: when evaluation of `other' has no side effects, it
         -- may be better to use "and then" to avoid execution-time
         -- overhead.
      do
         Result := Current and then other
      end

   infix "and then" (other: BOOLEAN): BOOLEAN
         -- Semi-strict `and' of Current with `other'.
      external "built_in"
      end

   infix "implies" (other: BOOLEAN): BOOLEAN
         -- Does Current imply `other'.
      external "built_in"
      end

   infix "or" (other: BOOLEAN): BOOLEAN
         -- `or' of Current with `other'
         --
         -- Note: when evaluation of `other' has no side effects, it
         -- may be better to use "or else" to avoid execution-time
         -- overhead.
      do
         Result := Current or else other
      end

   infix "or else" (other: BOOLEAN): BOOLEAN
         -- Semi-strict `or' of Current with `other'
      external "built_in"
      end

   infix "xor" (other: BOOLEAN): BOOLEAN
         -- `xor' of Current with `other'
      do
         Result := Current /= other
      end

   prefix "not": BOOLEAN
         -- `not' of Current.
      do
         Result := Current = False
      end

   to_string: STRING
      do
         if Current then
            Result := once "True"
         else
            Result := once "False"
         end
      ensure
         (once "True").is_equal(Result) implies Current
         ;(once "False").is_equal(Result) implies not Current
      end

   to_integer: INTEGER
      do
         if Current then
            Result := 1
         else
            Result := 0
         end
      ensure
         Result = 1 implies Current
         Result = 0 implies not Current
      end

   to_character: CHARACTER
      do
         if Current then
            Result := '1'
         else
            Result := '0'
         end
      ensure
         Result = '1' implies Current
         Result = '0' implies not Current
      end

   append_in (str: STRING)
      do
         str.append(to_string)
      end

feature {ANY} -- Object Printing:
   out_in_tagged_out_memory, fill_tagged_out_memory
      do
         tagged_out_memory.append(to_string)
      end

end -- class BOOLEAN
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
