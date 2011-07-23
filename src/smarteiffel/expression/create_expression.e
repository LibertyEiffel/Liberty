-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CREATE_EXPRESSION
   --
   -- The new style create expression as in:    create {FOO}.make(bar)
   --

inherit
   EXPRESSION

insert
   CREATE_SUPPORT

creation {ANY}
   make

creation {TYPE_MARK}
   default_user_expanded

feature {ANY}
   is_current: BOOLEAN is False

   is_implicit_current: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   is_static: BOOLEAN is False

   extra_bracket_flag: BOOLEAN is True

   is_void: BOOLEAN is False

   is_result: BOOLEAN is False

   is_writable: BOOLEAN is False

   specialize_in (new_type: TYPE): like Current is
      local
         c: like call
      do
         explicit_type.specialize_in(new_type)
         Result := Current
         if call /= Void then
            c := call.specialize_in(new_type)
            if c /= call then
               Result := twin
               Result.set_call(c)
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         et: like explicit_type; c: like call
      do
         et := explicit_type.specialize_thru(parent_type, parent_edge, new_type)
         if call /= Void then
            c := call.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(et, c)
      end

   specialize_2 (type: TYPE): like Current is
      local
         created_type_memory: TYPE; c: like call; fake_target: FAKE_TARGET; fs: FEATURE_STAMP; name: FEATURE_NAME
         test_default: BOOLEAN
      do
         created_type_memory := created_type(type)
         if call = Void then
            -- Create the call to the default creation feature if it is implicit.
            default_create_call := True
            fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, created_type_memory)
            create name.ordinary_name(created_type_memory.get_feature_name(fs).name, start_position)
            create fake_target.make(start_position, created_type_memory.canonical_type_mark)
            create {PROCEDURE_CALL_0} c.make(fake_target, name)
         else
            c := call
            test_default := True
         end
         c.set_creation_type(created_type_memory.canonical_type_mark)
         --|*** 
         c ::= c.specialize_2(type)
         --|*** BEURK: drawback of the new signature of specialize_2.
         if test_default then
            fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, created_type_memory)
            default_create_call := c.feature_stamp = fs
         end
         Result := current_or_twin_init(explicit_type, c)
         Result.specialize_2_checks(type)
      ensure then
         Result.call /= Void
      end

   has_been_specialized: BOOLEAN is
      do
         Result := call /= Void implies call.has_been_specialized
      end

   collect (type: TYPE): TYPE is
      local
         lt: LIVE_TYPE
      do
         Result := created_type(type)
         if call /= Void then
            call.collect_create(type, Result, start_position)
         else
            lt := smart_eiffel.collect_one_type(Result, True)
         end
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := created_type(type)
      end

   adapt_for (type: TYPE): like Current is
      local
         created_type_memory: TYPE; c: like call
      do
         created_type_memory := created_type(type)
         if call /= Void then
            c := call.adapt_for(type)
            created_type_memory.live_type.create_function_register(c.feature_stamp)
         else
            created_type_memory.live_type.create_function_register(Void)
         end
         Result := current_or_twin_init(explicit_type.to_static(type), c)
      end

   declaration_type: TYPE is
      do
         Result := explicit_type.declaration_type.type
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): EXPRESSION is
      local
         c: like call; creation_proc: E_ROUTINE; args: EFFECTIVE_ARG_LIST
      do
         if call /= Void then
            c := call.simplify_arguments(type)
            creation_proc ::= c.feature_stamp.anonymous_feature(created_type(type))
            if creation_proc.routine_body = Void then
               args := c.arguments
               if args = Void or else args.side_effect_free(type) then
                  c := Void
                  smart_eiffel.magic_count_increment
               end
            end
         end
         Result := current_or_twin_init(explicit_type, c)
      end

   mapping_c_target (type, target_formal_type: TYPE) is
      local
         created_type_memory: TYPE; internal_c_local: INTERNAL_C_LOCAL
      do
         created_type_memory := created_type(type)
         check
            -- This is actually a direct call:
            target_formal_type = created_type_memory
         end
         if created_type_memory.is_reference then
            compile_to_c_support(type, created_type_memory)
         elseif extra_local_expanded(type) /= Void then
            check
               extra_local_expanded(type) = created_type_memory
            end
            cpp.pending_c_function_body.extend('(')
            internal_c_local := cpp.pending_c_function_lock_local(created_type_memory, once "new")
            internal_c_local.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.extend('=')
            compile_to_c_support(type, created_type_memory)            
            cpp.pending_c_function_body.append(once ",&")
            internal_c_local.append_in(cpp.pending_c_function_body)
            internal_c_local.unlock
            cpp.pending_c_function_body.extend(')')
         else
            compile_to_c_support(type, created_type_memory)            
         end
      end

   mapping_c_arg (type: TYPE) is
      do
         compile_to_c(type)
      end

   result_type: TYPE_MARK is
      do
         Result := explicit_type
      end

   use_current (type: TYPE): BOOLEAN is
      local
         args: like arguments
      do
         if call /= Void then
            args := call.arguments
            if args /= Void then
               Result := args.use_current(type)
            end
         end
      end

   accept (visitor: CREATE_EXPRESSION_VISITOR) is
      do
         visitor.visit_create_expression(Current)
      end

   compile_to_c (type: TYPE) is
      local
         created_type_memory: TYPE
      do
         created_type_memory := created_type(type)
         if created_type_memory.is_reference then
            cpp.pending_c_function_body.append(once "((T0*)")
         end
         compile_to_c_support(type, created_type_memory)
         if created_type_memory.is_reference then
            cpp.pending_c_function_body.extend(')')
         end
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
      local
         rf: RUN_FEATURE
      do
         compile_to_jvm0(explicit_type)
         if call /= Void then
            rf := call.run_feature_for(type)
         elseif explicit_type.is_user_expanded then
            rf := explicit_type.type.live_type.default_create_run_feature
         end
         if rf /= Void then
            jvm.inside_create_instruction(type, rf, call)
         end
         explicit_type.jvm_check_class_invariant
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   jvm_branch_if_false, jvm_branch_if_true (type: TYPE): INTEGER is
      do
         check
            False
         end
      end

   bracketed_pretty, pretty (indent_level: INTEGER) is
      do
         pretty_printer.keyword(once "create")
         pretty_printer.put_character('{')
         pretty_printer.put_type_mark(explicit_type)
         pretty_printer.put_character('}')
         if call /= Void then
            pretty_printer.put_character('.')
            pretty_printer.put_string(call.feature_name.to_string)
            if call.arguments /= Void then
               call.arguments.pretty(indent_level)
            end
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   short (type: TYPE) is
      do
         short_printer.hook_or(once "create_open", once "create {")
         explicit_type.short(type)
         short_printer.hook_or(once "create_close", once "}")
         if call /= Void then
            --|*** PH: why short on create_expression? If specialize_2
            --|has been called, then use 'default_create_call' instead.
            --|*** 
            --| I do not understand your question Philippe ?
            --| a CREATE_EXPRESSION can be used in a require assertion.
            --| So I think there is no problem here.
            --| Dom. jan 25 th 2004
            --|*** 
            call.short(type)
         end
      end

   short_target (type: TYPE) is
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   created_type (type: TYPE): TYPE is
      do
         Result := explicit_type.resolve_in(type)
      end
   
