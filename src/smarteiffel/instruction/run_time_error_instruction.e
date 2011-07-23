-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUN_TIME_ERROR_INSTRUCTION
   --
   -- Such an object is created when some run-time error INSTRUCTION must be placed in the CODE.
   -- (See also RUN_TIME_ERROR_EXPRESSION.)
   --

inherit
   NON_WRITTEN_INSTRUCTION

creation
   make

feature {ANY}
   start_position: POSITION

   error_message: STRING
         -- Error message printed when exceptions are turned off.

   error_name: STRING
         -- Symbolic name for the error code to be raised when 
         -- exceptions are turned on.

   simplify (type: TYPE): INSTRUCTION is
      do
         Result := Current
      end

   collect (type: TYPE): TYPE is
      do
      end

   use_current (type: TYPE): BOOLEAN is
      do
      end
   
   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := False
      end

   safety_check (type: TYPE) is
      do
      end
   
   adapt_for (type: TYPE): like Current is
      do
         Result := Current
      end

   compile_to_c (type: TYPE) is
      do
         if ace.no_check then
            if exceptions_handler.used then
               cpp.pending_c_function_body.append(once "internal_exception_handler(")
               cpp.pending_c_function_body.append(error_name)
               cpp.pending_c_function_body.append(once ");%N")
            else
               cpp.pending_c_function_body.append(once "error1(")
               manifest_string_pool.string_to_c_code(error_message, cpp.pending_c_function_body)
               cpp.pending_c_function_body.extend(',')
               cpp.put_position(start_position)
               cpp.pending_c_function_body.append(once ");%N")
            end
         else
            not_yet_implemented
         end
      end
   
   accept (visitor: RUN_TIME_ERROR_INSTRUCTION_VISITOR) is
      do
         visitor.visit_run_time_error_instruction(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.current_context.add_last(Current)         
      end
   
feature {}
   make (sp: like start_position; em: like error_message; en: like error_name) is
      require
         not sp.is_unknown
         em /= Void
         en.is_equal(once "Void_call_target") or else en.is_equal(once "System_level_type_error")
      do
         start_position := sp
         error_message := em
         error_name := en
      ensure
         start_position = sp
         error_message = em
         error_name = en
      end

end -- class RUN_TIME_ERROR_INSTRUCTION
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
