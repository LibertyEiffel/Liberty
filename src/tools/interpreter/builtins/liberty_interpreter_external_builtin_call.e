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
class LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL

inherit
	LIBERTY_TYPE_VISITOR

create {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	last_call_failed: BOOLEAN

	call is
		do
			last_call_failed := False
			builtin_call.definition_type.accept(Current)
			if last_call_failed then
				last_call_failed := False
				builtin_call.target.type.accept(Current)
			end
		end

feature {}
	make (a_interpreter: like interpreter; a_builtin_call: like builtin_call) is
		require
			a_interpreter /= Void
			a_builtin_call /= Void
		do
			interpreter := a_interpreter
			builtin_call := a_builtin_call
		ensure
			interpreter = a_interpreter
			builtin_call = a_builtin_call
		end

	interpreter: LIBERTY_INTERPRETER
	builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL

feature {LIBERTY_UNIVERSE}
	visit_type_any (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_any_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS
		do
			create type_any_builtins.make(interpreter)
			ret := type_any_builtins.call(builtin_call)
			if type_any_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_platform (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_platform_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_PLATFORM_BUILTINS
		do
			create type_platform_builtins.make(interpreter)
			ret := type_platform_builtins.call(builtin_call)
			if type_platform_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_pointer (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_pointer_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_POINTER_BUILTINS
		do
			create type_pointer_builtins.make(interpreter)
			ret := type_pointer_builtins.call(builtin_call)
			if type_pointer_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_integer_64_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_64_BUILTINS
		do
			create type_integer_64_builtins.make(interpreter)
			ret := type_integer_64_builtins.call(builtin_call)
			if type_integer_64_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_integer_32_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_32_BUILTINS
		do
			create type_integer_32_builtins.make(interpreter)
			ret := type_integer_32_builtins.call(builtin_call)
			if type_integer_32_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_integer_16_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_16_BUILTINS
		do
			create type_integer_16_builtins.make(interpreter)
			ret := type_integer_16_builtins.call(builtin_call)
			if type_integer_16_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_integer_8_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_8_BUILTINS
		do
			create type_integer_8_builtins.make(interpreter)
			ret := type_integer_8_builtins.call(builtin_call)
			if type_integer_8_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_real_64_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_64_BUILTINS
		do
			create type_real_64_builtins.make(interpreter)
			ret := type_real_64_builtins.call(builtin_call)
			if type_real_64_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_real_32_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_32_BUILTINS
		do
			create type_real_32_builtins.make(interpreter)
			ret := type_real_32_builtins.call(builtin_call)
			if type_real_32_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_real_80_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_80_BUILTINS
		do
			create type_real_80_builtins.make(interpreter)
			ret := type_real_80_builtins.call(builtin_call)
			if type_real_80_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_real_128_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_128_BUILTINS
		do
			create type_real_128_builtins.make(interpreter)
			ret := type_real_128_builtins.call(builtin_call)
			if type_real_128_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_character (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_character_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_CHARACTER_BUILTINS
		do
			create type_character_builtins.make(interpreter)
			ret := type_character_builtins.call(builtin_call)
			if type_character_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_string (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_string_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_STRING_BUILTINS
		do
			create type_string_builtins.make(interpreter)
			ret := type_string_builtins.call(builtin_call)
			if type_string_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_boolean (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_boolean_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_BOOLEAN_BUILTINS
		do
			create type_boolean_builtins.make(interpreter)
			ret := type_boolean_builtins.call(builtin_call)
			if type_boolean_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_native_array (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_native_array_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS
		do
			create type_native_array_builtins.make(interpreter)
			ret := type_native_array_builtins.call(builtin_call)
			if type_native_array_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_tuple (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_tuple_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_TUPLE_BUILTINS
		do
			create type_tuple_builtins.make(interpreter)
			ret := type_tuple_builtins.call(builtin_call)
			if type_tuple_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_routine (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_routine_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_ROUTINE_BUILTINS
		do
			create type_routine_builtins.make(interpreter)
			ret := type_routine_builtins.call(builtin_call)
			if type_routine_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_procedure (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_procedure_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_PROCEDURE_BUILTINS
		do
			create type_procedure_builtins.make(interpreter)
			ret := type_procedure_builtins.call(builtin_call)
			if type_procedure_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_function (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_function_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_FUNCTION_BUILTINS
		do
			create type_function_builtins.make(interpreter)
			ret := type_function_builtins.call(builtin_call)
			if type_function_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_type_predicate (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			type_predicate_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_PREDICATE_BUILTINS
		do
			create type_predicate_builtins.make(interpreter)
			ret := type_predicate_builtins.call(builtin_call)
			if type_predicate_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

	visit_user_type (type: LIBERTY_ACTUAL_TYPE) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			user_type_builtins: LIBERTY_INTERPRETER_EXTERNAL_USER_TYPE_BUILTINS
		do
			create user_type_builtins.make(interpreter)
			ret := user_type_builtins.call(builtin_call)
			if user_type_builtins.last_call_failed then
				last_call_failed := True
			else
				builtin_call.set_returned_object(ret)
			end
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (type: LIBERTY_VOID_TYPE) is
		do
			check False end
		end

invariant
	interpreter /= Void
	builtin_call /= Void

end -- class LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL
