-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_FEATURES

inherit
   RUN_FEATURE_VISITOR
   NATIVE_VISITOR

insert
   RUNNER_PROCESSOR_FACET
      redefine
         current_frame
      end

create {RUNNER_PROCESSOR}
   make

feature {RUNNER_PROCESSOR}
   current_frame: RUNNER_FRAME

feature {RUNNER_FACET}
   call (a_call: FEATURE_CALL) is
      require
         a_call /= Void
      local
         target, return: RUNNER_OBJECT
      do
         target := processor.expressions.eval(a_call.target)
         return := execute_rf(target, agent arguments(a_call, current_frame),
                              a_call.run_feature_for(current_frame.type_of_current))
         check
            return = Void
         end
      end

   item (a_call: FEATURE_CALL): RUNNER_OBJECT is
      require
         a_call /= Void
      local
         target: RUNNER_OBJECT
      do
         target := processor.expressions.eval(a_call.target)
         Result := execute_rf(target, agent arguments(a_call, current_frame),
                              a_call.run_feature_for(current_frame.type_of_current))
      end

   non_void (a_call: NON_VOID_NO_DISPATCH): RUNNER_OBJECT is
      require
         a_call /= Void
      local
         target: RUNNER_OBJECT
      do
         target := current_frame.target
         if a_call.once_function /= Void then
            check
               a_call.context_type = current_frame.type_of_current
               a_call.run_feature = a_call.feature_stamp.run_feature_for(current_frame.type_of_current)
            end
            Result := execute_rf(target, Void, a_call.run_feature)
         else
            check
               a_call.external_function /= Void
               -- no run_feature here
            end
            Result := execute_non_void(target, a_call)
         end
      end

   new (a_type: TYPE; a_call: PROCEDURE_CALL): RUNNER_OBJECT is
      require
         a_type /= Void
      local
         return: RUNNER_OBJECT
      do
         Result := processor.new_object(a_type)
         if a_call /= Void then
            return := execute_rf(Result, agent arguments(a_call, current_frame),
                                 a_call.run_feature_for(current_frame.type_of_current))
            check
               return = Void
            end
         end
      end

   manifest_new (a_manifest: MANIFEST_GENERIC): RUNNER_OBJECT is
      require
         a_manifest /= Void
      local
         return: RUNNER_OBJECT; feature_make, feature_put: RUN_FEATURE; i, step, capacity: INTEGER
      do
         Result := processor.new_object(a_manifest.created_type)
         if a_manifest.manifest_make_feature_stamp /= Void then
            feature_make := a_manifest.manifest_make_feature_stamp.run_feature_for(a_manifest.created_type)
            if feature_make = Void then
               processor.set_exception(exceptions.System_level_type_error, once "Unknown manifest_make feature")
            else
               if a_manifest.item_list /= Void then
                  capacity := a_manifest.item_list.count
               end
               return := execute_rf(Result, agent manifest_arguments(capacity, a_manifest.optional_arguments, current_frame),
                                    feature_make)
            end
         end
         check
            return = Void
         end
         if a_manifest.manifest_put_feature_stamp /= Void then
            feature_put := a_manifest.manifest_put_feature_stamp.run_feature_for(a_manifest.created_type)
            if feature_put = Void then
               processor.set_exception(exceptions.System_level_type_error, once "Unknown manifest_put feature")
            else
               step := feature_put.arguments.count - 1
               if a_manifest.item_list /= Void then
                  from
                     i := a_manifest.item_list.lower
                  until
                     i > a_manifest.item_list.upper
                  loop
                     return := execute_rf(Result, agent manifest_arguments_slice(i - a_manifest.item_list.lower, a_manifest.item_list, i, step, current_frame),
                                          feature_put)
                     check
                        return = Void
                     end
                     i := i + step
                  end
               end
            end
         end
      end

   call_agent (launcher: AGENT_LAUNCHER; a_executor: VISITOR) is
         -- calling `call' or `item' on an agent
      local
         agent_launcher: RUNNER_AGENT_LAUNCHER
      do
         create agent_launcher.make(processor, launcher)
         execute_agent(agent_launcher, a_executor)
      end

feature {RUNNER_PROCESSOR}
   run (rf: RUN_FEATURE) is
      local
         root_object: RUNNER_OBJECT
         return: RUNNER_OBJECT
      do
         root_object := processor.new_object(rf.type_of_current)
         return := execute_rf(root_object, agent idem_arguments(Void), rf)
         check
            return = Void
         end
      end

