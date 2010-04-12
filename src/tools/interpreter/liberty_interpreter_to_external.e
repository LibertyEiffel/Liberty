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
class LIBERTY_INTERPRETER_TO_EXTERNAL

inherit
	LIBERTY_TYPE_VISITOR

create {LIBERTY_INTERPRETER_EXTERNAL_PLUGINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_PLUGINS}
	item (a_object: LIBERTY_INTERPRETER_OBJECT): FOREIGN_OBJECT is
		require
			a_object /= Void
		do
			liberty_object := a_object
			a_object.result_type.actual_type.accept(Current)
			Result := external_object
		end

feature {}
	external_object: FOREIGN_OBJECT
	liberty_object: LIBERTY_INTERPRETER_OBJECT

feature {LIBERTY_UNIVERSE}
	visit_type_any (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_platform (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_pointer (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[POINTER]
		do
			p ::= liberty_object
			external_object := foreign_types.create_pointer(p.item)
		end

	visit_type_integer_64 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			p ::= liberty_object
			external_object := foreign_types.create_sint64(p.item)
		end

	visit_type_integer_32 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			p ::= liberty_object
			external_object := foreign_types.create_sint32(p.item.to_integer_32)
		end

	visit_type_integer_16 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			p ::= liberty_object
			external_object := foreign_types.create_sint16(p.item.to_integer_16)
		end

	visit_type_integer_8 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			p ::= liberty_object
			external_object := foreign_types.create_sint8(p.item.to_integer_8)
		end

	visit_type_real_64 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128]
		do
			p ::= liberty_object
			external_object := foreign_types.create_double(p.item.force_to_real_64)
		end

	visit_type_real_32 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128]
		do
			p ::= liberty_object
			external_object := foreign_types.create_double(p.item.force_to_real_32)
		end

	visit_type_real_80 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_real_128 (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_character (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER]
		do
			p ::= liberty_object
			external_object := foreign_types.create_schar(p.item)
		end

	visit_type_string (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_boolean (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_OBJECT_BOOLEAN
		do
			p ::= liberty_object
			external_object := foreign_types.create_sint32(p.item.to_integer)
		end

	visit_type_native_array (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			p: LIBERTY_INTERPRETER_NATIVE_ARRAY
		do
			p ::= liberty_object
			external_object := foreign_types.create_pointer(p.to_external)
		end

	visit_type_tuple (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_procedure (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_function (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_type_predicate (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

	visit_user_type (a_type: LIBERTY_ACTUAL_TYPE_IMPL) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (a_type: LIBERTY_VOID_TYPE) is
		do
			interpreter.fatal_error("The type " + a_type.full_name + " cannot be transmitted to a plugin")
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
	foreign_types: FOREIGN_TYPES

	storage_attribute: FIXED_STRING is
		once
			Result := "storage".intern
		end

end -- LIBERTY_INTERPRETER_FOREIGN_TYPES
