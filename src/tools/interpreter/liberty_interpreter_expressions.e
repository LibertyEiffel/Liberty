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

creation {LIBERTY_INTERPRETER}
	make

feature {ANY}
	last_eval: LIBERTY_INTERPRETER_OBJECT is
		do
			if eval_memory /= Void then
				Result := eval_memory.storage_twin
			end
		end

feature {LIBERTY_ADD}
	visit_liberty_add (v: LIBERTY_ADD) is
		do
			visit_infix(v)
		end

feature {LIBERTY_AGENT}
	visit_liberty_agent (v: LIBERTY_AGENT) is
		do
			not_yet_implemented
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
		do
			not_yet_implemented
		end

feature {LIBERTY_ASSIGNMENT_TEST}
	visit_liberty_assignment_test (v: LIBERTY_ASSIGNMENT_TEST) is
		do
			v.expression.accept(Current)
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]} eval_memory.with_item(interpreter, interpreter.universe.type_boolean, last_eval.type.is_conform_to(v.tested_type.actual_type))
		end

feature {LIBERTY_BOOLEAN_MANIFEST}
	visit_liberty_boolean_manifest (v: LIBERTY_BOOLEAN_MANIFEST) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]} eval_memory.with_item(interpreter, interpreter.universe.type_boolean, v.manifest)
		end

feature {LIBERTY_CALL_EXPRESSION}
	visit_liberty_call_expression (v: LIBERTY_CALL_EXPRESSION) is
		local
			target: LIBERTY_INTERPRETER_OBJECT
			params: COLLECTION[LIBERTY_INTERPRETER_OBJECT]
		do
			v.target.accept(interpreter.expressions)
			target := interpreter.expressions.last_eval
			params := as_parameters(v.actuals)
			eval_memory := interpreter.item_feature(target, v.entity.feature_definition, params)
		end

feature {LIBERTY_CHARACTER_MANIFEST}
	visit_liberty_character_manifest (v: LIBERTY_CHARACTER_MANIFEST) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER]} eval_memory.with_item(interpreter, interpreter.universe.type_character, v.manifest)
		end

feature {LIBERTY_CREATION_EXPRESSION}
	visit_liberty_creation_expression (v: LIBERTY_CREATION_EXPRESSION) is
		do
			eval_memory := interpreter.new_object(v.result_type.actual_type)
			interpreter.call_feature(eval_memory, v.feature_entity.feature_definition, as_parameters(v.feature_arguments))
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
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]} eval_memory.with_item(interpreter, interpreter.universe.type_boolean, visit_comparison(v))
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
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_16]} eval_memory.with_item(interpreter, interpreter.universe.type_integer_64, v.manifest)
		end

feature {LIBERTY_INTEGER_32_MANIFEST}
	visit_liberty_integer_32_manifest (v: LIBERTY_INTEGER_32_MANIFEST) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_32]} eval_memory.with_item(interpreter, interpreter.universe.type_integer_32, v.manifest)
		end

feature {LIBERTY_INTEGER_64_MANIFEST}
	visit_liberty_integer_64_manifest (v: LIBERTY_INTEGER_64_MANIFEST) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]} eval_memory.with_item(interpreter, interpreter.universe.type_integer_16, v.manifest)
		end

feature {LIBERTY_INTEGER_8_MANIFEST}
	visit_liberty_integer_8_manifest (v: LIBERTY_INTEGER_8_MANIFEST) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_8]} eval_memory.with_item(interpreter, interpreter.universe.type_integer_8, v.manifest)
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
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]} eval_memory.with_item(interpreter, interpreter.universe.type_boolean, not visit_comparison(v))
		end

feature {LIBERTY_OLD}
	visit_liberty_old (v: LIBERTY_OLD) is
		do
			eval_memory := interpreter.old_value(v.expression)
		end

feature {LIBERTY_OPEN_ARGUMENT}
	visit_liberty_open_argument (v: LIBERTY_OPEN_ARGUMENT) is
		do
			not_yet_implemented
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
			eval_memory := interpreter.item_precursor(v.the_feature, as_parameters(v.actuals))
		end

feature {LIBERTY_PREFIX_OPERATOR}
	visit_liberty_prefix_operator (v: LIBERTY_PREFIX_OPERATOR) is
		do
			visit_prefix(v)
		end

feature {LIBERTY_REAL_MANIFEST}
	visit_liberty_real_manifest (v: LIBERTY_REAL_MANIFEST) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL]} eval_memory.with_item(interpreter, interpreter.universe.type_real, v.manifest)
		end

feature {LIBERTY_REAL_TYPED_MANIFEST}
	visit_liberty_real_typed_manifest (v: LIBERTY_REAL_TYPED_MANIFEST) is
		do
			not_yet_implemented
		end

