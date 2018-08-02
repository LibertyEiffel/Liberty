-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class E_PROCEDURE

inherit
   EFFECTIVE_ROUTINE
      rename make_effective_routine as make
      redefine
         inline_instruction_0, inline_instruction_1, inline_instruction_n
      end

create {ANY}
   make

feature {ANY}
   side_effect_free (target_type: TYPE): BOOLEAN
      do
      end

   debug_list: HASHED_SET[STRING]
      once
         create Result.make
      end

feature {PROCEDURE_CALL_0}
   inline_instruction_0 (type: TYPE; target_type: TYPE; target: EXPRESSION): INLINE_MEMO
      local
         direct_non_void_call_flag, no_rescue_no_local_expanded: BOOLEAN; compound: COMPOUND
         proc_call: PROCEDURE_CALL; assignment: ASSIGNMENT
         writable_attribute_name: WRITABLE_ATTRIBUTE_NAME; left_side: FUNCTION_CALL_0
      do
         direct_non_void_call_flag := target_type.direct_non_void_call_flag
         no_rescue_no_local_expanded := no_rescue_no_local_expanded_in(target_type)
         if routine_body = Void and then direct_non_void_call_flag and then no_rescue_no_local_expanded then
            -- To handle procedure with an empty body:
            Result := smart_eiffel.get_inline_memo
            if target.side_effect_free(type) then
               -- We can really remove everything:
               check
                  Result.instruction = Void
               end
            else
               Result.set_instruction(create {UNUSED_EXPRESSION}.make(target))
            end
         else
            compound ?= routine_body
            if compound = Void then
               -- It is a one instruction body:
               if direct_non_void_call_flag and then no_rescue_no_local_expanded then
                  proc_call ?= routine_body
                  if proc_call /= Void then
                     Result := inline_proc_call_0(proc_call, type, target_type, target)
                  else
                     assignment ?= routine_body
                     if assignment /= Void then
                        -- Now looking for attribute setter:
                        writable_attribute_name ?= assignment.left_side
                        if writable_attribute_name /= Void and then assignment.right_side.is_static then
                           create left_side.make(target, writable_attribute_name.feature_name)
                           left_side.set_feature_stamp(writable_attribute_name.feature_stamp)
                           create assignment.inline_make(left_side, assignment.right_side)
                           Result := smart_eiffel.get_inline_memo
                           Result.set_instruction(assignment)
                        end
                     end
                  end
               end
            end
         end
         if Result /= Void then
            smart_eiffel.magic_count_increment
         end
      end

feature {PROCEDURE_CALL_1}
   inline_instruction_1 (type: TYPE; target_type: TYPE; target, arg: EXPRESSION): INLINE_MEMO
      local
         direct_non_void_call_flag, no_rescue_no_local_expanded: BOOLEAN; compound: COMPOUND
         proc_call: PROCEDURE_CALL; assignment: ASSIGNMENT; writable_attribute_name: WRITABLE_ATTRIBUTE_NAME
         argument_name_ref: ARGUMENT_NAME_REF; left_side: FUNCTION_CALL_0; call_0_c: FUNCTION_CALL_0; call: FUNCTION_CALL
         inline_assignment_procedure: BOOLEAN; fs: FEATURE_STAMP; writable_attribute: WRITABLE_ATTRIBUTE
      do
         direct_non_void_call_flag := target_type.direct_non_void_call_flag
         no_rescue_no_local_expanded := no_rescue_no_local_expanded_in(target_type)
         if routine_body = Void and then direct_non_void_call_flag and then no_rescue_no_local_expanded then
            -- To handle procedure with an empty body:
            Result := smart_eiffel.get_inline_memo
            if target.side_effect_free(type) then
               if arg.side_effect_free(type) then
                  -- We can really remove everything:
                  check
                     Result.instruction = Void
                  end
               else
                  Result.set_instruction(create {UNUSED_EXPRESSION}.make(arg))
               end
            elseif arg.side_effect_free(type) then
               Result.set_instruction(create {UNUSED_EXPRESSION}.make(target))
            else
               Result.set_instruction(create {COMPOUND}.make_2(create {UNUSED_EXPRESSION}.make(target),
                                                               create {UNUSED_EXPRESSION}.make(arg)))
            end
         else
            compound ?= routine_body
            if compound = Void then
               -- It is a one instruction body:
               if direct_non_void_call_flag and then no_rescue_no_local_expanded then
                  proc_call ?= routine_body
                  if proc_call /= Void then
                     -- And the body is one procedure call:
                     Result := inline_proc_call_1(proc_call, type, target_type, target, arg)
                  else
                     assignment ?= routine_body
                     if assignment /= Void then
                        -- Now looking for assignment procedure (e.g. {STRING}.set_count):
                        writable_attribute_name ?= assignment.left_side
                        argument_name_ref ?= assignment.right_side
                        if writable_attribute_name /= Void and then argument_name_ref /= Void then
                           inline_assignment_procedure := True
                           if target_type.is_expanded then
                              call ?= target
                              if call /= Void then
                                 inline_assignment_procedure := False
                                 call_0_c ?= call
                                 if call_0_c /= Void and then call_0_c.target.is_current then
                                    -- It may be an attribute:
                                    fs := call_0_c.feature_stamp
                                    check
                                       --|*** This seems to mean "fs has already been specialized", but can
                                       --|*** it be expressed with the new resolve_static_bindig_for? <FM-18/03/2006>
                                       -- fs = fs.resolve_dynamic_binding_for(type)
                                    end
                                    writable_attribute ?= fs.anonymous_feature(type)
                                    if writable_attribute /= Void then
                                       inline_assignment_procedure := True
                                    end
                                 end
                              end
                           end
                           if inline_assignment_procedure then
                              create left_side.make(target, writable_attribute_name.feature_name)
                              left_side.set_feature_stamp(writable_attribute_name.feature_stamp)
                              create assignment.inline_make(left_side, arg)
                              Result := smart_eiffel.get_inline_memo
                              Result.set_instruction(assignment)
                           end
                        end
                     end
                  end
               end
            end
         end
         if Result /= Void then
            smart_eiffel.magic_count_increment
         end
      end

