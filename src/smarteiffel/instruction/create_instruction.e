-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CREATE_INSTRUCTION
   --
   -- The new style create instruction.
   --

inherit
   INSTRUCTION
      redefine
         specialize_without_checks
      end

insert
   CREATE_SUPPORT

create {EIFFEL_PARSER, INTROSPECTION_HANDLER}
   make

create {INTROSPECTION_HANDLER}
   make_specialized, typed_internals

feature {ANY}
   specialize_in (new_type: TYPE): like Current
      local
         w: like writable; c: like call
      do
         if explicit_type /= Void then
            explicit_type.specialize_in(new_type)
         end
         w := writable.specialize_in(new_type)
         if call /= Void then
            c := call.specialize_in(new_type)
         end
         Result := current_or_twin_init(explicit_type, w, c)
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         et: like explicit_type; w: like writable; c: like call
      do
         if explicit_type /= Void then
            et := explicit_type.specialize_thru(parent_type, parent_edge, new_type)
         end
         w := writable.specialize_thru(parent_type, parent_edge, new_type)
         if call /= Void then
            c := call.specialize_thru(parent_type, parent_edge, new_type)
         end
         Result := current_or_twin_init(et, w, c)
      end

   specialize_and_check (type: TYPE): like Current
      do
         Result := specialize_without_checks(type)
         Result.specialize_checks(type)
      end

   has_been_specialized: BOOLEAN
      do
         Result := writable.has_been_specialized and then (call /= Void implies call.has_been_specialized)
      end

   collect (type: TYPE): TYPE
      local
         writable_type: TYPE; lt: LIVE_TYPE; type_to_create: TYPE
      do
         writable_type := writable.collect(type)
         if call /= Void then
            call.collect_create(type, writable_type, writable.start_position)
         else
            if explicit_type = Void then
               type_to_create := writable_type
            else
               type_to_create := explicit_type.resolve_in(type)
            end
            lt := smart_eiffel.collect_one_type(type_to_create, True)
         end
      end

   adapt_for (type: TYPE): like Current
      local
         w: like writable; c: like call; et: like explicit_type
      do
         w := writable.adapt_for(type)
         if call /= Void then
            c := call.adapt_for(type)
         end
         if explicit_type /= Void then
            et := explicit_type.to_static(type, False)
         end
         Result := current_or_twin_init(et, w, c)
      end

   frozen use_current (type: TYPE): BOOLEAN
      local
         args: like arguments
      do
         if writable.use_current(type) then
            Result := True
         elseif call /= Void then
            args := call.arguments
            if args /= Void then
               Result := args.use_current(type)
            end
         end
      end

   simplify (type: TYPE): INSTRUCTION
      local
         c: like call; creation_proc: E_ROUTINE; args: EFFECTIVE_ARG_LIST; type_to_create: TYPE
      do
         if call /= Void then
            c := call.simplify_arguments(type)
            if explicit_type = Void then
               -- TODO: check why it is sufficient to do this
               -- "type_to_create"-stuff only if call /= Void
               type_to_create := writable.resolve_in(type)
            else
               type_to_create := explicit_type.resolve_in(type)
            end
            creation_proc ::= c.feature_stamp.anonymous_feature(type_to_create)
            if creation_proc.routine_body = Void and not creation_proc.is_external then
               args := c.arguments
               if args = Void or else args.side_effect_free(type) then
                  c := Void
                  smart_eiffel.magic_count_increment
               end
            end
         end
         Result := current_or_twin_init(explicit_type, writable, c)
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "create")
         if explicit_type /= Void then
            pretty_printer.put_character('{')
            pretty_printer.put_type_mark(explicit_type)
            pretty_printer.put_character('}')
            pretty_printer.put_character(' ')
         end
         writable.pretty(indent_level)
         if call /= Void then
            pretty_printer.put_character('.')
            pretty_printer.put_string(call.feature_name.to_string)
            if call.arguments /= Void then
               call.arguments.pretty(indent_level)
            end
         end
         if pretty_printer.semi_colon_flag then
            pretty_printer.put_character(';')
         end
         pretty_printer.set_indent_level(0)
      end

   end_mark_comment: BOOLEAN False

   accept (visitor: CREATE_INSTRUCTION_VISITOR)
      do
         visitor.visit_create_instruction(Current)
      end

   created_type (type: TYPE): TYPE
      do
         if explicit_type /= Void then
            Result := explicit_type.resolve_in(type)
         else
            Result := writable.resolve_in(type)
         end
      end

   specialize_without_checks (type: TYPE): like Current
      local
         w: like writable; c: like call; creation_type: TYPE; fs: FEATURE_STAMP
         name: FEATURE_NAME; test_default: BOOLEAN
      do
         w := writable.specialize_and_check(type)
         if explicit_type /= Void then
            creation_type := explicit_type.resolve_in(type)
         else
            creation_type := w.resolve_in(type)
         end
         if call = Void then
            -- Create the call to the default creation feature if it is implicit.
            default_create_call := True
            fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, creation_type)
            create name.ordinary_name(creation_type.get_feature_name(fs).name, w.start_position)
            create {PROCEDURE_CALL_0} c.make(w, name)
            if explicit_type /= Void then
               c.set_target(w) --| **** TODO: what for??? the `make' above assigns the target too!
            end
         else
            c := call
            test_default := True
         end
         c.set_creation_type(creation_type.canonical_type_mark)
         c ::= c.specialize_and_check(type)
         check
            c /= Void
         end
         if test_default then
            fs := any_default_create_fs.resolve_static_binding_for(smart_eiffel.type_any, creation_type)
            default_create_call := c.feature_stamp = fs
         end
         Result := current_or_twin_init(explicit_type, w, c)
      ensure then
         Result.call /= Void
      end

feature {CREATE_INSTRUCTION, EXTERNAL_ROUTINE}
   init (et: like explicit_type; w: like writable; c: like call)
      require
         w /= Void
      do
         explicit_type := et
         writable := w
         call := c
      ensure
         explicit_type = et
         writable = w
         call = c
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         create_instruction: like Current; args: EFFECTIVE_ARG_LIST; c: like call
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
               create_instruction := twin
               create_instruction.set_call(c)
               code_accumulator.current_context.add_last(create_instruction)
            end
         end
      end

feature {}
   make (sp: like start_position; et: like explicit_type; w: like writable; c: like call)
      require
         not sp.is_unknown
         w /= Void
         c /= Void implies c.target = w
      do
         start_position := sp
         call := c
         if et = Void then
            writable := w
         else
            create {CREATE_WRITABLE} writable.make(et, w)
            explicit_type := et
            if call /= Void then
               call.set_target(writable)
            end
         end
      ensure
         start_position = sp
         explicit_type = et
         writable /= Void
         call = c
      end

   make_specialized (sp: like start_position; et: like explicit_type; w: like writable; c: like call)
      require
         not sp.is_unknown
         et.is_static
         w /= Void
         c /= Void implies c.target = w
      do
         start_position := sp
         call := c
         create {CREATE_WRITABLE} writable.make_specialized(et, w)
         explicit_type := et
         if call /= Void then
            call.set_target(writable)
         end
      ensure
         start_position = sp
         explicit_type = et
         writable /= Void
         call = c
      end

   typed_internals (sp: like start_position; type: TYPE)
      require
         not sp.is_unknown
         type /= Void
      local
         hs: HASHED_STRING; cn: CLASS_NAME; gl: ARRAY[TYPE_MARK]; ugtm: USER_GENERIC_TYPE_MARK
         fn: FEATURE_NAME; eal: EFFECTIVE_ARG_LIST_N; er: RESULT; target: IMPLICIT_CURRENT
      do
         start_position := sp
         hs := string_aliaser.hashed_string(as_typed_internals)
         create cn.make(hs, sp, False)
         gl := {ARRAY[TYPE_MARK] 1, <<create {LIKE_CURRENT_TYPE_MARK}.make(sp)>>}
         create ugtm.make(cn, gl)
         explicit_type := ugtm
         create er.make(sp)
         create {CREATE_WRITABLE} writable.make(explicit_type, er)
         create fn.simple_feature_name(as_for_object, sp)
         create target.make(sp)
         create eal.make_1(start_position, target)
         create {PROCEDURE_CALL_1} call.make(writable, fn, eal)
      end

   current_or_twin_init (et: like explicit_type; w: like writable; c: like call): like Current
      require
         w /= Void
      do
         if et = explicit_type and then w = writable and then c = call then
            Result := Current
         else
            Result := twin
            Result.init(et, w, c)
         end
      ensure
         Result.explicit_type = et
         Result.writable = w
         Result.call = c
      end

invariant
   not start_position.is_unknown

   writable.is_writable

end -- class CREATE_INSTRUCTION
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
