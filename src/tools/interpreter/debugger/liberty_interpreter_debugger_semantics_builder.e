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
class LIBERTY_INTERPRETER_DEBUGGER_SEMANTICS_BUILDER

insert
	LIBERTY_SEMANTICS_BUILDER
		rename
			instruction as sem_instruction
			expression as sem_expression
		end

create {LIBERTY_INTERPRETER_DEBUGGER}
	make

feature {ANY}
	expression (exp: LIBERTY_AST_EXPRESSION; current_type: LIBERTY_ACTUAL_TYPE): LIBERTY_EXPRESSION is
		local
			local_context: LIBERTY_FEATURE_DEFINITION_CONTEXT
		do
			type := current_type
			ast := exp
			create local_context.make(current_type)
			Result := sem_expression(exp, local_context)
		end

	instruction (exp: LIBERTY_AST_INSTRUCTION; current_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INSTRUCTION is
		local
			local_context: LIBERTY_FEATURE_DEFINITION_CONTEXT
		do
			type := current_type
			ast := exp
			create local_context.make(current_type)
			Result := sem_instruction(exp, local_context)
		end

feature {}
	instruction_call_on_precursor (a_precursor_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_DEFINITION_CONTEXT): LIBERTY_PRECURSOR_INSTRUCTION is
		do
			std_error.put_string(once "*** Cannot call Precursor")
		end

	expression_call_on_precursor (a_precursor_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_DEFINITION_CONTEXT): LIBERTY_PRECURSOR_EXPRESSION is
		do
			std_error.put_string(once "*** Cannot call Precursor")
		end

	ast: LIBERTY_AST_NON_TERMINAL_NODE
	type: LIBERTY_ACTUAL_TYPE

	current_entity: LIBERTY_CURRENT is
		do
			Result := type.current_entity
		end

	file: FIXED_STRING is
		once
			Result := "<command line>".intern
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER
	universe: LIBERTY_UNIVERSE is
		do
			Result := interpreter.universe
		end

end -- class LIBERTY_INTERPRETER_DEBUGGER_SEMANTICS_BUILDER
