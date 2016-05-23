-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PACKRAT_LOOKAHEAD

inherit
   PACKRAT_ALTERNATIVE
      redefine
         set_nt
      end

feature {ANY}
   is_coherent: BOOLEAN
      do
         Result := primary.is_coherent
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := primary.is_equal(other.primary)
      end

   copy (other: like Current)
      do
         primary:= other.primary.twin
      end

feature {PACKRAT_INTERNAL}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
      do
         primary.set_default_tree_builders(non_terminal_builder, terminal_builder)
      end

   set_nt (a_nt: like nt)
      do
         Precursor(a_nt)
         primary.set_nt(a_nt)
      end

feature {}
   make (a_primary: like primary)
      require
         a_primary /= Void
      do
         primary := a_primary
      ensure
         primary = a_primary
      end

feature {PACKRAT_LOOKAHEAD, PACKRAT_VISITOR}
   primary: PACKRAT_PRIMARY

invariant
   primary /= Void

end -- class PACKRAT_LOOKAHEAD
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
