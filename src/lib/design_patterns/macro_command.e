-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MACRO_COMMAND[C_ -> COMMAND]
   --
   -- A very useful kind of Command: that's a bunch of commands to be executed at once.
   --

inherit
   COMMAND
      undefine fill_tagged_out_memory, out_in_tagged_out_memory, default_create
      redefine copy, is_equal
      end
   COLLECTION[C_]
      undefine default_create, out_in_tagged_out_memory
      end

insert
   FAST_ARRAY[C_]
      redefine copy, is_equal
      end

create {ANY}
   make, with_capacity

feature {ANY}
   execute
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            item(i).execute
            i := i + 1
         end
      end

   copy (other: like Current)
      do
         Precursor {FAST_ARRAY} (other)
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := Precursor {FAST_ARRAY} (other)
      end

end -- class MACRO_COMMAND
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
