-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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

   INSTRUCTION_VISITOR

create {ANY}
   make

feature {SMART_EIFFEL}
   compile is
         -- Code interpretation happens here.
      do
      end

feature {AGENT_INSTRUCTION}
   visit_agent_instruction (visited: AGENT_INSTRUCTION) is
      do
      end

feature {ASSERTION_LIST}
   visit_assertion_list (visited: ASSERTION_LIST) is
      do
      end

feature {CLASS_INVARIANT}
   visit_class_invariant (visited: CLASS_INVARIANT) is
      do
      end

feature {ENSURE_ASSERTION}
   visit_ensure_assertion (visited: ENSURE_ASSERTION) is
      do
      end

feature {LOOP_INVARIANT}
   visit_loop_invariant (visited: LOOP_INVARIANT) is
      do
      end

feature {ASSIGNMENT_ATTEMPT}
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT) is
      do
      end

feature {ASSIGNMENT}
   visit_assignment (visited: ASSIGNMENT) is
      do
      end

feature {CHECK_COMPOUND}
   visit_check_compound (visited: CHECK_COMPOUND) is
      do
      end

feature {C_INLINE}
   visit_c_inline (visited: C_INLINE) is
      do
      end

feature {COMMENT}
   visit_comment (visited: COMMENT) is
      do
      end

feature {COMPOUND}
   visit_compound (visited: COMPOUND) is
      do
      end

feature {CREATE_INSTRUCTION}
   visit_create_instruction (visited: CREATE_INSTRUCTION) is
      do
      end

feature {RAW_CREATE_INSTRUCTION}
   visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION) is
      do
      end

feature {DEBUG_COMPOUND}
   visit_debug_compound (visited: DEBUG_COMPOUND) is
      do
      end

feature {IFTHENELSE}
   visit_ifthenelse (visited: IFTHENELSE) is
      do
      end

feature {IFTHEN}
   visit_ifthen (visited: IFTHEN) is
      do
      end

feature {MANIFEST_STRING_INSPECT_STATEMENT}
   visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT) is
      do
      end

feature {OTHER_INSPECT_STATEMENT}
   visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT) is
      do
      end

feature {LOOP_INSTRUCTION}
   visit_loop_instruction (visited: LOOP_INSTRUCTION) is
      do
      end

feature {NO_INVARIANT_WRAPPER}
   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER) is
      do
      end

feature {RUN_TIME_ERROR_INSTRUCTION}
   visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION) is
      do
      end

feature {SEDB}
   visit_sedb (visited: SEDB) is
      do
      end

feature {UNUSED_EXPRESSION}
   visit_unused_expression (visited: UNUSED_EXPRESSION) is
      do
      end

feature {VOID_PROC_CALL}
   visit_void_proc_call (visited: VOID_PROC_CALL) is
      do
      end

feature {PRECURSOR_INSTRUCTION}
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION) is
      do
      end

feature {PROCEDURE_CALL_0}
   visit_procedure_call_0 (visited: PROCEDURE_CALL_0) is
      do
      end

feature {PROCEDURE_CALL_1}
   visit_procedure_call_1 (visited: PROCEDURE_CALL_1) is
      do
      end

feature {PROCEDURE_CALL_N}
   visit_procedure_call_n (visited: PROCEDURE_CALL_N) is
      do
      end

feature {REQUIRE_ASSERTION}
   visit_require_assertion (visited: REQUIRE_ASSERTION) is
      do
      end

feature {RETRY_INSTRUCTION}
   visit_retry_instruction (visited: RETRY_INSTRUCTION) is
      do
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE) is
      do
      end

feature {}
   make is
      do
         create instructions.make(1, 0)
      end

   instructions: RING_ARRAY[INSTRUCTION]

invariant
   instructions /= Void

end -- class RUNNER
