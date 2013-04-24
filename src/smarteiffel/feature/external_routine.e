-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class EXTERNAL_ROUTINE
   --
   -- For routines implemented with a call to a foreign language.
   -- Root of EXTERNAL_PROCEDURE and EXTERNAL_FUNCTION.
   --

inherit
   E_ROUTINE

feature {ANY}
   native: NATIVE

   alias_string: MANIFEST_STRING

   is_deferred: BOOLEAN is False

   frozen rescue_compound: INSTRUCTION is
      do
      end

   frozen set_rescue_compound (rc: like rescue_compound) is
      do
         if rc /= Void then
            error_handler.add_position(rc.start_position)
         else
            error_handler.add_position(start_position)
         end
         error_handler.append(once "External feature must not have rescue compound.")
         error_handler.print_as_fatal_error
      end

   frozen use_current (type: TYPE): BOOLEAN is
      do
         Result := native.use_current(Current)
         if not Result and then not ace.boost then
            if require_assertion /= Void then
               Result := require_assertion.use_current(type)
            end
            if not Result and then ensure_assertion /= Void then
               Result := ensure_assertion.use_current(type)
            end
         end
      end

   external_name: STRING is
      local
         tmp: STRING
      do
         if {NATIVE_C_PLUS_PLUS} ?:= native then
            -- For C++, there is always a wrapping function :
            tmp := first_name.to_string
            create Result.make(tmp.count + 8)
            Result.append(once "cpp")
            class_text.id.append_in(Result)
            Result.append(tmp)
         else
            Result := c_plus_plus_name
         end
      end

   specialize_body_in (new_type: TYPE; can_twin: BOOLEAN): like Current is
      local
         type_name: STRING
         lv: like local_vars; rb: like routine_body
      do
         type_name := new_type.class_text.name.to_string
         if type_name = as_typed_internals then
            Result ::= introspection_handler.specialize_body_for_typed_internals(Current, new_type, can_twin)
         elseif type_name = as_internals_handler then
            Result ::= introspection_handler.specialize_body_for_internals_handler(Current, new_type, can_twin)
         elseif type_name = as_native_array_internals then
            Result ::= introspection_handler.specialize_body_for_native_array_internals(Current, new_type, can_twin)
         elseif first_name.to_string = as_to_internals then
            Result ::= introspection_handler.specialize_body_for_any_to_internals(Current, new_type, can_twin)
         else
            if local_vars /= Void then
               lv := local_vars.specialize_in(new_type)
               check
                  smart_eiffel.specializing_feature_local_var_list = Void
               end
               smart_eiffel.set_specializing_feature_variables(lv)
            end
            if routine_body /= Void then
               rb := routine_body.specialize_in(new_type)
            end
            if lv /= Void then
               check
                  smart_eiffel.specializing_feature_local_var_list = lv
               end
               smart_eiffel.set_specializing_feature_variables(Void)
            end
            Result := current_or_twin_init(lv, rb, is_generated_eiffel, ensure_assertion, require_assertion, can_twin)
         end
      end

   specialize_body_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE; can_twin: BOOLEAN): like Current is
      local
         lv, lv_memory: like local_vars; rb: like routine_body
      do
         if local_vars /= Void then
            lv := local_vars.specialize_thru(parent_type, parent_edge, new_type)
            lv_memory := smart_eiffel.specializing_feature_local_var_list
            smart_eiffel.set_specializing_feature_variables(lv)
         end
         if routine_body /= Void and then new_type.class_text.name.to_string /= as_typed_internals then
            rb := routine_body.specialize_thru(parent_type, parent_edge, new_type)
            Result := current_or_twin_init(lv, rb, is_generated_eiffel, ensure_assertion, require_assertion, can_twin)
         else
            Result := current_or_twin_init_no_body(lv, is_generated_eiffel, ensure_assertion, require_assertion, can_twin)
         end
         if lv /= Void then
            check
               smart_eiffel.specializing_feature_local_var_list = lv
            end
            smart_eiffel.set_specializing_feature_variables(lv_memory)
         end
      end

   specialize_and_check (type: TYPE): E_ROUTINE is
      local
         ra: like require_assertion; ea: like ensure_assertion; rb: like routine_body
      do
         if routine_body /= Void then
            if class_text_name.to_string = as_internals_handler then
               -- specialize_and_check is deferred until the adapt phase
               check
                  first_name.to_string = as_internals_from_generating_type
                     or first_name.to_string = as_valid_generating_type_for_internals
                     or first_name.to_string = as_native_array_internals_from_generating_type
                     or first_name.to_string = as_valid_generating_type_for_native_array_internals
               end
               rb := routine_body
            elseif not type.is_deferred then
               rb := routine_body.specialize_without_checks(type)
            else
               rb := routine_body
            end
         end
         if not ace.boost then
            if require_assertion /= Void then
               ra ::= require_assertion.specialize_and_check(type)
            end
            if ensure_assertion /= Void then
               ea := ensure_assertion.specialize_and_check(type)
            end
         end
         Result := current_or_twin_init(local_vars, rb, is_generated_eiffel, ea, ra, True)
      end

   has_been_specialized: BOOLEAN is
      do
         Result := (routine_body /= Void implies routine_body.has_been_specialized)
            and then (local_vars /= Void implies local_vars.has_been_specialized)
         if not ace.boost and then Result then
            if require_assertion /= Void then
               Result := require_assertion.has_been_specialized
            end
            if Result and then ensure_assertion /= Void then
               Result := ensure_assertion.has_been_specialized
            end
         end
      end