feature {CREATE_EXPRESSION}
   init (et: like explicit_type; c: like call) is
      do
         explicit_type := et
         call := c
      ensure
         explicit_type = et
         call = c
      end

feature {FEATURE_CALL}
   extra_local_expanded (type: TYPE): TYPE is
         -- Assuming that `Current' is used as some target, if some extra local variable is required, the
         -- corresponding user's expanded type is returned.
      require
         smart_eiffel.status.collecting_done
         type /= Void
      local
         created_type_memory: TYPE
      do
         created_type_memory := created_type(type)
         if created_type_memory.is_user_expanded and then not created_type_memory.is_empty_expanded then
            Result := created_type_memory
         end
      ensure
         Result /= Void implies Result.is_user_expanded
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         create_expression: like Current; args: EFFECTIVE_ARG_LIST; c: like call
      do
         if call = Void then
            code_accumulator.current_context.add_last(Current)
         elseif call.arguments = Void then
            code_accumulator.current_context.add_last(Current)
         else
            args := call.arguments.inline_dynamic_dispatch(code_accumulator, type)
            if args = call.arguments then
               code_accumulator.current_context.add_last(Current)
            else
               c := call.twin
               c.set_arguments(args)
               create_expression := twin
               create_expression.set_call(c)
               code_accumulator.current_context.add_last(create_expression)
            end
         end
      end
   
feature {}
   compile_to_c_support (type, created_type_memory: TYPE) is
      require
         created_type_memory = created_type(type)
      local
         boost: BOOLEAN; rf: RUN_FEATURE; args: like arguments; id: INTEGER
      do
         id := created_type_memory.live_type.id
         boost := ace.boost
         cpp.pending_c_function_body.append(once "create")
         id.append_in(cpp.pending_c_function_body)
         if call /= Void then
            args := call.arguments
            rf := call.run_feature_for(type)
            cpp.pending_c_function_body.append(rf.name.to_string)
         end
         cpp.pending_c_function_body.extend('(')
         if ace.profile then
            cpp.pending_c_function_body.append(once "&local_profile")
         end
         if not boost then
            if ace.profile then
               cpp.pending_c_function_body.extend(',')
            end
            cpp.pending_c_function_body.append(once "&ds")
         end
         if args /= Void then
            if not boost or else ace.profile then
               cpp.pending_c_function_body.extend(',')
            end
            args.compile_to_c(type, rf.arguments)
         end
         cpp.pending_c_function_body.extend(')')
      end

   current_or_twin_init (et: like explicit_type; c: like call): like Current is
      require
         et /= Void
      do
         if et = explicit_type and then c = call then
            Result := Current
         else
            Result := twin
            Result.init(et, c)
         end
      ensure
         Result.explicit_type = et
         Result.call = c
      end

   se_tmp_buffer: STRING is
      once
         create Result.make(64)
      end

   make (sp: like start_position; et: like explicit_type; c: like call) is
      require
         not sp.is_unknown
         et /= Void
      do
         start_position := sp
         explicit_type := et
         call := c
      ensure
         start_position = sp
         explicit_type = et
         call = c
      end

   default_user_expanded (sp: like start_position; et: like explicit_type) is
         -- (To create the corresponding default expression.)
      require
         not sp.is_unknown
         et.is_static
         et.is_user_expanded
      local
         creation_type: TYPE; fs: FEATURE_STAMP; name: FEATURE_NAME; fake_target: FAKE_TARGET
      do
         start_position := sp
         explicit_type := et
         creation_type := et.type
         default_create_call := True
         fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, creation_type)
         create name.ordinary_name(creation_type.get_feature_name(fs).name, start_position)
         create fake_target.make(start_position, explicit_type)
         create {PROCEDURE_CALL_0} call.make(fake_target, name)
         call.set_feature_stamp(fs)
      ensure
         start_position = sp
         explicit_type = et
         call /= Void
      end

invariant
   explicit_type /= Void

   writable = Void

end -- class CREATE_EXPRESSION
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
