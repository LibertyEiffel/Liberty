-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class NATIVE_C
   --
   -- For the external "C ..." definition.
   --

inherit
   NATIVE

creation {ANY}
   make

feature {ANY}
   accept (visitor: NATIVE_C_VISITOR) is
      do
         visitor.visit_native_c(Current)
      end

   use_current (er: EXTERNAL_ROUTINE): BOOLEAN is
      do
         -- Without assertion, an external routine uses only its arguments.
         -- Note: assertion of the corresponding `er' may use `Current' and the check is done at
         -- the EXTERNAL_ROUTINE level.
      end

   does_need_c_wrapper (type_of_current: TYPE; name: STRING): BOOLEAN is
      do
         parse_external_tag
         if ace.no_check and then not c_inline then
            Result := True
         end
      end

   c_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      local
         type_of_current: TYPE
      do
         type_of_current := rf8.type_of_current
         parse_external_tag
         if need_prototype and then not prototype_dumped then
            prototype_dumped := True
            extra_c_prototype(start_position, type_of_current, rf8.base_feature)
         end
         if does_need_c_wrapper(type_of_current, name) then
            c_mapping(rf8.base_feature, True, True, rf8.arg_count)
         else
            c_mapping(rf8.base_feature, False, True, rf8.arg_count)
         end
      end

   c_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      local
         type_of_current: TYPE
      do
         type_of_current := rf7.type_of_current
         parse_external_tag
         if need_prototype and then not prototype_dumped then
            prototype_dumped := True
            extra_c_prototype(start_position, type_of_current, rf7.base_feature)
         end
         if does_need_c_wrapper(type_of_current, name) then
            c_mapping(rf7.base_feature, True, False, rf7.arg_count)
         else
            c_mapping(rf7.base_feature, False, False, rf7.arg_count)
         end
         cpp.pending_c_function_body.append(once ";%N")
      end

   jvm_add_method_for_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
      end

   jvm_define_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
         fe_c2jvm(rf8)
      end

   jvm_mapping_function (rf8: RUN_FEATURE_8; bcn, name: STRING) is
      do
         fe_c2jvm(rf8)
      end

   jvm_add_method_for_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
      end

   jvm_define_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
         fe_c2jvm(rf7)
      end

   jvm_mapping_procedure (rf7: RUN_FEATURE_7; bcn, name: STRING) is
      do
         fe_c2jvm(rf7)
      end

feature {EXTERNAL_ROUTINE}
   collect (t: TYPE; external_routine: EXTERNAL_ROUTINE) is
      do
         notify_external_assignments(t, external_routine)
      end

feature {EXTERNAL_TYPE}
   parse_external_type (alias_string: MANIFEST_STRING; target: EXTERNAL_TYPE) is
      do
         not_yet_implemented
      end

