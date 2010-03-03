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
class LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS

inherit
	LIBERTY_FEATURE_ACCELERATOR

insert
	LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER

creation {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	make

feature {}
	integer (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): INTEGER is
		local
			obj: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			builtin_call.evaluate_parameters
			obj ::= builtin_call.parameters.first
			Result := obj.item.to_integer_32
		end

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTINS}
	call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
		local
			target: LIBERTY_INTERPRETER_NATIVE_ARRAY
		do
			last_call_failed := False
			target ::= builtin_call.target
			inspect
				builtin_call.name.out
			when "element_sizeof" then
				Result := interpreter.new_integer(target.builtin_element_sizeof, builtin_call.position)
			when "calloc" then
				Result := target.builtin_calloc(integer(builtin_call), builtin_call.position)
			when "item" then
				Result := target.builtin_item(integer(builtin_call))
			when "put" then
				put(builtin_call)
			when "slice_copy" then
				slice_copy(builtin_call)
			when "from_pointer" then
				not_yet_implemented
			else
				last_call_failed := True
			end
		end

feature {}
	put (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL) is
		local
			target: LIBERTY_INTERPRETER_NATIVE_ARRAY
			element: LIBERTY_INTERPRETER_OBJECT
			index: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
		do
			target ::= builtin_call.target
			builtin_call.evaluate_parameters
			check
				builtin_call.parameters.lower = 0
			end
			element := builtin_call.parameters.item(0)
			index ::= builtin_call.parameters.item(1)
			target.builtin_put(element.storage_twin, index.item.to_integer_32)
		end

	slice_copy (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL) is
		local
			target: LIBERTY_INTERPRETER_NATIVE_ARRAY
			at, src_min, src_max: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
			src: LIBERTY_INTERPRETER_NATIVE_ARRAY
		do
			target ::= builtin_call.target
			builtin_call.evaluate_parameters
			check
				builtin_call.parameters.lower = 0
			end
			at ::= builtin_call.parameters.item(0)
			src ::= builtin_call.parameters.item(1)
			src_min ::= builtin_call.parameters.item(2)
			src_max ::= builtin_call.parameters.item(3)
			target.builtin_slice_copy(at.item.to_integer_32, src, src_min.item.to_integer_32, src_max.item.to_integer_32)
		end

end -- class LIBERTY_INTERPRETER_EXTERNAL_TYPE_NATIVE_ARRAY_BUILTINS
