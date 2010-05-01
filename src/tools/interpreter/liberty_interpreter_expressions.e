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
		do
			not_yet_implemented
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
		do
			v.left.accept(Current)
			left := eval_as_right_value
			v.right.accept(Current)
			right := eval_as_right_value
			Result := left.is_equal(right)
		end

	no_actuals: TRAVERSABLE[LIBERTY_EXPRESSION] is
		once
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.with_capacity(0)
		end

invariant
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_EXPRESSIONS
