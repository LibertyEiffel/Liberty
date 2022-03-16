-- This file is part of Liberty The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of th file.
--
class EFFECT_REDUCE_PRINTER

inherit
   PACKRAT_VISITOR
      redefine
         out_in_tagged_out_memory
      end

create {EFFECT}
   make

feature {ANY}
   out_in_tagged_out_memory
      do
         if buffer.is_empty then
            table.for_all_atoms(agent accept_atom)
         end
         buffer.out_in_tagged_out_memory
      end

feature {PACKRAT_NON_TERMINAL}
   visit_non_terminal (visited: PACKRAT_NON_TERMINAL)
      do
         visited.pattern.accept(Current)
      end

feature {PACKRAT_TERMINAL}
   visit_terminal (visited: PACKRAT_TERMINAL)
      do
         -- not used
      end

feature {PACKRAT_AND}
   visit_and (visited: PACKRAT_AND)
      do
         visited.primary.accept(Current)
      end

feature {PACKRAT_CHOICE}
   visit_choice (visited: PACKRAT_CHOICE)
      local
         i: INTEGER
      do
         from
            i := visited.alternatives.lower
         until
            i > visited.alternatives.upper
         loop
            visited.alternatives.item(i).accept(Current)
            i := i + 1
         end
      end

feature {PACKRAT_NOT}
   visit_not (visited: PACKRAT_NOT)
      do
         visited.primary.accept(Current)
      end

feature {PACKRAT_REFERENCE}
   visit_reference (visited: PACKRAT_REFERENCE)
      do
      end

feature {PACKRAT_SEQUENCE}
   visit_sequence (visited: PACKRAT_SEQUENCE)
      local
         i: INTEGER
      do
         from
            i := visited.primaries.lower
         until
            i > visited.primaries.upper
         loop
            visited.primaries.item(i).accept(Current)
            i := i + 1
         end
         if visited.tag /= Void then
            buffer.append(once "   #(1) %N      deferred%N      end%N%N" # visited.tag)
         end
      end

feature {}
   make (a_table: like table)
      require
         a_table /= Void
      do
         table := a_table
         buffer := ""
      ensure
         table = a_table
      end

   table: PARSE_TABLE[PACKRAT_PARSE_CONTEXT]
   buffer: STRING

invariant
   table /= Void
   buffer /= Void

end -- class EFFECT_REDUCE_PRINTER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as publhed by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: 2013-2015: Cyril ADRIAN
--
-- http://www.gnu.org/software/liberty-eiffel/
--
-- ------------------------------------------------------------------------------------------------------------------------------
