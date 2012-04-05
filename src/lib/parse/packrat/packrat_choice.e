-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_CHOICE

inherit
   PACKRAT_PATTERN

create {PACKRAT_ALTERNATIVE}
   make

feature {ANY}
   is_coherent: BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := alternatives.lower
         until
            not Result or else i > alternatives.upper
         loop
            Result := alternatives.item(i).is_coherent
            i := i + 1
         end
      end

   infix "/" (other: PACKRAT_ALTERNATIVE): PACKRAT_PATTERN is
      do
         alternatives.add_last(other)
         Result := Current
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := alternatives.is_equal(other.alternatives)
      end

   copy (other: like Current) is
      do
         alternatives := other.alternatives.twin
      end

   out_in_tagged_out_memory is
      local
         i: INTEGER
      do
         from
            i := alternatives.lower
         until
            i > alternatives.upper
         loop
            if i > alternatives.lower then
               tagged_out_memory.append(once " / ")
            end
            alternatives.item(i).out_in_tagged_out_memory
            i := i + 1
         end
      end

feature {PACKRAT_INTERNAL}
   parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE is
      local
         i: INTEGER
      do
         from
            Result := no
            i := alternatives.lower
         until
            Result /= no or else i > alternatives.upper
         loop
            Result := alternatives.item(i).parse(context)
            i := i + 1
         end
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      local
         i: INTEGER
      do
         from
            i := alternatives.lower
         until
            i > alternatives.upper
         loop
            alternatives.item(i).set_default_tree_builders(non_terminal_builder, terminal_builder)
            i := i + 1
         end
      end

feature {}
   make (first, second: PACKRAT_ALTERNATIVE) is
      require
         first /= Void
         second /= Void
      do
         create alternatives.with_capacity(2)
         alternatives.add_last(first)
         alternatives.add_last(second)
      ensure
         alternatives.count = 2
         alternatives.first = first
         alternatives.last = second
      end

feature {PACKRAT_CHOICE}
   alternatives: FAST_ARRAY[PACKRAT_ALTERNATIVE]

invariant
   useful: alternatives.count > 1
   correct: alternatives.for_all(agent (alt: PACKRAT_ALTERNATIVE): BOOLEAN is do Result := alt /= Void end)

end -- class PACKRAT_CHOICE
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
