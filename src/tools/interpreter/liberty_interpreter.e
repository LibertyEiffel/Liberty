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
class LIBERTY_INTERPRETER

creation {LIBERTYI}
	make

feature {LIBERTYI}
	run is
		local
			root_object: LIBERTY_INTERPRETER
		do
			create root_object.make(root_object_name, root_type)
			call_feature(root_object, root_feature, root_feature_parameters)
		end

feature {ANY}
	fatal_error (reason: ABSTRACT_STRING) is
		local
			i: INTEGER
		do
			check
				call_stack.lower = 0
			end
			std_output.put_line(once "--[Bottom of stack]--")
			from
				i := call_stack.lower
			until
				i > call_stack.upper
			loop
				if i > call_stack.lower then
					std_output.put_line(once "---------------------")
				end
				std_output.put_integer(i + 1)
				std_output.put_character('%T')
				call_stack.item(i).show_stack(std_output)
				i := i + 1
			end
			std_output.put_line(once "---[Top of stack]----")
			std_error.put_string(reason)
			die_with_code(1)
		end

	instructions: LIBERTY_INTERPRETER_INSTRUCTIONS
	expressions: LIBERTY_INTERPRETER_EXPRESSIONS
	assertions: LIBERTY_INTERPRETER_ASSERTION_CHECKER

	call_feature (target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]) is
		local
			dummy: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			dummy := do_call(target, feature_to_call, parameters)
		end

	item_feature (target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_OBJECT_INTERPRETER is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			call := do_call(target, feature_to_call, parameters)
			Result := call.returned_object
		end

	call_precursor (a_precursor: LIBERTY_FEATURE; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]) is
		local
			dummy: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			dummy := do_precursor(a_precursor, parameters)
		end

	item_precursor (a_precursor: LIBERTY_FEATURE; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_INTERPRETER_OBJECT is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			call := do_precursor(a_precursor, parameters)
			Result :=call.returned_object
		end

	is_in_debug_mode (keys: TRAVERSABLE[ABSTRACT_STRING]): BOOLEAN is
		do
			--|*** TODO
			Result := True
		end

feature {}
	do_call (target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			create Result.make(Current, target, feature_to_call, parameters)
			call_stack.add_last(Result)
			Result.call
			check
				call_stack.last = Result
			end
			call_stack.remove_last
		end

	do_precursor (a_feature: LIBERTY_FEATURE; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			create Result.make_precursor(Current, call_stack.last.target, a_feature, parameters)
			call_stack.add_last(Result)
			Result.call
			check
				call_stack.last = Result
			end
			call_stack.remove_last
		end

feature {LIBERTY_INTERPRETER_ASSIGNMENT}
	local_static_type (name: FIXED_STRING): LIBERTY_ACTUAL_TYPE is
		do
			Result := call_stack.last.local_static_type(name)
		end

	set_local (name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_local(name, value)
		end

	returned_static_type: LIBERTY_ACTUAL_TYPE is
		do
			Result := call_stack.last.returned_static_type
		end

	set_returned_object (value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_returned_object(value)
		end

	writable_feature_static_type (name: LIBERTY_FEATURE_NAME) is
		do
			Result := call_stack.last.writable_feature_name(name)
		end

	set_writable_feature (name: LIBERTY_FEATURE_NAME; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_writable_feature(name, value)
		end

feature {}
	make (a_root_type: like root_type; a_root_feature_name: LIBERTY_FEATURE_NAME) is
		require
			a_root_type.has_feature(a_root_feature_name)
		do
			root_type := a_root_type
			root_feature := a_root_type.feature_definition(a_root_feature_name)

			create instructions.make(Current)
			create expressions.make(Current)
			create assertions.make(Current)

			create {FAST_ARRAY[LIBERTY_INTERPRETER_FEATURE_CALL]} call_stack.with_capacity(1024)
		ensure
			root_type = a_root_type
			root_feature = a_root_type.feature_definition(a_root_feature_name)
		end

	root_type: LIBERTY_ACTUAL_TYPE
	root_feature: LIBERTY_FEATURE_DEFINITION

	root_object_name: FIXED_STRING is
		once
			Result := "<root>".intern
		end

	root_feature_parameters: COLLECTION[LIBERTY_INTERPRETER_OBJECT] is
		once
			create {FAST_ARRAY[LIBERTY_INTERPRETER_OBJECT]} Result.with_capacity(0)
		ensure
			Result.is_empty
		end

	call_stack: COLLECTION[LIBERTY_INTERPRETER_FEATURE_CALL]

invariant
	instructions /= Void
	expressions /= Void
	call_stack /= Void

end -- class LIBERTY_INTERPRETER
