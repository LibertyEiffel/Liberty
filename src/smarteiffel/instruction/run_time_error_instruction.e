-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_TIME_ERROR_INSTRUCTION
   --
   -- Such an object is created when some run-time error INSTRUCTION must be placed in the CODE.
   -- (See also RUN_TIME_ERROR_EXPRESSION.)
   --

inherit
   NON_WRITTEN_INSTRUCTION

create {ANY}
   make

feature {ANY}
   start_position: POSITION

   error_message: STRING
         -- Error message printed when exceptions are turned off.

   error_code: INTEGER
         -- An EXCEPTIONS error code.

   error_name: STRING
         -- Symbolic name for the error code to be raised when
         -- exceptions are turned on.
      do
         Result := exceptions.name_of_exception(error_code)
      end

   simplify (type: TYPE): INSTRUCTION
      do
         Result := Current
      end

   collect (type: TYPE): TYPE
      do
      end

   use_current (type: TYPE): BOOLEAN
      do
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := False
      end

   safety_check (type: TYPE)
      do
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
      end

   accept (visitor: RUN_TIME_ERROR_INSTRUCTION_VISITOR)
      do
         visitor.visit_run_time_error_instruction(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         code_accumulator.current_context.add_last(Current)
      end

feature {}
   make (sp: like start_position; em: like error_message; ec: like error_code)
      require
         not sp.is_unknown
         em /= Void
         ec = exceptions.Void_call_target or else ec = exceptions.System_level_type_error
      do
         start_position := sp
         error_message := em
         error_code := ec
      ensure
         start_position = sp
         error_message = em
         error_code = ec
      end

invariant
   error_code = exceptions.Void_call_target or else error_code = exceptions.System_level_type_error

end -- class RUN_TIME_ERROR_INSTRUCTION
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
