-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ADDRESS_OF
   --
   -- For the special address form notation : $name
   --

inherit
   EXPRESSION

create {ANY}
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

   is_writable: BOOLEAN False

   is_current: BOOLEAN False

   is_implicit_current: BOOLEAN False

   is_static: BOOLEAN False

   is_result: BOOLEAN False

   is_void: BOOLEAN False

   is_manifest_string: BOOLEAN False

   use_current (type: TYPE): BOOLEAN
      do
         Result := (feature_name /= Void and then
                    feature_stamp.anonymous_feature(type).is_attribute)
      end

   extra_bracket_flag: BOOLEAN False

   declaration_type: TYPE
      once
         Result := smart_eiffel.type_pointer
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := declaration_type
         check
            Result.is_pointer
         end
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := True
      end

   adapt_for (type: TYPE): like Current
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

   safety_check (type: TYPE)
      do
         if calling_code /= Void then
            calling_code.safety_check(type)
         end
      end

   specialize_in (type: TYPE): like Current
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
               error_handler.append(once " Feature `")
               error_handler.append(feature_name.to_string)
               error_handler.append(once "' not found.")
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

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
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

   specialize_and_check (type: TYPE): like Current
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
               calling_code := calling_code.specialize_in(type).specialize_and_check(type)
               Result := Current
            else
               cc := calling_code.specialize_and_check(type)
               if cc = calling_code then
                  Result := Current
               else
                  Result := twin
                  Result.set_calling_code(cc)
               end
            end
         end
      end

   has_been_specialized: BOOLEAN
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

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := resolve_in(type)
         check
            Result.is_pointer
         end
      end

   simplify (type: TYPE): like Current
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

   precedence: INTEGER
      do
         Result := atomic_precedence
      end

   start_position: POSITION
      do
         if local_name /= Void then
            Result := local_name.start_position
         else
            Result := feature_name.start_position
         end
      end

   pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('%D')
         if local_name /= Void then
            local_name.pretty(indent_level)
         else
            feature_name.pretty(indent_level)
         end
      end

   pretty_target (indent_level: INTEGER)
      do
         check
            False
         end
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   short (type: TYPE)
      do
         short_printer.put_character('%D')
         if local_name /= Void then
            local_name.short(type)
         else
            feature_name.short(type)
         end
      end

   short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   collect (type: TYPE): TYPE
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

   accept (visitor: ADDRESS_OF_VISITOR)
      do
         visitor.visit_address_of(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         cc: like calling_code; new_one: like Current
      do
         if local_name /= Void then
            code_accumulator.current_context.add_last(Current)
         --elseif calling_code /= Void then --| **** ??? strange code (see invariant)
         --   code_accumulator.current_context.add_last(Current)
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
   set_local_name (ln: like local_name)
      require
         ln /= Void
      do
         local_name := ln
      ensure
         local_name = ln
      end

   set_target_type (tt: like target_type)
      require
         tt /= Void
      do
         target_type := tt
      ensure
         target_type = tt
      end

   set_feature_stamp (fs: like feature_stamp)
      require
         fs /= Void
      do
         feature_stamp := fs
      ensure
         feature_stamp = fs
      end

   set_calling_code (cc: like calling_code)
      do
         calling_code := cc
      ensure
         calling_code = cc
      end

feature {}
   with_local (ln: like local_name)
      require
         ln /= Void
      do
         local_name := ln
      ensure
         local_name = ln
      end

   with_feature_name (fn: like feature_name)
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
