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
         if buffer._empty then
            table.for_all_atoms(agent accept_atom)
         end
         buffer.out_in_tagged_out_memory
      end

feature {PACKRAT_NON_TERMINAL}
   vit_non_terminal (vited: PACKRAT_NON_TERMINAL)
      do
         vited.pattern.accept(Current)
      end

feature {PACKRAT_TERMINAL}
   vit_terminal (vited: PACKRAT_TERMINAL)
      do
         -- not used
      end

feature {PACKRAT_AND}
   vit_and (vited: PACKRAT_AND)
      do
         vited.primary.accept(Current)
      end

feature {PACKRAT_CHOICE}
   vit_choice (vited: PACKRAT_CHOICE)
      local
         i: INTEGER
      do
         from
            i := vited.alternatives.lower
         until
            i > vited.alternatives.upper
         loop
            vited.alternatives.item(i).accept(Current)
            i := i + 1
         end
      end

feature {PACKRAT_NOT}
   vit_not (vited: PACKRAT_NOT)
      do
         vited.primary.accept(Current)
      end

feature {PACKRAT_REFERENCE}
   vit_reference (vited: PACKRAT_REFERENCE)
      do
      end

feature {PACKRAT_SEQUENCE}
   vit_sequence (vited: PACKRAT_SEQUENCE)
      local
         i: INTEGER
      do
         from
            i := vited.primaries.lower
         until
            i > vited.primaries.upper
         loop
            vited.primaries.item(i).accept(Current)
            i := i + 1
         end
         if vited.tag /= Void then
            buffer.append(once "   #(1) %N      deferred%N      end%N%N" # vited.tag)
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
-- Copyright(C) 2011-2013-2014: Cyril ADRIAN
--
-- http://www.gnu.org/software/liberty-eiffel/
--
-- ------------------------------------------------------------------------------------------------------------------------------
