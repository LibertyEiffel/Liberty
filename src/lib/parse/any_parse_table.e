-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ANY_PARSE_TABLE
   --
   -- A parsing table (aka Grammar), not typed.
   --

feature {ANY}
   is_coherent: BOOLEAN is
      deferred
      ensure
         must_be_coherent: Result
      end

   has (atom_name: ABSTRACT_STRING): BOOLEAN is
      require
         not atom_name.is_empty
      deferred
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      require
         is_coherent
      deferred
      end

   extend (a_table: like Current) is
         -- Extends Current with a *copy* of the atoms of `a_table'. Any atom with a name already existing in
         -- Current is ignored.
      require
         a_table /= Void
         a_table /= Current
      deferred
      end

   add_or_replace (atom_name: ABSTRACT_STRING; atom: PARSE_ATOM) is
      require
         atom_name /= Void
         atom /= Void
      deferred
      ensure
         item(atom_name.intern) = atom
      end

   item (atom_name: ABSTRACT_STRING): PARSE_ATOM is
      require
         not atom_name.is_empty
         has(atom_name)
      deferred
      end

end -- class ANY_PARSE_TABLE
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
