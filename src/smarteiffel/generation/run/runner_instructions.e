-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_INSTRUCTIONS

inherit
   INSTRUCTION_VISITOR
   RUNNER_LOOP_VISITOR
   RUNNER_EXECUTOR

create {RUNNER_PROCESSOR}
   make

feature {AGENT_INSTRUCTION}
   visit_agent_instruction (visited: AGENT_INSTRUCTION)
      do
         processor.features.call_agent(visited, Current)
      end

feature {ASSERTION_LIST}
   visit_assertion_list (visited: ASSERTION_LIST)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {CLASS_INVARIANT}
   visit_class_invariant (visited: CLASS_INVARIANT)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {ENSURE_ASSERTION}
   visit_ensure_assertion (visited: ENSURE_ASSERTION)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {LOOP_INVARIANT}
   visit_loop_invariant (visited: LOOP_INVARIANT)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {ASSIGNMENT_ATTEMPT}
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT)
      do
         processor.assignment.try_assign(visited)
      end

feature {ASSIGNMENT}
   visit_assignment (visited: ASSIGNMENT)
      do
         processor.assignment.do_assign(visited)
      end

feature {CHECK_COMPOUND}
   visit_check_compound (visited: CHECK_COMPOUND)
      do
         if visited.must_be_generated(current_frame.type_of_current) then
            processor.check_assertions(exceptions.Check_instruction, visited.assertion_list)
         end
      end

feature {C_INLINE}
   visit_c_inline (visited: C_INLINE)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {COMMENT}
   visit_comment (visited: COMMENT)
      do
         -- nothing
      end

feature {COMPOUND}
   visit_compound (visited: COMPOUND)
      do
         check
            visited.list /= Void
         end
         current_frame.add_instructions(visited.list)
      end

feature {CREATE_INSTRUCTION}
   visit_create_instruction (visited: CREATE_INSTRUCTION)
      local
         new: RUNNER_OBJECT
      do
         new := processor.features.new(visited.created_type(current_frame.type_of_current), visited.call)
         processor.assignment.assign_to(new, visited.writable)
      end

feature {RAW_CREATE_INSTRUCTION}
   visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION)
      do
         visit_create_instruction(visited)
      end

feature {DEBUG_COMPOUND}
   visit_debug_compound (visited: DEBUG_COMPOUND)
      do
         if visited.must_be_generated(current_frame.type_of_current) then
            if visited.compound /= Void then
               current_frame.add_instruction(visited.compound)
            end
         end
      end

feature {IFTHENELSE}
   visit_ifthenelse (visited: IFTHENELSE)
      local
         old_flag: like ifthen_flag
         i: INTEGER
         condition: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         condition ::= processor.expressions.eval(visited.expression)
         if condition.item then
            if visited.then_compound /= Void then
               visited.then_compound.accept(Current)
            end
         else
            old_flag := ifthen_flag
            ifthen_flag := False

            if visited.elseif_list /= Void then
               from
                  i := visited.elseif_list.lower
               until
                  ifthen_flag or else i > visited.elseif_list.upper
               loop
                  visited.elseif_list.item(i).accept(Current)
                  i := i + 1
               end
            end
            if not ifthen_flag and then visited.else_compound /= Void then
               visited.else_compound.accept(Current)
            end

            ifthen_flag := old_flag
         end
      end

feature {}
   ifthen_flag: BOOLEAN
         -- turns true as soon as some ifelse branch was called

feature {IFTHEN}
   visit_ifthen (visited: IFTHEN)
      local
         condition: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         condition ::= processor.expressions.eval(visited.expression)
         if condition.item then
            if visited.then_compound /= Void then
               visited.then_compound.accept(Current)
            end
            ifthen_flag := True
         end
      end

feature {MANIFEST_STRING_INSPECT_STATEMENT}
   visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT)
      do
         inspector.call(visited)
      end

feature {OTHER_INSPECT_STATEMENT}
   visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT)
      do
         inspector.call(visited)
      end

feature {LOOP_INSTRUCTION}
   visit_loop_instruction (visited: LOOP_INSTRUCTION)
      do
         current_frame.add_instruction(create {RUNNER_LOOP}.make(visited))
         if visited.initialize /= Void then
            current_frame.add_instruction(visited.initialize)
         end
      end

feature {RUNNER_LOOP}
   visit_runner_loop (visited: RUNNER_LOOP)
      local
         stop: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         stop ::= processor.expressions.eval(visited.loop_instruction.until_expression)
         debug ("run.callstack")
            std_output.put_line(once "Stop loop: #(1)" # stop.out)
         end
         if not stop.item then
            current_frame.add_instruction(visited)
            if visited.loop_instruction.loop_body /= Void then
               current_frame.add_instruction(visited.loop_instruction.loop_body)
            end
         end
      end

feature {NO_INVARIANT_WRAPPER}
   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER)
      do
         visited.compound.accept(Current)
      end

feature {RUN_TIME_ERROR_INSTRUCTION}
   visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION)
      do
         processor.set_exception(visited.error_code,
                                 once "#(1):#(2):#(3): #(4)"
                                    # visited.start_position.path
                                    # visited.start_position.line.out
                                    # visited.start_position.column.out
                                    # visited.error_message)
      end

feature {SEDB}
   visit_sedb (visited: SEDB)
      do
         debug ("run.data")
            std_output.put_line(once "SEDB: #(1)" # visited.info_code.out)
         end
      end

feature {UNUSED_EXPRESSION}
   visit_unused_expression (visited: UNUSED_EXPRESSION)
      local
         dropped: RUNNER_OBJECT
      do
         dropped := processor.expressions.eval(visited.expression)
      end

feature {VOID_PROC_CALL}
   visit_void_proc_call (visited: VOID_PROC_CALL)
      do
         processor.set_exception(exceptions.Void_call_target, "Void call")
      end

feature {PRECURSOR_INSTRUCTION}
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {}
   visit_procedure_call (visited: PROCEDURE_CALL)
      do
         processor.features.call(visited)
      end

feature {PROCEDURE_CALL_0}
   visit_procedure_call_0 (visited: PROCEDURE_CALL_0)
      do
         visit_procedure_call(visited)
      end

feature {PROCEDURE_CALL_1}
   visit_procedure_call_1 (visited: PROCEDURE_CALL_1)
      do
         visit_procedure_call(visited)
      end

feature {PROCEDURE_CALL_N}
   visit_procedure_call_n (visited: PROCEDURE_CALL_N)
      do
         visit_procedure_call(visited)
      end

feature {REQUIRE_ASSERTION}
   visit_require_assertion (visited: REQUIRE_ASSERTION)
      do
         std_output.put_line(once "%N%N**** TODO ****%N%N")
         break --| **** TODO
      end

feature {RETRY_INSTRUCTION}
   visit_retry_instruction (visited: RETRY_INSTRUCTION)
      do
         current_frame.set_retry
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE)
      do
         check
            never_called: False -- because RUNNER_INSPECTOR handles inspect
         end
      end

feature {}
   make (a_processor: like processor)
      require
         a_processor /= Void
      do
         processor := a_processor
         create inspector.make(a_processor)
      ensure
         processor = a_processor
      end

   inspector: RUNNER_INSPECTOR

invariant
   inspector /= Void
   inspector.processor = processor

end -- class RUNNER_INSTRUCTIONS
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