feature {}
   parsing_done, need_prototype, prototype_dumped: BOOLEAN

   macro: BOOLEAN
         -- Is the "macro" keyword used?

   struct: STRING
         -- Non Void when the "struct" keyword is used. The value is then the
         -- appropriate C cast to access the corresponding C struct.

   access: STRING
         -- Non Void if we have to access this `struct' name field.

   type: STRING
         -- Non Void if the type is indicated.

   access_mode: INTEGER
         -- Either `set_access', `get_access' or `getset_access'

   set_access, get_access, getset_access: INTEGER is unique

   signature: FAST_ARRAY[STRING]
         -- Non Void when some external `signature' is used.

   c_inline: BOOLEAN
         -- When the C inline is used.

   parse_external_tag is
      local
         file_name: STRING
      do
         if not parsing_done then
            parsing_done := True
            from
               need_prototype := True
               mini_buffer.start_with(external_tag)
               mini_buffer.next
               mini_buffer.skip_separators
            until
               mini_buffer.is_off
            loop
               if mini_buffer.a_keyword(once "macro") then
                  macro := True
                  need_prototype := False
               elseif mini_buffer.a_keyword(once "struct") then
                  need_prototype := False
                  struct := mini_buffer.a_type_cast
                  if mini_buffer.a_keyword(once "set") then
                     access := mini_buffer.a_field_or_variable_name
                     access_mode := set_access
                  elseif mini_buffer.a_keyword(once "get") then
                     access := mini_buffer.a_field_or_variable_name
                     access_mode := get_access
                  elseif mini_buffer.a_keyword(once "access") then
                     access := mini_buffer.a_field_or_variable_name
                     access_mode := getset_access
                  else
                     bad_external("%"set%", %"get%", or %"access%" keyword expected.")
                  end
               elseif mini_buffer.a_keyword(once "type") then
                  type := mini_buffer.a_field_or_variable_name
               elseif mini_buffer.a_keyword(once "use") then
               elseif mini_buffer.a_keyword(once "inline") then
                  c_inline := True
                  need_prototype := False
               elseif mini_buffer.a_keyword(once "signature") then
                  signature := mini_buffer.a_signature
               elseif mini_buffer.item = '(' then
                  signature := mini_buffer.a_signature
               else
                  inspect
                     mini_buffer.item
                  when ',', '|' then
                     mini_buffer.next
                     mini_buffer.skip_separators
                  else
                     file_name := mini_buffer.a_include
                     need_prototype := False
                     cpp.include_register(start_position, file_name)
                  end
               end
            end
         end
      end

   bad_external (msg: STRING) is
      do
         error_handler.add_position(start_position)
         error_handler.append(msg)
         error_handler.print_as_fatal_error
      end

   c_mapping (er: EXTERNAL_ROUTINE; wrapped, is_function: BOOLEAN; arg_count: INTEGER) is
         -- Where `wrapped' means that the code is wrapped inside some function (-no_check mode).
      local
         tcbd, stop: BOOLEAN; p: POSITION; c_code, arg: STRING; cc: CHARACTER; i, arg_idx: INTEGER
      do
         p := start_position
         if signature /= Void and then signature.upper /= arg_count then
            bad_external("Bad number of arguments of external signature.")
         end
         if not wrapped then
            tcbd := cpp.target_cannot_be_dropped
            if tcbd then
               cpp.pending_c_function_body.extend(',')
            end
         end
         if struct /= Void then
            if access_mode = set_access then
               if is_function or else arg_count /= 2 then
                  error_handler.add_position(er.start_position)
                  bad_external("Bad prototype for C struture set external.")
               end
            elseif access_mode = get_access then
               if not is_function or else arg_count /= 1 then
                  error_handler.add_position(er.start_position)
                  bad_external("Bad prototype for C struture get external.")
               end
            end
            cpp.pending_c_function_body.append(once "(((")
            cpp.pending_c_function_body.append(struct)
            cpp.pending_c_function_body.append(once "*)")
            if wrapped then
               cpp.pending_c_function_body.append(as_a1)
            else
               cpp.put_ith_argument(1)
            end
            cpp.pending_c_function_body.append(once ")->")
            cpp.pending_c_function_body.append(access)
            cpp.pending_c_function_body.extend(')')
            if not is_function then
               cpp.pending_c_function_body.append(once "=(")
               if type /= Void then
                  cpp.pending_c_function_body.extend('(')
                  cpp.pending_c_function_body.append(type)
                  cpp.pending_c_function_body.extend(')')
               end
               if wrapped then
                  cpp.pending_c_function_body.append(once "a2")
               else
                  cpp.put_ith_argument(2)
               end
               cpp.pending_c_function_body.extend(')')
            end
         elseif c_inline then
            from
               c_code := er.external_name
               i := 1
            until
               i > c_code.count
            loop
               cc := c_code.item(i)
               if cc /= '$' then
                  cpp.pending_c_function_body.extend(cc)
               else
                  from
                     i := i + 1
                     arg := once "local buffer..."
                     arg.clear_count
                     stop := i > c_code.count
                  until
                     stop
                  loop
                     cc := c_code.item(i)
                     inspect
                        cc
                     when 'a' .. 'z', 'A' .. 'Z', '0' .. '9', '_' then
                        arg.extend(cc)
                        i := i + 1
                     else
                        stop := True
                        i := i - 1
                     end
                  end
                  arg := string_aliaser.string(arg)
                  arg_idx := er.argument_rank_of(arg)
                  if arg_idx > 0 then
                     if wrapped then
                        cpp.pending_c_function_body.extend('a')
                        arg_idx.append_in(cpp.pending_c_function_body)
                     else
                        cpp.put_ith_argument(arg_idx)
                     end
                  else
                     error_handler.add_position(er.start_position)
                     error_handler.add_position(start_position)
                     error_handler.append("Unknown %"$")
                     error_handler.append(arg)
                     error_handler.append("%" argument in external C inline definition.")
                     error_handler.print_as_fatal_error
                  end
               end
               i := i + 1
            end
         else
            cpp.pending_c_function_body.append(er.external_name)
            if arg_count > 0 then
               cpp.pending_c_function_body.extend('(')
               from
                  i := 1
               until
                  i > arg_count
               loop
                  if signature /= Void then
                     cpp.pending_c_function_body.append(once "((")
                     cpp.pending_c_function_body.append(signature.item(i))
                     cpp.pending_c_function_body.extend(')')
                  end
                  if wrapped then
                     cpp.pending_c_function_body.extend('a')
                     i.append_in(cpp.pending_c_function_body)
                  else
                     cpp.put_ith_argument(i)
                  end
                  if signature /= Void then
                     cpp.pending_c_function_body.extend(')')
                  end
                  i := i + 1
                  if i <= arg_count then
                     cpp.pending_c_function_body.extend(',')
                  end
               end
               cpp.pending_c_function_body.extend(')')
            elseif not macro then
               cpp.pending_c_function_body.append(once "()")
            end
         end
         if not wrapped then
            if tcbd then
               cpp.pending_c_function_body.extend(')')
            end
            if not is_function then
               cpp.pending_c_function_body.extend(';')
            end
         end
         cpp.pending_c_function_body.extend('%N')
         cpp.put_position_comment(p)
      end

end -- class NATIVE_C
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
