-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NON_WRITTEN_INSTRUCTION

inherit
   INSTRUCTION

feature {ANY}
   has_been_specialized: BOOLEAN is True

   frozen specialize_in (type: TYPE): like Current is
      do
         check
            non_written_code: False
         end
      end

   frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         check
            non_written_code: False
         end
      end

   frozen specialize_2 (type: TYPE): INSTRUCTION is
      do
         check
            non_written_code: False
         end
      end

   frozen pretty (indent_level: INTEGER) is
      do
         check
            non_written_code: False
         end
      end

   frozen end_mark_comment: BOOLEAN is
      do
         check
            non_written_code: False
         end
      end

   frozen compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

end -- class NON_WRITTEN_INSTRUCTION
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
