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

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
		do
			inspect
				builtin_call.name.out
			when "generating_type" then
				Result := interpreter.new_string(builtin_call.target.type.full_name.out, builtin_call.position)
			when "generator" then
				Result := interpreter.new_string(builtin_call.target.type.name.out, builtin_call.position)
			when "same_dynamic_type" then
				Result := interpreter.new_boolean(builtin_call.target.type = builtin_call.parameters.first.type, builtin_call.position)
			when "is_equal" then
				not_yet_implemented
			when "standard_is_equal" then
				not_yet_implemented
			when "is_deep_equal" then
				not_yet_implemented
			when "twin" then
				not_yet_implemented
			when "copy" then
				not_yet_implemented
			when "standard_twin" then
				not_yet_implemented
			when "standard_copy" then
				not_yet_implemented
			when "deep_twin" then
				not_yet_implemented
			when "trace_switch" then
				-- se specific
				not_yet_implemented
			when "sedb_breakpoint" then
				-- se specific
				not_yet_implemented
			when "die_with_code" then
				not_yet_implemented
			when "to_pointer" then
				not_yet_implemented
			when "is_basic_expanded_type" then
				not_yet_implemented
			when "object_size" then
				not_yet_implemented
			when "c_inline_h" then
				-- se specific
				not_yet_implemented
			when "c_inline_c" then
				-- se specific
				not_yet_implemented
			when "print_run_time_stack" then
				not_yet_implemented
			when "to_internals" then
				not_yet_implemented
			else
				interpreter.fatal_error("Unknown built-in in ANY: " + builtin_call.name)
			end
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

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_ANY_BUILTINS
