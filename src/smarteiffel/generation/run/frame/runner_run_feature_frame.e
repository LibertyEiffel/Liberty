-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_RUN_FEATURE_FRAME

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
         Result := rf.start_position
      end

feature {RUNNER_FACET}
   name: FEATURE_NAME
      do
         Result := rf.name
      end

   arguments: TRAVERSABLE[RUNNER_OBJECT]
      do
         if arguments_set then
            Result := arguments_memory
         else
            Result := arguments_factory.item([])
            arguments_memory := Result
            arguments_set := True
            debug ("run.data")
               std_output.put_line(once "(#(1)) #(2): arguments: #(3)" # depth.out # rf.name.to_string # listrepr(Result))
            end
         end
      end

   type_of_current: TYPE
      do
         Result := rf.type_of_current
      end

   type_of_result: TYPE
      local
         tm: TYPE_MARK
      do
         tm := rf.result_type
         if tm /= Void then
            Result := tm.resolve_in(type_of_current)
         end
      end

   feature_stamp: FEATURE_STAMP
      do
         Result := rf.feature_stamp
      end

   formal_arguments: FORMAL_ARG_LIST
      do
         Result := rf.arguments
      end

feature {}
   make (a_processor: like processor; a_caller: like caller; a_target: like target; a_arguments_factory: like arguments_factory; a_rf: like rf)
      require
         a_processor /= Void
         a_target /= Void
         a_rf /= Void
      do
         if a_arguments_factory = Void then
            arguments_set := True
         else
            arguments_factory := a_arguments_factory
         end
         rf := a_rf
         make_frame(a_processor, a_caller, a_target)
      ensure
         processor = a_processor
         caller = a_caller
         target = a_target
         arguments_factory = a_arguments_factory
         rf = a_rf
         a_rf.local_vars /= Void implies locals.count = a_rf.local_vars.count
         a_rf.local_vars = Void implies locals = Void
      end

   local_vars: LOCAL_VAR_LIST
      do
         Result := rf.local_vars
      end

   arguments_factory: FUNCTION[TUPLE, TRAVERSABLE[RUNNER_OBJECT]]
   arguments_memory: TRAVERSABLE[RUNNER_OBJECT]
   arguments_set: BOOLEAN

   rf: RUN_FEATURE

invariant
   rf /= Void
   arguments_factory = Void implies arguments_set

   --| **** TODO rf.type_of_current = target.type

end -- class RUNNER_RUN_FEATURE_FRAME
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
