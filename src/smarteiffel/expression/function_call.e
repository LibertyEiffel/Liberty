-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class FUNCTION_CALL
   --
   -- For all kinds of FEATURE_CALL with a result value (see also PROCEDURE_CALL).
   --
   -- Classification: CALL_0 when 0 argument, CALL_1 when
   -- 1 argument and FUNCTION_CALL_N when N arguments.
   --

inherit
   EXPRESSION
   FEATURE_CALL

feature {ANY}
   is_writable: BOOLEAN False

   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_result: BOOLEAN False

   is_void: BOOLEAN False

   is_static: BOOLEAN False

   resolve_in (type: TYPE): TYPE
      local
         tm: TYPE_MARK; target_type: TYPE
      do
         target_type := target.resolve_in(type)
         tm := feature_stamp.anonymous_feature(target_type).result_type
         -- If the next call fails, then check if specialize_and_check has been called!
         Result := tm.resolve_in(target_type)
      end

   declaration_type: TYPE
      do
         Result := written_declaration_type_mark.resolve_in(target.declaration_type)
      end

   written_declaration_type_mark: TYPE_MARK
      local
         target_declaration_type: TYPE; af: ANONYMOUS_FEATURE; fs: FEATURE_STAMP
      do
         Result := written_declaration_type_mark_memory
         if Result = Void then
            target_declaration_type := target.declaration_type
            fs := target_declaration_type.lookup(feature_name)
            if target_declaration_type = feature_accumulator.context_type then
               Result := feature_accumulator.find_type_for(fs)
            else
               af := fs.anonymous_feature(target_declaration_type)
               Result := af.result_type
            end
            written_declaration_type_mark_memory := Result
         end
      end

   frozen non_void_no_dispatch_type (type: TYPE): TYPE
      local
         rt: TYPE
      do
         rt := resolve_in(type)
         if rt.is_expanded then
            Result := rt
         else
            -- Even if there is only one possibility for the dynamic
            -- type, we are not sure that this call is not Void.
         end
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty(indent_level)
         pretty_printer.put_character('.')
      end

   has_been_specialized: BOOLEAN
      do
         Result := target.has_been_specialized
         if Result and then arguments /= Void then
            Result := arguments.has_been_specialized
         end
         if target.is_current then
            Result := Result and then feature_stamp /= Void
         end
      end

