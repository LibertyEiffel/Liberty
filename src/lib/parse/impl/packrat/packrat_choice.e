-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_CHOICE

inherit
   PACKRAT_PATTERN
      redefine
         set_nt
      end

create {PACKRAT_ALTERNATIVE}
   make

feature {ANY}
   is_coherent: BOOLEAN
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

   infix "/" (other: PACKRAT_ALTERNATIVE): PACKRAT_PATTERN
      do
         alternatives.add_last(other)
         Result := Current
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := alternatives.is_equal(other.alternatives)
      end

   copy (other: like Current)
      do
         alternatives := other.alternatives.twin
      end

   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         from
            i := alternatives.lower
         until
            i > alternatives.upper
         loop
            if i > alternatives.lower then
               (once " / ").out_in_tagged_out_memory
            end
            alternatives.item(i).out_in_tagged_out_memory
            i := i + 1
         end
      end

   accept (visitor: PACKRAT_VISITOR)
      do
         visitor.visit_choice(Current)
      end

feature {}
   pack_parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE
      local
         i: INTEGER
      do
         debug ("parse")
            log.trace.put_line(once "parsing choice of #(1) at #(2)" # nt.name # context.buffer.current_index.out)
         end
         from
            Result := no
            i := alternatives.lower
         until
            Result /= no or else i > alternatives.upper
         loop
            debug ("parse")
               log.trace.put_line(once "  parse choice ##(1) of #(2) at #(3): #(4)" # i.out # nt.name # context.buffer.current_index.out # alternatives.item(i).out)
            end
            Result := alternatives.item(i).parse(context)
            i := i + 1
         end
      end

feature {PACKRAT_INTERNAL}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
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

   set_nt (a_nt: like nt)
      local
         i: INTEGER
      do
         Precursor(a_nt)
         from
            i := alternatives.lower
         until
            i > alternatives.upper
         loop
            alternatives.item(i).set_nt(a_nt)
            i := i + 1
         end
      end

feature {}
   make (first, second: PACKRAT_ALTERNATIVE)
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

feature {PACKRAT_CHOICE, PACKRAT_VISITOR}
   alternatives: FAST_ARRAY[PACKRAT_ALTERNATIVE]

invariant
   useful: alternatives.count > 1
   correct: alternatives.for_all(agent (alt: PACKRAT_ALTERNATIVE): BOOLEAN do Result := alt /= Void end(?))

end -- class PACKRAT_CHOICE
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
