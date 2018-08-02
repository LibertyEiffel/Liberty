-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXCEPTIONS_HANDLER
   --
   -- Unique global object in charge of EXCEPTION handling.
   --

insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   used: BOOLEAN
         -- Indicate whether the live code uses EXCEPTIONS or not.

feature {C_CODE_COMPILER}
   bad_inspect_value (p: POSITION)
         -- When some Eiffel "inspect" instruction without the optional "else" part does not match the input.
      require
         cpp.pending_c_function
         ace.no_check
      do
         if used then
            cpp.pending_c_function_body.append(once "internal_exception_handler(Incorrect_inspect_value);%N")
         else
            cpp.pending_c_function_body.append(once "error1(%"Invalid inspect (nothing selected).%",")
            cpp.put_position(p)
            cpp.pending_c_function_body.append(once ");%N")
         end
      end

feature {RUN_FEATURE, EXTERNAL_ROUTINE}
   set_used
      do
         used := True
      end

feature {C_PRETTY_PRINTER}
   customize_c_runtime
      do
         if used then
            cpp.sys_runtime_h_and_c(once "exceptions")
         end
      end

   initialize_runtime
      do
         if used then
            cpp.pending_c_function_body.append(once "setup_signal_handler();%N")
         end
      end

   se_evobt
      require
         ace.boost
      do
         if used then
            cpp.pending_c_function_body.append(once "internal_exception_handler(Void_call_target)")
         else
            cpp.pending_c_function_body.append(once "se_print_run_time_stack(),exit(1)")
         end
      end

feature {}
   make
      do
      end

end -- class EXCEPTIONS_HANDLER
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
