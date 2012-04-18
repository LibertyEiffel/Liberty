-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BUILT_IN_EQ_NEQ
   --
   -- For the built-in "=" and "/=" operators.
   --

inherit
   EXPRESSION

creation
   make_eq, make_neq

feature {ANY}
   eq_flag: BOOLEAN
         -- True indicate that it is the "=" operator (otherwise, it is a "/=").

   operator_position: POSITION
         -- To show the "/=" or the "=".

   left_side: EXPRESSION
         -- The right-hand side part.

   right_side: EXPRESSION
         -- The left-hand side part.

   precedence: INTEGER is 6

   is_writable: BOOLEAN is False

   is_current: BOOLEAN is False

   is_implicit_current: BOOLEAN is False

   is_manifest_string: BOOLEAN is False

   is_result: BOOLEAN is False

   is_void: BOOLEAN is False

   start_position: POSITION is
      do
         Result := left_side.start_position
      end

   is_static: BOOLEAN is
      do
         Result := left_side.is_static and then right_side.is_static
      end

   extra_bracket_flag: BOOLEAN is True

   short (type: TYPE) is
      do
         if left_side.precedence = atomic_precedence then
            left_side.short(type)
         elseif precedence > left_side.precedence then
            left_side.bracketed_short(type)
         elseif precedence < left_side.precedence then
            left_side.short(type)
         else
            left_side.short(type)
         end
         short_printer.hook_or(once "Binfix", once " ")
         if not eq_flag then
            short_printer.put_character('/')
         end
         short_printer.put_character('=')
         short_printer.hook_or(once "Ainfix", once " ")
         if right_side.precedence = atomic_precedence then
            right_side.short(type)
         elseif precedence > right_side.precedence then
            right_side.bracketed_short(type)
         elseif precedence < right_side.precedence then
            right_side.short(type)
         else
            right_side.bracketed_short(type)
         end
      end

   short_target (type: TYPE) is
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   pretty_target (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   bracketed_pretty (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty (indent_level: INTEGER) is
      do
         -- The `left_side' first:
         if left_side.precedence = atomic_precedence then
            left_side.pretty(indent_level)
         elseif precedence > left_side.precedence then
            left_side.bracketed_pretty(indent_level)
         elseif precedence < left_side.precedence then
            left_side.pretty(indent_level)
         else
            left_side.pretty(indent_level)
         end
         -- The operator:
         pretty_printer.put_character(' ')
         if eq_flag then
            pretty_printer.put_string(once "=")
         else
            pretty_printer.put_string(once "/=")
         end
         pretty_printer.put_character(' ')
         -- The `right_side':
         if right_side.precedence = atomic_precedence then
            right_side.pretty(indent_level)
         elseif precedence > right_side.precedence then
            right_side.bracketed_pretty(indent_level)
         elseif precedence < right_side.precedence then
            right_side.pretty(indent_level)
         else
            right_side.bracketed_pretty(indent_level)
         end
      end

   declaration_type: TYPE is
      once -- <-- Yes it is once
         Result := smart_eiffel.type_boolean
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := left_side.side_effect_free(type) and then right_side.side_effect_free(type)
      end

   specialize_in (type: TYPE): like Current is
      local
         ls: like left_side; rs: like right_side
      do
         ls := left_side.specialize_in(type)
         rs := right_side.specialize_in(type)
         if ls = left_side and then rs = right_side then
            Result := Current
         else
            Result := twin
            Result.set_left_and_right(ls, rs)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         ls: like left_side; rs: like right_side
      do
         ls := left_side.specialize_thru(parent_type, parent_edge, new_type)
         rs := right_side.specialize_thru(parent_type, parent_edge, new_type)
         if ls = left_side and then rs = right_side then
            Result := Current
         else
            Result := twin
            Result.set_left_and_right(ls, rs)
         end
      end

   specialize_2 (type: TYPE): like Current is
      local
         ls: like left_side; rs: like right_side
      do
         ls := left_side.specialize_2(type)
         rs := right_side.specialize_2(type)
         if ls.is_void then
            void_comparison_check(type, ls.start_position, rs)
         elseif rs.is_void then
            void_comparison_check(type, ls.start_position, ls)
         else
            specialize_2_standard_comparison_check(ls, rs, type)
         end
         if ls = left_side and then rs = right_side then
            Result := Current
         else
            Result := twin
            Result.set_left_and_right(ls, rs)
         end
      end

   has_been_specialized: BOOLEAN is
      do
         Result := left_side.has_been_specialized and then right_side.has_been_specialized
      end

   simplify (type: TYPE): EXPRESSION is
      local
         ls: like left_side; rs: like right_side; built_in_eq_neq: BUILT_IN_EQ_NEQ
      do
         --|*** (PR 21/09/04) remove not on boolean. Ex: "ls = not rs" should be turned into "ls /= rs"
         ls := left_side.simplify(type)
         rs := right_side.simplify(type)
         Result := simplify_boolean_constant(ls, rs)
         if Result = Void then
            Result := simplify_boolean_constant(rs, ls)
         end
         if Result = Void then
            Result := simplify_void(type, ls, rs)
         end
         if Result = Void then
            Result := simplify_void(type, rs, ls)
         end
         if Result = Void then
            Result := simplify_character_constant(ls, rs)
         end
         if Result = Void then
            Result := simplify_integer_real(ls, rs)
         end
         if Result = Void then
            Result := simplify_null_pointer(ls, rs)
         end
         -- Finally, the general scheme:
         if Result = Void then
            if ls = left_side and then rs = right_side then
               Result := Current
            else
               built_in_eq_neq := twin
               built_in_eq_neq.set_left_and_right(ls, rs)
               Result := built_in_eq_neq
            end
         end
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := left_side.use_current(type) or else right_side.use_current(type)
      end

   collect (type: TYPE): TYPE is
      local
         dummy: TYPE
      do
         if not left_side.is_void then
            dummy := left_side.collect(type)
         end
         if not right_side.is_void then
            dummy := right_side.collect(type)
         end
         Result := declaration_type
      end

   adapt_for (type: TYPE): like Current is
      local
         ls: like left_side; rs: like right_side
      do
         ls := left_side.adapt_for(type)
         rs := right_side.adapt_for(type)
         if ls = left_side and then rs = right_side then
            Result := Current
         else
            Result := twin
            Result.set_left_and_right(ls, rs)
         end
      end

   safety_check (type: TYPE) is
      do
         left_side.safety_check(type)
         right_side.safety_check(type)
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result :=  resolve_in(type)
      end

   compile_to_jvm (type: TYPE) is
      local
         point1, point2: INTEGER; left_type, right_type: TYPE; lt: LIVE_TYPE
      do
         if left_side.is_void then
            jvm_void_cmp(type, right_side)
         elseif right_side.is_void then
            jvm_void_cmp(type, left_side)
         else
            left_type := left_side.resolve_in(type)
            left_side.compile_to_jvm(type)
            right_side.compile_to_jvm(type)
            if left_type.is_user_expanded then
               lt := left_type.live_type
               jvm.std_is_equal(lt, lt.writable_attributes)
            else
               right_type := right_side.resolve_in(type)
               if left_type.jvm_stack_space /= right_type.jvm_stack_space then
                  if left_type.jvm_stack_space < right_type.jvm_stack_space then
                     jvm.kernel_expanded_convert(left_type, right_type)
                     left_type := right_type
                  else
                     jvm.kernel_expanded_convert(right_type, left_type)
                  end
               end
               point1 := left_type.canonical_type_mark.jvm_if_x_eq
               if eq_flag then
                  code_attribute.opcode_bipush(0)
               else
                  code_attribute.opcode_bipush(1)
               end
               point2 := code_attribute.opcode_goto
               code_attribute.resolve_u2_branch(point1)
               if eq_flag then
                  code_attribute.opcode_bipush(1)
               else
                  code_attribute.opcode_bipush(0)
               end
               code_attribute.resolve_u2_branch(point2)
            end
         end
      end

   compile_target_to_jvm (type: TYPE) is
      do
         standard_compile_target_to_jvm(type)
      end

   jvm_branch_if_false (type: TYPE): INTEGER is
      do
         Result := jvm_standard_branch_if_false(type)
      end

   jvm_branch_if_true (type: TYPE): INTEGER is
      do
         Result := jvm_standard_branch_if_true(type)
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   accept (visitor: BUILT_IN_EQ_NEQ_VISITOR) is
      do
         visitor.visit_built_in_eq_neq(Current)
      end

feature {E_FUNCTION}
   inline_with (new_left_side, new_right_side: EXPRESSION): like Current is
      require
         new_left_side /= Void
         new_right_side /= Void
      do
         Result := twin
         Result.set_left_and_right(new_left_side, new_right_side)
      end

feature {BUILT_IN_EQ_NEQ}
   set_left_and_right (ls: like left_side; rs: like right_side) is
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

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      local
         ls: like left_side; rs: like right_side; built_in_eq_neq: like Current
      do
         left_side.inline_dynamic_dispatch_(code_accumulator, type)
         ls:= code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         right_side.inline_dynamic_dispatch_(code_accumulator, type)
         rs:= code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if ls = left_side and then rs = right_side then
            code_accumulator.current_context.add_last(Current)
         else
            built_in_eq_neq := twin
            built_in_eq_neq.set_left_and_right(ls, rs)
            code_accumulator.current_context.add_last(built_in_eq_neq)
         end
      end

feature {}
   basic_make (flag: like eq_flag; ls: like left_side; op: like operator_position; rs: like right_side) is
      require
         ls /= Void
         not op.is_unknown
         rs /= Void
      do
         left_side := ls
         eq_flag := flag
         operator_position := op
         right_side := rs
      ensure
         eq_flag = flag
         left_side = ls
         operator_position = op
         right_side = rs
      end

   make_eq (ls: like left_side; op: like operator_position; rs: like right_side) is
      do
         basic_make(True, ls, op, rs)
      end

   make_neq (ls: like left_side; op: like operator_position; rs: like right_side) is
      do
         basic_make(False, ls, op, rs)
      end

   simplify_boolean_constant (e1, e2: EXPRESSION): EXPRESSION is
         -- To simplify comparison with True / False.
      require
         e1 /= Void
         e2 /= Void
      local
         bc1, bc2: BOOLEAN_CONSTANT
      do
         if bc1 ?:= e1 then
            bc1 ::= e1
            if bc1.value and then eq_flag then
               smart_eiffel.magic_count_increment
               Result := e2
            elseif not bc1.value and then (not eq_flag) then
               smart_eiffel.magic_count_increment
               Result := e2
            else
               if bc2 ?:= e2 then
                  bc2 ::= e2
                  smart_eiffel.magic_count_increment
                  if eq_flag then
                     Result := true_or_false(bc1.value = bc2.value)
                  else
                     Result := true_or_false(bc1.value /= bc2.value)
                  end
               end
            end
         end
      end

   simplify_character_constant (e1, e2: EXPRESSION): EXPRESSION is
      local
         cc1, cc2: CHARACTER_CONSTANT
      do
         if cc1 ?:= e1 then
            cc1 ::= e1
            if cc2 ?:= e2 then
               cc2 ::= e2
               smart_eiffel.magic_count_increment
               if eq_flag then
                  Result := true_or_false(cc1.value = cc2.value)
               else
                  Result := true_or_false(cc1.value /= cc2.value)
               end
            end
         end
      end

   simplify_void (type: TYPE; e1, e2: EXPRESSION): EXPRESSION is
      local
         non_void_type, always_void_type: TYPE
      do
         if e1.is_void then
            if e2.is_void then
               smart_eiffel.magic_count_increment
               Result := true_or_false(eq_flag)
            elseif e2.is_current then
               smart_eiffel.magic_count_increment
               Result := true_or_false(not eq_flag)
            elseif e2.is_manifest_string then
               smart_eiffel.magic_count_increment
               Result := true_or_false(not eq_flag)
            else
               always_void_type := e2.resolve_in(type)
               if always_void_type.is_expanded and then e2.side_effect_free(type) then
                  smart_eiffel.magic_count_increment
                  Result := true_or_false(not eq_flag)
               elseif always_void_type.is_always_void and then e2.side_effect_free(type) then
                  smart_eiffel.magic_count_increment
                  Result := true_or_false(eq_flag)
               elseif {NON_VOID_NO_DISPATCH} ?:= e2 then
                  Result := true_or_false(not eq_flag)
               else
                  non_void_type := e2.non_void_no_dispatch_type(type)
                  if non_void_type /= Void then
                     if precomputable_routine_detector.can_be_dropped(type, non_void_type, e2) then
                        smart_eiffel.magic_count_increment
                        Result := true_or_false(not eq_flag)
                     end
                  end
               end
            end
         end
      end

   simplify_integer_real (e1, e2: EXPRESSION): EXPRESSION is
      local
         ic1, ic2: INTEGER_CONSTANT; rc1, rc2: REAL_CONSTANT
      do
         if ic1 ?:= e1 then
            ic1 ::= e1
            if ic2 ?:= e2 then
               ic2 ::= e2
               smart_eiffel.magic_count_increment
               if ic1.value_memory = ic2.value_memory then
                  Result := true_or_false(eq_flag)
               else
                  Result := true_or_false(not eq_flag)
               end
            end
         else
            if rc1 ?:= e1 then
               rc1 ::= e1
               if rc2 ?:= e2 then
                  rc2 ::= e2
                  smart_eiffel.magic_count_increment
                  if rc1.normalized_view.is_equal(rc2.normalized_view) then
                     Result := true_or_false(eq_flag)
                  else
                     Result := true_or_false(not eq_flag)
                  end
               end
            end
         end
      end

   simplify_null_pointer (e1, e2: EXPRESSION): EXPRESSION is
      local
         np1, np2: NULL_POINTER
      do
         if np1 ?:= e1 then
            np1 ::= e1
            if np2 ?:= e2 then
               np2 ::= e2
               smart_eiffel.magic_count_increment
               Result := true_or_false(eq_flag)
            end
         end
      end

   void_comparison_check (type: TYPE; void_position: POSITION; expression: EXPRESSION) is
         -- Check what has to be checked when the `expression' is compared with Void.
      require
         not void_position.is_unknown
         expression /= Void
      local
         dt: like declaration_type
      do
         check
            -- Because this is already checked in the parser:
            not expression.is_current
         end
         -- The check must be done only for the written site:
         if void_position.class_text = type.class_text then
            dt := expression.declaration_type
            if dt.is_expanded then
               error_handler.append("Such a weird comparison with Void is not allowed because it would be always ")
               if eq_flag then
                  error_handler.append(fz_false)
               else
                  error_handler.append(fz_true)
               end
               error_handler.append(". (See explaination below.)")
               error_handler.add_position(operator_position)
               error_handler.print_as_error
               error_handler.append("The declaration type of ")
               error_handler.add_expression(expression)
               error_handler.append(" is obviously expanded (i.e. the written type mark is %"")
               error_handler.append(dt.name.to_string)
               error_handler.append("%"). You can use the Void comparison only when other type mark is a reference type or, %
               %if it is an expanded type, it must be an anchor or some formal generic argument. %
               %Fix this error first.")
               error_handler.add_position(start_position)
               error_handler.print_as_fatal_error
            end
         end
      end

   specialize_2_standard_comparison_check (t, arg: EXPRESSION; type: TYPE) is
      require
         not t.is_void
         not arg.is_void
      local
         t1, t2: TYPE; error_flag: BOOLEAN; written_site: STRING
      do
         t1 := t.resolve_in(type)
         t2 := arg.resolve_in(type)
         if t1.is_expanded xor t2.is_expanded then
            written_site := start_position.class_text.name.to_string
            if written_site = as_integer_general or else written_site = as_real_general then
               -- Relaxed rule to share more code in INTEGER_* and REAL_*.
            else
               sedb_breakpoint
               error_handler.append("Cannot compare an expanded expression with a reference expression.")
               error_handler.add_position(operator_position)
               error_handler.append(" Expression ")
               error_handler.add_expression(left_side)
               error_handler.append(" is of type ")
               error_handler.append(t1.name.to_string)
               error_handler.append(" while expression ")
               error_handler.add_expression(right_side)
               error_handler.append(" is of type ")
               error_handler.append(t2.name.to_string)
               error_handler.append(".")
               if type.class_text /= left_side.start_position.class_text then
                  error_handler.append(" (Error occurs while checking the code in ")
                  error_handler.append(type.name.to_string)
                  error_handler.append(" context.)")
               end
               error_handler.print_as_fatal_error
            end
         end
         if t1.can_be_assigned_to(t2) or else t2.can_be_assigned_to(t1) then
            -- (We only allow reasonable comparisons.)
         elseif t1.is_expanded or else t2.is_expanded then
            error_handler.add_position(operator_position)
            error_handler.append("An expanded value can be compared only with the same other expanded %
                                 %value. Expression ")
            error_handler.add_expression(left_side)
            error_handler.append(" is of type ")
            error_handler.append(t1.name.to_string)
            error_handler.append(" while expression ")
            error_handler.add_expression(right_side)
            error_handler.append(" is of type ")
            error_handler.append(t2.name.to_string)
            error_handler.append(". Comparison not allowed (VWEQ).")
            error_handler.print_as_fatal_error
         else
            if type.class_text = operator_position.class_text then
               -- The strict rule is relaxed when the code is inherited. As an example, STACK insert
               -- COLLECTION and some assertions are normally always True (or False).
               error_flag := True
            end
            if error_flag then
               error_handler.add_position(operator_position)
               error_handler.append("Invalid comparison of expression ")
               error_handler.add_expression(left_side)
               error_handler.append(" which is of type ")
               error_handler.append(t1.name.to_string)
               error_handler.append(" with expression ")
               error_handler.add_expression(right_side)
               error_handler.append(" which is of type ")
               error_handler.append(t2.name.to_string)
               error_handler.append(". (This would always yield to a ")
               if eq_flag then
                  error_handler.append("False")
               else
                  error_handler.append("True")
               end
               error_handler.append(" result.) (VWEQ)")
               error_handler.print_as_fatal_error
            end
         end
      end

   true_or_false (boolean: BOOLEAN): EXPRESSION is
         -- (Often used by simplify.)
      do
         if boolean then
            create {E_TRUE} Result.make(operator_position)
         else
            create {E_FALSE} Result.make(operator_position)
         end
      end

   jvm_void_cmp (type: TYPE; e: EXPRESSION) is
      local
         point1, point2: INTEGER
      do
         if e.resolve_in(type).is_expanded then
            if eq_flag then
               code_attribute.opcode_iconst_0
            else
               code_attribute.opcode_iconst_1
            end
         else
            e.compile_to_jvm(type)
            if eq_flag then
               point1 := code_attribute.opcode_ifnull
            else
               point1 := code_attribute.opcode_ifnonnull
            end
            code_attribute.opcode_iconst_0
            point2 := code_attribute.opcode_goto
            code_attribute.resolve_u2_branch(point1)
            code_attribute.opcode_iconst_1
            code_attribute.resolve_u2_branch(point2)
         end
      end

invariant
   left_side /= Void

   right_side /= Void

end -- class BUILT_IN_EQ_NEQ
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
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
