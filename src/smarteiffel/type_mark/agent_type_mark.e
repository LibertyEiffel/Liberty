-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AGENT_TYPE_MARK
   --
   -- For all agent's types: ROUTINE, PROCEDURE, FUNCTION and PREDICATE.
   --

inherit
   GENERIC_TYPE_MARK
      redefine pretty_in, specialize_in, specialize_thru
      end

insert
   AGENT_TYPE_MARKS

creation {ANY}
   routine, procedure, function, predicate

feature {ANY}
   is_reference: BOOLEAN is True

   is_expanded: BOOLEAN is False

   written_open: TYPE_MARK is
         -- The written type for open operands (this is not always a TUPLE, see also `open').
      do
         Result := generic_list.first
      end

   result_type: TYPE_MARK is
         -- The type of the `Result' (used only when `pretty_code' = `function_code' ).
      local
         index: INTEGER
      do
         index := generic_list.lower + 1
         if generic_list.valid_index(index) then
            Result := generic_list.item(index)
         end
      end

   pretty_in (buffer: STRING) is
      do
         inspect
            pretty_code
         when routine_code then
            buffer.append(as_routine)
         when procedure_code then
            buffer.append(as_procedure)
         when function_code then
            buffer.append(as_function)
         when predicate_code then
            buffer.append(as_predicate)
         end
         buffer.extend('[')
         written_open.pretty_in(buffer)
         if pretty_code = function_code then
            buffer.append(once ", ")
            result_type.pretty_in(buffer)
         end
         buffer.extend(']')
      end

   specialize_in (new_type: TYPE) is
      local
         gl: ARRAY[TYPE]
      do
         Precursor(new_type)
         gl := static_memory.fast_at(new_type).generic_list
         open_check(new_type, gl.first)
      ensure then
         declaration_type /= Void
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): GENERIC_TYPE_MARK is
      local
         gl: ARRAY[TYPE];
      do
         Result := Precursor(parent_type, parent_edge, new_type)
         gl := static_memory.fast_at(new_type).generic_list
         open_check(new_type, gl.first)
      end

   c_type_for_target_in (buffer: STRING) is
      do
         buffer.extend('T')
         id.append_in(buffer)
         buffer.extend('*')
      end

   c_type_for_argument_in, c_type_for_result_in (buffer: STRING) is
      do
         buffer.append(once "T0*")
      end

   accept (visitor: AGENT_TYPE_MARK_VISITOR) is
      do
         visitor.visit_agent_type_mark(Current)
      end

   c_initialize_in (buffer: STRING) is
      do
         buffer.append(once "(void*)0")
      end

   just_before_gc_mark_in (str: STRING) is
      do
      end

   gc_define1 is
      do
         cpp.out_h_buffer.copy(once "%N#define gc_mark")
         id.append_in(cpp.out_h_buffer)
         cpp.out_h_buffer.append(once "(x) (((se_agent0*)(x))->gc_mark_agent_mold((se_agent*)(x)))%N%N")
         cpp.write_out_h_buffer
      end

   gc_define2 is
      do
      end

   is_user_expanded: BOOLEAN is False

   gc_info_in (str: STRING) is
      do
      end

   is_empty_expanded: BOOLEAN is False

   need_c_struct: BOOLEAN is False

   id: INTEGER is
      do
         Result := type.live_type.id
      end

   jvm_xnewarray is
      local
         idx: INTEGER
      do
         idx := constant_pool.idx_jvm_root_class
         code_attribute.opcode_anewarray(idx)
      end

   jvm_check_class_invariant is
      do
         standard_jvm_check_class_invariant
      end

   jvm_if_x_ne: INTEGER is
      do
         Result := code_attribute.opcode_if_acmpne
      end

   jvm_return_code is
      do
         code_attribute.opcode_areturn
      end

   jvm_target_descriptor_in (str: STRING) is
      do
      end

   jvm_push_local (offset: INTEGER) is
      do
         code_attribute.opcode_aload(offset)
      end

   jvm_xaload is
      do
         code_attribute.opcode_aaload
      end

   jvm_write_local_creation, jvm_write_local (offset: INTEGER) is
      do
         code_attribute.opcode_astore(offset)
      end

   jvm_push_default: INTEGER is
      do
         code_attribute.opcode_aconst_null
         Result := 1
      end

   jvm_descriptor_in (str: STRING) is
      do
         str.append(jvm_root_descriptor)
      end

   jvm_method_flags: INTEGER is 17

   jvm_standard_is_equal is
      local
         rc: LIVE_TYPE; wa: ARRAY[RUN_FEATURE_2]
      do
         rc := type.live_type
         wa := rc.writable_attributes
         jvm.std_is_equal(rc, wa)
      end

   jvm_xastore is
      do
         code_attribute.opcode_aastore
      end

   jvm_if_x_eq: INTEGER is
      do
         Result := code_attribute.opcode_if_acmpeq
      end

--   can_be_assigned_to (other: TYPE_MARK; current_type, other_type: TYPE): BOOLEAN is
--      local
--         open_ok: BOOLEAN; open_current, open_other: ARRAY[TYPE]
--         result_current, result_other: TYPE; i: INTEGER
--      do
--         if other.is_expanded then
--            Result := False
--         elseif {AGENT_TYPE_MARK} ?:= other then
--            open_current := current_type.open_arguments
--            open_other := other_type.open_arguments
--            if open_current = Void then
--               open_ok := True
--            elseif open_other /= Void then
--               if open_other.count >= open_current.count then
--                  from
--                     open_ok := True
--                     i := open_current.upper
--                  until
--                     (not open_ok) or else i < open_current.lower
--                  loop
--                     open_ok := argument_can_be_assigned(open_other.item(i), open_current.item(i))
--                     i := i - 1
--                  end
--               end
--            end
--            if open_ok then
--               result_current := current_type.agent_result
--               result_other := other_type.agent_result
--               if result_current = Void then
--                  if result_other = Void then
--                     Result := True
--                  end
--               elseif result_other /= Void then
--                  Result := result_current.can_be_assigned_to(result_other)
--               else
--                  Result := True
--               end
--            end
--         else
--            Result := current_type.can_be_assigned_through_parent_to(other_type, other)
--         end
--      end

feature {TYPE}
   need_gc_mark_function (current_type: TYPE): BOOLEAN is
      do
         Result := True
      end

feature {TYPE_MARK}
   short_ (shorted_type: TYPE) is
      local
         agent_type_mark: AGENT_TYPE_MARK
      do
         short_printer.put_class_name(class_text_name)
         short_printer.hook_or("open_sb", "[")
         agent_type_mark ?= static_memory.fast_at(shorted_type).canonical_type_mark
         agent_type_mark.written_open.short_(shorted_type)
         if result_type /= Void then
            short_printer.hook_or("tm_sep", ", ")
            result_type.short_(shorted_type)
         end
         short_printer.hook_or("close_sb", "]")
      end

feature {AGENT_TYPE_MARK_VISITOR}
   pretty_code: INTEGER
         -- For the use of `pretty'.

feature {}
   valid_code (c: like pretty_code): BOOLEAN is
      do
         inspect
            c
         when routine_code, procedure_code, function_code, predicate_code then
            Result := True
         else
         end
      end

   basic_make (c: like pretty_code; wo: like written_open; rt: like result_type) is
      require
         class_text_name /= Void
         valid_code(c)
         wo /= Void
      do
         pretty_code := c
         create generic_list.with_capacity(2, 1)
         generic_list.add_last(wo)
         if rt /= Void then
            generic_list.add_last(rt)
         end
      ensure
         pretty_code = c
         written_open = wo
         result_type = rt
      end

   routine (sp: like start_position; wo: like written_open) is
      require
         not sp.is_unknown
         wo /= Void
      do
         create class_text_name.make(routine_name, sp)
         basic_make(routine_code, wo, Void)
      ensure
         written_open = wo
      end

   procedure (sp: like start_position; wo: like written_open) is
      require
         not sp.is_unknown
         wo /= Void
      do
         create class_text_name.make(procedure_name, sp)
         basic_make(procedure_code, wo, Void)
      ensure
         written_open = wo
         result_type = Void
      end

   function (sp: like start_position; wo: like written_open; rt: like result_type) is
      require
         not sp.is_unknown
         wo /= Void
         rt /= Void
      do
         create class_text_name.make(function_name, sp)
         basic_make(function_code, wo, rt)
      ensure
         written_open = wo
         result_type = rt
      end

   predicate (sp: like start_position; wo: like written_open) is
      require
         not sp.is_unknown
         wo /= Void
      do
         create class_text_name.make(function_name, sp)
         basic_make(predicate_code, wo, create {BOOLEAN_TYPE_MARK}.make(sp))
      ensure
         written_open = wo
      end

   routine_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_routine)
      end

   procedure_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_procedure)
      end

   function_name: HASHED_STRING is
      once
         Result := string_aliaser.hashed_string(as_function)
      end

   open_check (context: TYPE; new_open: TYPE) is
         -- Check that `new_open' is a valid `open' TUPLE type.
      require
         new_open /= Void
      do
         if not new_open.is_tuple then
            error_handler.add_position(written_open.start_position)
            error_handler.append("TUPLE type expected for open arguments of agent type. %
             %(See also the next fatal error message.)")
            error_handler.print_as_error
            error_handler.add_position(written_open.start_position)
            if not written_open.is_static then
               error_handler.append("When the context of the validation is ")
               error_handler.append(context.name.to_string)
               error_handler.append(", this type mark is not a TUPLE. (This is actually ")
               error_handler.append(new_open.name.to_string)
               error_handler.append(".)")
            else
               error_handler.append("This type mark is not a TUPLE type mark.")
            end
            error_handler.print_as_fatal_error
         end
      end

invariant
   valid_code(pretty_code)

   written_open /= Void

end -- class AGENT_TYPE_MARK
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