feature {PROCEDURE_CALL_N}
   inline_instruction_n (type: TYPE; target_type: TYPE; target: EXPRESSION; args: EFFECTIVE_ARG_LIST)
      : INLINE_MEMO
      local
         direct_non_void_call_flag, no_rescue_no_local_expanded: BOOLEAN; compound: COMPOUND
         proc_call: PROCEDURE_CALL
      do
         direct_non_void_call_flag := target_type.direct_non_void_call_flag
         no_rescue_no_local_expanded := no_rescue_no_local_expanded_in(target_type)
         if routine_body = Void and then direct_non_void_call_flag and then no_rescue_no_local_expanded then
            -- To handle procedure with an empty body:
            Result := smart_eiffel.get_inline_memo
            if not target.side_effect_free(type) then
               Result.set_instruction(create {UNUSED_EXPRESSION}.make(target))
            end
            args.unused_expression_in(Result, type)
         else
            compound ?= routine_body
            if compound = Void then
               -- It is a one instruction body:
               if direct_non_void_call_flag and then no_rescue_no_local_expanded then
                  proc_call ?= routine_body
                  if proc_call /= Void then
                     Result := inline_proc_call_n(proc_call, type, target_type, target, args)
                  end
               end
            end
         end
         if Result /= Void then
            smart_eiffel.magic_count_increment
         end
      end

feature {}
   new_run_feature_for (t: TYPE; fn: FEATURE_NAME): RUN_FEATURE_3
      do
         create Result.for(t.live_type, Current, fn)
      end

feature {ANY}
   accept (visitor: E_PROCEDURE_VISITOR)
      do
         visitor.visit_e_procedure(Current)
      end

   result_type: TYPE_MARK
      do
      end

