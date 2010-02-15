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
class LIBERTY_INTERPRETER_ASSIGNMENT

inherit
	LIBERTY_ENTITY_VISITOR

creation {LIBERTY_INTERPRETER_INSTRUCTIONS}
	make

feature {LIBERTY_CURRENT}
	visit_liberty_current (v: LIBERTY_CURRENT) is
		do
			interpreter.fatal_error("Cannot assign Current")
		end

feature {LIBERTY_FEATURE_DEFINITION}
	visit_liberty_feature_definition (v: LIBERTY_FEATURE_DEFINITION) is
		do
			interpreter.fatal_error("Cannot assign a feature definition")
		end

feature {LIBERTY_FEATURE_ENTITY}
	visit_liberty_feature_entity (v: LIBERTY_FEATURE_ENTITY) is
		do
			interpreter.fatal_error("Cannot assign a feature entity")
		end

feature {LIBERTY_LOCAL}
	visit_liberty_local (v: LIBERTY_LOCAL) is
		do
			interpreter.set_local(v.name, value)
		end

feature {LIBERTY_PARAMETER}
	visit_liberty_parameter (v: LIBERTY_PARAMETER) is
		do
			interpreter.fatal_error("Cannot assign a parameter")
		end

feature {LIBERTY_RESULT}
	visit_liberty_result (v: LIBERTY_RESULT) is
		do
			interpreter.set_returned_object(value)
		end

feature {LIBERTY_WRITABLE_FEATURE}
	visit_liberty_writable_feature (v: LIBERTY_WRITABLE_FEATURE) is
		do
			interpreter.set_writable_feature(v.name, value)
		end

feature {}
	make (a_interpreter: like interpreter; a_value: like value) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			value := a_value
		ensure
			interpreter = a_interpreter
			value = a_value
		end

	interpreter: LIBERTY_INTERPRETER_INTERPRETER
	value: LIBERTY_INTERPRETER_OBJECT

invariant
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_ASSIGNMENT
