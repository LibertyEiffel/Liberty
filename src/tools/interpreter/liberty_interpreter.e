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
	show_stack (o: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			check
				call_stack.lower = 0
			end
			o.put_line(once "=========== [Bottom of stack] ===========")
			from
				i := call_stack.lower
			until
				i > call_stack.upper
			loop
				if i > call_stack.lower then
					o.put_line(once "-----------------------------------------")
				end
				o.put_integer(i + 1)
				o.put_character('%T')
				call_stack.item(i).show_stack(o)
				i := i + 1
			end
			o.put_line(once "============ [Top of stack] =============")
		end

	fatal_error (reason: ABSTRACT_STRING) is
		do
			if not gathering_old_values then
				std_error.put_new_line
				std_error.put_line(once "*** Fatal error!")
				std_error.put_new_line

				show_stack(std_error)

				std_error.put_new_line
				std_error.put_string(once "*** ")
				std_error.put_line(reason)

				sedb_breakpoint
				die_with_code(1)
			elseif not evaluating_old_value_stack.is_empty then
				if old_fatal_error = Void then
					old_fatal_error := reason.intern
				end
			end
		end

	instructions: LIBERTY_INTERPRETER_INSTRUCTIONS
	expressions: LIBERTY_INTERPRETER_EXPRESSIONS
	assertions: LIBERTY_INTERPRETER_ASSERTION_CHECKER
	creator: LIBERTY_INTERPRETER_OBJECT_CREATOR
	array_creator: LIBERTY_INTERPRETER_NATIVE_ARRAY_CREATOR
	builtins: LIBERTY_INTERPRETER_EXTERNAL_BUILTINS
	plugins: LIBERTY_INTERPRETER_EXTERNAL_PLUGINS
	object_printer: LIBERTY_INTERPRETER_OBJECT_PRINTER
	object_converter: LIBERTY_INTERPRETER_OBJECT_CONVERTER

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

	void_object (type: LIBERTY_ACTUAL_TYPE; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT is
		do
			create {LIBERTY_INTERPRETER_VOID} Result.make(Current, type, a_position)
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

	new_pointer (manifest: POINTER; a_position: LIBERTY_POSITION): LIBERTY_INTERPRETER_OBJECT_NATIVE[POINTER] is
		do
			create Result.with_item(Current, universe.type_pointer, manifest, a_position)
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
	start_gathering_old_values is
		do
			gathering_old_values_counter := gathering_old_values_counter + 1
		ensure
			gathering_old_values
			gathering_old_values_counter = old gathering_old_values_counter + 1
		end

	finished_gathering_old_values is
		require
			gathering_old_values
		do
			gathering_old_values_counter := gathering_old_values_counter - 1
		ensure
			gathering_old_values_counter = old gathering_old_values_counter - 1
		end

	start_evaluating_old_value is
		require
			gathering_old_values
		do
			evaluating_old_value_stack.add_last(call_stack.last)
		ensure
			gathering_old_values_counter = old gathering_old_values_counter
			evaluating_old_value
		end

	add_old_value (a_expression: LIBERTY_EXPRESSION; a_value: LIBERTY_INTERPRETER_OBJECT) is
		require
			gathering_old_values
			evaluating_old_value
		do
			check
				evaluating_old_value_stack.last = call_stack.last
			end
			call_stack.last.add_old_value(a_expression, a_value, old_fatal_error)
			evaluating_old_value_stack.remove_last
			if evaluating_old_value_stack.is_empty then
				old_fatal_error := Void
			end
		ensure
			gathering_old_values
			evaluating_old_value
		end

	gathering_old_values: BOOLEAN is
		do
			Result := gathering_old_values_counter > 0
		end

	evaluating_old_value: BOOLEAN is
		do
			Result := not evaluating_old_value_stack.is_empty
		end

feature {}
	old_fatal_error: FIXED_STRING

	gathering_old_values_counter: INTEGER
	evaluating_old_value_stack: COLLECTION[LIBERTY_INTERPRETER_FEATURE_CALL]

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
			cf /= Void
			not is_evaluating_parameters(cf)
		do
			check cf = call_stack.last end
			feature_evaluating_parameters.add_last(cf)
			call_stack.remove_last
			debug
				std_output.put_string(once " {{{ opening parameters evaluation of ")
				std_output.put_line(cf.name)
			end
		ensure
			is_evaluating_parameters(cf)
		end

	unset_evaluating_parameters (cf: like current_feature) is
		require
			cf /= Void
			is_evaluating_parameters(cf)
		do
			check cf = feature_evaluating_parameters.last end
			call_stack.add_last(cf)
			feature_evaluating_parameters.remove_last
			debug
				std_output.put_string(once " }}} closing parameters evaluation of ")
				std_output.put_line(cf.name)
			end
		ensure
			not is_evaluating_parameters(cf)
		end

	is_evaluating_parameters (cf: like current_feature): BOOLEAN is
		require
			cf /= Void
		do
			Result := not feature_evaluating_parameters.is_empty and then feature_evaluating_parameters.last = cf
			check
				Result = feature_evaluating_parameters.fast_has(cf)
			end
		end

feature {}
	feature_evaluating_parameters: COLLECTION[LIBERTY_INTERPRETER_FEATURE_CALL]

	current_feature: LIBERTY_INTERPRETER_FEATURE_CALL is
		do
			Result := call_stack.last
			debug
				std_output.put_string(once " -> current feature is ")
				std_output.put_line(Result.name)
			end
		end

feature {LIBERTY_INTERPRETER_EXPRESSIONS, LIBERTY_INTERPRETER_INSTRUCTIONS}
	target: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.target
			debug
				std_output.put_string(once "      Current is ")
				object_printer.print_object(std_output, Result, 2)
			end
		end

	local_value (name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.local_value(name)
			debug
				std_output.put_string(once "      Local ")
				std_output.put_string(name)
				std_output.put_string(once " is ")
				object_printer.print_object(std_output, Result, 2)
			end
		end

	returned_object: LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.returned_object
			debug
				std_output.put_string(once "      Result is ")
				object_printer.print_object(std_output, Result, 2)
			end
		end

	writable_feature (name: LIBERTY_FEATURE_NAME): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.writable_feature(name)
			debug
				std_output.put_string(once "      Writable feature ")
				std_output.put_string(name.full_name)
				std_output.put_string(once " is ")
				object_printer.print_object(std_output, Result, 2)
			end
		end

	parameter (name: FIXED_STRING): LIBERTY_INTERPRETER_OBJECT is
		do
			Result := current_feature.parameter(name)
			debug
				std_output.put_string(once "      Parameter ")
				std_output.put_string(name)
				std_output.put_string(once " is ")
				object_printer.print_object(std_output, Result, 2)
			end
		end

feature {LIBERTY_INTERPRETER_ASSIGNMENT}
	local_static_type (name: FIXED_STRING): LIBERTY_ACTUAL_TYPE is
		do
			Result := current_feature.local_static_type(name)
		end

	set_local_value (name: FIXED_STRING; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			current_feature.set_local_value(name, value)
		end

	returned_static_type: LIBERTY_ACTUAL_TYPE is
		do
			Result := current_feature.returned_static_type
		end

	set_returned_object (value: LIBERTY_INTERPRETER_OBJECT) is
		do
			current_feature.set_returned_object(value)
		end

	writable_feature_static_type (name: LIBERTY_FEATURE_NAME): LIBERTY_ACTUAL_TYPE is
		do
			Result := current_feature.writable_feature_static_type(name)
		end

	set_writable_feature (name: LIBERTY_FEATURE_NAME; value: LIBERTY_INTERPRETER_OBJECT) is
		do
			current_feature.set_writable_feature(name, value)
		end

feature {LIBERTY_INTERPRETER_ASSERTION_CHECKER}
	evaluate_feature_parameters is
		do
			call_stack.last.evaluate_parameters
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
			create object_converter.make(Current)

			create {FAST_ARRAY[LIBERTY_INTERPRETER_FEATURE_CALL]} call_stack.with_capacity(1024)
			create {FAST_ARRAY[LIBERTY_INTERPRETER_FEATURE_CALL]} feature_evaluating_parameters.with_capacity(16)
			create {FAST_ARRAY[LIBERTY_INTERPRETER_FEATURE_CALL]} evaluating_old_value_stack.with_capacity(2)
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
	feature_evaluating_parameters /= Void
	evaluating_old_value_stack /= Void

end -- class LIBERTY_INTERPRETER
