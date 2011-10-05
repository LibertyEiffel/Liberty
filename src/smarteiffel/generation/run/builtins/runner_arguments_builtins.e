-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_ARGUMENTS_BUILTINS
   --
   -- builtins for ARGUMENTS
   --

inherit
   RUNNER_UNTYPED_BUILTINS

insert
   ARGUMENTS

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_STRUCTURED_OBJECT is
      do
         create Result.make(processor, type, Current)
      end

feature {RUNNER_UNTYPED_BUILTINS}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN is
      do
         inspect
            processor.current_frame.rf.name.to_string
         when "se_argc" then
            builtin_se_argc(processor)
            Result := True
         when "se_argv" then
            builtin_se_argv(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_se_argc (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_integer_32(se_argc))
      end

   builtin_se_argv (processor: RUNNER_PROCESSOR) is
      local
         index: RUNNER_NATIVE_EXPANDED[INTEGER_64]
      do
         index ::= processor.current_frame.arguments.first
         processor.current_frame.set_return(processor.new_manifest_string(se_argv(index.item.to_integer_32), True))
      end

feature {}
   make (a_type: like type) is
      require
         a_type /= Void
      do
         type := a_type
      ensure
         type = a_type
      end

   type: TYPE

end -- class RUNNER_ARGUMENTS_BUILTINS
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
