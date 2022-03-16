-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class NON_WRITTEN_EXPRESSION
   --
   -- Common parent of all internal expression which cannot be written in pure Eiffel.
   -- (As an example, see VOID_CALL class.)
   --

inherit
   EXPRESSION

feature {ANY}
   is_current: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_void: BOOLEAN False

   has_been_specialized: BOOLEAN True

   frozen specialize_in (type: TYPE): like Current
      do
         check
            non_written_code: False
         end
         sedb_breakpoint
      end

   frozen specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         check
            non_written_code: False
         end
         sedb_breakpoint
      end

   frozen specialize_and_check (type: TYPE): EXPRESSION
      do
         check
            non_written_code: False
         end
         sedb_breakpoint
      end

   frozen precedence: INTEGER
      do
         check
            non_written_code: False
         end
      end

   frozen short, frozen short_target (type: TYPE)
      do
         check
            non_written_code: False
         end
      end

   frozen pretty_target, frozen bracketed_pretty, frozen pretty (indent_level: INTEGER)
      do
         check
            non_written_code: False
         end
      end

   extra_bracket_flag: BOOLEAN
      do
         check
            non_written_code: False
         end
      end

end -- class NON_WRITTEN_EXPRESSION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
