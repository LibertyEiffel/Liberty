-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class DESCENDING_PARSER
   --
   -- The entry point to LL(n) parsing. Currently that top-down parsing is directly implemented in the
   -- PARSE_ATOM classes.
   --

inherit
   ABSTRACT_PARSER[DESCENDING_PARSE_CONTEXT]

create {ANY}
   make

feature {ANY}
   parse (buffer: MINI_PARSER_BUFFER; grammar: PARSE_TABLE[DESCENDING_PARSE_CONTEXT]; start: STRING; a_actions: COLLECTION[PARSE_ACTION]): BOOLEAN
      local
         context: DESCENDING_PARSE_CONTEXT
         atom: PARSE_ATOM[DESCENDING_PARSE_CONTEXT]
         parsed: TRISTATE
      do
         create context.make(buffer, a_actions)
         error := Void
         atom := grammar.item(start)
         parsed := atom.parse(context)
         if parsed = yes then
            Result := True
         elseif parsed = no then
            error := buffer.last_error
            if error = Void then
               create error.make(1, once "This does not look like a valid text, not even remotely.", Void)
            end
            Result := True
         else
            check
               should_add_more: not Result
            end
         end
      end

feature {}
   make
      do
      end

end -- class DESCENDING_PARSER
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