feature {FEATURE_CALL, IMPLICIT_CAST, C_TARGET_MAPPER}
   extra_local_expanded (type: TYPE): TYPE
         -- Assuming that `Current' is used as some target, if some extra local variable is required, the
         -- corresponding user's expanded type is returned.
      require
         smart_eiffel.status.collecting_done
         type /= Void
      local
         target_type, rt: TYPE; an_attribute: ATTRIBUTE; af: ANONYMOUS_FEATURE
      do
         rt := resolve_in(type)
         if rt.is_user_expanded and then not rt.is_empty_expanded then
            target_type := target.resolve_in(type)
            af := feature_stamp.anonymous_feature(target_type)
            if (an_attribute ?:= af) and then target.is_current then
               -- An extra local would prevent the modification of the target.
            else
               Result := rt
            end
         end
      ensure
         Result /= Void implies Result.is_user_expanded
      end

   creation_type: TYPE_MARK
      do
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         t: like target; inspect_statement: OTHER_INSPECT_STATEMENT; fs: FEATURE_STAMP
         target_type, non_void_no_dispatch, tt: TYPE; target_live_type, live_type: LIVE_TYPE
         run_time_set: RUN_TIME_SET; when_clause: WHEN_CLAUSE; function_call: like Current
         i: INTEGER; ddt1: DYNAMIC_DISPATCH_TEMPORARY1; ddt2: DYNAMIC_DISPATCH_TEMPORARY2
         args: like arguments; ddt1_id: DYNAMIC_DISPATCH_TEMPORARY1_ID
         internal_local2: INTERNAL_LOCAL2; run_time_error_instruction: RUN_TIME_ERROR_INSTRUCTION
         monomorphic_flag, void_call_flag, no_dispatch_flag: BOOLEAN
         af: ANONYMOUS_FEATURE; default_expression: EXPRESSION
      do
         code_accumulator.add_sedb(feature_name.start_position, 'S')
         target.inline_dynamic_dispatch_(code_accumulator, type)
         t := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         target_type := t.resolve_in(type)
         check
            target_type = target.resolve_in(type)
         end
         fs := feature_stamp
         non_void_no_dispatch := t.non_void_no_dispatch_type(type)
         target_live_type := target_type.live_type
         if non_void_no_dispatch /= Void then
            monomorphic_flag := True
            if non_void_no_dispatch /= target_type then
               fs := fs.resolve_static_binding_for(target_type, non_void_no_dispatch)
            end
         elseif target_live_type = Void then
            void_call_flag := True
         else
            run_time_set := target_live_type.run_time_set
            inspect
               run_time_set.count
            when 0 then
               void_call_flag := True
            when 1 then
               monomorphic_flag := True
               if target_live_type.run_time_set.first /= target_live_type then
                  no_dispatch_flag := True
                  target_live_type := target_live_type.run_time_set.first
                  fs := fs.resolve_static_binding_for(target_type, target_live_type.type)
                  target_type := target_live_type.type
               end
            else
               check
                  not monomorphic_flag
               end
            end
         end
         if target_type.is_expanded then
            -- We must not use extra local in order to avoid expanded extra copy:
            if arguments /= Void then
               args := arguments.inline_dynamic_dispatch(code_accumulator, type)
            end
            if t = target and then fs = feature_stamp and then args = arguments then
               code_accumulator.current_context.add_last(Current)
            else
               function_call := Current.twin
               function_call.set_target(t)
               function_call.set_feature_stamp(fs)
               function_call.set_arguments(args)
               code_accumulator.current_context.add_last(function_call)
            end
            smart_eiffel.monomorphic_function_call_count_increment
            smart_eiffel.expanded_target_function_call_count_increment
         elseif monomorphic_flag then
            smart_eiffel.monomorphic_function_call_count_increment
            check
               target_type.is_reference
            end
            if ace.boost or else t.side_effect_free(type) then
               -- No need to add an extra local:
               if no_dispatch_flag then
                  create {NO_DISPATCH} t.make(type, t, target_type)
               end
               if not ace.boost then
                  non_void_check(code_accumulator, type, t, target_type)
                  type_id_check(code_accumulator, type, t, target_live_type)
               end
               if arguments /= Void then
                  args := arguments.inline_dynamic_dispatch(code_accumulator, type)
               end
               if t = target and then fs = feature_stamp and then args = arguments then
                  code_accumulator.current_context.add_last(Current)
               else
                  function_call := Current.twin
                  function_call.set_target(t)
                  function_call.set_feature_stamp(fs)
                  function_call.set_arguments(args)
                  code_accumulator.current_context.add_last(function_call)
               end
            else
               -- We must add an extra local:
               create ddt1.make(t, target_type)
               non_void_check(code_accumulator, type, ddt1, target_type)
               type_id_check(code_accumulator, type, ddt1, target_live_type)
               function_call := Current.twin
               create ddt2.make(ddt1, target_live_type)
               function_call.set_target(ddt2)
               function_call.set_feature_stamp(fs)
               if arguments /= Void then
                  args := arguments.inline_dynamic_dispatch(code_accumulator, type)
                  function_call.set_arguments(args)
               end
               code_accumulator.current_context.add_last(function_call)
            end
         elseif void_call_flag then
            smart_eiffel.void_target_function_call_count_increment
            code_accumulator.current_context.add_last(
               create {VOID_CALL}.make(feature_name.start_position, feature_stamp, target_type))
         else
            check
               not monomorphic_flag
               not void_call_flag
            end
            -- The general polymorphic case with an `inspect' INSTRUCTION:
            create ddt1.make(t, target_type)
            non_void_check(code_accumulator, type, ddt1, target_type)
            create ddt1_id.make(ddt1)
            create inspect_statement.make(feature_name.start_position, ddt1_id)
            inspect_statement.set_dynamic_dispatch_flag(ddt1)
            code_accumulator.current_context.add_last(inspect_statement)
            from
               i := 1
               smart_eiffel.polymorphic_function_call_count_increment(i)
               create internal_local2.make(feature_name.start_position, Current, feature_name.to_string, False)
            until
               i > run_time_set.count
            loop
               live_type := run_time_set.item(i)
               if live_type.at_run_time then
                  code_accumulator.open_new_context
                  create when_clause.make_dynamic_dispatch(inspect_statement, feature_name.start_position, live_type)
                  tt := live_type.type
                  fs := feature_stamp.resolve_static_binding_for(target_type, tt)
                  af := fs.anonymous_feature(tt)
                  if af.empty_body_side_effect_free_effective_routine(tt) then
                     if not t.side_effect_free(type) then
                        code_accumulator.current_context.add_last(create {UNUSED_EXPRESSION}.make(t))
                     end
                     if arguments /= Void then
                        args := arguments.inline_dynamic_dispatch(code_accumulator, type)
                        args.unused_expression_inline(code_accumulator, type)
                     end
                     default_expression := af.result_type.to_static(tt, False).default_expression(start_position)
                     code_accumulator.current_context.add_last(create {ASSIGNMENT}.inline_make(internal_local2, default_expression))
                  else
                     function_call := Current.twin
                     create ddt2.make(ddt1, live_type)
                     function_call.set_target(ddt2)
                     function_call.set_feature_stamp(fs)
                     if arguments /= Void then
                        args := arguments.inline_dynamic_dispatch(code_accumulator, type)
                        function_call.set_arguments(args)
                     end
                     code_accumulator.current_context.add_last(create {ASSIGNMENT}.inline_make(internal_local2, function_call))
                  end
                  when_clause.set_compound(code_accumulator.current_context_to_instruction)
                  code_accumulator.close_current_context
               end
               i := i + 1
            end
            if not ace.boost then
               create run_time_error_instruction.make(feature_name.start_position,
                      once "Invalid type for the target of this function call.",
                      exceptions.System_level_type_error)
               inspect_statement.set_else_compound(feature_name.start_position, run_time_error_instruction)
            end
            code_accumulator.current_context.add_last(internal_local2)
         end
      end

