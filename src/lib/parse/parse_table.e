-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PARSE_TABLE[C_ -> PARSE_CONTEXT]
   --
   -- A parsing table (aka Grammar).
   --
   -- The only way to create a parse table is to use SmartEiffel's manifest notation.
   --
   -- The structure of this notation is:
   --
   --    {PARSE_TABLE[...] << name, atom;
   --                         name, atom;
   --                           . . .
   --                         name, atom
   --                      >>}
   --
   -- where each name is a STRING and each atom may be either a PARSE_NON_TERMINAL or a PARSE_TERMINAL.
   --

insert
   LOGGING
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   manifest_creation

create {PARSER_FACET}
   with_capacity

feature {ANY}
   is_coherent: BOOLEAN
         -- True if all the used atoms are defined
      local
         i: INTEGER; atom: PARSE_ATOM[C_]
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

   has (atom_name: ABSTRACT_STRING): BOOLEAN
      require
         not atom_name.is_empty
      do
         Result := atoms.fast_has(atom_name.intern)
      end

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]])
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

   extend (a_table: like Current)
         -- Extends Current with a *copy* of the atoms of `a_table'. Any atom with a name already existing in
         -- Current is ignored.
      require
         a_table /= Void
         a_table /= Current
      local
         i: INTEGER; atom: PARSE_ATOM[C_]
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

   add_or_replace (atom_name: ABSTRACT_STRING; atom: PARSE_ATOM[C_])
      require
         atom_name /= Void
         atom /= Void
      do
         atoms.put(atom, atom_name.intern)
      ensure
         item(atom_name.intern) = atom
      end

   item (atom_name: ABSTRACT_STRING): PARSE_ATOM[C_]
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
               atoms.for_each(agent print_atom(?, ?))
               log.trace.put_line(once "-------->8--")
               breakpoint
            end
         end
      end

   out_in_tagged_out_memory
      do
         for_all_atoms(agent (atom: PARSE_ATOM[C_]) do atom.out_in_tagged_out_memory; tagged_out_memory.extend('%N') end)
      end

   pretty_print_on (stream: OUTPUT_STREAM)
      require
         stream.is_connected
      do
         for_all_atoms(agent {PARSE_ATOM[C_]}.pretty_print_on(stream))
      end

   for_all_atoms (action: PROCEDURE[TUPLE[PARSE_ATOM[C_]]])
      require
         action /= Void
      do
         atoms.for_each(action)
      end

feature {}
   print_atom (v: PARSE_ATOM[C_]; k: FIXED_STRING)
      do
         log.trace.put_character('"')
         log.trace.put_string(k)
         log.trace.put_character('"')
         log.trace.put_string(once " => ")
         log.trace.put_line(v.out)
      end

feature {PARSE_TABLE}
   atoms: LINKED_HASHED_DICTIONARY[PARSE_ATOM[C_], FIXED_STRING]

feature {PARSER_FACET}
   add (name: ABSTRACT_STRING; atom: PARSE_ATOM[C_])
      require
         not has(name)
         atom.name = Void
      do
         atoms.add(atom, name.intern)
         atom.set(name, Current)
      ensure
         atoms.count = old atoms.count + 1
         atoms.last = atom
      end

feature {}
   with_capacity, manifest_make (needed_capacity: INTEGER)
      do
         create atoms.with_capacity(needed_capacity)
      end

   manifest_put (index: INTEGER; name: ABSTRACT_STRING; atom: PARSE_ATOM[C_])
      require
         not has(name)
         atom.name = Void
         atoms.count = index
      do
         add(name, atom)
      ensure
         atom.name = name.intern
         atoms.count = old atoms.count + 1
         atoms.last = atom
      end

   manifest_semicolon_check: INTEGER 2

end -- class PARSE_TABLE
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
