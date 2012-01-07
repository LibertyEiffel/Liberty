-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_AGENT_BUILTINS
   --
   -- a collection of builtins for all kinds of agents (PROCEDURE and FUNCTION alike)
   --

inherit
   RUNNER_UNTYPED_BUILTINS

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT is
      do
         check
            False
         end
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN is
      do
         inspect
            processor.current_frame.name.to_string
         when "call" then
            builtin_call(processor)
            Result := True
         when "item" then
            builtin_item(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_call (processor: RUNNER_PROCESSOR) is
      local
         agent_object: RUNNER_AGENT_OBJECT
         inst: INSTRUCTION
      do
         sedb_breakpoint
         agent_object ::= processor.current_frame.target
         if inst ?:= agent_object.code then
            inst ::= agent_object.code
            processor.instructions.execute(inst)
         else
            processor.set_exception(exceptions.Routine_failure, "Cannot execute: the code is not an instruction")
         end
      end

   builtin_item (processor: RUNNER_PROCESSOR) is
      local
         agent_object: RUNNER_AGENT_OBJECT
         expr: EXPRESSION
      do
         sedb_breakpoint
         agent_object ::= processor.current_frame.target
         if expr ?:= agent_object.code then
            expr ::= agent_object.code
            processor.current_frame.set_return(processor.expressions.eval(expr))
         else
            processor.set_exception(exceptions.Routine_failure, "Cannot execute: the code is not an expression")
         end
      end

feature {}
   make (a_type: like type) is
      do
         type := a_type
      ensure
         type = a_type
      end

feature {RUNNER_FACET}
   type: TYPE

end -- class RUNNER_AGENT_BUILTINS
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
