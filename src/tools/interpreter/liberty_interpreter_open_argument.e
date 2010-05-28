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
class LIBERTY_INTERPRETER_OPEN_ARGUMENT

inherit
	LIBERTY_INTERPRETER_OBJECT
		redefine
			is_open
		end

create {LIBERTY_INTERPRETER_EXPRESSIONS}
	make

feature {ANY}
	is_open: BOOLEAN is True

	is_equal (other: LIBERTY_INTERPRETER_OBJECT): BOOLEAN is
		do
			Result := other = Current
		end

	converted_to (target_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT is
		do
			not_yet_implemented
		end

	type: LIBERTY_ACTUAL_TYPE

feature {LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS} -- Standard builtings
	builtin_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
		do
			not_yet_implemented
		end

	builtin_standard_is_equal (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION): BOOLEAN is
		do
			not_yet_implemented
		end

	builtin_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION) is
		do
			not_yet_implemented
		end

	builtin_twin (a_position: LIBERTY_POSITION): like Current is
		do
			not_yet_implemented
		end

	builtin_standard_copy (other: LIBERTY_INTERPRETER_OBJECT; a_position: LIBERTY_POSITION) is
		do
			not_yet_implemented
		end

	builtin_standard_twin (a_position: LIBERTY_POSITION): like Current is
		do
			not_yet_implemented
		end

feature {LIBERTY_INTERPRETER_OBJECT}
	do_deep_twin (deep_twin_memory: DICTIONARY[LIBERTY_INTERPRETER_OBJECT, LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		do
			not_yet_implemented
		end

	do_deep_equal (object: LIBERTY_INTERPRETER_OBJECT; deep_equal_memory: SET[LIBERTY_INTERPRETER_OBJECT]; a_position: LIBERTY_POSITION): BOOLEAN is
		do
			not_yet_implemented
		end

feature {LIBERTY_INTERPRETER_OBJECT_PRINTER, LIBERTY_INTERPRETER_FEATURE_CALL}
	show_stack (o: OUTPUT_STREAM; indent: INTEGER) is
		do
			o.put_character('{')
			o.put_string(type.full_name)
			o.put_character('}')
		end

feature {}
	expanded_twin: like Current is
		do
			not_yet_implemented
		end

feature {}
	make (a_interpreter: like interpreter; a_type: like type) is
		require
			a_interpreter /= Void
			a_type /= Void
		do
			interpreter := a_interpreter
			type := a_type
		ensure
			interpreter = a_interpreter
			type = a_type
		end

end -- class LIBERTY_INTERPRETER_OPEN_ARGUMENT
