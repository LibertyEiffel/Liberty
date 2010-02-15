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

	call_feature (object: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]) is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			create call.make(Current, object, feature_to_call.feature_name, parameters)
			call_stack.add_last(call)
			feature_to_call.the_feature.accept(call)
			check
				call_stack.last = call
			end
			call_stack.remove_last
		end

	item_feature (object: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; parameters: TRAVERSABLE[LIBERTY_INTERPRETER_OBJECT]): LIBERTY_OBJECT_INTERPRETER is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			create call.make(Current, object, feature_to_call.feature_name, parameters)
			call_stack.add_last(call)
			feature_to_call.the_feature.accept(call)
			check
				call_stack.last = call
			end
			Result := call.returned_object
			call_stack.remove_last
		end

feature {LIBERTY_INTERPRETER_ASSIGNMENT}
	set_local (name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_local(name, value)
		end

	set_returned_object (value: LIBERTY_INTERPRETER_OBJECT) is
		do
			call_stack.last.set_returned_object(value)
		end

	set_writable_feature (name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		local
			struct: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
		do
			struct ::= call_stack.last.target
			struct.put_attribute(name, value)
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
