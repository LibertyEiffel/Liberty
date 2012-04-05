-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PACKRAT_PRIMARY

insert
   PACKRAT_INTERNAL
   TRISTATE_VALUES

feature {ANY}
   is_coherent: BOOLEAN is
      deferred
      end

feature {PACKRAT_INTERNAL}
   parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE is
      require
         context /= Void
      deferred
      ensure
         Result /= yes implies context.buffer.current_index = old context.buffer.current_index
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      deferred
      end

   set_nt (a_nt: like nt) is
      require
         a_nt /= Void
      do
         nt := a_nt
      ensure
         nt = a_nt
      end

   nt: PACKRAT_NON_TERMINAL

end -- class PACKRAT_PRIMARY
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
