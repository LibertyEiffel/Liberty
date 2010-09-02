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
class LIBERTY_INTERPRETER_FOREIGN_TYPES

inherit
	LIBERTY_TYPE_VISITOR

create {LIBERTY_INTERPRETER_EXTERNAL_PLUGINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_PLUGINS}
	type (a_type: LIBERTY_KNOWN_TYPE): FOREIGN_TYPE is
		require
			a_type /= Void
		do
			a_type.accept(Current)
			Result := foreign_type
		end

feature {LIBERTY_UNIVERSE}
	visit_type_any (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_platform (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_pointer (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.pointer
		end

	visit_type_integer_64 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.sint64
		end

	visit_type_integer_32 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.sint32
		end

	visit_type_integer_16 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.sint16
		end

	visit_type_integer_8 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.sint8
		end

	visit_type_real_64 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.double
		end

	visit_type_real_32 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.float
		end

	visit_type_real_80 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_real_128 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_character (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.schar
		end

	visit_type_string (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_boolean (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.sint32
		end

	visit_type_native_array (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			foreign_type := types.pointer
		end

	visit_type_tuple (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_routine (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_procedure (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_function (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_type_predicate (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

	visit_user_type (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (a_type: LIBERTY_VOID_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin", errors.unknown_position)
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

	foreign_type: FOREIGN_TYPE
	types: FOREIGN_TYPES

	interpreter: LIBERTY_INTERPRETER
	errors: LIBERTY_ERRORS

end -- LIBERTY_INTERPRETER_FOREIGN_TYPES
