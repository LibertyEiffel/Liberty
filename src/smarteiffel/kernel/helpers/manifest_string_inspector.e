-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_STRING_INSPECTOR
	--
	-- *** I am quite sure that this class is not so useful. All the stuff should be now included into 
	-- the INSPECT_STATEMENT class. Please, consider do the removal job... or replace this comment 
	-- with an explaination telling us why this MANIFEST_STRING_INSPECTOR is still useful.
	-- *** Dom. May 20th 2008 ***
	--
insert
	GLOBALS

creation {ANY}
	make

feature {}
	string_pool: TUPLE_STRING_POOL

	headers: FAST_ARRAY[STRING]

	make (ei: INSPECT_STATEMENT) is
		require
			ei /= Void
		local
			when_list: FAST_ARRAY[WHEN_CLAUSE]; val: FAST_ARRAY[WHEN_ITEM]; i, j, n: INTEGER; wi1: WHEN_ITEM_1
			s: STRING; ms: MANIFEST_STRING
		do
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
						error_handler.append("Using range inside inspect of type STRING is not possible.")
						error_handler.print_as_fatal_error
					else
						wi1 ::= val.item(j)
						if not (ms ?:= wi1.expression) then
							error_handler.add_position(ei.start_position)
							error_handler.add_position(wi1.start_position)
							error_handler.append("Only manifest strings are accepted in %"when%" clauses of %
														%%"inspect%" (in order to ensure that the STRING %
														%won't change at runtime). Note that even a constant of %
														%type STRING can have its content changed at runtime.")
							error_handler.print_as_fatal_error
						else
							ms ::= wi1.expression
							s := ms.to_string
							if headers.has(s) then
								error_handler.add_position(ei.start_position)
								error_handler.add_position(ms.start_position)
								error_handler.append("Second occurrence of this value (%"")
								error_handler.append(s)
								error_handler.append("%") in the same inspect.")
								error_handler.print_as_fatal_error
							elseif s.is_empty then
								empty_position := ms.start_position
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

	has_empty: BOOLEAN is
		local
			unknown_position: POSITION
		do
			Result := empty_position /= unknown_position
		end

	empty_position: POSITION

feature {INSPECT_STATEMENT}
	simplify (type: TYPE; inspect_statement: INSPECT_STATEMENT): INSTRUCTION is
		local
			exp, count_call, local_expression: EXPRESSION; assign_expression, string_inspect: INSTRUCTION
			item_call: FUNCTION_CALL_1; i, s, c: INTEGER; compound: COMPOUND; when_clause: WHEN_CLAUSE
			state_inspect: OTHER_INSPECT_STATEMENT; state_local: INTERNAL_LOCAL2
		do
			exp := inspect_statement.expression.simplify(type)
			if exp.is_stored_in_some_local_variable then
				local_expression := exp
			else
				local_expression := create {INTERNAL_LOCAL2}.make(exp.start_position, exp, once "inspectExpression", True)
				create {ASSIGNMENT} assign_expression.inline_make(local_expression, exp)
			end
			create state_local.make(exp.start_position, create {INTEGER_CONSTANT}.make(32768, exp.start_position), once "state", False)
			item_call := inspect_statement.item_call(type, local_expression)
			count_call := inspect_statement.count_call(type, local_expression)
			string_inspect := inline_inspect(type, state_local, item_call, count_call,	once "", inspect_statement.start_position)
			create state_inspect.make(inspect_statement.start_position, state_local)
			from
				s := 1
				i := inspect_statement.when_list.lower
			until
				i > inspect_statement.when_list.upper
			loop
				create when_clause.make(state_inspect,	inspect_statement.when_list.item(i).start_position, inspect_statement.when_list.item(i).header_comment)
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
			if assign_expression = Void then
				create compound.make_2(string_inspect, state_inspect)
			else
				create compound.make_3(assign_expression, string_inspect, state_inspect)
			end
			smart_eiffel.magic_count_increment
			Result := compound.simplify(type)
		end

feature {INSPECT_STATEMENT}
	c_compile (type: TYPE; inspect_statement: INSPECT_STATEMENT) is
		require
			cpp.pending_c_function
		local
			i, cur_state, new_state, ext_state: INTEGER; cur_char: CHARACTER; octal: STRING
			no_check, all_check: BOOLEAN; transition: LINKED_LIST[TUPLE[CHARACTER, INTEGER]]
			storage_internal_c_local, count_internal_c_local, state_internal_c_local, i_internal_c_local: INTERNAL_C_LOCAL
		do
			no_check := ace.no_check
			all_check := ace.all_check
			cpp.pending_c_function_body.append(once "/*[manifest INSPECT*/%N")

			storage_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_native_array_character, once "storage")
			storage_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "/*storage*/=((")
			cpp.inspect_local_type(type)
			cpp.pending_c_function_body.append(once ")")
			cpp.inspect_local_compile_to_c(type)
			cpp.pending_c_function_body.append(once ")->_storage + ((")
			cpp.inspect_local_type(type)
			cpp.pending_c_function_body.append(once ")")
			cpp.inspect_local_compile_to_c(type)
			cpp.pending_c_function_body.append(once ")->_storage_lower;%N")

			count_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_integer_32, once "count")
			count_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "/*count*/=((")
			cpp.inspect_local_type(type)
			cpp.pending_c_function_body.append(once ")")
			cpp.inspect_local_compile_to_c(type)
			cpp.pending_c_function_body.append(once ")->_count;%N")

			-- Walk through the string to have the final state:
			state_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_integer_32, once "state")
			state_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "/*state*/=")
			string_pool.unknown_state.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%N")
			i_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_integer_32, once "i")
			i_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "/*i*/=0;%N")
			if has_empty then
				cpp.pending_c_function_body.append(once " /* has_empty */ if (")
				count_internal_c_local.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once "==0) ")
				state_internal_c_local.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once "=")
				string_pool.external_state(string_pool.state_empty).append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once ";%Nelse")
			end
			cpp.pending_c_function_body.append(once " while (")
			i_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once " < ")
			count_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once " && (")
			i_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "==0 || ")
			state_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "!=")
			string_pool.unknown_state.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ")) {%Nswitch(")
			state_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ") {%N")
			from
				cur_state := string_pool.unknown_state
			until
				cur_state > string_pool.maxstate
			loop
				cpp.pending_c_function_body.append(once "case ")
				cur_state.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once ": switch(*(")
				storage_internal_c_local.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.extend('+')
				i_internal_c_local.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once ")) {%N")
				transition := string_pool.transition(cur_state)
				from
					i := transition.lower
				until
					i > transition.upper
				loop
					cur_char := transition.item(i).first
					new_state := transition.item(i).second
					cpp.pending_c_function_body.append(once "case (unsigned char)'")
					inspect
						cur_char.code
					when 9 then
						cpp.pending_c_function_body.append(once "\t")
					when 10 then
						cpp.pending_c_function_body.append(once "\r")
					when 13 then
						cpp.pending_c_function_body.append(once "\n")
					when 39 then
						cpp.pending_c_function_body.append(once "\'")
					when 92 then
						cpp.pending_c_function_body.append(once "\\")
					when 0 .. 8, 11, 12, 14 .. 31 then
						octal := once ""
						octal.clear_count
						cur_char.code.to_integer_8.to_octal_in(octal)
						cpp.pending_c_function_body.extend('\')
						cpp.pending_c_function_body.append(octal)
					else
						cpp.pending_c_function_body.extend(cur_char)
					end
					cpp.pending_c_function_body.append(once "': ")
					state_internal_c_local.append_in(cpp.pending_c_function_body)
					cpp.pending_c_function_body.extend('=')
					if new_state < headers.count and then new_state /= string_pool.unknown_state then
						ext_state := string_pool.external_state(new_state)
						if ext_state /= new_state then
							cpp.pending_c_function_body.extend('(')
							i_internal_c_local.append_in(cpp.pending_c_function_body)
							cpp.pending_c_function_body.append(once "!=")
							count_internal_c_local.append_in(cpp.pending_c_function_body)
							cpp.pending_c_function_body.append(once "-1)?")
							new_state.append_in(cpp.pending_c_function_body)
							cpp.pending_c_function_body.extend(':')
						end
						ext_state.append_in(cpp.pending_c_function_body)
					else
						new_state.append_in(cpp.pending_c_function_body)
					end
					cpp.pending_c_function_body.append(once ";break;%N")
					i := i + 1
				end
				cpp.pending_c_function_body.append(once "default: ")
				state_internal_c_local.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.extend('=')
				string_pool.unknown_state.append_in(cpp.pending_c_function_body)
				cpp.pending_c_function_body.append(once ";%Nbreak;%N}%Nbreak;%N")
				cur_state := cur_state + 1
			end
			cpp.pending_c_function_body.append(once "default: ")
			state_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.extend('=')
			string_pool.unknown_state.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once ";%Nbreak;%N}%N")
			i_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "++;%N}%N")
			-- now compile the compounds:
			cpp.pending_c_function_body.append(once "switch(")
			state_internal_c_local.append_in(cpp.pending_c_function_body)
			cpp.pending_c_function_body.append(once "){%N")
			inspect_statement.compile_to_c_switch(type)
			if inspect_statement.else_compound /= Void then
				check
					not inspect_statement.else_position.is_unknown
				end
				cpp.pending_c_function_body.append(once "default:;%N")
				inspect_statement.else_compound.compile_to_c(type)
			elseif inspect_statement.else_position.is_unknown and then no_check then
				cpp.pending_c_function_body.append(once "default:;%N")
				exceptions_handler.bad_inspect_value(inspect_statement.start_position)
			end
			cpp.pending_c_function_body.append(once "}/*manifest INSPECT]*/%N")
			storage_internal_c_local.unlock
			count_internal_c_local.unlock
			state_internal_c_local.unlock
			i_internal_c_local.unlock
		end

feature {}
	inline_inspect (type: TYPE; state_local: INTERNAL_LOCAL2; item_call: FUNCTION_CALL_1; count_call: EXPRESSION;
						 a_prefix: STRING; pos: POSITION): INSTRUCTION is
		local
			i_call: FUNCTION_CALL_1
			args: EFFECTIVE_ARG_LIST
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
				create args.make_1(create {INTEGER_CONSTANT}.make(level + 1, pos))
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

	strings: STRING_RECYCLING_POOL is
		once
			create Result.make
		end

end -- class MANIFEST_STRING_INSPECTOR
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
