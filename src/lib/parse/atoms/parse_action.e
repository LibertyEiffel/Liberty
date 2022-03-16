-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PARSE_ACTION

create {PARSER_FACET}
   make

feature {ANY}
   name: ABSTRACT_STRING
         -- useful for debug

   call
      do
         action.call([])
      end

feature {PARSER_FACET}
   set_name (a_name: like name)
      do
         name := a_name
      ensure
         name = a_name
      end

feature {}
   make (a_action: like action)
      require
         a_action /= Void
      do
         action := a_action
      ensure
         action = a_action
      end

   action: PROCEDURE[TUPLE]

invariant
   action /= Void

end -- PARSE_ACTION
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