feature {}
   arguments (a_call: FEATURE_CALL; a_frame: like current_frame): FAST_ARRAY[RUNNER_OBJECT] is
         -- evaluates the arguments of the call in the given frame
      do
         Result := indexable_arguments(a_call.arguments, a_frame)
      end

   manifest_arguments (a_capacity: INTEGER; a_arguments: INDEXABLE[EXPRESSION]; a_frame: like current_frame): FAST_ARRAY[RUNNER_OBJECT] is
         -- evaluates the arguments in the given frame
      local
         extra: FAST_ARRAY[RUNNER_OBJECT]
      do
         extra := {FAST_ARRAY[RUNNER_OBJECT] << processor.new_integer_32(a_capacity) >>}
         if a_arguments = Void then
            Result := indexable_arguments_slice(extra, Void, 0, 0, a_frame)
         else
            Result := indexable_arguments_slice(extra, a_arguments, a_arguments.lower, a_arguments.count, a_frame)
         end
      end

   manifest_arguments_slice (a_index: INTEGER; a_arguments: INDEXABLE[EXPRESSION]; start, count: INTEGER; a_frame: like current_frame): FAST_ARRAY[RUNNER_OBJECT] is
         -- evaluates the arguments in the given frame
      local
         extra: FAST_ARRAY[RUNNER_OBJECT]
      do
         extra := {FAST_ARRAY[RUNNER_OBJECT] << processor.new_integer_32(a_index) >>}
         Result := indexable_arguments_slice(extra, a_arguments, start, count, a_frame)
      end

   indexable_arguments (a_arguments: INDEXABLE[EXPRESSION]; a_frame: like current_frame): FAST_ARRAY[RUNNER_OBJECT] is
         -- evaluates the arguments in the given frame
      do
         if a_arguments /= Void then
            Result := indexable_arguments_slice(Void, a_arguments, a_arguments.lower, a_arguments.count, a_frame)
         end
      end

   indexable_arguments_slice (a_extra_arguments: INDEXABLE[RUNNER_OBJECT]; a_arguments: INDEXABLE[EXPRESSION]; start, count: INTEGER; a_frame: like current_frame): FAST_ARRAY[RUNNER_OBJECT] is
         -- evaluates one slice of arguments in the given frame
      require
         at_least_some_arguments: a_arguments /= Void or else a_extra_arguments /= Void
         valid_start: a_arguments /= Void implies start.in_range(a_arguments.lower, a_arguments.upper - count + 1)
         valid_count: a_arguments /= Void implies count.in_range(1, a_arguments.count)
                      a_arguments = Void implies count = 0
         full_slice: a_arguments /= Void implies (start - a_arguments.lower) \\ count = 0
      local
         i, extra_count: INTEGER
         old_frame: like current_frame
      do
         check
            integrity: a_frame = current_frame.caller
         end

         old_frame := current_frame
         current_frame := a_frame
         if a_extra_arguments /= Void then
            extra_count := a_extra_arguments.count
         end

         create Result.make(extra_count + count)

         from
            i := 0
         until
            i = extra_count
         loop
            Result.put(a_extra_arguments.item(i + a_extra_arguments.lower), i)
            i := i + 1
         end

         from
            i := 0
         until
            i = count
         loop
            Result.put(expand(processor.expressions.eval(a_arguments.item(i + start))), extra_count + i)
            i := i + 1
         end

         debug ("run.data")
            from
               i := Result.lower
            until
               i > Result.upper
            loop
               if Result.item(i) = Void then
                  std_output.put_line(once "ARG##(1) = Void" # i.out)
               else
                  std_output.put_line(once "ARG##(1) = #(2)" # i.out # Result.item(i).out)
               end
               i := i + 1
            end
         end

         current_frame := old_frame
      ensure
         a_extra_arguments = Void implies Result.count = count
         a_extra_arguments /= Void implies Result.count = a_extra_arguments.count + count
      end

   idem_arguments (a_arguments: like arguments): like arguments is
      do
         Result := a_arguments
      end

   execute_rf (a_target: RUNNER_OBJECT; a_arguments: FUNCTION[TUPLE, TRAVERSABLE[RUNNER_OBJECT]]; a_rf: RUN_FEATURE): RUNNER_OBJECT is
      require
         a_target /= Void
         --| **** TODO a_target.type = a_rf.type_of_current
         a_rf /= Void
      local
         frame: RUNNER_RUN_FEATURE_FRAME
      do
         debug ("run.callstack")
            std_output.put_line(once "%N~~~~ CALLING #(1) ~~~~%N%N" # a_rf.name.to_string)
         end

         create frame.make(processor, current_frame, a_target, a_arguments, a_rf)
         execute_frame(frame, a_rf, Current, a_rf)
         Result := frame.return
         check
            Result /= Void implies (a_rf.result_type /= Void and then
                                    Result.type.can_be_assigned_to(a_rf.result_type.resolve_in(a_rf.type_of_current)))
         end

         debug ("run.callstack")
            std_output.put_line(once "> return from #(1)%N" # a_rf.name.to_string)
         end
      end

   execute_non_void (a_target: RUNNER_OBJECT; a_non_void: NON_VOID_NO_DISPATCH): RUNNER_OBJECT is
      require
         a_target /= Void
         a_non_void /= Void
         a_non_void.external_function /= Void
      local
         frame: RUNNER_NON_VOID_FRAME
      do
         debug ("run.callstack")
            std_output.put_line(once "%N~~~~ CALLING #(1) ~~~~%N%N" # a_non_void.feature_stamp.name.to_string)
         end

         create frame.make(processor, current_frame, a_target, a_non_void)
         execute_frame(frame, a_non_void.external_function.native, Current, Void)
         Result := frame.return

         debug ("run.callstack")
            std_output.put_line(once "> return from #(1)%N" # a_non_void.feature_stamp.name.to_string)
         end
      ensure
         Result /= Void
      end

   execute_agent (a_launcher: RUNNER_AGENT_LAUNCHER; a_executor: VISITOR) is
      require
         a_launcher /= Void
      local
         frame: RUNNER_AGENT_FRAME
      do
         debug ("run.callstack")
            std_output.put_line(once "%N~~~~ CALLING agent #(1) ~~~~%N%N" # a_launcher.feature_stamp.name.to_string)
         end

         create frame.make(processor, current_frame, a_launcher)
         execute_frame(frame, a_launcher.code, a_executor, Void)
         check
            frame.return = Void -- if `item': the result is already set in the calling RUNNER_EXPRESSIONS
         end

         debug ("run.callstack")
            std_output.put_line(once "> return from agent #(1)%N" # a_launcher.feature_stamp.name.to_string)
         end
      end

   execute_frame (a_frame: like current_frame; a_executable: VISITABLE; a_executor: VISITOR; a_rf: RUN_FEATURE) is
      require
         a_frame /= Void
         a_rf /= Void implies a_executable = a_rf
      local
         old_frame: like current_frame
      do
         old_frame := current_frame
         current_frame := a_frame

         debug ("run.data")
            std_output.put_line(once "Current is #(1)" # a_frame.target.out)
         end

         processor.check_invariant(a_frame.target.type)
         if a_rf /= Void then
            processor.check_require(a_frame.target, a_rf)
         end

         if processor.exception = Void then
            a_executable.accept(a_executor)
         end

         if a_rf /= Void then
            processor.check_ensure(a_rf)
         end
         processor.check_invariant(a_frame.target.type)

         check
            old_frame = a_frame.caller
         end
         current_frame := old_frame

         debug ("run.data")
            if a_frame.type_of_result /= Void then
               if a_frame.return = Void then
                  std_output.put_line(once "Result is Void")
               else
                  std_output.put_line(once "Result is #(1)" # a_frame.return.out)
               end
            end
         end
      ensure
         a_frame.target = old a_frame.target
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

feature {}
   execute_routine (a_routine: RUN_FEATURE) is
      do
         if a_routine.routine_body /= Void then
            from
            until
               current_frame.finished
            loop
               processor.instructions.execute(a_routine.routine_body)
               current_frame.execute
               if processor.exception /= Void and then a_routine.rescue_compound /= Void then
                  processor.instructions.execute(a_routine.rescue_compound)
                  current_frame.execute
               end
            end
         end
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3) is
      do
         current_frame.force_eval_arguments
         execute_routine(visited)
         check
            current_frame.return = Void
         end
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4) is
      do
         current_frame.force_eval_arguments
         execute_routine(visited)
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5) is
      do
         current_frame.force_eval_arguments
         if once_run_features.fast_has(visited.base_feature) then
            check
               once_run_features.fast_at(visited.base_feature) = Void
            end
         else
            execute_routine(visited)
            once_run_features.add(Void, visited.base_feature)
         end
         check
            current_frame.return = Void
         end
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6) is
      do
         current_frame.force_eval_arguments
         if once_run_features.fast_has(visited.base_feature) then
            current_frame.set_return(once_run_features.fast_at(visited.base_feature))
         else
            execute_routine(visited)
            once_run_features.add(expand(current_frame.return), visited.base_feature)
         end
      end

feature {}
   once_run_features: HASHED_DICTIONARY[RUNNER_OBJECT, ONCE_ROUTINE]

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7) is
      do
         visited.base_feature.native.accept(Current)
         current_frame.execute
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8) is
      do
         visited.base_feature.native.accept(Current)
         current_frame.execute
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9) is
      do
         --| **** TODO: deferred feature called
      end

feature {NATIVE_BUILT_IN}
   visit_native_built_in (visited: NATIVE_BUILT_IN) is
      do
         current_frame.target.builtins.call(processor)
      end

feature {NATIVE_C_PLUS_PLUS}
   visit_native_c_plus_plus (visited: NATIVE_C_PLUS_PLUS) is
      do
         break --| **** TODO
      end

feature {NATIVE_C}
   visit_native_c (visited: NATIVE_C) is
      do
         break --| **** TODO
      end

feature {NATIVE_JAVA}
   visit_native_java (visited: NATIVE_JAVA) is
      do
         break --| **** TODO
      end

feature {NATIVE_PLUG_IN}
   visit_native_plug_in (visited: NATIVE_PLUG_IN) is
      local
         plugin: RUNNER_PLUGIN
      do
         plugin ::= visited.plugin
         plugin.call(processor)
      end

feature {}
   make (a_processor: like processor) is
      require
         a_processor /= Void
      do
         processor := a_processor
         create once_run_features.make
      ensure
         processor = a_processor
      end

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
