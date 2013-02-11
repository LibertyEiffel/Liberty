-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_ATTEMPT
   --
   -- For [[Dynamic type testing#ForcedAssignment]] and [[Dynamic type testing#AssignmentAttempt]].
   --

inherit
   INSTRUCTION

insert
   PLATFORM

creation {ANY}
   make

feature {ANY}
   left_side: EXPRESSION

   right_side: EXPRESSION

   forced_flag: BOOLEAN
         -- Indicate that it is a forced one (i.e ::=).

   end_mark_comment: BOOLEAN is False

   side_effect_free (type: TYPE): BOOLEAN is
      do
      end

   use_current (type: TYPE): BOOLEAN is
      do
         if left_side.use_current(type) then
            Result := True
         else
            Result := right_side.use_current(type)
         end
      end

   simplify (type: TYPE): INSTRUCTION is
      local
         rs: like right_side; left_type, right_type: TYPE; right_run_time_set: RUN_TIME_SET
         counter1, counter2, i: INTEGER
      do
         if forced_flag then
            smart_eiffel.magic_count_increment
            create {ASSIGNMENT} Result.make(left_side, right_side.simplify(type))
         else
            left_type := left_side.resolve_in(type)
            rs := right_side.simplify(type)
            right_type := rs.resolve_in(type)
            if right_type.can_be_assigned_to(left_type) then
               -- An ordinary assignment is equivalent:
               smart_eiffel.magic_count_increment
               create {ASSIGNMENT} Result.make(left_side, right_side.simplify(type))
            elseif rs.is_void then
               -- An ordinary assignment with Void is equivalent:
               smart_eiffel.magic_count_increment
               create {ASSIGNMENT} Result.make(left_side, rs)
            elseif rs.non_void_no_dispatch_type(type) /= Void then
               -- Because we are sure of the right-hand side dynamic TYPE:
               smart_eiffel.magic_count_increment
               if right_type.can_be_assigned_to(left_type) then
                  create {ASSIGNMENT} Result.make(left_side, rs)
               else
                  create {ASSIGNMENT} Result.make(left_side, create {E_VOID}.make(rs.start_position))
               end
            elseif right_type.live_type = Void or else right_type.live_type.run_time_set.count = 0 then
               -- Right side can be only Void:
               smart_eiffel.magic_count_increment
               create {ASSIGNMENT} Result.make(left_side, create {E_VOID}.make(rs.start_position))
            else
               right_run_time_set := right_type.live_type.run_time_set
               check
                  right_run_time_set.count > 0
               end
               from
                  i := 1
               until
                  i > right_run_time_set.count
               loop
                  if right_run_time_set.item(i).type.can_be_assigned_to(left_type) then
                     counter1 := counter1 + 1
                     if counter2 > 0 then
                        i := right_run_time_set.count
                     end
                  else
                     counter2 := counter2 + 1
                     if counter1 > 0 then
                        i := right_run_time_set.count
                     end
                  end
                  i := i + 1
               end
               if right_run_time_set.count = counter1 then
                  -- They can be all assigned into `left_side':
                  smart_eiffel.magic_count_increment
                  create {ASSIGNMENT} Result.make(left_side, rs)
               elseif right_run_time_set.count = counter2 then
                  -- Conversely, all possibilities of the right-hand side are all non-assignable into
                  -- the left-hand side. We must still take care of the fact that the right-hand can be
                  -- non Void:
                  smart_eiffel.magic_count_increment
                  if rs.side_effect_free(type) then
                     create {ASSIGNMENT} Result.make(left_side, create {E_VOID}.make(rs.start_position))
                  else
                     --|*** (Fred. + Ph + Dom Oct 21th 2004) ***
                     --| Should use one day some new kind of INSTRUCTION, just to drop the value of
                     --| some unused expression:
                     create {COMPOUND}
                        Result.make_2(create {ASSIGNMENT}.make(left_side, rs),
                                      create {ASSIGNMENT}.make(left_side, create {E_VOID}.make(rs.start_position)))
                  end
               elseif rs /= right_side then
                  smart_eiffel.magic_count_increment
                  create {ASSIGNMENT_ATTEMPT} Result.make(left_side, rs, forced_flag)
               else
                  Result := Current
               end
            end
         end
      end

   compile_to_jvm (type: TYPE) is
      local
         left_type, right_type: TYPE; run_time_set: RUN_TIME_SET; rc: LIVE_TYPE; point1, i: INTEGER
         ca: like code_attribute; branch_index: INTEGER
      do
         --|*** forced_flag not implemented
         left_type := left_side.resolve_in(type)
         right_type := right_side.resolve_in(type)
         ca := code_attribute
         if right_type.is_expanded then
            error_handler.add_position(start_position)
            error_handler.append("Right-hand side expanded Not Yet Implemented.")
            error_handler.print_as_fatal_error
         end
         run_time_set := left_type.live_type.run_time_set
         if run_time_set.count = 0 then
            right_side.compile_to_jvm(type)
            ca.opcode_pop
            ca.opcode_aconst_null
            left_side.jvm_assign(type)
         else
            right_side.compile_to_jvm(type)
            ca.opcode_dup
            point1 := ca.opcode_ifnull
            from
               branch_index := ca.get_branch_array_index
               i := 1
            until
               i > run_time_set.count
            loop
               ca.opcode_dup
               rc := run_time_set.item(i)
               rc.opcode_instanceof
               ca.add_branch(ca.opcode_ifne, branch_index)
               i := i + 1
            end
            ca.opcode_pop
            ca.opcode_aconst_null
            ca.resolve_u2_branch(point1)
            ca.resolve_branches(branch_index)
            ca.release_branch_array_index
            left_side.jvm_assign(type)
         end
      end

   start_position: POSITION is
      do
         Result := left_side.start_position
      end

   specialize_in (type: TYPE): like Current is
      local
         l, r: EXPRESSION
      do
         l := left_side.specialize_in(type)
         r := right_side.specialize_in(type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r, forced_flag)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         l, r: EXPRESSION
      do
         l := left_side.specialize_thru(parent_type, parent_edge, new_type)
         r := right_side.specialize_thru(parent_type, parent_edge, new_type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r, forced_flag)
         end
      end

   specialize_2 (type: TYPE): like Current is
      local
         l, r: EXPRESSION; l_dt, r_dt: TYPE
      do
         l := left_side.specialize_2(type)
         r := right_side.specialize_2(type)
         l_dt := l.declaration_type
         r_dt := r.declaration_type
         if r.is_void then
            error_handler.add_position(right_side.start_position)
            error_handler.append("Void cannot be the right-hand side of a ")
            if forced_flag then
               error_handler.append("::= assignment (a forced assignment).")
            else
               error_handler.append("?=  assignment (an assignment attempt).")
            end
            error_handler.print_as_fatal_error
         elseif l_dt.is_expanded then
            error_handler.append("The left-hand side of ")
            if forced_flag then
               error_handler.append("::=")
            else
               error_handler.append("?=")
            end
            error_handler.append(" must not be expanded. (")
            error_handler.add_expression(left_side)
            error_handler.append(" is of type ")
            error_handler.add_type(l_dt)
            error_handler.append(".)")
            error_handler.add_position(start_position)
            error_handler.print_as_fatal_error
         elseif not l_dt.can_be_assigned_to(r_dt) then
            error_handler.add_position(left_side.start_position)
            error_handler.add_position(right_side.start_position)
            error_handler.append("Invalid ")
            if forced_flag then
               error_handler.append("forced assignment (%"::=%").")
            else
               error_handler.append("assignment attempt (%"?=%").")
            end
            error_handler.append(" The left-hand side expression must conform to the right-hand side. The expression ")
            error_handler.add_expression(left_side)
            error_handler.append(" is of type ")
            error_handler.append(l_dt.name.to_string)
            error_handler.append(" while the expression ")
            error_handler.add_expression(right_side)
            error_handler.append(" is of type ")
            error_handler.append(r_dt.name.to_string)
            error_handler.append(".")
            error_handler.print_as_fatal_error
         elseif r_dt.can_be_assigned_to(l_dt) and then left_side.written_declaration_type_mark.is_static then
            error_handler.add_position(left_side.start_position)
            error_handler.add_position(right_side.start_position)
            error_handler.append("The expression ")
            error_handler.add_expression(right_side)
            error_handler.append(" which is of type ")
            error_handler.append(r_dt.name.to_string)
            error_handler.append(" can be assigned into ")
            error_handler.add_expression(left_side)
            error_handler.append(" which is of type ")
            error_handler.append(l_dt.name.to_string)
            error_handler.append(" by using an ordinary %":=%" assignment ")
            if forced_flag then
               error_handler.append(" (%"::=%" is not necessary).")
            else
               error_handler.append(" (%"?=%" is not necessary).")
            end
            error_handler.print_as_warning
         end
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r, forced_flag)
         end
      end

   has_been_specialized: BOOLEAN is
      do
         Result := left_side.has_been_specialized
         Result := Result and right_side.has_been_specialized
      end

   safety_check (type: TYPE) is
      do
         right_side.safety_check(type)
      end

   pretty (indent_level: INTEGER) is
      local
         semi_colon_flag: BOOLEAN; expression_with_comment: EXPRESSION_WITH_COMMENT
      do
         pretty_printer.set_indent_level(indent_level)
         semi_colon_flag := pretty_printer.semi_colon_flag
         left_side.pretty(indent_level)
         if forced_flag then
            pretty_printer.put_string(once " ::= ")
         else
            pretty_printer.put_string(once " ?= ")
         end
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

   collect (t: TYPE): TYPE is
      local
         left_type, right_type: TYPE; left_live_type: LIVE_TYPE; right_rts: RUN_TIME_SET; i: INTEGER
      do
         left_type := left_side.collect(t)
         right_type := right_side.collect(t)
         if left_type.live_type = Void then
            -- It may be the time to actually collect the `left_side' LIVE_TYPE:
            if right_type.live_type /= Void then
               from
                  right_rts := right_type.live_type.run_time_set
                  i := 1
               until
                  left_live_type /= Void or else i > right_rts.count
               loop
                  if right_rts.item(i).type.can_be_assigned_to(left_type) then
                     -- It is the time to actually collect the corresponding LIVE_TYPE:
                     -- (Done in EFFECTIVE_ARG_LIST, ASSIGNMENT_ATTEMPT, ASSIGNMENT and CREATE_WRITABLE.)
                     left_live_type := smart_eiffel.collect_one_type(left_type, False)
                  end
                  i := i + 1
               end
            end
         end
         assignment_handler.collect_force(right_type, left_type)
      end

   adapt_for (t: TYPE): like Current is
      local
         l: like left_side; r: like right_side
      do
         l := left_side.adapt_for(t)
         r := right_side.adapt_for(t)
         if l = left_side and then r = right_side then
            Result := Current
         else
            create Result.make(l, r, forced_flag)
         end
      end

   accept (visitor: ASSIGNMENT_ATTEMPT_VISITOR) is
      do
         visitor.visit_assignment_attempt(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         rs: like right_side
      do
         code_accumulator.add_sedb(start_position, 'N')
         right_side.inline_dynamic_dispatch_(code_accumulator, type)
         rs := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if rs = right_side then
            code_accumulator.current_context.add_last(Current)
         else
            code_accumulator.current_context.add_last(create {like Current}.make(left_side, rs, forced_flag))
         end
      end

feature {}
   make (ls: like left_side; rs: like right_side; f: like forced_flag) is
      require
         ls /= Void
         rs /= Void
      do
         left_side := ls
         right_side := rs
         forced_flag := f
      end

invariant
   left_side.is_writable

   right_side /= Void

end -- class ASSIGNMENT_ATTEMPT
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
