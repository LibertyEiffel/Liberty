-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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

create {ANY}
   make

create {TYPE_MARK}
   default_user_expanded

feature {ANY}
   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_manifest_string: BOOLEAN False

   is_static: BOOLEAN False

   extra_bracket_flag: BOOLEAN True

   is_void: BOOLEAN False

   is_result: BOOLEAN False

   is_writable: BOOLEAN False

   specialize_in (new_type: TYPE): like Current
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

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         et: like explicit_type; c: like call
      do
         et := explicit_type.specialize_thru(parent_type, parent_edge, new_type)
         if call /= Void then
            c := call.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(et, c)
      end

   specialize_and_check (type: TYPE): like Current
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
         c ::= c.specialize_and_check(type)
         --|*** BEURK: drawback of the new signature of specialize_and_check.
         if test_default then
            fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, created_type_memory)
            default_create_call := c.feature_stamp = fs
         end
         Result := current_or_twin_init(explicit_type, c)
         Result.specialize_checks(type)
      ensure then
         Result.call /= Void
      end

   has_been_specialized: BOOLEAN
      do
         Result := call /= Void implies call.has_been_specialized
      end

   collect (type: TYPE): TYPE
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

   resolve_in (type: TYPE): TYPE
      do
         Result := created_type(type)
      end

   adapt_for (type: TYPE): like Current
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
         Result := current_or_twin_init(explicit_type.to_static(type, False), c)
      end

   declaration_type: TYPE
      do
         Result := explicit_type.declaration_type.type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := explicit_type.declaration_type
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): EXPRESSION
      local
         c: like call; creation_proc: E_ROUTINE; args: EFFECTIVE_ARG_LIST
      do
         if call /= Void then
            c := call.simplify_arguments(type)
            creation_proc ::= c.feature_stamp.anonymous_feature(created_type(type))
            check
               creation_proc.result_type = Void -- obviously, because it is a procedure
               creation_proc.routine_then = Void -- ditto
            end
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

   result_type: TYPE_MARK
      do
         Result := explicit_type
      end

   use_current (type: TYPE): BOOLEAN
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

   accept (visitor: CREATE_EXPRESSION_VISITOR)
      do
         visitor.visit_create_expression(Current)
      end

   bracketed_pretty, pretty (indent_level: INTEGER)
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

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

   short (type: TYPE)
      do
         short_printer.hook_or(once "create_open", once "create {")
         explicit_type.short(type)
         short_printer.hook_or(once "create_close", once "}")
         if call /= Void then
            --|*** PH: why short on create_expression? If specialize_and_check
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

   short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   created_type (type: TYPE): TYPE
      do
         Result := explicit_type.resolve_in(type)
      end

feature {CREATE_EXPRESSION}
   init (et: like explicit_type; c: like call)
      do
         explicit_type := et
         call := c
      ensure
         explicit_type = et
         call = c
      end

feature {FEATURE_CALL, C_TARGET_MAPPER}
   extra_local_expanded (type: TYPE): TYPE
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
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
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
   current_or_twin_init (et: like explicit_type; c: like call): like Current
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

   se_tmp_buffer: STRING
      once
         create Result.make(64)
      end

   make (sp: like start_position; et: like explicit_type; c: like call)
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

   default_user_expanded (sp: like start_position; et: like explicit_type)
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
