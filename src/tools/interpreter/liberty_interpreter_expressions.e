-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_INTERPRETER_EXPRESSIONS

inherit
	LIBERTY_EXPRESSION_VISITOR
	LIBERTY_ENTITY_VISITOR
	LIBERTY_INTERPRETER_OBJECT_VISITOR

insert
	LIBERTY_ARRAY_MANIFEST_CONSTANTS

creation {LIBERTY_INTERPRETER}
	make

feature {ANY}
	eval_memory: LIBERTY_INTERPRETER_OBJECT

	eval_as_right_value: LIBERTY_INTERPRETER_OBJECT is
			-- When `eval_memory' is to be assigned to an entity
		do
			Result := eval_memory.as_right_value
		end

	eval_as_target: LIBERTY_INTERPRETER_OBJECT is
			-- When `eval_memory' is to be used as a target of a call
		do
			Result := eval_memory.as_target(eval_memory.position)
		end

feature {LIBERTY_ADD}
	visit_liberty_add (v: LIBERTY_ADD) is
		do
			visit_infix(v)
		end

feature {LIBERTY_AGENT}
	visit_liberty_agent (v: LIBERTY_AGENT) is
		do
			eval_memory := interpreter.new_agent(v)
		end

feature {LIBERTY_AND}
	visit_liberty_and (v: LIBERTY_AND) is
		do
			visit_infix(v)
		end

feature {LIBERTY_AND_THEN}
	visit_liberty_and_then (v: LIBERTY_AND_THEN) is
		do
			visit_infix(v)
		end

feature {LIBERTY_ARRAY_MANIFEST}
	visit_liberty_array_manifest (v: LIBERTY_ARRAY_MANIFEST) is
			-- manifest_make
			-- manifest_put
			-- manifest_semicolon_check: BOOLEAN or INTEGER
		local
			semicolons: INTEGER
		do
			semicolons := semicolon_pattern(v.separators)
			if semicolons < 0 then
				eval_memory := Void
			else
				new_array_manifest(semicolons, v)
			end
		end

feature {}
	new_array_manifest (semicolons: INTEGER; v: LIBERTY_ARRAY_MANIFEST) is
		require
			semicolons = semicolon_pattern(v.separators)
		local
			array_type: LIBERTY_ACTUAL_TYPE
			fd: LIBERTY_FEATURE_DEFINITION
			new_array: like eval_memory
			i, j, index, capacity, n_args: INTEGER
			args: FAST_ARRAY[LIBERTY_EXPRESSION]
			f: LIBERTY_FEATURE
		do
			-- NOTE!!
			--
			-- Liberty does not make use of SmartEiffel's "manifest_semicolon_check" feature.
			--
			-- Instead, the number of arguments of "manifest_put" is taken into account to determine if
			-- semi-colons are needed. In a nutshell, they are if manifest_put needs more than one extra argument
			-- (i.e. besides the 'index' first argument).
			--

			array_type ::= v.result_type.known_type

			fd := array_type.feature_definition(manifest_make_feature_name)
			new_array := interpreter.new_object(array_type, v.position)
			capacity := v.contents.count
			create args.with_capacity(1 + v.parameters.count)
			args.add_last(interpreter.new_integer_32(capacity, v.position))
			args.append_traversable(v.parameters)
			interpreter.call_feature(new_array, fd, args, v.position)

			fd := array_type.feature_definition(manifest_put_feature_name)
			f := fd.the_feature.bound(array_type)
			if f.parameters.count < 2 then
				-- TODO: error: not enough parameters
				not_yet_implemented
			elseif semicolons = 0 and then f.parameters.count = 2 then
				-- ok, using only commas is allowed if there is only one extra argument
				n_args := 1
			elseif f.parameters.count = semicolons + 1 then
				-- ok, using semi-colon-separated slices; note that semi-colons are also allowed between each
				-- argument
				n_args := semicolons
			elseif f.parameters.count = v.contents.count + 1 then
				-- ok, special case if there is only one slice that must be given at once to manifest_put
				n_args := v.contents.count
			else
				-- TODO: error: the semicolons pattern does not match the number of arguments of manifest_put + 1
				not_yet_implemented
			end

			check
				n_args.in_range(1, v.contents.count)
				v.contents.count \\ n_args = 0
			end
			from
				args.with_capacity(n_args + 1)
				index := 0
				i := v.contents.lower
			until
				i > v.contents.upper
			loop
				args.clear_count
				args.add_last(interpreter.new_integer_32(index, v.position))
				from
					j := 0
				until
					j = n_args
				loop
					v.contents.item(i+j).accept(Current)
					args.add_last(eval_as_right_value)
					j := j + 1
				end
				interpreter.call_feature(new_array, fd, args, v.position)
				index := index + 1
				i := i + n_args
			end

			eval_memory := new_array
		end

	semicolon_pattern (separators: TRAVERSABLE[LIBERTY_ARRAY_MANIFEST_SEPARATOR]): INTEGER is
		local
			n, i: INTEGER
		do
			from
				i := separators.lower
				n := 1
			until
				Result < 0 or else i > separators.upper
			loop
				if separators.item(i) = separator_comma then
					check
						not_last: i < separators.upper
					end
					n := n + 1
				elseif separators.item(i) = separator_semi_colon then
					check
						not_last: i < separators.upper
					end
					if Result = 0 then
						Result := n
					elseif Result /= n then
						-- TODO: error, non regular semi-colon pattern
						not_yet_implemented
					end
					n := 1
				else
					check
						is_none: separators.item(i) = separator_none
						is_last: i = separators.upper
					end
					if Result /= 0 and then Result /= n then
						-- TODO: error, non regular semi-colon pattern
						not_yet_implemented
					end
				end
				i := i + 1
			end
		ensure
			Result >= 0
			Result > 0 implies separators.count \\ Result = 0
		end

