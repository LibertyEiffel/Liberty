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
	LIBERTY_VARIANT_VISITOR

creation {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_ASSIGNMENT_ATTEMPT}
	visit_liberty_assignment_attempt (v: LIBERTY_ASSIGNMENT_ATTEMPT) is
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
		do
			v.expression.accept(interpreter.expressions)
			create assignment.attempt(interpreter, interpreter.expressions.last_eval)
			v.writable.accept(assignment)
		end

feature {LIBERTY_ASSIGNMENT_FORCED}
	visit_liberty_assignment_forced (v: LIBERTY_ASSIGNMENT_FORCED) is
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
		do
			v.expression.accept(interpreter.expressions)
			create assignment.forced(interpreter, interpreter.expressions.last_eval)
			v.writable.accept(assignment)
		end

feature {LIBERTY_ASSIGNMENT_REGULAR}
	visit_liberty_assignment_regular (v: LIBERTY_ASSIGNMENT_REGULAR) is
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
		do
			v.expression.accept(interpreter.expressions)
			create assignment.regular(interpreter, interpreter.expressions.last_eval)
			v.writable.accept(assignment)
		end

feature {LIBERTY_CALL_INSTRUCTION}
	visit_liberty_call_instruction (v: LIBERTY_CALL_INSTRUCTION) is
		local
			target: LIBERTY_INTERPRETER_OBJECT
		do
			if v.is_implicit_current then
				target := interpreter.target
			else
				v.target.accept(interpreter.expressions)
				target := interpreter.expressions.last_eval
				if target = Void then
					interpreter.fatal_error("Call on Void target")
				end
			end
			interpreter.call_feature(target, v.entity.feature_definition, v.actuals, v.position)
		end

feature {LIBERTY_CHECK_INSTRUCTION}
	visit_liberty_check_instruction (v: LIBERTY_CHECK_INSTRUCTION) is
		do
			interpreter.assertions.validate(v.checks, once "Check")
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
			if not condition_stack.last and then v.else_clause /= Void then
				v.else_clause.accept(Current)
			end
			condition_stack.remove_last
		ensure
			condition_stack.count = old condition_stack.count
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
		local
			assignment: LIBERTY_INTERPRETER_ASSIGNMENT
			new_object: LIBERTY_INTERPRETER_OBJECT
		do
			new_object := interpreter.new_object(v.type.actual_type, v.position)
			interpreter.call_feature(new_object, v.feature_entity.feature_definition, v.feature_arguments, v.position)
			create assignment.regular(interpreter, new_object)
			v.writable.accept(assignment)
		end

feature {LIBERTY_DEBUG}
	visit_liberty_debug (v: LIBERTY_DEBUG) is
		do
			if interpreter.is_in_debug_mode(v.keys) then
				v.instruction.accept(Current)
			end
		end

feature {LIBERTY_DEFAULT}
	visit_liberty_default (v: LIBERTY_DEFAULT) is
		do
			v.instruction.accept(Current)
		end

feature {LIBERTY_EMPTY}
	visit_liberty_empty (v: LIBERTY_EMPTY) is
		do
			-- well, nothing
		end

feature {LIBERTY_INSPECT}
	visit_liberty_inspect (v: LIBERTY_INSPECT) is
		local
			exp: LIBERTY_INTERPRETER_OBJECT
			i, n: INTEGER
		do
			v.expression.accept(interpreter.expressions)
			exp := interpreter.expressions.last_eval
			inspect_stack.add_last(exp)
			n := inspect_stack.count
			from
				i := v.clauses.lower
			until
				inspect_stack.count < n or else i > v.clauses.upper
			loop
				v.clauses.item(i).accept(Current)
				i := i + 1
			end
			if inspect_stack.count = n then
				if v.else_clause = Void then
					interpreter.fatal_error("Inspect: nothing selected")
				else
					v.else_clause.accept(Current)
					check
						inspect_stack.last = exp
					end
					inspect_stack.remove_last
				end
			else
				check
					inspect_stack.count = n - 1
				end
			end
		ensure
			inspect_stack.count = old inspect_stack.count
		end

feature {LIBERTY_INSPECT_CLAUSE}
	visit_liberty_inspect_clause (v: LIBERTY_INSPECT_CLAUSE) is
		local
			i, n: INTEGER; found: BOOLEAN
		do
			from
				n := inspect_stack.count
				i := v.values.lower
			until
				found or else i > v.values.upper
			loop
				v.values.item(i).accept(Current)
				if inspect_stack.count < n then
					check
						inspect_stack.count = n - 1
					end
					v.instruction.accept(Current)
					found := True
				end
				i := i + 1
			end
		ensure
			inspect_stack.count.in_range(old inspect_stack.count - 1, old inspect_stack.count)
		end

feature {LIBERTY_INSPECT_SLICE}
	visit_liberty_inspect_slice (v: LIBERTY_INSPECT_SLICE) is
		local
			lower, upper: LIBERTY_INTERPRETER_OBJECT
		do
			v.lower.accept(interpreter.expressions)
			lower := interpreter.expressions.last_eval
			if v.lower = v.upper then
				if inspect_stack.last.is_equal(lower) then
					inspect_stack.remove_last
				end
			else
				v.upper.accept(interpreter.expressions)
				upper := interpreter.expressions.last_eval
				if inspect_stack.last.is_between(lower, upper, v.position) then
					inspect_stack.remove_last
				end
			end
		ensure
			inspect_stack.count.in_range(old inspect_stack.count - 1, old inspect_stack.count)
		end

feature {LIBERTY_LOOP}
	visit_liberty_loop (v: LIBERTY_LOOP) is
		local
			exp_until: LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN]
			done: BOOLEAN
		do
			from
				v.init.accept(Current)
				if v.variant_clause /= Void then
					loop_variant_stack.add_last(Void)
				end
			until
				done
			loop
				v.expression.accept(interpreter.expressions)
				exp_until ::= interpreter.expressions.last_eval
				if exp_until.item then
					done := True
				else
					v.invariant_clause.accept(interpreter.assertions)
					if v.variant_clause /= Void then
						v.variant_clause.accept(Current)
					end
					v.body.accept(Current)
				end
			end
			if v.variant_clause /= Void then
				loop_variant_stack.remove_last
			end
		end

feature {LIBERTY_VARIANT}
	visit_liberty_variant (v: LIBERTY_VARIANT) is
		local
			exp_variant: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			v.expression.accept(interpreter.expressions)
			if loop_variant_stack.last = Void then
				exp_variant ::= interpreter.expressions.last_eval
			elseif exp_variant.item >= loop_variant_stack.last.item then
				interpreter.fatal_error("Variant failed")
			end
			loop_variant_stack.put(exp_variant, loop_variant_stack.upper)
		end

feature {LIBERTY_PRECURSOR_INSTRUCTION}
	visit_liberty_precursor_instruction (v: LIBERTY_PRECURSOR_INSTRUCTION) is
		do
			interpreter.call_precursor(v.the_feature, v.actuals, v.position)
		end

feature {LIBERTY_RETRY}
	visit_liberty_retry (v: LIBERTY_RETRY) is
		do
			not_yet_implemented
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			create condition_stack.with_capacity(0)
			create inspect_stack.with_capacity(0)
			create loop_variant_stack.with_capacity(0)
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER

	condition_stack: FAST_ARRAY[BOOLEAN]
	inspect_stack: FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT]
	loop_variant_stack: FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]]

invariant
	interpreter /= Void
	condition_stack /= Void

end -- class LIBERTY_INTERPRETER_INSTRUCTIONS
