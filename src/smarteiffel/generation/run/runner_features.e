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

   new (a_type: TYPE; a_call: PROCEDURE_CALL): RUNNER_OBJECT is
      require
         a_type /= Void
      local
         return: RUNNER_OBJECT
      do
         Result := processor.new_object(a_type)
         if a_call /= Void then
            return := do_execute(Result, arguments(a_call),
                                 a_call.run_feature_for(processor.current_frame.type_of_current)).return
            check
               return = Void
            end
         end
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
   arguments (a_call: FEATURE_CALL; a_frame: like current_frame): FAST_ARRAY[RUNNER_OBJECT] is
         -- evaluates the arguments of the call in the given frame
      local
         i: INTEGER
         old_frame: like current_frame
      do
         if a_call.arg_count > 0 then
            old_frame := current_frame
            current_frame := a_frame

            create Result.with_capacity(a_call.arg_count)
            from
               i := 1
            until
               i > a_call.arg_count
            loop
               Result.add_last(expand(processor.expressions.eval(a_call.arguments.expression(i))))
               i := i + 1
            end

            current_frame := old_frame
         end
      end

   execute (a_call: FEATURE_CALL): like current_frame is
      require
         a_call /= Void
      local
         target: RUNNER_OBJECT
      do
         target := processor.expressions.eval(a_call.target)
         Result := do_execute(target, agent arguments(a_call, current_frame),
                              a_call.run_feature_for(processor.current_frame.type_of_current))
      end

   do_execute (a_target: RUNNER_OBJECT; a_arguments: TRAVERSABLE[RUNNER_OBJECT]; a_rf: RUN_FEATURE): like current_frame is
      require
         a_target.type = a_rf.type_of_current
      do
         do_execute_(a_target, agent idem_arguments(a_arguments), a_rf)
      ensure
         Result /= Void
      end

   idem_arguments (a_arguments: like arguments): like arguments is
      do
         Result := a_arguments
      end

   do_execute_ (a_target: RUNNER_OBJECT; a_arguments: FUNCTION[TUPLE, TRAVERSABLE[RUNNER_OBJECT]]; a_rf: RUN_FEATURE): like current_frame is
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
         current_frame.force_eval_arguments
         current_frame.set_return(processor.expressions.eval(visited.value))
      end

feature {RUN_FEATURE_2}
   visit_run_feature_2 (visited: RUN_FEATURE_2) is
      local
         target: RUNNER_STRUCTURED_OBJECT
      do
         current_frame.force_eval_arguments
         target ::= current_frame.target
         current_frame.set_return(target.field(visited.name.to_string))
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3) is
      do
         current_frame.force_eval_arguments
         if visited.routine_body /= Void then
            processor.instructions.execute(visited.routine_body)
         end
         check
            current_frame.return = Void
         end
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4) is
      do
         current_frame.force_eval_arguments
         if visited.routine_body /= Void then
            processor.instructions.execute(visited.routine_body)
         end
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5) is
      do
         current_frame.force_eval_arguments
         if not once_run_features.fast_has(visited) then
            if visited.routine_body /= Void then
               processor.instructions.execute(visited.routine_body)
            end
            check
               current_frame.return = Void
            end
            once_run_features.add(Void, visited)
         end
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6) is
      do
         current_frame.force_eval_arguments
         if once_run_features.fast_has(visited) then
            current_frame.set_return(once_run_features.fast_at(visited))
         else
            if visited.routine_body /= Void then
               processor.instructions.execute(visited.routine_body)
            end
            once_run_features.add(expand(current_frame.return), visited)
         end
      end

feature {}
   once_run_features: HASHED_DICTIONARY[RUNNER_OBJECT, RUN_FEATURE]

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7) is
      do
         current_frame.force_eval_arguments -- don't, we need to semi-evaluate in some cases
         sedb_breakpoint
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8) is
      do
         current_frame.force_eval_arguments -- don't, we need to semi-evaluate in some cases
         sedb_breakpoint
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9) is
      do
         --| **** TODO: deferred feature called
      end

feature {}
   make (a_processor: like processor) is
      do
         processor := a_processor
         create once_run_features.make
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