feature {LIBERTY_ASSIGNMENT_TEST}
	visit_liberty_assignment_test (v: LIBERTY_ASSIGNMENT_TEST) is
		do
			v.expression.accept(Current)
			eval_memory := interpreter.new_boolean(eval_memory.type.is_conform_to(v.tested_type.known_type), v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_BOOLEAN_MANIFEST}
	visit_liberty_boolean_manifest (v: LIBERTY_BOOLEAN_MANIFEST) is
		do
			eval_memory := interpreter.new_boolean(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_CALL_EXPRESSION}
	visit_liberty_call_expression (v: LIBERTY_CALL_EXPRESSION) is
		do
			if v.is_implicit_current then
				eval_memory := item_feature(interpreter.target, v.entity, v.actuals, v.position)
			else
				v.target.accept(Current)
				eval_memory := item_feature(eval_as_target, v.entity, v.actuals, v.position)
			end
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_CAST_EXPRESSION}
	visit_liberty_cast_expression (v: LIBERTY_CAST_EXPRESSION) is
		local
			actual_type: LIBERTY_ACTUAL_TYPE
		do
			v.expression.accept(Current)
			actual_type ::= v.result_type.known_type
			if eval_memory.result_type.known_type.is_conform_to(actual_type) then
				-- nothing to do
			elseif eval_memory.result_type.known_type.converts_to(actual_type) then
				eval_memory := interpreter.object_converter.convert_object(eval_memory, actual_type)
			else
				-- fatal error!! should not happen
				check False end
				crash
			end
		end

feature {LIBERTY_CHARACTER_MANIFEST}
	visit_liberty_character_manifest (v: LIBERTY_CHARACTER_MANIFEST) is
		do
			eval_memory := interpreter.new_character(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_CREATION_EXPRESSION}
	visit_liberty_creation_expression (v: LIBERTY_CREATION_EXPRESSION) is
		local
			actual_type: LIBERTY_ACTUAL_TYPE
		do
			actual_type ::= v.result_type.known_type
			eval_memory := interpreter.new_object(actual_type, v.position)
			interpreter.call_feature(eval_memory, v.feature_entity.feature_definition, v.feature_arguments, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_DIVIDE}
	visit_liberty_divide (v: LIBERTY_DIVIDE) is
		do
			visit_infix(v)
		end

