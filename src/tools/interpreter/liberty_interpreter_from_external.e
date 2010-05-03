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
class LIBERTY_INTERPRETER_FROM_EXTERNAL

inherit
	LIBERTY_TYPE_VISITOR

create {LIBERTY_INTERPRETER_EXTERNAL_PLUGINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_PLUGINS}
	item (a_type: LIBERTY_KNOWN_TYPE; a_external: FOREIGN_OBJECT; a_position: like position): LIBERTY_INTERPRETER_OBJECT is
		require
			a_type /= Void
		do
			position := a_position
			external_object := a_external
			a_type.accept(Current)
			Result := liberty_object
		end

feature {}
	position: LIBERTY_POSITION
	external_object: FOREIGN_OBJECT
	liberty_object: LIBERTY_INTERPRETER_OBJECT

feature {LIBERTY_UNIVERSE}
	visit_type_any (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_platform (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_pointer (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[POINTER]
		do
			p ::= external_object
			liberty_object := interpreter.new_pointer(p.item, position)
		end

	visit_type_integer_64 (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[INTEGER_64]
		do
			p ::= external_object
			liberty_object := interpreter.new_integer_64(p.item, position)
		end

	visit_type_integer_32 (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[INTEGER_32]
		do
			p ::= external_object
			liberty_object := interpreter.new_integer_32(p.item, position)
		end

	visit_type_integer_16 (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[INTEGER_16]
		do
			p ::= external_object
			liberty_object := interpreter.new_integer_16(p.item, position)
		end

	visit_type_integer_8 (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[INTEGER_8]
		do
			p ::= external_object
			liberty_object := interpreter.new_integer_8(p.item, position)
		end

	visit_type_real_64 (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[REAL_64]
		do
			p ::= external_object
			liberty_object := interpreter.new_real_64(p.item, position)
		end

	visit_type_real_32 (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[REAL_32]
		do
			p ::= external_object
			liberty_object := interpreter.new_real_32(p.item, position)
		end

	visit_type_real_80 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_real_128 (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_character (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[CHARACTER]
		do
			p ::= external_object
			liberty_object := interpreter.new_character(p.item, position)
		end

	visit_type_string (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_boolean (a_type: LIBERTY_ACTUAL_TYPE) is
		local
			p: FOREIGN_TYPED_OBJECT[INTEGER]
		do
			p ::= external_object
			liberty_object := interpreter.new_boolean(p.item /= 0, position)
		end

	visit_type_native_array (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_tuple (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_procedure (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_function (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_type_predicate (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

	visit_user_type (a_type: LIBERTY_ACTUAL_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (a_type: LIBERTY_VOID_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted from a plugin", position)
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

end -- LIBERTY_INTERPRETER_FROM_EXTERNAL
