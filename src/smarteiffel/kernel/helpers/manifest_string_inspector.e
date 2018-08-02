-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_STRING_INSPECTOR
   --|
   --| *** I am quite sure that this class is not so useful. All the stuff should be now included into
   --| the INSPECT_STATEMENT class. Please, consider do the removal job... or replace this comment
   --| with an explanation telling us why this MANIFEST_STRING_INSPECTOR is still useful.
   --| *** Dom. May 20th 2008 ***
   --|
   --| Dominique is right (once again). This object has no own state but borrows its state from its
   --| INSPECT_STATEMENT owner.
   --| *** CAD October 24th 2013 ***
   --|

insert
   GLOBALS

create {ANY}
   make

feature {INSPECT_STATEMENT_VISITOR}
   string_pool: TUPLE_STRING_POOL

   headers: FAST_ARRAY[STRING]

   has_empty: BOOLEAN
      local
         unknown_position: POSITION
      do
         Result := empty_position /= unknown_position
      end

feature {}
   start_position: POSITION

   make (ei: INSPECT_STATEMENT)
      require
         ei /= Void
      local
         when_list: FAST_ARRAY[WHEN_CLAUSE]; val: FAST_ARRAY[WHEN_ITEM]; i, j, n: INTEGER; wi1: WHEN_ITEM_1
         s: STRING; ms: MANIFEST_STRING
      do
         start_position := ei.start_position
         create headers.make(0)
         when_list := ei.when_list
         from
            n := when_list.count - 1
            i := 0
         until
            i > n
         loop
            val := when_list.item(i).list
            from
               j := val.lower
            until
               j > val.upper
            loop
               if not wi1 ?:= val.item(j) then
                  error_handler.add_position(ei.start_position)
                  error_handler.add_position(val.item(j).start_position)
                  error_handler.append(once "Using range inside inspect of type STRING is not possible.")
                  error_handler.print_as_fatal_error
               else
                  wi1 ::= val.item(j)
                  if not (ms ?:= wi1.expression) then
                     error_handler.add_position(ei.start_position)
                     error_handler.add_position(wi1.start_position)
                     error_handler.append(once "Only manifest strings are accepted in %"when%" clauses of%
                                          % %"inspect%" (in order to ensure that the STRING %
                                          %won't change at runtime). Note that even a constant of %
                                          %type STRING can have its content changed at runtime.")
                     error_handler.print_as_fatal_error
                  else
                     ms ::= wi1.expression
                     s := ms.to_string
                     if headers.has(s) then
                        error_handler.add_position(ei.start_position)
                        error_handler.add_position(ms.start_position)
                        error_handler.append(once "Second occurrence of this value (%"")
                        error_handler.append(s)
                        error_handler.append(once "%") in the same inspect.")
                        error_handler.print_as_fatal_error
                     elseif s.is_empty then
                        empty_position := ms.start_position
                        empty_index := i
                     end
                     wi1.set_expression_value(headers.count)
                     headers.add_last(s)
                  end
               end
               j := j + 1
            end
            i := i + 1
         end
         if not ace.boost then
            -- in boost the string pool is not used --- see `inline_inspect'
            create string_pool.from_collection(headers)
            debug
               from
                  i := headers.lower
               until
                  i > headers.upper
               loop
                  echo.put_string(once "checking header#")
                  echo.put_integer(i)
                  echo.put_string(once ": %"")
                  echo.put_string(headers.item(i))
                  echo.put_string(once "%"%N")
                  check
                     string_pool.index_of(headers.item(i)) = i
                  end
                  i := i + 1
               end
            end
            check
               has_empty = string_pool.has_empty
            end
         end
      end

   empty_position: POSITION
   empty_index: INTEGER

feature {INSPECT_STATEMENT}
   simplify (type: TYPE; inspect_statement: INSPECT_STATEMENT): INSTRUCTION
      local
         exp, count_call, local_expression: EXPRESSION; assign_expression, string_inspect: INSTRUCTION
         item_call: FUNCTION_CALL_1; i, s, c: INTEGER; inspect_compound, compound: COMPOUND
         when_clause: WHEN_CLAUSE; state_inspect: OTHER_INSPECT_STATEMENT; state_local: INTERNAL_LOCAL2
         if_empty: IFTHENELSE; is_empty_call: FUNCTION_CALL_0
         empty_string_compound: INSTRUCTION
      do
         exp := inspect_statement.expression.simplify(type)
         if exp.is_stored_in_some_local_variable then
            local_expression := exp
         else
            local_expression := create {INTERNAL_LOCAL2}.make(exp.start_position, exp, once "inspectManifestStringExpression", True)
            create {ASSIGNMENT} assign_expression.inline_make(local_expression, exp)
         end
         create state_local.make(exp.start_position, create {INTEGER_CONSTANT}.make(32768, exp.start_position), once "state", False)
         is_empty_call := inspect_statement.is_empty_call(type, local_expression)
         item_call := inspect_statement.item_call(type, local_expression)
         count_call := inspect_statement.count_call(type, local_expression)
         string_inspect := inline_inspect(type, state_local, item_call, count_call, once "", inspect_statement.start_position)
         create state_inspect.make(inspect_statement.start_position, state_local)
         from
            s := 1
            i := inspect_statement.when_list.lower
         until
            i > inspect_statement.when_list.upper
         loop
            create when_clause.make(state_inspect, inspect_statement.when_list.item(i).start_position, inspect_statement.when_list.item(i).header_comment)
            c := inspect_statement.when_list.item(i).list.count
            if c = 1 then
               when_clause.add_value(create {INTEGER_CONSTANT}.make(s, inspect_statement.when_list.item(i).start_position))
               s := s + 1
            else
               when_clause.add_slice(create {INTEGER_CONSTANT}.make(s, inspect_statement.when_list.item(i).start_position),
                                     create {INTEGER_CONSTANT}.make(s + c - 1, inspect_statement.when_list.item(i).start_position))
               s := s + c
            end
            when_clause.set_compound(inspect_statement.when_list.item(i).compound)
            i := i + 1
         end
         if not inspect_statement.else_position.is_unknown then
            state_inspect.set_else_compound(inspect_statement.else_position, inspect_statement.else_compound)
         end
         state_inspect.force_internal_values(type)
         create inspect_compound.make_2(string_inspect, state_inspect)
         if has_empty then
            empty_string_compound := inspect_statement.when_list.item(empty_index).compound
         else
            empty_string_compound := inspect_statement.else_compound
         end
         create if_empty.with_else(exp.start_position, is_empty_call, empty_string_compound, inspect_compound)
         if assign_expression = Void then
            Result := if_empty.simplify(type)
         else
            create compound.make_2(assign_expression, if_empty)
            Result := compound.simplify(type)
         end
         smart_eiffel.magic_count_increment
      end

feature {}
   inline_inspect (type: TYPE; state_local: INTERNAL_LOCAL2; item_call: FUNCTION_CALL_1; count_call: EXPRESSION;
                   a_prefix: STRING; pos: POSITION): INSTRUCTION
      local
         i_call: FUNCTION_CALL_1
         args: EFFECTIVE_ARG_LIST_N
         then_compound, else_compound, when_compound: INSTRUCTION; ifthenelse: IFTHENELSE
         inspect_chars: OTHER_INSPECT_STATEMENT; eq: BUILT_IN_EQ_NEQ
         when_clause: WHEN_CLAUSE
         level, i, full_index: INTEGER; c: CHARACTER; chars, pfx, full: STRING
      do
         level := a_prefix.count

         -- Which characters are available with the given prefix?
         chars := strings.new
         from
            i := headers.lower
         until
            i > headers.upper
         loop
            if headers.item(i).has_prefix(a_prefix) then
               if headers.item(i).count = level then
                  full := headers.item(i)
                  full_index := i
               elseif level < headers.item(i).count then
                  c := headers.item(i).item(level + 1)
                  if not chars.has(c) then
                     chars.add_last(c)
                  end
               end
            end
            i := i + 1
         end

         -- We begin to define the else_compound, which may contain nested inspect statements
         if chars.is_empty then
            -- No character is available to the chars set; so the else_compound is simply to set the state to
            -- 0 (not found).
            create {ASSIGNMENT} else_compound.inline_make(state_local, create {INTEGER_CONSTANT}.make(0, pos))
         else
            create args.make_1(start_position, create {INTEGER_CONSTANT}.make(level + 1, pos))
            i_call := item_call.twin
            i_call.set_arguments(args)
            if chars.count = 1 then
               -- Only one character is available; either it is it, or not.
               c := chars.first
               pfx := strings.new_twin(a_prefix)
               pfx.extend(c)
               create eq.make_eq(i_call, pos, create {CHARACTER_CONSTANT}.with(pos, c))
               when_compound := inline_inspect(type, state_local, i_call, count_call, pfx, pos)
               create ifthenelse.with_else(pos, eq,
                                           when_compound,
                                           create {ASSIGNMENT}.inline_make(state_local, create {INTEGER_CONSTANT}.make(0, pos)))
               else_compound := ifthenelse
               strings.recycle(pfx)
            else
               -- General case: we must generate a characters inspect.
               create inspect_chars.make(pos, i_call)
               pfx := strings.best_fit(level + 1)
               pfx.copy(a_prefix)
               pfx.extend('%U')
               from
                  i := chars.lower
               until
                  i > chars.upper
               loop
                  c := chars.item(i)
                  pfx.put(c, level + 1)
                  when_compound := inline_inspect(type, state_local, i_call, count_call, pfx, pos)
                  create when_clause.make(inspect_chars, pos, Void)
                  when_clause.add_value(create {CHARACTER_CONSTANT}.with(pos, c))
                  when_clause.set_compound(when_compound)
                  i := i + 1
               end
               strings.recycle(pfx)
               inspect_chars.set_else_compound(pos,
                                               create {ASSIGNMENT}.inline_make(state_local, create {INTEGER_CONSTANT}.make(0, pos)))
               -- fix the inspect statement values
               inspect_chars.force_internal_values(type)
               else_compound := inspect_chars
            end
         end
         if full = Void then
            -- There is no terminal solution here; either we go on; or the state is 0 (not found).
            Result := else_compound
         else
            -- There is a terminal solution; we must test the count of the exp before concluding. Hence the
            -- if-then-else.
            create {ASSIGNMENT} then_compound.inline_make(state_local, create {INTEGER_CONSTANT}.make(full_index + 1, pos))
            create eq.make_eq(count_call, pos, create {INTEGER_CONSTANT}.make(level, pos))
            create ifthenelse.with_else(pos, eq, then_compound, else_compound)
            Result := ifthenelse
         end
         strings.recycle(chars)
      ensure
         a_prefix.is_equal(old (a_prefix.twin))
      end

end -- class MANIFEST_STRING_INSPECTOR
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
