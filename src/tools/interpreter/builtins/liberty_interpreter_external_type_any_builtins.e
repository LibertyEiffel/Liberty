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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS

insert
	LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
		do
			last_call_failed := False
			builtin_call.evaluate_parameters
			inspect
				builtin_call.name
			when "generating_type" then
				Result := interpreter.new_string(builtin_call.target.type.full_name.out, builtin_call.position)
			when "generator" then
				Result := interpreter.new_string(builtin_call.target.type.name.out, builtin_call.position)
			when "same_dynamic_type" then
				Result := interpreter.new_boolean(builtin_call.target.type = builtin_call.parameters.first.type, builtin_call.position)
			when "is_equal" then
				Result := interpreter.new_boolean(builtin_call.target.builtin_is_equal(builtin_call.parameters.first, builtin_call.position), builtin_call.position)
			when "standard_is_equal" then
				Result := interpreter.new_boolean(builtin_call.target.builtin_standard_is_equal(builtin_call.parameters.first, builtin_call.position), builtin_call.position)
			when "is_deep_equal" then
				Result := interpreter.new_boolean(builtin_call.target.builtin_is_deep_equal(builtin_call.parameters.first, builtin_call.position), builtin_call.position)
			when "twin" then
				Result := builtin_call.target.builtin_twin(builtin_call.position)
			when "copy" then
				builtin_call.target.builtin_copy(builtin_call.parameters.first, builtin_call.position)
			when "standard_twin" then
				Result := builtin_call.target.builtin_standard_twin(builtin_call.position)
			when "standard_copy" then
				builtin_call.target.builtin_standard_copy(builtin_call.parameters.first, builtin_call.position)
			when "deep_twin" then
				Result := builtin_call.target.builtin_deep_twin(builtin_call.position)
			when "trace_switch" then
				-- se specific, does nothing
			when "sedb_breakpoint" then
				-- se specific, should do nothing
				interpreter.break
			when "die_with_code" then
				do_die_with_code(builtin_call.parameters.first)
			when "to_pointer" then
				Result := interpreter.new_pointer(builtin_call.target.to_pointer, builtin_call.position)
			when "is_basic_expanded_type" then
				not_yet_implemented
			when "object_size" then
				Result := interpreter.new_integer(builtin_call.target.object_size, builtin_call.position)
			when "c_inline_h" then
				-- se specific
				not_yet_implemented
			when "c_inline_c" then
				-- se specific
				not_yet_implemented
			when "print_run_time_stack" then
				interpreter.show_stack(std_output)
			when "to_internals" then
				not_yet_implemented
			else
				last_call_failed := True
			end
		end

feature {}
	do_die_with_code (status: LIBERTY_INTERPRETER_OBJECT) is
		local
			sts: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			sts ::= status
			die_with_code(sts.item.to_integer_32)
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS
