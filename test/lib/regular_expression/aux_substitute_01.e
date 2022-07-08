-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_SUBSTITUTE_01
   --
   -- Regular expression matcher for expression "(a)(a)"

inherit
   REGULAR_EXPRESSION
      redefine default_create
      end

feature {ANY}
   default_create
      do
         pattern := once "aa"
         substrings_names := create {HASHED_BIJECTIVE_DICTIONARY[INTEGER, FIXED_STRING]}.make
         create substrings_first_indexes.make(0, 2)
         create substrings_last_indexes.make(0, 2)
         substitution_pattern_ready := False
      end

   match_from (text: ABSTRACT_STRING; first_index: INTEGER): BOOLEAN
      local
         pos, i: INTEGER
      do
         pos := text.substring_index(pattern, first_index)
         Result := pos /= 0
         substrings_first_indexes.put(pos, 0)
         substrings_last_indexes.put(pos + pattern.count - 1, 0)
         from
            i := pattern.count.min(9)
         until
            i < 1
         loop
            substrings_first_indexes.put(pos + i - 1, i)
            substrings_last_indexes.put(pos + i - 1, i)
            i := i - 1
         end
      end

   can_match: BOOLEAN True

   pattern: STRING

end -- class AUX_SUBSTITUTE_01
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
