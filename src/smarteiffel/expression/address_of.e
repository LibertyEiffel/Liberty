-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ADDRESS_OF
   --
   -- For the special address form notation : $name
   --

inherit
   EXPRESSION
   
creation {ANY}
   with_local, with_feature_name

feature {ANY}
   local_name: EXPRESSION
         -- Non Void when $name is the address of some local variable.

   feature_name: FEATURE_NAME
         -- Non Void when $name is the address of some feature.

   target_type: TYPE
         -- Used only when `feature_name' is not Void.
   
   feature_stamp: FEATURE_STAMP
         -- Used only when `feature_name' is not Void.

   calling_code: CODE
         -- Used only when `feature_name' is not Void.
   
   is_writable: BOOLEAN is False

   is_current: BOOLEAN is False

   is_implicit_current: BOOLEAN is False

   is_static: BOOLEAN is False

   is_result: BOOLEAN is False

   is_void: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   use_current (type: TYPE): BOOLEAN is
      do
         Result := (feature_name /= Void and then
                    feature_stamp.anonymous_feature(type).is_attribute)
      end

   extra_bracket_flag: BOOLEAN is False

   declaration_type: TYPE is
      once
         Result := smart_eiffel.type_pointer
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
         check
            Result.is_pointer
         end
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := True
      end

   adapt_for (type: TYPE): like Current is
      local
         ln: like local_name; cc: like calling_code
      do
         if local_name /= Void then
            ln := local_name.adapt_for(type)
            if ln /= local_name then
               Result := twin
               Result.set_local_name(ln)
            else
               Result := Current
            end
         else
            if calling_code /= Void then
               cc := calling_code.adapt_for(type)
            end
            if cc /= calling_code then
               Result := twin
               Result.set_calling_code(cc)
            else
               Result := Current
            end
            if not feature_stamp.anonymous_feature(type).is_attribute then
               Result.target_type.address_of_register(Result)
            end
         end
      end

   safety_check (type: TYPE) is
      do
         if calling_code /= Void then
            calling_code.safety_check(type)
         end
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
      do
         error_handler.add_position(start_position)
         error_handler.append(fz_jvm_error)
         error_handler.print_as_fatal_error
      end

   jvm_branch_if_false, jvm_branch_if_true (type: TYPE): INTEGER is
      do
         check
            False
         end
      end

   compile_to_c (type: TYPE) is
      do
         if local_name /= Void then
            cpp.pending_c_function_body.append(once "/*$*/(void*)&")
            local_name.compile_to_c(type)
         elseif feature_stamp.anonymous_feature(type).is_attribute then
            cpp.pending_c_function_body.append(once "/*$*/(void*)&")
            calling_code.compile_to_c(target_type)
         else
            cpp.pending_c_function_body.append(once "/*$*/((void*)W")
            target_type.id.append_in(cpp.pending_c_function_body)
            cpp.pending_c_function_body.append(feature_stamp.name.to_string)
            cpp.pending_c_function_body.extend(')')
         end
      end

   mapping_c_target (type, target_formal_type: TYPE) is
      do
         compile_to_c(type)
      end

   mapping_c_arg (type: TYPE) is
      do
         compile_to_c(type)
      end

   specialize_in (type: TYPE): like Current is
      local
         ln: like local_name; fs: like feature_stamp; cc: like calling_code
      do
         if local_name /= Void then
            ln := local_name.specialize_in(type)
            if ln /= local_name then
               Result := twin
               Result.set_local_name(ln)
            else
               Result := Current
            end
         else
            fs := type.search(feature_name)
            if fs = Void then
               error_handler.add_position(feature_name.start_position)
               error_handler.append(fz_vuar4)
               error_handler.append(" Feature `")
               error_handler.append(feature_name.to_string)
               error_handler.append("' not found.")
               error_handler.print_as_fatal_error
            end
            if calling_code /= Void then
               cc := calling_code.specialize_in(type)
            end
            if feature_stamp = Void then
               target_type := type
               feature_stamp := fs
               Result := Current
            elseif target_type = type and then feature_stamp = fs and then calling_code = cc then
               Result := Current
            else
               Result := twin
               Result.set_target_type(type)
               Result.set_feature_stamp(fs)
               Result.set_calling_code(cc)
            end
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         ln: like local_name; fs: like feature_stamp; target: IMPLICIT_CURRENT; cc: like calling_code
      do
         if local_name /= Void then
            ln := local_name.specialize_thru(parent_type, parent_edge, new_type)
            if ln /= local_name then
               Result := twin
               Result.set_local_name(ln)
            else
               Result := Current
            end
         else
            if calling_code = Void then
               create target.make(feature_name.start_position)
               calling_code := feature_stamp.fake_feature_call(start_position, target, parent_type)
               calling_code := calling_code.specialize_in(parent_type)
            end               
            fs := feature_stamp.specialize_thru(parent_type, parent_edge, new_type)
            cc := calling_code.specialize_thru(parent_type, parent_edge, new_type)
            check
               target_type /= new_type
            end
            Result := twin
            Result.set_target_type(new_type)
            Result.set_feature_stamp(fs)
            Result.set_calling_code(cc)
         end
      end

   specialize_2 (type: TYPE): like Current is
      local
         af: ANONYMOUS_FEATURE; cst: CST_ATT; target: IMPLICIT_CURRENT; cc: like calling_code
      do
         if local_name /= Void then
            Result := Current
         else
            af := feature_stamp.anonymous_feature(type)
            if cst ?:= af then
               error_handler.add_position(feature_name.start_position)
               error_handler.append(fz_vuar4)
               error_handler.print_as_fatal_error
            end
            if calling_code = Void then
               create target.make(feature_name.start_position)
               calling_code := feature_stamp.fake_feature_call(start_position, target, type)
               calling_code := calling_code.specialize_in(type).specialize_2(type)
               Result := Current
            else
               cc := calling_code.specialize_2(type)
               if cc = calling_code then
                  Result := Current
               else
                  Result := twin
                  Result.set_calling_code(cc)
               end
            end
         end
      end

   has_been_specialized: BOOLEAN is
      do
         if feature_name /= Void then
            Result := feature_stamp /= Void
         else
            Result := local_name.has_been_specialized
         end
         if calling_code /= Void then
            Result := Result and then calling_code.has_been_specialized
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
         check
            Result.is_pointer
         end
      end

   simplify (type: TYPE): like Current is
      local
         cc: like calling_code
      do
         if local_name /= Void then
            Result := Current
         else
            cc := calling_code.simplify(type)
            if calling_code = cc then
               Result := Current
            else
               Result := twin
               Result.set_calling_code(cc)
            end
         end
      end

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   start_position: POSITION is
      do
         if local_name /= Void then
            Result := local_name.start_position
         else
            Result := feature_name.start_position
         end
      end

   pretty (indent_level: INTEGER) is
      do
         pretty_printer.put_character('%D')
         if local_name /= Void then
            local_name.pretty(indent_level)
         else
            feature_name.pretty(indent_level)
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         check
            False
         end
      end

   bracketed_pretty (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   short (type: TYPE) is
      do
         short_printer.put_character('%D')
         if local_name /= Void then
            local_name.short(type)
         else
            feature_name.short(type)
         end
      end

   short_target (type: TYPE) is
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   collect (type: TYPE): TYPE is
      local
         dummy: TYPE
      do
         if feature_name /= Void then
            if calling_code /= Void then
               dummy := calling_code.collect(type)
            end
         else
            dummy := local_name.collect(type)
         end
         Result := declaration_type
         check
            Result.is_pointer
         end
         smart_eiffel.collect_create(Result)
      end

   accept (visitor: ADDRESS_OF_VISITOR) is
      do
         visitor.visit_address_of(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         cc: like calling_code; new_one: like Current
      do
         if local_name /= Void then
            code_accumulator.current_context.add_last(Current)
         elseif calling_code /= Void then
            code_accumulator.current_context.add_last(Current)
         else
            code_accumulator.open_new_context
            calling_code.inline_dynamic_dispatch_(code_accumulator, type)
            cc := code_accumulator.current_context_to_code
            code_accumulator.close_current_context
            if calling_code = cc then
               code_accumulator.current_context.add_last(Current)
            else
               new_one := twin
               new_one.set_calling_code(cc)
               code_accumulator.current_context.add_last(new_one)
            end
         end
      end
   
feature {ADDRESS_OF}
   set_local_name (ln: like local_name) is
      require
         ln /= Void
      do
         local_name := ln
      ensure
         local_name = ln
      end

   set_target_type (tt: like target_type) is
      require
         tt /= Void
      do
         target_type := tt
      ensure
         target_type = tt
      end

   set_feature_stamp (fs: like feature_stamp) is
      require
         fs /= Void
      do
         feature_stamp := fs
      ensure
         feature_stamp = fs
      end

   set_calling_code (cc: like calling_code) is
      do
         calling_code := cc
      ensure
         calling_code = cc
      end

feature {TYPE}
   c_define (wrapper_id: INTEGER) is
      local
         result_type: TYPE_MARK; af: ANONYMOUS_FEATURE; compound_expression: COMPOUND_EXPRESSION
         expression: EXPRESSION
      do
         af := feature_stamp.anonymous_feature(target_type)
         cpp.prepare_c_function
         result_type := af.result_type
         if result_type = Void then
            cpp.pending_c_function_signature.append(once "void")
         else
            result_type.c_type_for_external_in(cpp.pending_c_function_signature)
         end
         cpp.pending_c_function_signature.append(once " W")
         target_type.id.append_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(feature_stamp.name.to_string)
         cpp.pending_c_function_signature.extend('(')
         target_type.canonical_type_mark.c_type_for_external_in(cpp.pending_c_function_signature)
         cpp.pending_c_function_signature.append(once " C")
         if af.arguments /= Void then
            cpp.pending_c_function_signature.extend(',')
            af.arguments.external_prototype_in(cpp.pending_c_function_signature, target_type)
         end
         cpp.pending_c_function_signature.extend(')')
         if ace.no_check then
            cpp.pending_c_function_body.append(once "se_dump_stack ds={NULL,NULL,0,NULL,NULL,NULL};%N%
                                                    %ds.caller=se_dst;%N%
                                                    %ds.exception_origin=NULL;%N%
                                                    %ds.locals=NULL;%N")
            cpp.set_dump_stack_top_for(target_type, once "&ds", once "link")
         end
         if result_type = Void then
            if calling_code /= Void then
               calling_code.compile_to_c(target_type)
            end
         else
            check
               calling_code /= Void
            end
            if {COMPOUND_EXPRESSION} ?:= calling_code then
               compound_expression ::= calling_code
               compound_expression.compound_compile_to_c(target_type)
               expression ::= compound_expression.last
            else
               expression ::= calling_code
            end
            cpp.pending_c_function_body.append(once "return ")
            expression.compile_to_c(target_type)
            cpp.pending_c_function_body.append(once ";%N")
         end
         cpp.dump_pending_c_function(True)
      end

feature {}
   with_local (ln: like local_name) is
      require
         ln /= Void
      do
         local_name := ln
      ensure
         local_name = ln
      end

   with_feature_name (fn: like feature_name) is
      require
         fn /= Void
      do
         feature_name := fn
      ensure
         feature_name = fn
      end

invariant
   local_name /= Void xor feature_name /= Void

   (local_name /= Void) implies feature_stamp = Void
   
   (local_name /= Void) implies calling_code = Void
   
end -- class ADDRESS_OF
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