feature {LIBERTY_ENTITY_EXPRESSION}
	visit_liberty_entity_expression (v: LIBERTY_ENTITY_EXPRESSION) is
		do
			v.entity.accept(Current)
		end

feature {LIBERTY_ENTITY_REFERENCE}
	visit_liberty_entity_reference (v: LIBERTY_ENTITY_REFERENCE) is
		do
			not_yet_implemented
		end

feature {LIBERTY_EQUALS}
	visit_liberty_equals (v: LIBERTY_EQUALS) is
		do
			eval_memory := interpreter.new_boolean(visit_comparison(v), v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_GREATER_OR_EQUAL}
	visit_liberty_greater_or_equal (v: LIBERTY_GREATER_OR_EQUAL) is
		do
			visit_infix(v)
		end

feature {LIBERTY_GREATER_THAN}
	visit_liberty_greater_than (v: LIBERTY_GREATER_THAN) is
		do
			visit_infix(v)
		end

feature {LIBERTY_IMPLIES}
	visit_liberty_implies (v: LIBERTY_IMPLIES) is
		do
			visit_infix(v)
		end

feature {LIBERTY_INFIX_OPERATOR}
	visit_liberty_infix_operator (v: LIBERTY_INFIX_OPERATOR) is
		do
			visit_infix(v)
		end

feature {LIBERTY_INT_DIVIDE}
	visit_liberty_int_divide (v: LIBERTY_INT_DIVIDE) is
		do
			visit_infix(v)
		end

feature {LIBERTY_INTEGER_16_MANIFEST}
	visit_liberty_integer_16_manifest (v: LIBERTY_INTEGER_16_MANIFEST) is
		do
			eval_memory := interpreter.new_integer_16(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_INTEGER_32_MANIFEST}
	visit_liberty_integer_32_manifest (v: LIBERTY_INTEGER_32_MANIFEST) is
		do
			eval_memory := interpreter.new_integer_32(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_INTEGER_64_MANIFEST}
	visit_liberty_integer_64_manifest (v: LIBERTY_INTEGER_64_MANIFEST) is
		do
			eval_memory := interpreter.new_integer_64(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_INTEGER_8_MANIFEST}
	visit_liberty_integer_8_manifest (v: LIBERTY_INTEGER_8_MANIFEST) is
		do
			eval_memory := interpreter.new_integer_8(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_INTEGER_TYPED_MANIFEST}
	visit_liberty_integer_typed_manifest (v: LIBERTY_INTEGER_TYPED_MANIFEST) is
		do
			not_yet_implemented
		end

feature {LIBERTY_INT_REMAINDER}
	visit_liberty_int_remainder (v: LIBERTY_INT_REMAINDER) is
		do
			visit_infix(v)
		end

feature {LIBERTY_LESS_OR_EQUAL}
	visit_liberty_less_or_equal (v: LIBERTY_LESS_OR_EQUAL) is
		do
			visit_infix(v)
		end

feature {LIBERTY_LESS_THAN}
	visit_liberty_less_than (v: LIBERTY_LESS_THAN) is
		do
			visit_infix(v)
		end

feature {LIBERTY_NEGATIVE}
	visit_liberty_negative (v: LIBERTY_NEGATIVE) is
		do
			visit_prefix(v)
		end

feature {LIBERTY_NOT}
	visit_liberty_not (v: LIBERTY_NOT) is
		do
			visit_prefix(v)
		end

