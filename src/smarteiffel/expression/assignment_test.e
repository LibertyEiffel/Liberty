-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_TEST
   --
   -- Both for expressions like:
   --    foo  ?:= bar
   -- or:
   --    {FOO} ?:= bar
   --

inherit
   EXPRESSION

create {EIFFEL_PARSER, INTROSPECTION_HANDLER}
   with_writable, with_type_mark

create {ASSIGNMENT_TEST}
   make

feature {ANY}
   left_type_mark: TYPE_MARK
         -- When non Void, it is an expression like: {FOO} ?:= bar

   left_writable: EXPRESSION
         -- When non Void, it is an expression like:  foo  ?:= bar

   right_side: EXPRESSION
         -- The right-hand side.

   end_mark_comment: BOOLEAN False

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := right_side.side_effect_free(type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         if left_type_mark /= Void then
            Result := right_side.use_current(type)
         elseif left_writable.use_current(type) then
            Result := True
         else
            Result := right_side.use_current(type)
         end
      end

   simplify (type: TYPE): EXPRESSION
      local
         rs: like right_side; left_type, right_type: TYPE; right_run_time_set: RUN_TIME_SET
         counter1, counter2, i: INTEGER
      do
         if left_type_mark /= Void then
            left_type := left_type_mark.resolve_in(type)
         else
            left_type := left_writable.resolve_in(type)
         end
         rs := right_side.simplify(type)
         if rs.is_void then
            -- An assignment test with Void is always True:
            smart_eiffel.magic_count_increment
            create {E_TRUE} Result.make(start_position)
         else
            right_type := rs.resolve_in(type)
            if right_type.can_be_assigned_to(left_type) then
               -- Such a test is always True:
               smart_eiffel.magic_count_increment
               create {E_TRUE} Result.make(start_position)
            elseif rs.non_void_no_dispatch_type(type) /= Void then
               -- Because we are sure of the right-side dynamic TYPE:
               smart_eiffel.magic_count_increment
               if right_type.can_be_assigned_to(left_type) then
                  create {E_TRUE} Result.make(start_position)
               else
                  create {E_FALSE} Result.make(start_position)
               end
            elseif right_type.live_type = Void or else right_type.live_type.run_time_set.count = 0 then
               -- Right side can be only Void:
               smart_eiffel.magic_count_increment
               create {E_TRUE} Result.make(start_position)
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
                  -- They can be all assigned into the left-hand side:
                  smart_eiffel.magic_count_increment
                  create {E_TRUE} Result.make(start_position)
               elseif right_run_time_set.count = counter2 then
                  -- Conversely, all possibilities of the right-hand side are all non-assignable into
                  -- the left-hand side. We must still take care of the fact that the right-hand can be
                  -- non Void:
                  smart_eiffel.magic_count_increment
                  create {E_VOID} Result.make(start_position)
                  create {BUILT_IN_EQ_NEQ} Result.make_eq(rs, start_position, Result)
               elseif rs /= right_side then
                  smart_eiffel.magic_count_increment
                  create {ASSIGNMENT_TEST} Result.make(left_type_mark, left_writable, rs)
               else
                  Result := Current
               end
            end
         end
      end

   start_position: POSITION
      do
         if left_type_mark /= Void then
            Result := left_type_mark.start_position
         else
            Result := left_writable.start_position
         end
      end

   specialize_in (type: TYPE): like Current
      local
         lw: like left_writable; rs: like right_side
      do
         if left_type_mark /= Void then
            left_type_mark.specialize_in(type)
         else
            lw := left_writable.specialize_in(type)
         end
         rs := right_side.specialize_in(type)
         if lw = left_writable and then rs = right_side then
            Result := Current
         else
            create Result.make(left_type_mark, lw, rs)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         ltm: like left_type_mark; lw: like left_writable; rs: like right_side
      do
         if left_type_mark /= Void then
            ltm := left_type_mark.specialize_thru(parent_type, parent_edge, new_type)
         else
            lw := left_writable.specialize_thru(parent_type, parent_edge, new_type)
         end
         rs := right_side.specialize_thru(parent_type, parent_edge, new_type)
         if ltm = left_type_mark and then lw = left_writable and then rs = right_side then
            Result := Current
         else
            create Result.make(ltm, lw, rs)
         end
      end

   specialize_and_check (type: TYPE): like Current
      local
         lw: like left_writable; rs: like right_side; l_dt, r_dt: TYPE
      do
         if left_writable /= Void then
            lw := left_writable.specialize_and_check(type)
         end
         rs := right_side.specialize_and_check(type)
         if left_type_mark /= Void then
            l_dt := left_type_mark.resolve_in(type)
         else
            l_dt := lw.declaration_type
         end
         if l_dt.is_expanded then
            error_handler.append(once "The left-hand side of an assignment attempt must not be expanded. %
                                 %(Actually, the left-hand side is of type ")
            error_handler.add_type(l_dt)
            error_handler.append(once ".) Invalid assignment test.")
            error_handler.add_position(start_position)
            error_handler.print_as_fatal_error
         elseif rs.is_void then
            error_handler.add_position(right_side.start_position)
            error_handler.append(once "Void must not be the right-hand side of an assignment test (always True).")
            error_handler.print_as_fatal_error
         else
            r_dt := rs.declaration_type
            if not l_dt.can_be_assigned_to(r_dt) then
               error_handler.add_position(start_position)
               error_handler.add_position(right_side.start_position)
               error_handler.append(once "Invalid assignment test. The left-hand side expression must conforms %
                                    %with the right-hand side. The left-hand side is of type ")
               error_handler.append(l_dt.name.to_string)
               error_handler.append(once " while expression ")
               error_handler.add_expression(right_side)
               error_handler.append(once " is of type ")
               error_handler.append(r_dt.name.to_string)
               error_handler.append(once ".")
               error_handler.print_as_fatal_error
            elseif r_dt.can_be_assigned_to(l_dt) and then static_left_type_mark(lw) then
               error_handler.add_position(start_position)
               error_handler.add_position(right_side.start_position)
               error_handler.append(once "Expression ")
               error_handler.add_expression(right_side)
               error_handler.append(once " which is of type ")
               error_handler.append(r_dt.name.to_string)
               error_handler.append(once " can be normally assigned into the left-hand side which is of type ")
               error_handler.append(l_dt.name.to_string)
               error_handler.append(once ". (This assignment test is always True.)")
               error_handler.print_as_warning
            end
         end
         if lw = left_writable and then rs = right_side then
            Result := Current
         else
            create Result.make(left_type_mark, lw, rs)
         end
      end

   has_been_specialized: BOOLEAN
      do
         if left_type_mark /= Void then
            Result := left_type_mark.has_been_specialized
         else
            Result := left_writable.has_been_specialized
         end
         Result := Result and right_side.has_been_specialized
      end

   safety_check (type: TYPE)
      do
         right_side.safety_check(type)
      end

   pretty (indent_level: INTEGER)
      local
         buffer: STRING
      do
         if left_type_mark /= Void then
            pretty_printer.put_character('{')
            buffer := once "........................"
            buffer.clear_count
            left_type_mark.pretty_in(buffer)
            pretty_printer.put_string(buffer)
            pretty_printer.put_character('}')
         else
            left_writable.pretty(indent_level)
         end
         pretty_printer.put_string(once " ?:= ")
         right_side.pretty(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
      end

   pretty_target (indent_level: INTEGER)
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   collect (type: TYPE): TYPE
      local
         left_type, right_type: TYPE
      do
         if left_type_mark /= Void then
            left_type := left_type_mark.resolve_in(type)
         else
            left_type := left_writable.collect(type)
         end
         right_type := right_side.collect(type)
         assignment_test_pool.collect(left_type, right_type)
         Result := resolve_in(type)
      end

   adapt_for (type: TYPE): like Current
      local
         lw: like left_writable; rs: like right_side
      do
         if left_writable /= Void then
            lw := left_writable.adapt_for(type)
         end
         rs := right_side.adapt_for(type)
         if lw = left_writable and then rs = right_side then
            Result := Current
         else
            create Result.make(left_type_mark, lw, rs)
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         Result := declaration_type
      end

   declaration_type: TYPE
      once
         Result := smart_eiffel.type_boolean
      end

   written_declaration_type_mark: TYPE_MARK
      once
         Result := declaration_type.canonical_type_mark
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := declaration_type
      end

   accept (visitor: ASSIGNMENT_TEST_VISITOR)
      do
         visitor.visit_assignment_test(Current)
      end

   short (type: TYPE)
      do
         if left_type_mark /= Void then
            left_type_mark.short(type)
         else
            left_writable.short(type)
         end
         short_printer.hook_or(once "asntst", once " ?:= ")
         right_side.short(type)
         end

   short_target (type: TYPE)
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   precedence: INTEGER 2

   is_manifest_string: BOOLEAN False
   is_result: BOOLEAN False
   is_implicit_current: BOOLEAN False
   extra_bracket_flag: BOOLEAN True
   is_static: BOOLEAN False
   is_writable: BOOLEAN False
   is_void: BOOLEAN False
   is_current: BOOLEAN False

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         rs: like right_side
      do
         right_side.inline_dynamic_dispatch_(code_accumulator, type)
         rs := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if rs = right_side then
            code_accumulator.current_context.add_last(Current)
         else
            code_accumulator.current_context.add_last(create {like Current}.make(left_type_mark, left_writable, rs))
         end
      end

feature {}
   with_writable (lw: like left_writable; rs: like right_side)
      require
         lw /= Void
         rs /= Void
      do
         left_writable := lw
         right_side := rs
      ensure
         left_writable = lw
         right_side = rs
      end

   with_type_mark (ltm: like left_type_mark; rs: like right_side)
      require
         ltm /= Void
         rs /= Void
      do
         left_type_mark := ltm
         right_side := rs
      ensure
         left_type_mark = ltm
         right_side = rs
      end

   make (ltm: like left_type_mark; lw: like left_writable; rs: like right_side)
      require
         ltm /= Void xor lw /= Void
         rs /= Void
      do
         left_type_mark := ltm
         left_writable := lw
         right_side := rs
      ensure
         left_type_mark = ltm
         left_writable = lw
         right_side = rs
      end

   static_left_type_mark (lw: like left_writable): BOOLEAN
      do
         if lw /= Void then
            Result := lw.written_declaration_type_mark.is_static
         else
            Result := left_type_mark.is_static
         end
      end

invariant
   left_writable /= Void implies left_writable.is_writable

   left_writable = Void xor left_type_mark = Void

   right_side /= Void

end -- class ASSIGNMENT_TEST
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
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
