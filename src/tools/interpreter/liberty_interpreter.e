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
			root_object: LIBERTY_INTERPRETER_OBJECT
		do
			debug
				std_output.put_string(once "Now running {")
				std_output.put_string(root_type.full_name)
				std_output.put_string(once "}.")
				std_output.put_line(root_feature_name.full_name)
			end
			root_object := new_object(root_type)
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
			std_output.put_line(once "=========== [Bottom of stack] ===========")
			from
				i := call_stack.lower
			until
				i > call_stack.upper
			loop
				if i > call_stack.lower then
					std_output.put_line(once "-----------------------------------------")
				end
				std_output.put_integer(i + 1)
				std_output.put_character('%T')
				call_stack.item(i).show_stack(std_output)
				i := i + 1
			end
			std_output.put_line(once "============ [Top of stack] =============")
			std_error.put_line(reason)
			sedb_breakpoint
			die_with_code(1)
		end

	instructions: LIBERTY_INTERPRETER_INSTRUCTIONS
	expressions: LIBERTY_INTERPRETER_EXPRESSIONS
	assertions: LIBERTY_INTERPRETER_ASSERTION_CHECKER
	creator: LIBERTY_INTERPRETER_OBJECT_CREATOR
	array_creator: LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR

	universe: LIBERTY_UNIVERSE

	call_feature (a_target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]) is
		local
			dummy: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			dummy := do_call(a_target, feature_to_call, parameters)
		end

	item_feature (a_target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_INTERPRETER_OBJECT is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			call := do_call(a_target, feature_to_call, parameters)
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
			Result := call.returned_object
		end

	new_object (object_type: LIBERTY_ACTUAL_TYPE): LIBERTY_INTERPRETER_OBJECT is
		do
			debug
				std_output.put_string(once "Creating new object of type ")
				std_output.put_line(object_type.full_name)
			end
			Result := creator.new_object(object_type)
		end

	new_array (type: LIBERTY_ACTUAL_TYPE; capacity: INTEGER): LIBERTY_INTERPRETER_OBJECT is
		do
			check
				type.parameters.count = 1
			end
			debug
				std_output.put_string(once "Creating new array of ")
				std_output.put_integer(capacity)
				std_output.put_character(' ')
				std_output.put_line(type.parameters.first.full_name)
			end
			Result := array_creator.new_array(type, capacity)
		end

	is_in_debug_mode (keys: TRAVERSABLE[ABSTRACT_STRING]): BOOLEAN is
		do
			--|*** TODO
			Result := True
		end

	old_value (a_expression: LIBERTY_EXPRESSION): LIBERTY_INTERPRETER_OBJECT is
		do
			check
				call_stack.last.has_old_value(a_expression)
			end
			Result := call_stack.last.old_value(a_expression)
		end

feature {LIBERTY_INTERPRETER_POSTCONDITION_BROWSER}
	add_old_value (a_expression: LIBERTY_EXPRESSION; a_value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.add_old_value(a_expression, a_value)
		end

feature {}
	do_call (a_target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			create Result.make(Current, a_target, feature_to_call, parameters)
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

feature {LIBERTY_INTERPRETER_EXPRESSIONS}
	target: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := call_stack.last.target
		end

	local_value (name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := call_stack.last.local_value(name)
		end

	returned_object: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := call_stack.last.returned_object
		end

	writable_feature (name: LIBERTY_FEATURE_NAME): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := call_stack.last.writable_feature(name)
		end

	parameter (name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := call_stack.last.parameter(name)
		end

feature {LIBERTY_INTERPRETER_ASSIGNMENT}
	local_static_type (name: FIXED_STRING): LIBERTY_ACTUAL_TYPE is
		do
			Result := call_stack.last.local_static_type(name)
		end

	set_local_value (name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_local_value(name, value)
		end

	returned_static_type: LIBERTY_ACTUAL_TYPE is
		do
			Result := call_stack.last.returned_static_type
		end

	set_returned_object (value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_returned_object(value)
		end

	writable_feature_static_type (name: LIBERTY_FEATURE_NAME): LIBERTY_ACTUAL_TYPE is
		do
			Result := call_stack.last.writable_feature_static_type(name)
		end

	set_writable_feature (name: LIBERTY_FEATURE_NAME; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_writable_feature(name, value)
		end

feature {}
	make (a_universe: like universe; a_root_type: like root_type; a_root_feature_name: like root_feature_name) is
		require
			a_universe /= Void
			a_root_type.has_feature(a_root_feature_name)
		do
			universe := a_universe

			root_type := a_root_type
			root_feature_name := a_root_feature_name
			root_feature := a_root_type.feature_definition(a_root_feature_name)

			create instructions.make(Current)
			create expressions.make(Current)
			create assertions.make(Current)
			create creator.make(Current)
			create array_creator.make(Current)

			create {FAST_ARRAY[LIBERTY_INTERPRETER_FEATURE_CALL]} call_stack.with_capacity(1024)
		ensure
			universe = a_universe
			root_type = a_root_type
			root_feature_name = a_root_feature_name
			root_feature = a_root_type.feature_definition(a_root_feature_name)
		end

	root_type: LIBERTY_ACTUAL_TYPE
	root_feature_name: LIBERTY_FEATURE_NAME
	root_feature: LIBERTY_FEATURE_DEFINITION

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
	assertions /= Void
	creator /= Void
	call_stack /= Void
	universe /= Void

end -- class LIBERTY_INTERPRETER
