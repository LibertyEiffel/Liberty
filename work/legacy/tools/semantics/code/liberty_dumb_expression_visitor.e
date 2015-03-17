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
class LIBERTY_DUMB_EXPRESSION_VISITOR

inherit
   LIBERTY_EXPRESSION_VISITOR

feature {LIBERTY_ADD}
   visit_liberty_add (v: LIBERTY_ADD)
      do
      end

feature {LIBERTY_AGENT}
   visit_liberty_agent (v: LIBERTY_AGENT)
      do
      end

feature {LIBERTY_AND}
   visit_liberty_and (v: LIBERTY_AND)
      do
      end

feature {LIBERTY_AND_THEN}
   visit_liberty_and_then (v: LIBERTY_AND_THEN)
      do
      end

feature {LIBERTY_ARRAY_MANIFEST}
   visit_liberty_array_manifest (v: LIBERTY_ARRAY_MANIFEST)
      do
      end

feature {LIBERTY_ASSIGNMENT_TEST}
   visit_liberty_assignment_test (v: LIBERTY_ASSIGNMENT_TEST)
      do
      end

feature {LIBERTY_BOOLEAN_MANIFEST}
   visit_liberty_boolean_manifest (v: LIBERTY_BOOLEAN_MANIFEST)
      do
      end

feature {LIBERTY_CALL_EXPRESSION}
   visit_liberty_call_expression (v: LIBERTY_CALL_EXPRESSION)
      do
      end

feature {LIBERTY_CAST_EXPRESSION}
   visit_liberty_cast_expression (v: LIBERTY_CAST_EXPRESSION)
      do
      end

feature {LIBERTY_CHARACTER_MANIFEST}
   visit_liberty_character_manifest (v: LIBERTY_CHARACTER_MANIFEST)
      do
      end

feature {LIBERTY_CREATION_EXPRESSION}
   visit_liberty_creation_expression (v: LIBERTY_CREATION_EXPRESSION)
      do
      end

feature {LIBERTY_DIVIDE}
   visit_liberty_divide (v: LIBERTY_DIVIDE)
      do
      end

feature {LIBERTY_ENTITY_EXPRESSION}
   visit_liberty_entity_expression (v: LIBERTY_ENTITY_EXPRESSION)
      do
      end

feature {LIBERTY_ENTITY_REFERENCE}
   visit_liberty_entity_reference (v: LIBERTY_ENTITY_REFERENCE)
      do
      end

feature {LIBERTY_EQUALS}
   visit_liberty_equals (v: LIBERTY_EQUALS)
      do
      end

feature {LIBERTY_GREATER_OR_EQUAL}
   visit_liberty_greater_or_equal (v: LIBERTY_GREATER_OR_EQUAL)
      do
      end

feature {LIBERTY_GREATER_THAN}
   visit_liberty_greater_than (v: LIBERTY_GREATER_THAN)
      do
      end

feature {LIBERTY_IMPLIES}
   visit_liberty_implies (v: LIBERTY_IMPLIES)
      do
      end

feature {LIBERTY_INFIX_OPERATOR}
   visit_liberty_infix_operator (v: LIBERTY_INFIX_OPERATOR)
      do
      end

feature {LIBERTY_INT_DIVIDE}
   visit_liberty_int_divide (v: LIBERTY_INT_DIVIDE)
      do
      end

feature {LIBERTY_INTEGER_16_MANIFEST}
   visit_liberty_integer_16_manifest (v: LIBERTY_INTEGER_16_MANIFEST)
      do
      end

feature {LIBERTY_INTEGER_32_MANIFEST}
   visit_liberty_integer_32_manifest (v: LIBERTY_INTEGER_32_MANIFEST)
      do
      end

feature {LIBERTY_INTEGER_64_MANIFEST}
   visit_liberty_integer_64_manifest (v: LIBERTY_INTEGER_64_MANIFEST)
      do
      end

feature {LIBERTY_INTEGER_8_MANIFEST}
   visit_liberty_integer_8_manifest (v: LIBERTY_INTEGER_8_MANIFEST)
      do
      end

feature {LIBERTY_INTEGER_TYPED_MANIFEST}
   visit_liberty_integer_typed_manifest (v: LIBERTY_INTEGER_TYPED_MANIFEST)
      do
      end

feature {LIBERTY_INT_REMAINDER}
   visit_liberty_int_remainder (v: LIBERTY_INT_REMAINDER)
      do
      end

feature {LIBERTY_LESS_OR_EQUAL}
   visit_liberty_less_or_equal (v: LIBERTY_LESS_OR_EQUAL)
      do
      end

feature {LIBERTY_LESS_THAN}
   visit_liberty_less_than (v: LIBERTY_LESS_THAN)
      do
      end

feature {LIBERTY_NEGATIVE}
   visit_liberty_negative (v: LIBERTY_NEGATIVE)
      do
      end

feature {LIBERTY_NOT}
   visit_liberty_not (v: LIBERTY_NOT)
      do
      end

feature {LIBERTY_NOT_EQUALS}
   visit_liberty_not_equals (v: LIBERTY_NOT_EQUALS)
      do
      end

feature {LIBERTY_OLD}
   visit_liberty_old (v: LIBERTY_OLD)
      do
      end

feature {LIBERTY_OPEN_ARGUMENT}
   visit_liberty_open_argument (v: LIBERTY_OPEN_ARGUMENT)
      do
      end

feature {LIBERTY_OR}
   visit_liberty_or (v: LIBERTY_OR)
      do
      end

feature {LIBERTY_OR_ELSE}
   visit_liberty_or_else (v: LIBERTY_OR_ELSE)
      do
      end

feature {LIBERTY_POSITIVE}
   visit_liberty_positive (v: LIBERTY_POSITIVE)
      do
      end

feature {LIBERTY_POWER}
   visit_liberty_power (v: LIBERTY_POWER)
      do
      end

feature {LIBERTY_PRECURSOR_EXPRESSION}
   visit_liberty_precursor_expression (v: LIBERTY_PRECURSOR_EXPRESSION)
      do
      end

feature {LIBERTY_PREFIX_OPERATOR}
   visit_liberty_prefix_operator (v: LIBERTY_PREFIX_OPERATOR)
      do
      end

feature {LIBERTY_REAL_MANIFEST}
   visit_liberty_real_manifest (v: LIBERTY_REAL_MANIFEST)
      do
      end

feature {LIBERTY_REAL_TYPED_MANIFEST}
   visit_liberty_real_typed_manifest (v: LIBERTY_REAL_TYPED_MANIFEST)
      do
      end

feature {LIBERTY_STRING_MANIFEST}
   visit_liberty_string_manifest (v: LIBERTY_STRING_MANIFEST)
      do
      end

feature {LIBERTY_STRING_TYPED_MANIFEST}
   visit_liberty_string_typed_manifest (v: LIBERTY_STRING_TYPED_MANIFEST)
      do
      end

feature {LIBERTY_SUBTRACT}
   visit_liberty_subtract (v: LIBERTY_SUBTRACT)
      do
      end

feature {LIBERTY_TIMES}
   visit_liberty_times (v: LIBERTY_TIMES)
      do
      end

feature {LIBERTY_TUPLE}
   visit_liberty_tuple (v: LIBERTY_TUPLE)
      do
      end

feature {LIBERTY_VOID}
   visit_liberty_void (v: LIBERTY_VOID)
      do
      end

feature {LIBERTY_XOR}
   visit_liberty_xor (v: LIBERTY_XOR)
      do
      end

end -- class LIBERTY_DUMB_EXPRESSION_VISITOR
