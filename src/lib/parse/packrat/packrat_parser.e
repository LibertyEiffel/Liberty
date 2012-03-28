-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_PARSER
   --
   -- The entry point to Packrat parsing (for PEGs: Parsing Expression Grammars)
   --
   -- See http://bford.info/packrat/
   --

inherit
   ABSTRACT_PARSER[PACKRAT_NON_TERMINAL]

feature {ANY}
   parse (buffer: MINI_PARSER_BUFFER; grammar: PARSE_TABLE[PACKRAT_NON_TERMINAL]; start: STRING; a_actions: COLLECTION[PARSE_ACTION]): BOOLEAN is
      do
      end

end -- class PACKRAT_PARSER
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