feature {}
   try_to_undefine_aux (fn: FEATURE_NAME; ct: CLASS_TEXT): DEFERRED_ROUTINE
      do
         create {DEFERRED_PROCEDURE} Result.from_effective(fn, arguments, require_assertion, ensure_assertion, ct, permissions)
      end

   pretty_print_once_or_do (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "do")
      end

   inline_proc_call_0 (proc_call: PROCEDURE_CALL; type: TYPE; target_type: TYPE; target: EXPRESSION)
      : INLINE_MEMO
      require
         proc_call /= Void
      local
         proc_call_0: PROCEDURE_CALL_0; proc_call_1: PROCEDURE_CALL_1; proc_call_n: PROCEDURE_CALL_N; call_0: CALL_0
      do
         call_0 := left_most_current_direct_call_0_sequence(target_type, proc_call.target)
         if call_0 = Void and then proc_call.target.is_current then
            if proc_call.arg_count = 0 then
               -- (May be the {INPUT_STREAM}.filtered_read_character.)
               proc_call_0 ?= proc_call
               proc_call_0 := proc_call_0.inline_with(target)
               Result := smart_eiffel.get_inline_memo
               Result.set_instruction(proc_call_0)
            elseif proc_call.arguments.is_static then
               proc_call_1 ?= proc_call
               if proc_call_1 /= Void then
                  proc_call_1 := proc_call_1.inline_with(target, proc_call_1.arguments.expression(1))
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_1)
               else
                  proc_call_n ?= proc_call
                  proc_call_n := proc_call_n.inline_with(target, proc_call_n.arguments)
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_n)
               end
            end
         elseif call_0 /= Void then
            if proc_call.arg_count = 0 then
               call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
               proc_call_0 ?= proc_call
               proc_call_0 := proc_call_0.inline_with(call_0)
               Result := smart_eiffel.get_inline_memo
               Result.set_instruction(proc_call_0)
            elseif proc_call.arguments.is_static then
               call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
               proc_call_1 ?= proc_call
               if proc_call_1 /= Void then
                  proc_call_1 := proc_call_1.inline_with(call_0, proc_call.arguments.expression(1))
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_1)
               else
                  proc_call_n ?= proc_call
                  proc_call_n := proc_call_n.inline_with(call_0, proc_call.arguments)
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_n)
               end
            end
         end
      end

   inline_proc_call_1 (body: PROCEDURE_CALL; type: TYPE; target_type: TYPE; target, arg: EXPRESSION)
      : INLINE_MEMO
      require
         body /= Void
      local
         proc_call_1: PROCEDURE_CALL_1; proc_call_n: PROCEDURE_CALL_N; call_0: CALL_0; argument_name_ref: ARGUMENT_NAME_REF
      do
         call_0 := left_most_current_direct_call_0_sequence(target_type, body.target)
         if call_0 = Void and then body.target.is_current then
            if body.arg_count = 1 then
               argument_name_ref ?= body.arguments.expression(1)
               if argument_name_ref /= Void then
                  proc_call_1 ?= body
                  proc_call_1 := proc_call_1.inline_with(target, arg)
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_1)
               end
            elseif body.arg_count = 2 then
               argument_name_ref ?= body.arguments.expression(1)
               if argument_name_ref /= Void and then body.arguments.expression(2).is_static then
                  proc_call_n ?= body
                  proc_call_n := proc_call_n.inline_2(target, arg, proc_call_n.arguments.expression(2))
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_n)
               else
                  argument_name_ref ?= body.arguments.expression(2)
                  if argument_name_ref /= Void and then body.arguments.expression(1).is_static then
                     proc_call_n ?= body
                     proc_call_n := proc_call_n.inline_2(target, proc_call_n.arguments.expression(1), arg)
                     Result := smart_eiffel.get_inline_memo
                     Result.set_instruction(proc_call_n)
                  end
               end
            end
         elseif call_0 /= Void then
            if body.arg_count = 1 then
               -- (May be the {FILE_TOOLS}.delete.)
               argument_name_ref ?= body.arguments.expression(1)
               if argument_name_ref /= Void then
                  call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
                  proc_call_1 ?= body
                  proc_call_1 := proc_call_1.inline_with(call_0, arg)
                  Result := smart_eiffel.get_inline_memo
                  Result.set_instruction(proc_call_1)
               end
            end
         end
      end

   inline_proc_call_n (proc_call: PROCEDURE_CALL; type: TYPE; target_type: TYPE; target: EXPRESSION
      args: EFFECTIVE_ARG_LIST): INLINE_MEMO
      require
         proc_call /= Void
      local
         proc_call_n: PROCEDURE_CALL_N; call_0: CALL_0; argument_name_ref: ARGUMENT_NAME_REF
      do
         call_0 := left_most_current_direct_call_0_sequence(target_type, proc_call.target)
         if call_0 /= Void then
            if args.count = 2 and then proc_call.arg_count = 2 then
               -- (May be the {FAST_ARRAY}.put.)
               argument_name_ref ?= proc_call.arguments.expression(1)
               if argument_name_ref /= Void and then argument_name_ref.rank = 1 then
                  argument_name_ref ?= proc_call.arguments.expression(2)
                  if argument_name_ref /= Void and then argument_name_ref.rank = 2 then
                     call_0 := left_most_current_direct_call_0_sequence_inline(type, call_0, target_type, target)
                     proc_call_n ?= proc_call
                     proc_call_n := proc_call_n.inline_2(call_0, args.expression(1), args.expression(2))
                     Result := smart_eiffel.get_inline_memo
                     Result.set_instruction(proc_call_n)
                  end
               end
            end
         end
      end

end -- class E_PROCEDURE
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
