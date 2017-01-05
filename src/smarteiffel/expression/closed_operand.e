-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
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

create {AGENT_CREATION}
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

   declaration_type: TYPE
      do
         Result := original_capture.declaration_type
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := original_capture.written_declaration_type_mark
      end

   specialize_in (type: TYPE): like Current
      do
         capture_memory.put(original_capture.specialize_in(type), type)
         Result := Current
      end

   has_been_specialized: BOOLEAN
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

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
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

   specialize_and_check (type: TYPE): EXPRESSION
      local
         expression: EXPRESSION
      do
         if is_current then
            expression := original_capture
         else
            expression := capture_memory.reference_at(type).specialize_and_check(type)
         end
         capture_memory.put(expression, type)
         Result := Current
      end

   resolve_in (type: TYPE): TYPE
      do
         if is_current then
            capture_memory.put(original_capture, type)
            Result := type
         else
            Result := capture_memory.reference_at(type).resolve_in(type)
         end
      end

   simplify (type: TYPE): EXPRESSION
      do
         capture_memory.put(capture_memory.reference_at(type).simplify(type), type)
         Result := Current
      end

   collect (type: TYPE): TYPE
      local
         expression: EXPRESSION
      do
         expression := capture_memory.reference_at(type)
         Result := expression.collect(type)
      end

   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      do
         if inside_agent_launcher_flag then
            code_accumulator.current_context.add_last(Current)
         else
            capture_memory.reference_at(type).inline_dynamic_dispatch_(code_accumulator, type)
            capture_memory.put(code_accumulator.current_context.last.to_expression, type)
            code_accumulator.current_context.remove_last
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := capture_memory.reference_at(type).non_void_no_dispatch_type(type)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := capture_memory.reference_at(type).side_effect_free(type)
      end

   adapt_for (type: TYPE): like Current
      do
         Result := Current
         capture_memory.put(capture_memory.reference_at(type).adapt_for(type), type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := capture_memory.reference_at(type).use_current(type)
      end

   safety_check (type: TYPE)
      do
         capture_memory.reference_at(type).safety_check(type)
      end

   precedence: INTEGER
      do
         Result := original_capture.precedence
      end

   is_writable: BOOLEAN False

   is_current: BOOLEAN
      do
         Result := original_capture.is_current
      end

   is_implicit_current: BOOLEAN
      do
         Result := original_capture.is_implicit_current
      end

   is_void: BOOLEAN
      do
         Result := original_capture.is_void
      end

   is_static: BOOLEAN
      do
         Result := original_capture.is_static
      end

   is_manifest_string: BOOLEAN
      do
         Result := original_capture.is_manifest_string
      end

   is_result: BOOLEAN
      do
         Result := original_capture.is_result
      end

   short (type: TYPE)
      do
         capture_memory.reference_at(type).short(type)
      end

   short_target (type: TYPE)
      do
         capture_memory.reference_at(type).short_target(type)
      end

   pretty (indent_level: INTEGER)
      do
         original_capture.pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER)
      do
         original_capture.pretty_target(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         original_capture.bracketed_pretty(indent_level)
      end

   extra_bracket_flag: BOOLEAN
      do
         Result := original_capture.extra_bracket_flag
      end

   accept (visitor: CLOSED_OPERAND_VISITOR)
      do
         visitor.visit_closed_operand(Current)
      end

feature {AGENT_CREATION, CLOSED_OPERAND_VISITOR}
   inside_agent_launcher_flag: BOOLEAN

   set_inside_agent_launcher_flag (flag_value: BOOLEAN)
      do
         inside_agent_launcher_flag := flag_value
      end

feature {}
   make (r: like rank; c: like original_capture)
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
