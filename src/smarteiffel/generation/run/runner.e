-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER
   --
   -- Singleton in charge of handling Eiffel interpretation.
   -- This singleton is shared via the GLOBALS.`runner' once function.
   --

inherit
   CODE_PRINTER
      -- not really a "printer", but it consumes code semantics all the same; and that's what
      -- SMART_EIFFEL.`compile' expects

create {RUNNER_GLOBALS}
   make

feature {SMART_EIFFEL}
   compile
         -- Code interpretation happens here.
      do
         if nb_errors = 0 then
            check
               smart_eiffel.root_procedure /= Void
            end
            get_started
            check
               smart_eiffel.is_ready
            end
            smart_eiffel.customize_runtime
            processor.run(smart_eiffel.root_procedure)
         end
      end

feature {}
   get_started
      require
         smart_eiffel.status.is_safety_checking
      do
         smart_eiffel.status.set_generating
      end

feature {}
   make
      local
         memory: RUNNER_MEMORY
      do
         create memory.make
         create processor.make(memory)
      end

   processor: RUNNER_PROCESSOR

invariant
   processor /= Void

end -- class RUNNER
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
