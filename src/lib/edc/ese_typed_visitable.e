-- -----------------------------------------------------------------------------------------------------------
-- This file is part of the ESE library.
-- Copyright (C) 2006-2016: Cyril ADRIAN <cyril.adrian@gmail.com> and others (see AUTHORS)
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
-- associated documentation files (the "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
-- following conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
-- USE OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://ese.sourceforge.net
-- -----------------------------------------------------------------------------------------------------------
deferred class ESE_TYPED_VISITABLE[T_]
   --
   -- An object that can be visited by a ESE_TYPED_VISITOR[T_].
   --

inherit
   VISITABLE

insert
   INTERNALS_HANDLER

feature {ANY}
   frozen accept (visitor: ESE_VISITOR)
      local
         t: ESE_STATIC_TYPE[T_]; v: ESE_TYPED_VISITOR[T_]
      do
         -- This is totally not object-oriented. Erk. How to do better?
         v ::= visitor.as_typed(t.type_name)
         typed_accept(v)
      end

feature {}
   typed_accept (visitor: ESE_TYPED_VISITOR[T_])
         -- Accept to be visited by the `visitor'.
      deferred
      end

end -- class ESE_TYPED_VISITABLE
