-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_PRETTY_PRINTER

inherit
   PACKRAT_VISITOR

insert
   PACKRAT

create {ANY}
   make

feature {PACKRAT_NON_TERMINAL}
   visit_non_terminal (visited: PACKRAT_NON_TERMINAL)
      do
         stream.put_string(visited.name)
         stream.put_string(once " <- ")
         visited.pattern.accept(Current)
         stream.put_new_line
      end

feature {PACKRAT_TERMINAL}
   visit_terminal (visited: PACKRAT_TERMINAL)
      do
         -- nothing
      end

feature {PACKRAT_AND}
   visit_and (visited: PACKRAT_AND)
      do
         stream.put_character('&')
         visited.primary.accept(Current)
      end

feature {PACKRAT_CHOICE}
   visit_choice (visited: PACKRAT_CHOICE)
      local
         i: INTEGER
      do
         if visited.need_paren then
            stream.put_character('(')
         end
         from
            i := visited.alternatives.lower
         until
            i > visited.alternatives.upper
         loop
            if i > visited.alternatives.lower then
               stream.put_string(once " / ")
            end
            visited.alternatives.item(i).accept(Current)
            i := i + 1
         end
         if visited.need_paren then
            stream.put_character(')')
         end
      end

feature {PACKRAT_NOT}
   visit_not (visited: PACKRAT_NOT)
      do
         stream.put_character('!')
         visited.primary.accept(Current)
      end

feature {PACKRAT_REFERENCE}
   visit_reference (visited: PACKRAT_REFERENCE)
      do
         if visited.need_paren then
            stream.put_character('(')
         end
         stream.put_string(visited.name)
         if visited.need_paren then
            stream.put_character(')')
         end
      end

feature {PACKRAT_SEQUENCE}
   visit_sequence (visited: PACKRAT_SEQUENCE)
      local
         i: INTEGER
      do
         if visited.need_paren then
            stream.put_character('(')
         end
         from
            i := visited.primaries.lower
         until
            i > visited.primaries.upper
         loop
            if i > visited.primaries.lower then
               stream.put_character(' ')
            end
            visited.primaries.item(i).accept(Current)
            i := i + 1
         end
         if visited.need_paren then
            stream.put_character(')')
         end
         inspect
            visited.how_many
         when one then
         when zero_or_more then
            stream.put_character('*')
         when one_or_more then
            stream.put_character('+')
         when zero_or_one then
            stream.put_character('?')
         end
         if visited.tag /= Void then
            stream.put_character(' ')
            stream.put_character('{')
            stream.put_string(visited.tag)
            stream.put_character('}')
         end
      end

feature {}
   stream: OUTPUT_STREAM

   make (a_stream: like stream)
      require
         a_stream.is_connected
      do
         stream := a_stream
      ensure
         stream = a_stream
      end

invariant
   stream.is_connected

end -- class PACKRAT_PRETTY_PRINTER
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