feature {LIBERTY_NOT_EQUALS}
	visit_liberty_not_equals (v: LIBERTY_NOT_EQUALS) is
		do
			eval_memory := interpreter.new_boolean(not visit_comparison(v), v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_OLD}
	visit_liberty_old (v: LIBERTY_OLD) is
		do
			eval_memory := interpreter.old_value(v.expression)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_OPEN_ARGUMENT}
	visit_liberty_open_argument (v: LIBERTY_OPEN_ARGUMENT) is
		local
			actual_type: LIBERTY_ACTUAL_TYPE
		do
			actual_type ::= v.result_type.known_type
			create {LIBERTY_INTERPRETER_OPEN_ARGUMENT} eval_memory.make(interpreter, actual_type)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_OR}
	visit_liberty_or (v: LIBERTY_OR) is
		do
			visit_infix(v)
		end

feature {LIBERTY_OR_ELSE}
	visit_liberty_or_else (v: LIBERTY_OR_ELSE) is
		do
			visit_infix(v)
		end

feature {LIBERTY_POSITIVE}
	visit_liberty_positive (v: LIBERTY_POSITIVE) is
		do
			visit_prefix(v)
		end

feature {LIBERTY_POWER}
	visit_liberty_power (v: LIBERTY_POWER) is
		do
			visit_infix(v)
		end

feature {LIBERTY_PRECURSOR_EXPRESSION}
	visit_liberty_precursor_expression (v: LIBERTY_PRECURSOR_EXPRESSION) is
		do
			eval_memory := interpreter.item_precursor(v.the_feature, v.actuals, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_PREFIX_OPERATOR}
	visit_liberty_prefix_operator (v: LIBERTY_PREFIX_OPERATOR) is
		do
			visit_prefix(v)
		end

feature {LIBERTY_REAL_MANIFEST}
	visit_liberty_real_manifest (v: LIBERTY_REAL_MANIFEST) is
		do
			eval_memory := interpreter.new_real(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_REAL_TYPED_MANIFEST}
	visit_liberty_real_typed_manifest (v: LIBERTY_REAL_TYPED_MANIFEST) is
		do
			not_yet_implemented
		end

feature {LIBERTY_STRING_MANIFEST}
	visit_liberty_string_manifest (v: LIBERTY_STRING_MANIFEST) is
		do
			eval_memory := interpreter.new_string(v.manifest, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_STRING_TYPED_MANIFEST}
	visit_liberty_string_typed_manifest (v: LIBERTY_STRING_TYPED_MANIFEST) is
		do
			not_yet_implemented
		end

feature {LIBERTY_SUBTRACT}
	visit_liberty_subtract (v: LIBERTY_SUBTRACT) is
		do
			visit_infix(v)
		end

feature {LIBERTY_TIMES}
	visit_liberty_times (v: LIBERTY_TIMES) is
		do
			visit_infix(v)
		end

feature {LIBERTY_TUPLE}
	visit_liberty_tuple (v: LIBERTY_TUPLE) is
		local
			tuple: LIBERTY_INTERPRETER_TUPLE
			i: INTEGER
		do
			tuple := interpreter.new_tuple(v)
			tuple.ensure_capacity(v.count)
			from
				i := v.lower
			until
				i > v.upper
			loop
				v.item(i).accept(Current)
				tuple.add_last(eval_as_right_value)
				i := i + 1
			end
			eval_memory := tuple
		end

feature {LIBERTY_VOID}
	visit_liberty_void (v: LIBERTY_VOID) is
		do
			eval_memory := interpreter.void_object(v.result_type.known_type, v.position)
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_XOR}
	visit_liberty_xor (v: LIBERTY_XOR) is
		do
			visit_infix(v)
		end

feature {LIBERTY_CURRENT}
	visit_liberty_current (v: LIBERTY_CURRENT) is
		do
			eval_memory := interpreter.target
			debug
				std_output.put_string(once " => Current = ")
				interpreter.object_printer.print_object(std_output, eval_memory, 2)
			end
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_FEATURE_DEFINITION}
	visit_liberty_feature_definition (v: LIBERTY_FEATURE_DEFINITION) is
		do
			check False end
		end

