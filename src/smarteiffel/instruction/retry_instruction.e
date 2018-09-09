-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RETRY_INSTRUCTION
   --
   -- To store instruction "retry" for exception handling.
   --

inherit
   INSTRUCTION

create {ANY}
   make

feature {ANY}
   start_position: POSITION

   end_mark_comment: BOOLEAN False

   use_current (type: TYPE): BOOLEAN
      do
      end

   specialize_in (type: TYPE): like Current
      do
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      do
         Result := Current
      end

   has_been_specialized: BOOLEAN True

   specialize_and_check (type: TYPE): like Current
      do
         Result := Current
      end

   collect (type: TYPE): TYPE
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
      end

   adapt_for (t: TYPE): like Current
      do
         Result := Current
      end

   safety_check (type: TYPE)
      do
      end

   simplify (type: TYPE): INSTRUCTION
      do
         Result := Current --|*** To be done *** (Dom. april 29th 2004) ***
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.put_string(once "retry")
         if pretty_printer.semi_colon_flag then
            pretty_printer.put_character(';')
         end
         pretty_printer.set_indent_level(indent_level)
      end

   accept (visitor: RETRY_INSTRUCTION_VISITOR)
      do
         visitor.visit_retry_instruction(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (sp: like start_position)
      do
         start_position := sp
      end

end -- class RETRY_INSTRUCTION
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