feature {FEATURE_STAMP, LIVE_TYPE, PRECURSOR_CALL}
   simplify (type: TYPE): like Current is
      local
         rb: like routine_body
      do
         if routine_body /= Void then
            rb := routine_body.simplify(type)
            if rb = Void and is_generated_eiffel then
               echo.w_put_string(once "Could not simplify generated code for ")
               echo.w_put_line(first_name.to_string)
               rb := routine_body
            end
         end
         Result := current_or_twin_init(local_vars, rb, is_generated_eiffel, ensure_assertion, require_assertion, True)
      end

feature {ANY}
   argument_rank_of (arg_name: STRING): INTEGER is
         -- Gives 0 or the index of `arg_name'.
      require
         string_aliaser.registered_one(arg_name)
      do
         if arguments /= Void then
            Result := arguments.fast_rank_of(arg_name)
         end
      ensure
         arguments /= Void implies Result.in_range(0, arguments.count)
         arguments = Void implies Result = 0
      end

feature {NATIVE_C_PLUS_PLUS}
   c_plus_plus_name: STRING is
         -- The name of the corresponding member in C++ is the
         -- `alias_string' if any or the `first_name' itself.
      do
         if alias_string = Void then
            Result := first_name.to_string
         else
            Result := alias_string.to_string
         end
      end

feature {}
   add_into_ (ft: like feature_text; fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]) is
      do
         add_into_shared(ft, fd)
      end

   pretty_print_routine_body (indent_level: INTEGER) is
      do
         pretty_printer.set_indent_level(indent_level)
         pretty_printer.keyword(once "external")
         native.pretty(1, False)
         if alias_string /= Void then
            pretty_printer.set_indent_level(indent_level)
            pretty_printer.keyword(once "alias")
            alias_string.pretty(indent_level+1)
         end
      end

   pretty_print_rescue (indent_level: INTEGER) is
      do
      end

   make_external_routine (n: like native; description: like alias_string) is
      require
         n /= Void
      do
         native := n
         alias_string := description
      end

   current_or_twin_init_no_body (lv: like local_vars; is_generated: like is_generated_eiffel;
      ea: like ensure_assertion; ra: like require_assertion; can_twin: BOOLEAN): like Current is
      do
         if lv = local_vars and then Void = routine_body and then is_generated = is_generated_eiffel
            and then ea = ensure_assertion and then ra = require_assertion then
            Result := Current
         else
            if can_twin then
               Result := twin
            else
               Result := Current
            end
            Result.init(lv, Void, is_generated, ea, ra)
         end
      end

feature {RUN_FEATURE_7, RUN_FEATURE_8}
   adapt_routine_body_for (t: TYPE): like routine_body is
         -- Remove parts of the body that are not needed because they
         -- refer to dead features.
      local
         cn: STRING
      do
         if routine_body /= Void then
            cn := class_text.name.to_string
            if first_name.to_string = as_to_internals then
               Result := introspection_handler.finalized_body_for_to_internals(Current, t)
            elseif cn = as_typed_internals then
               Result := introspection_handler.finalized_body_for_typed_internals(Current, t)
            elseif cn = as_native_array_internals then
               Result := introspection_handler.finalized_body_for_native_array_internals(Current, t)
            else
               Result := routine_body
            end
            if Result /= Void then
               Result := Result.adapt_for(t)
            end
         end
      end

feature {ANY}
   is_generated_eiffel: BOOLEAN
         -- Must `routine_body' be used instead of `native' ?

feature {INTROSPECTION_HANDLER}
   set_routine_body (rb: like routine_body) is
      require
         is_generated_eiffel
         rb /= Void
      do
         routine_body := rb
      ensure
         routine_body = rb
      end

feature {EXTERNAL_ROUTINE}
   init (lv: like local_vars; rb: like routine_body; is_generated: like is_generated_eiffel;
         ea: like ensure_assertion; ra: like require_assertion) is
      do
         local_vars := lv
         routine_body := rb
         is_generated_eiffel := is_generated
         ensure_assertion := ea
         require_assertion := ra
      ensure
         local_vars = lv
         routine_body = rb
         is_generated_eiffel = is_generated
         ensure_assertion = ea
         require_assertion = ra
      end

feature {INTROSPECTION_HANDLER}
   current_or_twin_init (lv: like local_vars; rb: like routine_body; is_generated: like is_generated_eiffel;
      ea: like ensure_assertion; ra: like require_assertion; can_twin: BOOLEAN): like Current is
      require
         routine_body /= Void implies rb /= Void
      do
         if lv = local_vars and then rb = routine_body and then is_generated = is_generated_eiffel
            and then ea = ensure_assertion and then ra = require_assertion then
            Result := Current
         else
            if can_twin then
               Result := twin
            else
               Result := Current
            end
            Result.init(lv, rb, is_generated, ea, ra)
         end
      end

feature {}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         if routine_body /= Void then
            routine_body := routine_body.inline_dynamic_dispatch(code_accumulator, type)
         end
      end

end -- class EXTERNAL_ROUTINE
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
