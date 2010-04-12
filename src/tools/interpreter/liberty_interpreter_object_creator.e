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
class LIBERTY_INTERPRETER_OBJECT_CREATOR

inherit
	LIBERTY_TYPE_VISITOR

creation {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_INTERPRETER}
	new_object (type: LIBERTY_ACTUAL_TYPE; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		do
			position := a_position
			type.accept(Current)
			Result := last_created
		ensure
			Result.type = type
		end

feature {LIBERTY_UNIVERSE}
	visit_type_any (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			check False end
		end

	visit_type_platform (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			check False end
		end

	visit_type_pointer (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[POINTER]} last_created.make(interpreter, type, position)
		end

	visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} last_created.make(interpreter, type, position)
		end

	visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} last_created.make(interpreter, type, position)
		end

	visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} last_created.make(interpreter, type, position)
		end

	visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[INTEGER_64]} last_created.make(interpreter, type, position)
		end

	visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} last_created.make(interpreter, type, position)
		end

	visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} last_created.make(interpreter, type, position)
		end

	visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} last_created.make(interpreter, type, position)
		end

	visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[REAL_128]} last_created.make(interpreter, type, position)
		end

	visit_type_character (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_HASHABLE[CHARACTER]} last_created.make(interpreter, type, position)
		end

	visit_type_string (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_STRUCTURE} last_created.make(interpreter, type, position)
		end

	visit_type_boolean (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_BOOLEAN} last_created.make(interpreter, type, position)
		end

	visit_type_native_array (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			last_created := interpreter.new_array(type, 0, position)
		end

	visit_type_tuple (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_STRUCTURE} last_created.make(interpreter, type, position)
		end

	visit_type_procedure (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_AGENT} last_created.make(interpreter, type, position)
		end

	visit_type_function (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_AGENT} last_created.make(interpreter, type, position)
		end

	visit_type_predicate (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_AGENT} last_created.make(interpreter, type, position)
		end

	visit_user_type (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			create {LIBERTY_INTERPRETER_OBJECT_STRUCTURE} last_created.make(interpreter, type, position)
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (type: LIBERTY_VOID_TYPE) is
		do
			last_created := interpreter.void_object(type, position)
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

	position: LIBERTY_POSITION
	last_created: LIBERTY_INTERPRETER_OBJECT
	interpreter: LIBERTY_INTERPRETER

invariant
	interpreter /= Void

end -- class LIBERTY_INTERPRETER_OBJECT_CREATOR
