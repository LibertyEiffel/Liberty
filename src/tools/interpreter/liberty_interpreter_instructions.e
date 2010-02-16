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
class LIBERTY_INTERPRETER_INSTRUCTIONS

inherit
	LIBERTY_INSTRUCTION_VISITOR

creation {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_ASSIGNMENT_ATTEMPT}
	visit_liberty_assignment_attempt (v: LIBERTY_ASSIGNMENT_ATTEMPT) is
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
			e: LIBERTY_INTERPRETER_OBJECT
		do
			v.expression.accept(interpreter.expressions)
			create assignment.attempt(interpreter, interpreter.expressions.last_eval)
			w.accept(assignment)
		end

feature {LIBERTY_ASSIGNMENT_FORCED}
	visit_liberty_assignment_forced (v: LIBERTY_ASSIGNMENT_FORCED) is
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
			e: LIBERTY_INTERPRETER_OBJECT
		do
			v.expression.accept(interpreter.expressions)
			create assignment.forced(interpreter, interpreter.expressions.last_eval)
			w.accept(assignment)
		end

feature {LIBERTY_ASSIGNMENT_REGULAR}
	visit_liberty_assignment_regular (v: LIBERTY_ASSIGNMENT_REGULAR) is
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
			e: LIBERTY_INTERPRETER_OBJECT
		do
			v.expression.accept(interpreter.expressions)
			create assignment.regular(interpreter, interpreter.expressions.last_eval)
			w.accept(assignment)
		end

feature {LIBERTY_CALL_INSTRUCTION}
	visit_liberty_call_instruction (v: LIBERTY_CALL_INSTRUCTION) is
		local
			target, actual: LIBERTY_INTERPRETER_OBJECT
			params: COLLECTION[LIBERTY_INTERPRETER_OBJECT]
			i: INTEGER
		do
			v.target.accept(interpreter.expressions)
			target := interpreter.expressions.last_eval
			create {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT]] params.with_capacity(v.actuals.count)
			from
				i := v.actuals.lower
			until
				i > v.actuals.upper
			loop
				v.actuals.item(i).accept(interpreter.expressions)
				actual := interpreter.expressions.last_eval
				params.add_last(actual)
				i := i + 1
			end
			interpreter.call_feature(target, v.feature_definition, params)
		end

feature {LIBERTY_CHECK_INSTRUCTION}
	visit_liberty_check_instruction (v: LIBERTY_CHECK_INSTRUCTION) is
		local
			checker: LIBERTY_INTERPRETER_ASSERTION_CHECKER
		do
			create checker.make(interpreter)
			checker.validate(v.checks, once "Check")
		end

feature {LIBERTY_COMPOUND}
	visit_liberty_compound (v: LIBERTY_COMPOUND) is
		local
			i: INTEGER
		do
			from
				i := v.lower
			until
				i > v.upper
			loop
				v.item(i).accept(Current)
				i := i + 1
			end
		end

feature {LIBERTY_CONDITIONAL}
	visit_liberty_conditional (v: LIBERTY_CONDITIONAL) is
		local
			i: INTEGER
		do
			condition_stack.add_last(False)
			from
				i := v.conditions.lower
			until
				condition_stack.last or else i > v.conditions.upper
			loop
				v.conditions.item(i).accept(Current)
				i := i + 1
			end
			if not conditions_stack.last then
				v.else_clause.accept(Current)
			end
			condition_stack.remove_last
		end

feature {LIBERTY_CONDITION}
	visit_liberty_condition (v: LIBERTY_CONDITION) is
		local
			c: LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]
		do
			v.expression.accept(interpreter.expressions)
			c ::= interpreter.expressions.last_eval
			if c.item then
				condition_stack.put(True, condition_stack.upper)
				v.instruction.accept(Current)
			end
		end

feature {LIBERTY_CREATION_INSTRUCTION}
	visit_liberty_creation_instruction (v: LIBERTY_CREATION_INSTRUCTION) is
		deferred
		end

feature {LIBERTY_DEBUG}
	visit_liberty_debug (v: LIBERTY_DEBUG) is
		deferred
		end

feature {LIBERTY_DEFAULT}
	visit_liberty_default (v: LIBERTY_DEFAULT) is
		deferred
		end

feature {LIBERTY_EMPTY}
	visit_liberty_empty (v: LIBERTY_EMPTY) is
		deferred
		end

feature {LIBERTY_INSPECT_CLAUSE}
	visit_liberty_inspect_clause (v: LIBERTY_INSPECT_CLAUSE) is
		deferred
		end

feature {LIBERTY_INSPECT}
	visit_liberty_inspect (v: LIBERTY_INSPECT) is
		deferred
		end

feature {LIBERTY_INSPECT_SLICE}
	visit_liberty_inspect_slice (v: LIBERTY_INSPECT_SLICE) is
		deferred
		end

feature {LIBERTY_LOOP}
	visit_liberty_loop (v: LIBERTY_LOOP) is
		deferred
		end

feature {LIBERTY_PRECURSOR_INSTRUCTION}
	visit_liberty_precursor_instruction (v: LIBERTY_PRECURSOR_INSTRUCTION) is
		deferred
		end

feature {LIBERTY_RETRY}
	visit_liberty_retry (v: LIBERTY_RETRY) is
		deferred
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			create condition_stack.with_capacity(0)
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER

	condition_stack: FAST_ARRAY[BOOLEAN]

invariant
	interpreter /= Void
	condition_stack /= Void

end -- class LIBERTY_INTERPRETER_INSTRUCTIONS
