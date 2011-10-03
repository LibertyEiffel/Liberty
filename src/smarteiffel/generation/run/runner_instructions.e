-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_INSTRUCTIONS

inherit
   INSTRUCTION_VISITOR
   RUNNER_LOOP_VISITOR

insert
   RUNNER_FACET

create {RUNNER_PROCESSOR}
   make

feature {RUNNER_FACET}
   execute (a_inst: INSTRUCTION) is
      require
         a_inst /= Void
      do
         a_inst.accept(Current)
      end

feature {AGENT_INSTRUCTION}
   visit_agent_instruction (visited: AGENT_INSTRUCTION) is
      do
         sedb_breakpoint
      end

feature {ASSERTION_LIST}
   visit_assertion_list (visited: ASSERTION_LIST) is
      do
         sedb_breakpoint
      end

feature {CLASS_INVARIANT}
   visit_class_invariant (visited: CLASS_INVARIANT) is
      do
         sedb_breakpoint
      end

feature {ENSURE_ASSERTION}
   visit_ensure_assertion (visited: ENSURE_ASSERTION) is
      do
         sedb_breakpoint
      end

feature {LOOP_INVARIANT}
   visit_loop_invariant (visited: LOOP_INVARIANT) is
      do
         sedb_breakpoint
      end

feature {ASSIGNMENT_ATTEMPT}
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT) is
      do
         assignment.try_assign(visited)
      end

feature {ASSIGNMENT}
   visit_assignment (visited: ASSIGNMENT) is
      do
         assignment.assign(visited)
      end

feature {CHECK_COMPOUND}
   visit_check_compound (visited: CHECK_COMPOUND) is
      do
         sedb_breakpoint
      end

feature {C_INLINE}
   visit_c_inline (visited: C_INLINE) is
      do
         sedb_breakpoint
      end

feature {COMMENT}
   visit_comment (visited: COMMENT) is
      do
         -- nothing
      end

feature {COMPOUND}
   visit_compound (visited: COMPOUND) is
      do
         processor.current_frame.add_instructions(visited.list)
      end

feature {CREATE_INSTRUCTION}
   visit_create_instruction (visited: CREATE_INSTRUCTION) is
      local
         new: RUNNER_OBJECT
      do
         new := processor.features.new(visited.created_type(processor.current_frame.type_of_current), visited.call)
         assignment.assign_to(new, visited.writable)
      end

feature {RAW_CREATE_INSTRUCTION}
   visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION) is
      do
         visit_create_instruction(visited)
      end

feature {DEBUG_COMPOUND}
   visit_debug_compound (visited: DEBUG_COMPOUND) is
      do
         if visited.must_be_generated(processor.current_frame.type_of_current) then
            processor.current_frame.add_instruction(visited.compound)
         end
      end

feature {IFTHENELSE}
   visit_ifthenelse (visited: IFTHENELSE) is
      do
         sedb_breakpoint
      end

feature {IFTHEN}
   visit_ifthen (visited: IFTHEN) is
      local
         condition: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         condition ::= processor.expressions.eval(visited.expression)
         if condition.item then
            processor.current_frame.add_instruction(visited.then_compound)
         end
      end

feature {MANIFEST_STRING_INSPECT_STATEMENT}
   visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT) is
      do
         sedb_breakpoint
      end

feature {OTHER_INSPECT_STATEMENT}
   visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT) is
      do
         sedb_breakpoint
      end

feature {LOOP_INSTRUCTION}
   visit_loop_instruction (visited: LOOP_INSTRUCTION) is
      do
         processor.current_frame.add_instruction(create {RUNNER_LOOP}.make(visited))
         processor.current_frame.add_instruction(visited.initialize)
      end

feature {RUNNER_LOOP}
   visit_runner_loop (visited: RUNNER_LOOP) is
      local
         stop: RUNNER_NATIVE_EXPANDED[BOOLEAN]
      do
         stop ::= processor.expressions.eval(visited.loop_instruction.until_expression)
         if not stop.item then
            processor.current_frame.add_instruction(visited)
            processor.current_frame.add_instruction(visited.loop_instruction.loop_body)
         end
      end

feature {NO_INVARIANT_WRAPPER}
   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER) is
      do
         sedb_breakpoint
      end

feature {RUN_TIME_ERROR_INSTRUCTION}
   visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION) is
      do
         std_error.put_line("**** " + visited.start_position.path +
                            ":"     + visited.start_position.line.out +
                            ","     + visited.start_position.column.out +
                            ": "    + visited.error_message)
         sedb_breakpoint
      end

feature {SEDB}
   visit_sedb (visited: SEDB) is
      do
         --sedb_breakpoint
      end

feature {UNUSED_EXPRESSION}
   visit_unused_expression (visited: UNUSED_EXPRESSION) is
      do
         sedb_breakpoint
      end

feature {VOID_PROC_CALL}
   visit_void_proc_call (visited: VOID_PROC_CALL) is
      do
         sedb_breakpoint
      end

feature {PRECURSOR_INSTRUCTION}
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION) is
      do
         sedb_breakpoint
      end

feature {PROCEDURE_CALL_0}
   visit_procedure_call_0 (visited: PROCEDURE_CALL_0) is
      do
         processor.features.call(visited)
      end

feature {PROCEDURE_CALL_1}
   visit_procedure_call_1 (visited: PROCEDURE_CALL_1) is
      do
         processor.features.call(visited)
      end

feature {PROCEDURE_CALL_N}
   visit_procedure_call_n (visited: PROCEDURE_CALL_N) is
      do
         processor.features.call(visited)
      end

feature {REQUIRE_ASSERTION}
   visit_require_assertion (visited: REQUIRE_ASSERTION) is
      do
         sedb_breakpoint
      end

feature {RETRY_INSTRUCTION}
   visit_retry_instruction (visited: RETRY_INSTRUCTION) is
      do
         sedb_breakpoint
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE) is
      do
         sedb_breakpoint
      end

feature {}
   make (a_processor: like processor) is
      do
         processor := a_processor
         create assignment.make(a_processor)
      ensure
         processor = a_processor
      end

   processor: RUNNER_PROCESSOR
   assignment: RUNNER_ASSIGNMENT

invariant
   processor /= Void
   assignment /= Void
   assignment.processor = processor

end -- class RUNNER_INSTRUCTIONS
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
