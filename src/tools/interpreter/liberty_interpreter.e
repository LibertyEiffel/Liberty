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
			root_object := new_object(root_type, errors.unknown_position)
			call_feature(root_object, root_feature, root_feature_actuals, errors.unknown_position)
		end

feature {ANY}
	fatal_error (reason: ABSTRACT_STRING) is
		local
			i: INTEGER
		do
			check
				call_stack.lower = 0
			end
			std_error.put_new_line
			std_error.put_line(once "*** Fatal error!")
			std_error.put_new_line
			std_error.put_line(once "=========== [Bottom of stack] ===========")
			from
				i := call_stack.lower
			until
				i > call_stack.upper
			loop
				if i > call_stack.lower then
					std_error.put_line(once "-----------------------------------------")
				end
				std_error.put_integer(i + 1)
				std_error.put_character('%T')
				call_stack.item(i).show_stack(std_error)
				i := i + 1
			end
			std_error.put_line(once "============ [Top of stack] =============")
			std_error.put_new_line
			std_error.put_string(once "*** ")
			std_error.put_line(reason)
			sedb_breakpoint
			die_with_code(1)
		end

	instructions: LIBERTY_INTERPRETER_INSTRUCTIONS
	expressions: LIBERTY_INTERPRETER_EXPRESSIONS
	assertions: LIBERTY_INTERPRETER_ASSERTION_CHECKER
	creator: LIBERTY_INTERPRETER_OBJECT_CREATOR
	array_creator: LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR
	builtins: LIBERTY_INTERPRETER_EXTERNAL_BUILTINS
	plugins: LIBERTY_INTERPRETER_EXTERNAL_PLUGINS
	object_printer: LIBERTY_INTERPRETER_OBJECT_PRINTER

	universe: LIBERTY_UNIVERSE

	call_feature (a_target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION) is
		local
			dummy: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			dummy := do_call(a_target, feature_to_call, actuals, a_position)
		end

	item_feature (a_target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			call := do_call(a_target, feature_to_call, actuals, a_position)
			Result := call.returned_object
		end

	call_precursor (a_precursor: LIBERTY_FEATURE; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION) is
		local
			dummy: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			dummy := do_precursor(a_precursor, actuals, a_position)
		end

	item_precursor (a_precursor: LIBERTY_FEATURE; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		local
			call: LIBERTY_INTERPRETER_FEATURE_CALL
		do
			call := do_precursor(a_precursor, actuals, a_position)
			Result := call.returned_object
		end

	new_object (object_type: LIBERTY_ACTUAL_TYPE; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		do
			debug
				std_output.put_string(once "Creating new object of type ")
				std_output.put_line(object_type.full_name)
			end
			Result := creator.new_object(object_type, a_position)
		end

	new_array (type: LIBERTY_ACTUAL_TYPE; capacity: INTEGER; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_NATIVE_ARRAY is
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
			Result := array_creator.new_array(type, capacity, a_position)
		end

	new_string (manifest: STRING; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		local
			the_new_string: LIBERTY_INTERPRETER_OBJECT_STRUCTURE
			new_string_capacity, new_string_count: LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64]
			new_string_storage: LIBERTY_INTERPRETER_NATIVE_ARRAY_TYPED[CHARACTER]
		do
			create new_string_capacity.with_item(Current, universe.type_integer, manifest.capacity, a_position)
			create new_string_count.with_item(Current, universe.type_integer, manifest.count, a_position)
			create new_string_storage.with_storage(Current, native_array_of_character, universe.type_character, manifest, a_position)
			the_new_string ::= new_object(universe.type_string, a_position)
			the_new_string.put_attribute(capacity_name, new_string_capacity)
			the_new_string.put_attribute(count_name, new_string_count)
			the_new_string.put_attribute(storage_name, new_string_storage)

			Result := the_new_string
		end

	new_boolean (manifest: BOOLEAN; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[BOOLEAN] is
		do
			create Result.with_item(Current, universe.type_boolean, manifest, a_position)
		end

	new_integer_64 (manifest: INTEGER_64; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64] is
		do
			create Result.with_item(Current, universe.type_integer_64, manifest, a_position)
		end

	new_integer_32 (manifest: INTEGER_32; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64] is
		do
			create Result.with_item(Current, universe.type_integer_32, manifest, a_position)
		end

	new_integer (manifest: INTEGER; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64] is
		do
			create Result.with_item(Current, universe.type_integer, manifest, a_position)
		end

	new_integer_16 (manifest: INTEGER_16; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64] is
		do
			create Result.with_item(Current, universe.type_integer_16, manifest, a_position)
		end

	new_integer_8 (manifest: INTEGER_8; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[INTEGER_64] is
		do
			create Result.with_item(Current, universe.type_integer_8, manifest, a_position)
		end

	new_real (manifest: REAL; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128] is
		do
			create Result.with_item(Current, universe.type_real, manifest, a_position)
		end

	new_real_128 (manifest: REAL_128; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128] is
		do
			create Result.with_item(Current, universe.type_real_128, manifest, a_position)
		end

	new_real_80 (manifest: REAL_80; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128] is
		do
			create Result.with_item(Current, universe.type_real_80, manifest, a_position)
		end

	new_real_64 (manifest: REAL_64; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128] is
		do
			create Result.with_item(Current, universe.type_real_64, manifest, a_position)
		end

	new_real_32 (manifest: REAL_32; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[REAL_128] is
		do
			create Result.with_item(Current, universe.type_real_32, manifest, a_position)
		end

	new_character (manifest: CHARACTER; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[CHARACTER] is
		do
			create Result.with_item(Current, universe.type_character, manifest, a_position)
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
	do_call (a_target: LIBERTY_INTERPRETER_OBJECT; feature_to_call: LIBERTY_FEATURE_DEFINITION; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			create Result.make(Current, a_target, feature_to_call, actuals, a_position)
			call_stack.add_last(Result)
			Result.call
			check
				call_stack.last = Result
			end
			call_stack.remove_last
		end

	do_precursor (a_feature: LIBERTY_FEATURE; actuals: TRAVERSABLE[LIBERTY_EXPRESSION]; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			create Result.make_precursor(Current, call_stack.last.target, a_feature, actuals, a_position)
			call_stack.add_last(Result)
			Result.call
			check
				call_stack.last = Result
			end
			call_stack.remove_last
		end

feature {LIBERTY_INTERPRETER_FEATURE_CALL}
	set_evaluating_parameters (cf: like current_feature) is
		require
			not is_evaluating_parameters
		do
			check cf = call_stack.last end
			feature_evaluating_parameters := cf
			call_stack.remove_last
		ensure
			is_evaluating_parameters
		end

	unset_evaluating_parameters (cf: like current_feature) is
		require
			is_evaluating_parameters
		do
			check cf = feature_evaluating_parameters end
			call_stack.add_last(cf)
			feature_evaluating_parameters := Void
		ensure
			not is_evaluating_parameters
		end

	is_evaluating_parameters: BOOLEAN is
		do
			Result := feature_evaluating_parameters /= Void
		end

feature {}
	feature_evaluating_parameters: like current_feature

	current_feature: LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			Result := call_stack.last
		end

feature {LIBERTY_INTERPRETER_EXPRESSIONS, LIBERTY_INTERPRETER_INSTRUCTIONS}
	target: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.target
		end

	local_value (name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.local_value(name)
		end

	returned_object: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.returned_object
		end

	writable_feature (name: LIBERTY_FEATURE_NAME): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.writable_feature(name)
		end

	parameter (name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.parameter(name)
		end

feature {LIBERTY_INTERPRETER_ASSIGNMENT}
	local_static_type (name: FIXED_STRING): LIBERTY_ACTUAL_TYPE is
		do
			Result := current_feature.local_static_type(name)
		end

	set_local_value (name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			check not is_evaluating_parameters end
			call_stack.last.set_local_value(name, value)
		end

	returned_static_type: LIBERTY_ACTUAL_TYPE is
		do
			Result := current_feature.returned_static_type
		end

	set_returned_object (value: LIBERTY_INTERPRETER_OBJECT) is
		do
			check not is_evaluating_parameters end
			call_stack.last.set_returned_object(value)
		end

	writable_feature_static_type (name: LIBERTY_FEATURE_NAME): LIBERTY_ACTUAL_TYPE is
		do
			Result := current_feature.writable_feature_static_type(name)
		end

	set_writable_feature (name: LIBERTY_FEATURE_NAME; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			check not is_evaluating_parameters end
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
			create builtins.make(Current)
			create plugins.make(Current)
			create object_printer.make(Current)

			create {FAST_ARRAY[LIBERTY_INTERPRETER_FEATURE_CALL]} call_stack.with_capacity(1024)
			native_array_of_character := universe.type_native_array({FAST_ARRAY[LIBERTY_ACTUAL_TYPE] << universe.type_character >> }, errors.unknown_position)
		ensure
			universe = a_universe
			root_type = a_root_type
			root_feature_name = a_root_feature_name
			root_feature = a_root_type.feature_definition(a_root_feature_name)
		end

	root_type: LIBERTY_ACTUAL_TYPE
	root_feature_name: LIBERTY_FEATURE_NAME
	root_feature: LIBERTY_FEATURE_DEFINITION
	native_array_of_character: LIBERTY_ACTUAL_TYPE

	root_feature_actuals: COLLECTION[LIBERTY_EXPRESSION] is
		once
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.with_capacity(0)
		ensure
			Result.is_empty
		end

	call_stack: COLLECTION[LIBERTY_INTERPRETER_FEATURE_CALL]

	capacity_name: FIXED_STRING is
		once
			Result := "capacity".intern
		end

	count_name: FIXED_STRING is
		once
			Result := "count".intern
		end

	storage_name: FIXED_STRING is
		once
			Result := "storage".intern
		end

	errors: LIBERTY_ERRORS

invariant
	instructions /= Void
	expressions /= Void
	assertions /= Void
	creator /= Void
	call_stack /= Void
	universe /= Void
	native_array_of_character /= Void

end -- class LIBERTY_INTERPRETER