feature {LIBERTY_FEATURE_ENTITY}
	visit_liberty_feature_entity (v: LIBERTY_FEATURE_ENTITY) is
		do
			eval_memory := interpreter.item_feature(interpreter.target, v.feature_definition, no_actuals, v.position)
			debug
				std_output.put_string(once " => Attribute ")
				std_output.put_string(v.name)
				std_output.put_string(once " = ")
				interpreter.object_printer.print_object(std_output, eval_memory, 2)
			end
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_LOCAL}
	visit_liberty_local (v: LIBERTY_LOCAL) is
		do
			eval_memory := interpreter.local_value(v.name)
			debug
				std_output.put_string(once " => Local ")
				std_output.put_string(v.name)
				std_output.put_string(once " = ")
				interpreter.object_printer.print_object(std_output, eval_memory, 2)
			end
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_PARAMETER}
	visit_liberty_parameter (v: LIBERTY_PARAMETER) is
		do
			eval_memory := interpreter.parameter(v.name)
			debug
				std_output.put_string(once " => Parameter ")
				std_output.put_string(v.name)
				std_output.put_string(once " = ")
				interpreter.object_printer.print_object(std_output, eval_memory, 2)
			end
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_RESULT}
	visit_liberty_result (v: LIBERTY_RESULT) is
		do
			eval_memory := interpreter.returned_object
			debug
				std_output.put_string(once " => Result = ")
				interpreter.object_printer.print_object(std_output, eval_memory, 2)
			end
		ensure
			eval_memory /= Void
		end

feature {LIBERTY_WRITABLE_FEATURE}
	visit_liberty_writable_feature (v: LIBERTY_WRITABLE_FEATURE) is
		do
			check False end
		end

feature {LIBERTY_INTERPRETER_OBJECT}
	visit_liberty_object (a_object: LIBERTY_INTERPRETER_OBJECT) is
		do
			eval_memory := a_object
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER

feature {}
	item_feature (target: LIBERTY_INTERPRETER_OBJECT; entity: LIBERTY_FEATURE_ENTITY; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		local
			target_type: LIBERTY_ACTUAL_TYPE
		do
			target_type ::= entity.target_type.known_type
			interpreter.ensure_built(target_type)
			Result := interpreter.item_feature(target, entity.feature_definition, actuals, position)
		end

	visit_infix (v: LIBERTY_INFIX_CALL) is
		do
			v.target.accept(Current)
			eval_memory := item_feature(eval_as_target, v.entity, v.actuals, v.position)
		ensure
			eval_memory /= Void
		end

	visit_prefix (v: LIBERTY_PREFIX_CALL) is
		do
			v.target.accept(Current)
			eval_memory := item_feature(eval_as_target, v.entity, no_actuals, v.position)
		ensure
			eval_memory /= Void
		end

	visit_comparison (v: LIBERTY_COMPARISON): BOOLEAN is
		local
			left, right: LIBERTY_INTERPRETER_OBJECT
			left_type, right_type: LIBERTY_ACTUAL_TYPE
		do
			v.left.accept(Current)
			left := eval_as_right_value
			v.right.accept(Current)
			right := eval_as_right_value
			if left_type ?:= left.type then
				left_type ::= left.type
				if right_type ?:= right.type then
					right_type ::= right.type
					if left_type.is_conform_to(right_type) then
						Result := left.is_equal(right)
					elseif right_type.is_conform_to(left_type) then
						Result := right.is_equal(left)
					elseif left_type.converts_to(right_type) then
						Result := interpreter.object_converter.convert_object(left, right_type).is_equal(right)
					elseif right_type.converts_to(left_type) then
						Result := interpreter.object_converter.convert_object(right, left_type).is_equal(left)
					else
						check not Result end
					end
				else
					check not Result end
				end
			elseif right_type ?:= right.type then
				check not Result end
			else
				Result := True -- Void = Void
			end
		end

	no_actuals: TRAVERSABLE[LIBERTY_EXPRESSION] is
		once
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.with_capacity(0)
		end

invariant
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_EXPRESSIONS
