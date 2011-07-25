-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLOSED_OPERAND
   --
   -- A CLOSED_OPERAND is an EXPRESSION captured during some AGENT_CREATION.
   --
   -- See also OPEN_ARGUMENT.
   --

inherit
   EXPRESSION

creation   {AGENT_CREATION}
   make

feature {ANY}
   start_position: POSITION

   original_capture: EXPRESSION
         -- The `original_capture' one.

   rank: INTEGER
         -- Can be -1 when the target is captured or the rank of the corresponding argument.

   capture_memory: HASHED_DICTIONARY[EXPRESSION, TYPE]
         -- For each context TYPE, the corresponding specialized `original_capture' EXPRESSION. Thus,
         -- an CLOSED_OPERAND object is never twinned.

   declaration_type: TYPE is
      do
         Result := original_capture.declaration_type
      end

   specialize_in (type: TYPE): like Current is
      do
         capture_memory.put(original_capture.specialize_in(type), type)
         Result := Current
      end

   has_been_specialized: BOOLEAN is
      local
         i: INTEGER
      do
         from
            Result := True
            i := capture_memory.lower
         until
            not Result or i > capture_memory.upper
         loop
            Result := capture_memory.item(i).has_been_specialized
            i := i + 1
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         expression: EXPRESSION
      do
         if is_current then
            expression := original_capture
         else
            expression := capture_memory.reference_at(parent_type).specialize_thru(parent_type, parent_edge, new_type)
         end
         capture_memory.put(expression, new_type)
         Result := Current
      end

   specialize_2 (type: TYPE): EXPRESSION is
      local
         expression: EXPRESSION
      do
         if is_current then
            expression := original_capture
         else
            expression := capture_memory.reference_at(type).specialize_2(type)
         end
         capture_memory.put(expression, type)
         Result := Current
      end

   resolve_in (type: TYPE): TYPE is
      do
         if is_current then
            capture_memory.put(original_capture, type)
            Result := type
         else
            Result := capture_memory.reference_at(type).resolve_in(type)
         end
      end

   simplify (type: TYPE): EXPRESSION is
      do
         capture_memory.put(capture_memory.reference_at(type).simplify(type), type)
         Result := Current
      end

   collect (type: TYPE): TYPE is
      local
         expression: EXPRESSION
      do
         expression := capture_memory.reference_at(type)
         Result := expression.collect(type)
      end

   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         if inside_agent_launcher_flag then
            code_accumulator.current_context.add_last(Current)
         else
            capture_memory.reference_at(type).inline_dynamic_dispatch_(code_accumulator, type)
            code_accumulator.current_context.remove_last
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := capture_memory.reference_at(type).non_void_no_dispatch_type(type)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := capture_memory.reference_at(type).side_effect_free(type)
      end

   adapt_for (type: TYPE): like Current is
      do
         Result := Current
         capture_memory.put(capture_memory.reference_at(type).adapt_for(type), type)
      end

   compile_to_c (type: TYPE) is
      do
         if is_static then
            -- No field to store such a static value:
            original_capture.compile_to_c(type)
         elseif inside_agent_launcher_flag then
            c_name_in(cpp.pending_c_function_body)
         else
            -- Well, outside of the agent:
            capture_memory.reference_at(type).compile_to_c(type)
         end
      end

   mapping_c_arg (type: TYPE) is
      do
         if is_static then
            -- No field to store such a static value:
            original_capture.mapping_c_arg(type)
         elseif inside_agent_launcher_flag then
            c_name_in(cpp.pending_c_function_body)
         else
            -- Well, outside of the agent:
            capture_memory.reference_at(type).mapping_c_arg(type)
         end
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := capture_memory.reference_at(type).use_current(type)
      end

   safety_check (type: TYPE) is
      do
         capture_memory.reference_at(type).safety_check(type)
      end

   precedence: INTEGER is
      do
         Result := original_capture.precedence
      end

   is_writable: BOOLEAN is False

   is_current: BOOLEAN is
      do
         Result := original_capture.is_current
      end

   is_implicit_current: BOOLEAN is
      do
         Result := original_capture.is_implicit_current
      end

   is_void: BOOLEAN is
      do
         Result := original_capture.is_void
      end

   is_static: BOOLEAN is
      do
         Result := original_capture.is_static
      end

   is_manifest_string: BOOLEAN is
      do
         Result := original_capture.is_manifest_string
      end

   is_result: BOOLEAN is
      do
         Result := original_capture.is_result
      end

   short (type: TYPE) is
      do
         capture_memory.reference_at(type).short(type)
      end

   short_target (type: TYPE) is
      do
         capture_memory.reference_at(type).short_target(type)
      end

   pretty (indent_level: INTEGER) is
      do
         original_capture.pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER) is
      do
         original_capture.pretty_target(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER) is
      do
         original_capture.bracketed_pretty(indent_level)
      end

   extra_bracket_flag: BOOLEAN is
      do
         Result := original_capture.extra_bracket_flag
      end

   accept (visitor: CLOSED_OPERAND_VISITOR) is
      do
         visitor.visit_closed_operand(Current)
      end

   compile_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   compile_target_to_jvm (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      do
         not_yet_implemented
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      do
         not_yet_implemented
      end

   jvm_assign_creation (type: TYPE) is
      do
         not_yet_implemented
      end

   jvm_assign (type: TYPE) is
      do
         not_yet_implemented
      end

feature {AGENT_CREATION, C_TARGET_MAPPER}
   inside_agent_launcher_flag: BOOLEAN

   c_name_in (buffer: STRING) is
      do
         if rank = -1 then
            buffer.append(once "closed_C")
         else
            buffer.append(once "closed_a")
            rank.append_in(buffer)
         end
      end

   set_inside_agent_launcher_flag (flag_value: BOOLEAN) is
      do
         inside_agent_launcher_flag := flag_value
      end

feature {}
   make (r: like rank; c: like original_capture) is
      require
         (r = -1) or else (r > 0)
      do
         rank := r
         start_position := c.start_position
         original_capture := c
         create capture_memory.make
      ensure
         rank = r
         start_position = c.start_position
         original_capture = c
      end

invariant
   not start_position.is_unknown

   ;(rank = -1) or else (rank > 0)

   original_capture /= Void

end -- class CLOSED_OPERAND
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
