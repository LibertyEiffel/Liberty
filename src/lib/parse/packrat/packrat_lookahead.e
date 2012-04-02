-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PACKRAT_LOOKAHEAD

inherit
   PACKRAT_ALTERNATIVE

feature {ANY}
   is_coherent: BOOLEAN is
      do
         Result := sequence.is_coherent
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := sequence.is_equal(other.sequence)
      end

   copy (other: like Current) is
      do
         sequence:= other.sequence.twin
      end

feature {PACKRAT_INTERNAL}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      do
         sequence.set_default_tree_builders(non_terminal_builder, terminal_builder)
      end

feature {}
   make (a_sequence: like sequence) is
      require
         a_sequence /= Void
      do
         sequence := a_sequence
      ensure
         sequence = a_sequence
      end

feature {PACKRAT_LOOKAHEAD}
   sequence: PACKRAT_SEQUENCE

invariant
   sequence /= Void

end -- class PACKRAT_LOOKAHEAD
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
