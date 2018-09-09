-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_NON_TERMINAL
   --
   -- A non-terminal meant to be put in a PARSE_TABLE.
   --

inherit
   PARSE_NON_TERMINAL[PACKRAT_PARSE_CONTEXT]
   PACKRAT_ATOM
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   out_in_tagged_out_memory
      do
         pattern.out_in_tagged_out_memory
      end

   accept (visitor: PACKRAT_VISITOR)
      do
         visitor.visit_non_terminal(Current)
      end

   pretty_print_on (stream: OUTPUT_STREAM)
      local
         pp: PACKRAT_PRETTY_PRINTER
      do
         create pp.make(stream)
         accept(pp)
      end

   is_coherent: BOOLEAN
      do
         Result := pattern.is_coherent
      end

feature {PARSER_FACET}
   parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE
      do
         debug ("parse")
            log.trace.put_line(once "----> %"#(1)%" at #(2)" # name # context.buffer.current_index.out)
            context.buffer.print_position_on(log.trace)
         end
         Result := pattern.parse(context)
         debug ("parse")
            log.trace.put_line(once "<---- %"#(1)%" => #(2) at #(3)" # name # Result.out # context.buffer.current_index.out)
            context.buffer.print_position_on(log.trace)
         end
      end

feature {PARSE_TABLE}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
      do
         pattern.set_default_tree_builders(non_terminal_builder, terminal_builder)
      end

feature {ANY}
   copy (other: like Current)
      do
         name := other.name
         pattern := other.pattern.twin
         pattern.set_nt(Current)
         is_initialized := True
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := name.is_equal(other.name) and then pattern.is_equal(other.pattern)
      end

feature {}
   make (a_pattern: like pattern)
      require
         a_pattern /= Void
         a_pattern.nt = Void
      do
         a_pattern.set_nt(Current)
         pattern := a_pattern
         is_initialized := True
      ensure
         pattern = a_pattern
      end

   sequence_count: INTEGER
   is_initialized: BOOLEAN

feature {PACKRAT_NON_TERMINAL, PACKRAT_VISITOR}
   pattern: PACKRAT_PATTERN

feature {PACKRAT_SEQUENCE}
   new_sequence_number: INTEGER
      do
         Result := sequence_count + 1
         sequence_count := Result
      end

invariant
   is_initialized implies pattern /= Void
   pattern /= Void implies pattern.nt = Current

end -- class PACKRAT_NON_TERMINAL
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
