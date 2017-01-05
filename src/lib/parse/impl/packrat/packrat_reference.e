-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_REFERENCE

inherit
   PACKRAT_PRIMARY
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   name: FIXED_STRING

   is_coherent: BOOLEAN
      do
         Result := nt.table.has(name)
      end

   out_in_tagged_out_memory
      do
         name.out_in_tagged_out_memory
      end

   accept (visitor: PACKRAT_VISITOR)
      do
         visitor.visit_reference(Current)
      end

feature {}
   pack_parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE
      local
         atom: PARSE_ATOM[PACKRAT_PARSE_CONTEXT]
         index: STRING
      do
         atom := nt.table.item(name)
         debug ("parse")
            index := context.buffer.current_index.out
            log.trace.put_line(once "parsing reference %"#(1)%" from #(2) at #(3): atom is #(4)" # name # nt.name # index # atom.out)
         end
         Result := atom.parse(context)
         debug ("parse")
            log.trace.put_line(once " parsed reference %"#(1)%" from #(2) at #(3): returned #(4)" # name # nt.name # index # Result.out)
         end
      end

feature {PACKRAT_INTERNAL}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
      do
      end

feature {}
   make (a_name: ABSTRACT_STRING)
      require
         a_name /= Void
      do
         name := a_name.intern
      ensure
         name = a_name.intern
      end

end -- class PACKRAT_REFERENCE
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
