-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_BOOLEAN_BUILTINS
   --
   -- a collection of builtins for BOOLEAN
   --

inherit
   RUNNER_TYPED_BUILTINS[BOOLEAN]

create {RUNNER_MEMORY}
   make

feature {RUNNER_MEMORY}
   new (processor: RUNNER_PROCESSOR): RUNNER_OBJECT
      do
         check
            False
         end
      end

feature {}
   call_ (processor: RUNNER_PROCESSOR): BOOLEAN
      do
         inspect
            processor.current_frame.name.to_string
         when "and then" then
            builtin_infix_and_then(processor)
            Result := True
         when "implies" then
            builtin_infix_implies(processor)
            Result := True
         when "or else" then
            builtin_infix_or_else(processor)
            Result := True
         else
            check
               not Result
            end
         end
      end

feature {}
   builtin_infix_and_then (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item and then right(processor).item))
      end

   builtin_infix_implies (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item implies right(processor).item))
      end

   builtin_infix_or_else (processor: RUNNER_PROCESSOR)
      do
         processor.current_frame.set_return(processor.new_boolean(left(processor).item or else right(processor).item))
      end

feature {}
   make
      do
      end

feature {RUNNER_FACET}
   type: TYPE
      do
         Result := smart_eiffel.type_boolean
      end

end -- class RUNNER_BOOLEAN_BUILTINS
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
