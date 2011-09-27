-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_FEATURES

inherit
   RUN_FEATURE_VISITOR

insert
   RUNNER_FACET

create {RUNNER_PROCESSOR}
   make

feature {RUNNER_PROCESSOR}
   current_frame: RUNNER_FRAME

feature {RUNNER_FACET}
   call (a_call: FEATURE_CALL) is
      require
         a_call /= Void
      local
         return: RUNNER_OBJECT
      do
         return := execute(a_call).return
         check
            return = Void
         end
      end

   item (a_call: FEATURE_CALL): RUNNER_OBJECT is
      require
         a_call /= Void
      do
         Result := execute(a_call).return
      end

feature {RUNNER_PROCESSOR}
   run (rf: RUN_FEATURE) is
      local
         root_object: RUNNER_OBJECT
         return: RUNNER_OBJECT
      do
         root_object := processor.new_object(rf.type_of_current)
         return := do_execute(root_object, Void, rf).return
         check
            return = Void
         end
      end

feature {}
   execute (a_call: FEATURE_CALL): like current_frame is
      require
         a_call /= Void
      local
         target: RUNNER_OBJECT; arguments: FAST_ARRAY[RUNNER_OBJECT]
         i: INTEGER
      do
         target := processor.expressions.eval(a_call.target)
         if a_call.arg_count > 0 then
            create arguments.with_capacity(a_call.arg_count)
            from
               i := 1
            until
               i > a_call.arg_count
            loop
               arguments.add_last(processor.expressions.eval(a_call.arguments.expression(i)))
               i := i + 1
            end
         end
         Result := do_execute(target, arguments, a_call.run_feature_for(processor.current_frame.type_of_current))
      end

   do_execute (a_target: RUNNER_OBJECT; a_arguments: TRAVERSABLE[RUNNER_OBJECT]; a_rf: RUN_FEATURE): like current_frame is
      require
         a_target.type = a_rf.type_of_current
      do
         create Result.make(processor, current_frame, a_target, a_arguments, a_rf)
         current_frame := Result
         a_rf.accept(Current)
         Result.execute
         current_frame := Result.caller

         check
            Result.return /= Void implies Result.return.type.can_be_assigned_to(a_rf.result_type.resolve_in(a_rf.type_of_current))
         end
      ensure
         Result /= Void
      end

feature {RUN_FEATURE_1}
   visit_run_feature_1 (visited: RUN_FEATURE_1) is
      do
      end

feature {RUN_FEATURE_2}
   visit_run_feature_2 (visited: RUN_FEATURE_2) is
      do
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3) is
      do
         processor.instructions.execute(visited.routine_body)
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4) is
      do
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5) is
      do
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6) is
      do
      end

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7) is
      do
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8) is
      do
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9) is
      do
      end

feature {}
   make (a_processor: like processor) is
      do
         processor := a_processor
      ensure
         processor = a_processor
      end

   processor: RUNNER_PROCESSOR

invariant
   processor /= Void

end -- class RUNNER_FEATURES
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
