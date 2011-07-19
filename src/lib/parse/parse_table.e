-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PARSE_TABLE
   --
   -- A parsing table (aka Grammar).
   --
   -- The only way to create a parse table is to use SmartEiffel's manifest notation.
   --
   -- The structure of this notation is:
   --
   --    {PARSE_TABLE << name, atom;
   --                    name, atom;
   --                      . . .
   --                    name, atom
   --                 >>}
   --
   -- where each name is a STRING and each atom may be either a PARSE_NON_TERMINAL or a PARSE_TERMINAL.
   --

insert
   LOGGING

creation {ANY}
   manifest_creation

feature {ANY}
   is_coherent: BOOLEAN is
         -- True if all the used atoms are defined
      local
         i: INTEGER; atom: PARSE_ATOM
      do
         from
            Result := True
            i := atoms.lower
         until
            not Result or else i > atoms.upper
         loop
            atom := atoms.item(i)
            Result := atom.is_coherent
            if not Result then
               breakpoint
            end
            i := i + 1
         end
      ensure
         must_be_coherent: Result
      end

   has (atom_name: ABSTRACT_STRING): BOOLEAN is
      require
         not atom_name.is_empty
      do
         Result := atoms.fast_has(atom_name.intern)
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      require
         is_coherent
      local
         i: INTEGER
      do
         from
            i := atoms.lower
         until
            i > atoms.upper
         loop
            atoms.item(i).set_default_tree_builders(non_terminal_builder, terminal_builder)
            i := i + 1
         end
      end

   extend (a_table: PARSE_TABLE) is
         -- Extends Current with a *copy* of the atoms of `a_table'. Any atom with a name already existing in
         -- Current is ignored.
      require
         a_table /= Void
         a_table /= Current
      local
         i: INTEGER; atom: PARSE_ATOM
      do
         from
            i := a_table.atoms.lower
         until
            i > a_table.atoms.upper
         loop
            if not atoms.fast_has(a_table.atoms.key(i)) then
               atom := a_table.atoms.item(i).twin
               atom.set_table(Current)
               atoms.add(atom, a_table.atoms.key(i))
            end
            i := i + 1
         end
      end

   add_or_replace (atom_name: ABSTRACT_STRING; atom: PARSE_ATOM) is
      require
         atom_name /= Void
         atom /= Void
      do
         atoms.put(atom, atom_name.intern)
      ensure
         item(atom_name.intern) = atom
      end

   item (atom_name: ABSTRACT_STRING): PARSE_ATOM is
      require
         not atom_name.is_empty
         has(atom_name)
      do
         Result := atoms.fast_reference_at(atom_name.intern)
         debug
            if Result = Void then
               log.trace.put_string(once "Unknown atom: ")
               log.trace.put_line(atom_name)
               log.trace.put_line(once "Known atoms:")
               log.trace.put_line(once "--8<--------")
               atoms.do_all(agent print_atom)
               log.trace.put_line(once "-------->8--")
               breakpoint
            end
         end
      end

feature {}
   print_atom (v: PARSE_ATOM; k: FIXED_STRING) is
      do
         log.trace.put_character('"')
         log.trace.put_string(k)
         log.trace.put_character('"')
         log.trace.put_string(once " => ")
         log.trace.put_line(v.out)
      end

feature {PARSE_TABLE}
   atoms: HASHED_DICTIONARY[PARSE_ATOM, FIXED_STRING]

feature {}
   manifest_make (needed_capacity: INTEGER) is
      do
         create atoms.with_capacity(needed_capacity)
      end

   manifest_put (index: INTEGER; name: ABSTRACT_STRING; atom: PARSE_ATOM) is
      require
         not has(name)
         atom.name = Void
      do
         atoms.add(atom, name.intern)
         atom.set(name, Current)
      ensure
         atom.name = name.intern
      end

   manifest_semicolon_check: INTEGER is 2

end -- class PARSE_TABLE
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
