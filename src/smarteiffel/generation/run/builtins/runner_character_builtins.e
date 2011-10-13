-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_CHARACTER_BUILTINS
   --
   -- a collection of builtins for CHARACTER
   --

inherit
   RUNNER_TYPED_BUILTINS[CHARACTER]

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT is
      do
         check
            False
         end
      end

feature {RUNNER_UNTYPED_BUILTINS}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN is
      do
         inspect
            processor.current_frame.rf.name.to_string
         when "code" then
            builtin_code(processor)
            Result := True
         when "to_integer_8" then
            builtin_to_integer_8(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_code (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_integer(left(processor).item.code))
      end

   builtin_to_integer_8 (processor: RUNNER_PROCESSOR) is
      do
         processor.current_frame.set_return(processor.new_integer_8(left(processor).item.to_integer_8))
      end

feature {}
   make is
      do
      end

feature {RUNNER_FACET}
   type: TYPE is
      do
         Result := smart_eiffel.type_character
      end

end -- class RUNNER_BOOLEAN_BUILTINS
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
