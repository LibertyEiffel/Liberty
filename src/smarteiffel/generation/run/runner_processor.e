-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_PROCESSOR

insert
   RUNNER_FACET

create {RUNNER}
   make

feature {RUNNER_FACET}
   features: RUNNER_FEATURES
   instructions: RUNNER_INSTRUCTIONS
   expressions: RUNNER_EXPRESSIONS
   memory: RUNNER_MEMORY

   current_frame: RUNNER_FRAME is
      do
         Result := features.current_frame
      end

feature {RUNNER}
   run (rf: RUN_FEATURE) is
      local
         type: TYPE; root_object: RUNNER_OBJECT
      do
         root_object := memory.new_object(Current, rf.type_of_current)
         features.call(root_object, Void, rf)
      end

feature {}
   make (a_memory: like memory) is
      require
         a_memory /= Void
      do
         create features.make(Current)
         create instructions.make(Current)
         create expressions.make(Current)
         memory := a_memory
      ensure
         memory = a_memory
      end

invariant
   features /= Void
   instructions /= Void
   expressions /= Void
   memory /= Void

end -- class RUNNER_PROCESSOR
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