feature {LIBERTY_STRING_MANIFEST}
	visit_liberty_string_manifest (v: LIBERTY_STRING_MANIFEST) is
		local
			string_manifest: STRING
			new_string: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
			new_string_capacity, new_string_count: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER]
			new_string_storage: LIBERTY_INTERPRETER_NATIVE_ARRAY[CHARACTER]
		do
			string_manifest := v.manifest
			create new_string_capacity.with_item(interpreter, interpreter.universe.type_integer, string_manifest.capacity)
			create new_string_count.with_item(interpreter, interpreter.universe.type_integer, string_manifest.count)
			create new_string_storage.with_storage(interpreter, native_array_of_character, interpreter.universe.type_character, string_manifest)
			new_string ::= interpreter.new_object(interpreter.universe.type_string)
			new_string.put_attribute(capacity_name, new_string_capacity)
			new_string.put_attribute(count_name, new_string_count)
			new_string.put_attribute(storage_name, new_string_storage)
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
		do
			not_yet_implemented
		end

feature {LIBERTY_VOID}
	visit_liberty_void (v: LIBERTY_VOID) is
		do
			eval_memory := Void
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
		end

feature {LIBERTY_FEATURE_DEFINITION}
	visit_liberty_feature_definition (v: LIBERTY_FEATURE_DEFINITION) is
		do
			check False end
		end

feature {LIBERTY_FEATURE_ENTITY}
	visit_liberty_feature_entity (v: LIBERTY_FEATURE_ENTITY) is
		do
			eval_memory := interpreter.item_feature(interpreter.target, v.feature_definition, no_parameters)
		end

feature {LIBERTY_LOCAL}
	visit_liberty_local (v: LIBERTY_LOCAL) is
		do
			eval_memory := interpreter.local_value(v.name)
		end

feature {LIBERTY_PARAMETER}
	visit_liberty_parameter (v: LIBERTY_PARAMETER) is
		do
			eval_memory := interpreter.parameter(v.name)
		end

feature {LIBERTY_RESULT}
	visit_liberty_result (v: LIBERTY_RESULT) is
		do
			eval_memory := interpreter.returned_object
		end

feature {LIBERTY_WRITABLE_FEATURE}
	visit_liberty_writable_feature (v: LIBERTY_WRITABLE_FEATURE) is
		do
			check False end
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		local
			errors: LIBERTY_ERRORS
		do
			interpreter := a_interpreter
			native_array_of_character := interpreter.universe.type_native_array({FAST_ARRAY[LIBERTY_ACTUAL_TYPE] << interpreter.universe.type_character >> }, errors.unknown_position)
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER
	eval_memory: LIBERTY_INTERPRETER_OBJECT
	native_array_of_character: LIBERTY_ACTUAL_TYPE

feature {}
	visit_infix (v: LIBERTY_INFIX_CALL) is
		local
			left, right: LIBERTY_INTERPRETER_OBJECT
		do
			v.target.accept(Current)
			left := last_eval
			v.actuals.first.accept(Current)
			right := last_eval
			v.entity.debug_display
			eval_memory := interpreter.item_feature(left, v.entity.feature_definition, {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT] << right >> })
		end

	visit_prefix (v: LIBERTY_PREFIX_CALL) is
		local
			target: LIBERTY_INTERPRETER_OBJECT
		do
			v.target.accept(Current)
			target := last_eval
			eval_memory := interpreter.item_feature(target, v.entity.feature_definition, no_parameters)
		end

	visit_comparison (v: LIBERTY_COMPARISON): BOOLEAN is
		local
			left, right: LIBERTY_INTERPRETER_OBJECT
		do
			v.left.accept(Current)
			left := last_eval
			v.right.accept(Current)
			right := last_eval
			if left = Void then
				Result := right = Void
			else
				Result := right /= Void and then left.is_equal(right)
			end
		end

	no_parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT] is
		once
			create {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT]} Result.with_capacity(0)
		end

	capacity_name: FIXED_STRING is
		once
			Result := "capacity".intern
		end

	count_name: FIXED_STRING is
		once
			Result := "count".intern
		end

	storage_name: FIXED_STRING is
		once
			Result := "storage".intern
		end

feature {}
	as_parameters (actuals: TRAVERSABLE[LIBERTY_EXPRESSION]): COLLECTION[LIBERTY_INTERPRETER_OBJECT] is
		local
			i: INTEGER; actual: LIBERTY_INTERPRETER_OBJECT
		do
			create {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT]} Result.with_capacity(actuals.count)
			from
				i := actuals.lower
			until
				i > actuals.upper
			loop
				actuals.item(i).accept(interpreter.expressions)
				actual := interpreter.expressions.last_eval
				Result.add_last(actual)
				i := i + 1
			end
		end

invariant
	interpreter /= Void
	native_array_of_character /= Void

end -- class LIBERTY_INTERPRETER_EXPRESSIONS
