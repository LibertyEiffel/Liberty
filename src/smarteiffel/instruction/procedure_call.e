-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class PROCEDURE_CALL
   --
   -- For all kinds of FEATURE_CALL with no result (see also FUNCTION_CALL).
   --
   -- Classification: E_PROC_0 when 0 argument, PROCEDURE_CALL_1 when
   -- 1 argument and PROCEDURE_CALL_N when N arguments.
   --

inherit
   INSTRUCTION
   FEATURE_CALL

feature {ANY}
   frozen pretty (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         target.pretty_target(indent_level)
         pretty_printer.put_string(feature_name.to_string)
         if arguments /= Void then
            arguments.pretty(indent_level)
         end
         if pretty_printer.semi_colon_flag then
            pretty_printer.put_character(';')
         end
         pretty_printer.set_indent_level(0)
      end

feature {ANY}
   frozen has_been_specialized: BOOLEAN
      do
         Result := target.has_been_specialized
         if Result and then arguments /= Void then
            Result := arguments.has_been_specialized
         end
         if target.is_current then
            Result := Result and then feature_stamp /= Void
         end
      end

   end_mark_comment: BOOLEAN False

feature {FEATURE_CALL, CREATE_SUPPORT}
   creation_type: TYPE_MARK
         -- Used when the PROCEDURE_CALL is actually used in a creation instruction, the `creation_type' is then the
         -- type to be created.
         --|*** Is it a good idea to have this information here (i.e. for all PROCEDURE_CALL ?)
         --|    Should it be inside create instruction ?
         --|*** Dom: jan 9th 2004 ***

feature {CREATE_SUPPORT}
   set_creation_type (ct: like creation_type)
      require
         ct.is_static
      do
         creation_type := ct
      ensure
         creation_type = ct
      end

   frozen collect_create (t: TYPE; target_type: TYPE; target_pos: POSITION)
         -- also given is the type of the *target* (that's the difference with collect)
         -- Used by CREATE_SUPPORT
         --|*** That's almost copy-pasted from FEATURE_CALL.collect_exp :-(
         --|*** a voir pour supprimer cela et utiliser "writable"
      local
         proc_type: TYPE; fs: FEATURE_STAMP
      do
         check
            -- Already checked during `specialize_and_check':
            target_type.valid_feature_name(feature_name)
         end
         fs := target_type.lookup(feature_name)
         proc_type := smart_eiffel.collect(target_type, fs, True)
         check
            is_procedure: proc_type = Void
         end
         -- now the arguments
         if arguments /= Void then
            arguments.collect(t, fs, target_type)
         end
         check
            set_collected_for(t)
         end
      end

feature {CREATE_SUPPORT}
   simplify_arguments (type: TYPE): PROCEDURE_CALL
      local
         args: like arguments
      do
         if arguments /= Void then
            args := arguments.simplify(type)
            if args /= arguments then
               Result := twin
               Result.set_arguments(args)
            else
               Result := Current
            end
         else
            Result := Current
         end
      ensure
         Result /= Void
      end

feature {CREATE_EXPRESSION}
   frozen short (type: TYPE)
      require
         type /= Void
      local
         target_type: TYPE; fs: FEATURE_STAMP
      do
         -- Note: PROC_CALLs are instruction which are part of CREATE_EXPRESSION, hence this definition.
         target.short_target(type)
         target_type := target.resolve_in(type)
         fs := feature_stamp.resolve_static_binding_for(target.declaration_type, target_type)
         target_type.get_feature_name(fs).short(type)
         if arguments /= Void then
            arguments.short(type)
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   frozen inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         t: like target; inspect_statement: OTHER_INSPECT_STATEMENT; fs: FEATURE_STAMP
         target_type, non_void_no_dispatch, tt: TYPE; target_live_type, live_type: LIVE_TYPE
         run_time_set: RUN_TIME_SET; when_clause: WHEN_CLAUSE
         procedure_call: like Current; i: INTEGER
         ddt1: DYNAMIC_DISPATCH_TEMPORARY1; ddt2: DYNAMIC_DISPATCH_TEMPORARY2
         run_time_error_instruction: RUN_TIME_ERROR_INSTRUCTION
         args: like arguments; ddt1_id: DYNAMIC_DISPATCH_TEMPORARY1_ID
         monomorphic_flag, void_call_flag, no_dispatch_flag: BOOLEAN; code_accumulator_index: INTEGER
         af: ANONYMOUS_FEATURE
      do
         code_accumulator_index := code_accumulator.current_context.upper
         code_accumulator.add_sedb(feature_name.start_position, 'N')
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
               procedure_call := twin
               procedure_call.set_target(t)
               procedure_call.set_feature_stamp(fs)
               procedure_call.set_arguments(args)
               code_accumulator.current_context.add_last(procedure_call)
            end
            smart_eiffel.monomorphic_procedure_call_count_increment
            smart_eiffel.expanded_target_procedure_call_count_increment
         elseif monomorphic_flag then
            smart_eiffel.monomorphic_procedure_call_count_increment
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
                  procedure_call := twin
                  procedure_call.set_target(t)
                  procedure_call.set_feature_stamp(fs)
                  procedure_call.set_arguments(args)
                  code_accumulator.current_context.add_last(procedure_call)
               end
            else
               create ddt1.make(t, target_type)
               non_void_check(code_accumulator, type, ddt1, target_type)
               type_id_check(code_accumulator, type, ddt1, target_live_type)
               procedure_call := twin
               create ddt2.make(ddt1, target_live_type)
               procedure_call.set_target(ddt2)
               procedure_call.set_feature_stamp(fs)
               if arguments /= Void then
                  args := arguments.inline_dynamic_dispatch(code_accumulator, type)
                  procedure_call.set_arguments(args)
               end
               code_accumulator.current_context.add_last(procedure_call)
            end
         elseif void_call_flag then
            smart_eiffel.void_target_procedure_call_count_increment
            code_accumulator.current_context.add_last(
               create {VOID_PROC_CALL}.make(feature_name.start_position, feature_stamp, target_type))
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
               run_time_set := target_live_type.run_time_set
               i := 1
               smart_eiffel.polymorphic_procedure_call_count_increment(i)
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
                  else
                     procedure_call := twin
                     create ddt2.make(ddt1, live_type)
                     procedure_call.set_target(ddt2)
                     procedure_call.set_feature_stamp(fs)
                     if arguments /= Void then
                        args := arguments.inline_dynamic_dispatch(code_accumulator, type)
                        procedure_call.set_arguments(args)
                     end
                     code_accumulator.current_context.add_last(procedure_call)
                  end
                  when_clause.set_compound(code_accumulator.current_context_to_instruction)
                  code_accumulator.close_current_context
               end
               i := i + 1
            end
            if not ace.boost then
               create run_time_error_instruction.make(feature_name.start_position,
                      once "Invalid type for the target of this procedure call.",
                      exceptions.System_level_type_error)
               inspect_statement.set_else_compound(feature_name.start_position, run_time_error_instruction)
            end
      end
         from
            code_accumulator_index := code_accumulator_index + 1
         until
            code_accumulator_index > code_accumulator.current_context.upper
         loop
            code_accumulator.current_context.item(code_accumulator_index).to_instruction.set_eiffel_parser_stamp(eiffel_parser_stamp)
            code_accumulator_index := code_accumulator_index + 1
         end
      end

feature {}
   frozen afd_check_hook
      do
      end

   frozen procedure_check (type: TYPE; af: ANONYMOUS_FEATURE)
         -- Check that the feature found is really a procedure.
      require
         af /= Void
      do
         if af.result_type /= Void then
            error_handler.add_position(af.start_position)
            error_handler.add_position(feature_name.start_position)
            error_handler.append(once "Feature found is not a procedure.")
            error_handler.print_as_error
            error_handler.add_position(feature_name.start_position)
            error_handler.append(once "This call has a result value (and you must use it).")
            error_handler.print_as_fatal_error
         end
      end

end -- class PROCEDURE_CALL
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