feature {EIFFEL_PARSER}
   is_assigned_to: BOOLEAN

   set_assigned_to
      do
         is_assigned_to := True
      ensure
         is_assigned_to
      end

feature {}
   written_declaration_type_mark_memory: TYPE_MARK

   frozen function_check (type: TYPE; af: ANONYMOUS_FEATURE): BOOLEAN
         -- Check that the feature found is really a function.
         -- Returns False if the function is in fact an agent creation.
      require
         af /= Void
      do
         if smart_eiffel.try_agent_creation_error_trap(Current) then
            -- Well, false alarm, its just an AGENT_CREATION which is actually a PROCEDURE_CALL.
            check not Result end
         elseif af.result_type /= Void then
            Result := True
         else
            error_handler.add_position(af.start_position)
            error_handler.add_position(feature_name.start_position)
            error_handler.append(once "Feature found is a procedure.")
            error_handler.print_as_error
            error_handler.add_position(feature_name.start_position)
            error_handler.append(once "This call has no result.")
            error_handler.print_as_fatal_error
         end
      end

   frozen true_or_false (boolean: BOOLEAN): EXPRESSION
         -- (Often used by simplify.)
      do
         if boolean then
            create {E_TRUE} Result.make(feature_name.start_position)
         else
            create {E_FALSE} Result.make(feature_name.start_position)
         end
      end

end -- class FUNCTION_CALL
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
