-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT
   --
   -- For instruction like :
   --                          foo := bar
   --                          foo := bar + 1
   --
   --

inherit
   ASSIGNMENT_INSTRUCTION

create {ANY}
   make

create {ANY}
   inline_make

feature {ANY}
   simplify (type: TYPE): INSTRUCTION
      local
         rs: like right_side
      do
         rs := right_side.simplify(type)
         if rs /= right_side then
            smart_eiffel.magic_count_increment
            create {ASSIGNMENT} Result.inline_make(left_side, rs)
         else
            Result := Current
         end
      end

   specialize_in (type: TYPE): like Current
      local
         l, r: EXPRESSION
      do
         l := left_side.specialize_in(type)
         r := right_side.specialize_in(type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         l, r: EXPRESSION
      do
         l := left_side.specialize_thru(parent_type, parent_edge, new_type)
         r := right_side.specialize_thru(parent_type, parent_edge, new_type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.inline_make(l, r)
         end
      end

   specialize_and_check (type: TYPE): INSTRUCTION
      local
         l, r: EXPRESSION; lt, rt: TYPE; written_site: STRING
         call_twin: FUNCTION_CALL_0
      do
         l := left_side.specialize_and_check(type)
         lt := l.resolve_in(type)
         if right_side.is_void then
            if lt.is_expanded then
               error_handler.add_position(right_side.start_position)
               error_handler.append(once "Void cannot be assigned to an expanded entity.")
               if left_side.start_position.class_text /= type.class_text then
                  error_handler.append(once " Error detected while checking this code in the ")
                  error_handler.append(type.name.to_string)
                  error_handler.append(once " context.")
               end
               error_handler.append(once " Cannot assign Void into ")
               error_handler.add_expression(left_side)
               error_handler.append(once " which is of type ")
               error_handler.append(lt.name.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            elseif l = left_side then
               Result := Current
            else
               create {ASSIGNMENT} Result.make(l, right_side)
            end
         else
            r := right_side.specialize_and_check(type)
            rt := r.resolve_in(type)
            -- Theoretically, validity checking should be done only once using the sole `declaration_type'.
            -- In practice, using the `declaration_type' needs more computation ... and this solution appears
            -- to catch errors which are not caught using the `declaration_type'. (Dom. july 12th 2004)
            if lt.is_expanded and then rt.is_reference then
               written_site := start_position.class_text.name.to_string
               if written_site = as_integer_general or else written_site = as_real_general or written_site = as_natural_general then
                  -- Relaxed rule to share more code in INTEGER_* / REAL_* / NATURAL_*.
               else
                  fatal_error_for("Assignment of a reference type into an expanded type is not allowed.",
                                  type, lt, rt)
               end
            end
            if not rt.can_be_assigned_to(lt) then
               fatal_error_for(" Bad assignment.", type, lt, rt)
            elseif rt.is_user_expanded then
               create call_twin.make(r, smart_eiffel.type_any.class_text.any_twin_feature.names.first)
               call_twin.set_feature_stamp(rt.twin_stamp)
               r := call_twin
            end
            if rt = lt and then r = right_side and then l = left_side then
               Result := Current
            else
               if rt /= lt and then not rt.is_agent then
                  r := assignment_handler.implicit_cast(r, rt, lt)
               end
               create {ASSIGNMENT} Result.make(l, r)
            end
         end
      end

   pretty (indent_level: INTEGER)
      local
         semi_colon_flag: BOOLEAN; expression_with_comment: EXPRESSION_WITH_COMMENT
      do
         pretty_printer.set_indent_level(indent_level)
         semi_colon_flag := pretty_printer.semi_colon_flag
         left_side.pretty(indent_level)
         pretty_printer.put_string(once " := ")
         pretty_printer.set_semi_colon_flag(False)
         expression_with_comment ?= right_side
         if expression_with_comment /= Void and then
            expression_with_comment.comment.start_position.line > expression_with_comment.expression.start_position.line
          then
            -- The comment is actually for the next instruction.
            expression_with_comment.expression.pretty(indent_level)
            pretty_printer.set_indent_level(indent_level)
            expression_with_comment.comment.pretty(indent_level)
         else
            right_side.pretty(indent_level)
         end
         pretty_printer.set_semi_colon_flag(semi_colon_flag)
         if semi_colon_flag then
            pretty_printer.put_character(';')
         end
         pretty_printer.set_indent_level(0)
      end

   accept (visitor: ASSIGNMENT_VISITOR)
      do
         visitor.visit_assignment(Current)
      end

   collect (t: TYPE): TYPE
      local
         left_type, right_type: TYPE; left_live_type: LIVE_TYPE
      do
         left_type := left_side.collect(t)
         if not right_side.is_void then
            right_type := right_side.collect(t)
            if left_type.live_type = Void then
               -- It may be the time to actually collect the `left_side' LIVE_TYPE:
               if right_type.live_type /= Void then
                  -- It is the time to actually collect the corresponding LIVE_TYPE:
                  -- (Done in EFFECTIVE_ARG_LIST_N, ASSIGNMENT_ATTEMPT, ASSIGNMENT and CREATE_WRITABLE.)
                  left_live_type := smart_eiffel.collect_one_type(left_type, False)
               end
            end
            assignment_handler.collect_normal(right_type, left_type)
         end
      end

   adapt_for (t: TYPE): like Current
      local
         l: like left_side; r: like right_side
      do
         l := left_side.adapt_for(t)
         r := right_side.adapt_for(t)
         if l = left_side and then r = right_side then
            Result := Current
         else
            create Result.inline_make(l, r)
         end
      end

feature {}
   fatal_error_for (msg: STRING; context_type, lt, rt: TYPE)
      require
         error_handler.is_empty
      do
         error_handler.append(msg)
         error_handler.add_position(right_side.start_position)
         error_handler.add_position(left_side.start_position)
         if left_side.start_position.class_text /= context_type.class_text then
            error_handler.append(once " Error detected while checking this code in the ")
            error_handler.append(context_type.name.to_string)
            error_handler.append(once " context.")
         end
         error_handler.append(once " Cannot assign ")
         error_handler.add_expression(right_side)
         error_handler.append(once " which is of type ")
         error_handler.append(rt.name.to_string)
         error_handler.append(once " into ")
         error_handler.add_expression(left_side)
         error_handler.append(once " which is of type ")
         error_handler.append(lt.name.to_string)
         error_handler.append(once ".")
         error_handler.print_as_fatal_error
      end

   make (ls: like left_side; rs: like right_side)
         -- Note: this creation procedure is for example called by the `eiffel_parser' which is in charge
         -- of checking that `ls' is actually a writable entity. (See also `inline_make'.)
      require
         ls.is_writable
         not ls.start_position.is_unknown
         rs /= Void
      do
         left_side := ls
         right_side := rs
      ensure
         left_side = ls
         right_side = rs
      end

   inline_make (ls: like left_side; rs: like right_side)
         -- This creation procedure is called to inline for example a procedure which is actually an
         -- attribute setter, hence the `is_writable' property is not necessary. (See also `make'.)
      require
         ls /= Void
         rs /= Void
      do
         left_side := ls
         right_side := rs
      ensure
         left_side = ls
         right_side = rs
      end

feature {ANONYMOUS_FEATURE}
   reset_default_value_in_local_or_result (type: TYPE): BOOLEAN
         -- Does this statement reset a local or Result to its default value?
      local
         result_type: TYPE; integer_constant: INTEGER_CONSTANT; implicit_cast: IMPLICIT_CAST
         character_constant: CHARACTER_CONSTANT; default_character: CHARACTER
      do
         Result := False
         if left_side.is_result or else ({LOCAL_NAME_REF} ?:= left_side) then
            if right_side.is_void then
               Result := True
            else
               result_type := right_side.resolve_in(type)
               if result_type.is_boolean then
                  Result := {E_FALSE} ?:= right_side
               elseif result_type.is_integer then
                  if {INTEGER_CONSTANT} ?:= right_side then
                     integer_constant ::= right_side
                     Result := integer_constant.value_memory = 0
                  elseif {IMPLICIT_CAST} ?:= right_side then
                     implicit_cast ::= right_side
                     if {INTEGER_CONSTANT} ?:= implicit_cast.expression then
                        integer_constant ::= implicit_cast.expression
                        Result := integer_constant.value_memory = 0
                     end
                  end
               elseif result_type.is_character then
                  if {CHARACTER_CONSTANT} ?:= right_side then
                     character_constant ::= right_side
                     Result := character_constant.value = default_character
                  end
               elseif result_type.is_pointer or else result_type.is_native_array then
                  Result := {NULL_POINTER} ?:= right_side
               end
            end
         end
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         rs: like right_side; code_accumulator_index: INTEGER
      do
         code_accumulator_index := code_accumulator.current_context.upper
         code_accumulator.add_sedb(start_position, 'N')
         right_side.inline_dynamic_dispatch_(code_accumulator, type)
         rs := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if rs = right_side then
            code_accumulator.current_context.add_last(Current)
         else
            code_accumulator.current_context.add_last(create {ASSIGNMENT}.inline_make(left_side, rs))
         end
         from
            code_accumulator_index := code_accumulator_index + 1
         until
            code_accumulator_index > code_accumulator.current_context.upper
         loop
            code_accumulator.current_context.item(code_accumulator_index).to_instruction.set_eiffel_parser_stamp(eiffel_parser_stamp)
            code_accumulator_index := code_accumulator_index + 1
         end
      end

end -- class ASSIGNMENT
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
