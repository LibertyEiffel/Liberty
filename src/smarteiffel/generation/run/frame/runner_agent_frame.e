-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_AGENT_FRAME
   -- specific to agent launcher frames

inherit
   RUNNER_FRAME
      rename
         make as make_frame
      end

create {RUNNER_FEATURES}
   make

feature {RUNNER_FEATURES}
   start_position: POSITION
      do
         Result := launcher.start_position
      end

feature {RUNNER_FACET}
   name: FEATURE_NAME
      do
         Result := feature_stamp.name
      end

   arguments: TRAVERSABLE[RUNNER_OBJECT]
      do
         Result := launcher.arguments
      end

   type_of_current: TYPE
      do
         Result := launcher.target.type
      end

   type_of_result: TYPE
      do
         Result := launcher.result_type
      end

   feature_stamp: FEATURE_STAMP
      do
         Result := launcher.feature_stamp
      end

   formal_arguments: FORMAL_ARG_LIST
      do
         not_yet_implemented
      end

feature {}
   make (a_processor: like processor; a_caller: like caller; a_launcher: like launcher)
      require
         a_processor /= Void
         a_launcher /= Void
      do
         launcher := a_launcher
         make_frame(a_processor, a_caller, a_launcher.target)
      ensure
         processor = a_processor
         caller = a_caller
         target = a_launcher.target
         launcher = a_launcher
      end

   launcher: RUNNER_AGENT_LAUNCHER

   local_vars: LOCAL_VAR_LIST
      do
         -- always Void
      end

invariant
   launcher /= Void

end -- class RUNNER_AGENT_FRAME
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
