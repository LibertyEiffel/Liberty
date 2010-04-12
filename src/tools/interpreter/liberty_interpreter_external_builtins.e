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
class LIBERTY_INTERPRETER_EXTERNAL_BUILTINS

inherit
	LIBERTY_TYPE_VISITOR

create {LIBERTY_INTERPRETER}
	make

feature {LIBERTY_INTERPRETER_FEATURE_CALL}
	call (a_builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL) is
		do
			last_call_failed := False
			builtin_call := a_builtin_call
			builtin_call.definition_type.accept(Current)
			if last_call_failed then
				last_call_failed := False
				builtin_call.target.type.accept(Current)
				if last_call_failed then
					interpreter.fatal_error("Unknown built-in feature in class " + builtin_call.target.type.full_name)
				end
			end
		end

feature {}
	make (a_interpreter: like interpreter) is
		require
			a_interpreter /= Void
		do
			interpreter := a_interpreter
			create type_any_builtins.make(a_interpreter)
			create type_platform_builtins.make(a_interpreter)
			create type_pointer_builtins.make(a_interpreter)
			create type_integer_64_builtins.make(a_interpreter)
			create type_integer_32_builtins.make(a_interpreter)
			create type_integer_16_builtins.make(a_interpreter)
			create type_integer_8_builtins.make(a_interpreter)
			create type_real_64_builtins.make(a_interpreter)
			create type_real_32_builtins.make(a_interpreter)
			create type_real_80_builtins.make(a_interpreter)
			create type_real_128_builtins.make(a_interpreter)
			create type_character_builtins.make(a_interpreter)
			create type_string_builtins.make(a_interpreter)
			create type_boolean_builtins.make(a_interpreter)
			create type_native_array_builtins.make(a_interpreter)
			create type_tuple_builtins.make(a_interpreter)
			create type_procedure_builtins.make(a_interpreter)
			create type_function_builtins.make(a_interpreter)
			create type_predicate_builtins.make(a_interpreter)
			create user_type_builtins.make(a_interpreter)
		ensure
			interpreter = a_interpreter
		end

	interpreter: LIBERTY_INTERPRETER
	builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL
	last_call_failed: BOOLEAN

	type_any_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS
	type_platform_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_PLATFORM_BUILTINS
	type_pointer_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_POINTER_BUILTINS
	type_integer_64_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_64_BUILTINS
	type_integer_32_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_32_BUILTINS
	type_integer_16_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_16_BUILTINS
	type_integer_8_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_INTEGER_8_BUILTINS
	type_real_64_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_64_BUILTINS
	type_real_32_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_32_BUILTINS
	type_real_80_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_80_BUILTINS
	type_real_128_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_REAL_128_BUILTINS
	type_character_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_CHARACTER_BUILTINS
	type_string_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_STRING_BUILTINS
	type_boolean_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_BOOLEAN_BUILTINS
	type_native_array_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS
	type_tuple_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_TUPLE_BUILTINS
	type_procedure_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_PROCEDURE_BUILTINS
	type_function_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_FUNCTION_BUILTINS
	type_predicate_builtins: LIBERTY_INTERPRETER_EXTERNAL_TYPE_PREDICATE_BUILTINS
	user_type_builtins: LIBERTY_INTERPRETER_EXTERNAL_USER_TYPE_BUILTINS

feature {LIBERTY_UNIVERSE}
	-- Note for the features below: we need to get the builtin call back in a local variable to ensure re-entrance

	visit_type_any (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_any_builtins.call(bc)
			if type_any_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_platform (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_platform_builtins.call(bc)
			if type_platform_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_pointer (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_pointer_builtins.call(bc)
			if type_pointer_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_integer_64 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_integer_64_builtins.call(bc)
			if type_integer_64_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_integer_32 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_integer_32_builtins.call(bc)
			if type_integer_32_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_integer_16 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_integer_16_builtins.call(bc)
			if type_integer_16_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_integer_8 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_integer_8_builtins.call(bc)
			if type_integer_8_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_real_64 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_real_64_builtins.call(bc)
			if type_real_64_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_real_32 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_real_32_builtins.call(bc)
			if type_real_32_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_real_80 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_real_80_builtins.call(bc)
			if type_real_80_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_real_128 (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_real_128_builtins.call(bc)
			if type_real_128_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_character (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_character_builtins.call(bc)
			if type_character_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_string (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_string_builtins.call(bc)
			if type_string_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_boolean (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_boolean_builtins.call(bc)
			if type_boolean_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_native_array (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_native_array_builtins.call(bc)
			if type_native_array_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_tuple (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_tuple_builtins.call(bc)
			if type_tuple_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_procedure (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_procedure_builtins.call(bc)
			if type_procedure_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_function (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_function_builtins.call(bc)
			if type_function_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_type_predicate (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := type_predicate_builtins.call(bc)
			if type_predicate_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

	visit_user_type (type: LIBERTY_ACTUAL_TYPE_IMPL) is
		local
			ret: LIBERTY_INTERPRETER_OBJECT
			bc: like builtin_call
		do
			bc := builtin_call
			ret := user_type_builtins.call(bc)
			if user_type_builtins.last_call_failed then
				last_call_failed := True
			else
				bc.set_returned_object(ret)
			end
		end

feature {LIBERTY_VOID_TYPE}
	visit_void (type: LIBERTY_VOID_TYPE) is
		do
			check False end
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_BUILTINS
