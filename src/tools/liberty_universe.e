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
class LIBERTY_UNIVERSE

insert
	LIBERTY_AST_HANDLER
		undefine is_equal
		end
	LIBERTY_ERROR_LEVELS
		undefine is_equal
		end
	SINGLETON

create {ANY}
	make

feature {ANY}
	get_type (cluster: LIBERTY_CLUSTER; position: LIBERTY_POSITION; class_name: STRING; effective_type_parameters: TRAVERSABLE[LIBERTY_ACTUAL_TYPE]): LIBERTY_ACTUAL_TYPE is
		require
			position /= Void
		do
			Result := do_get_type(cluster, position, class_name, effective_type_parameters)
		ensure
			Result.name.is_equal(class_name)
			Result.parameters.is_equal(effective_type_parameters)
		end

	build_types (root_type: LIBERTY_ACTUAL_TYPE; root_feature_name: LIBERTY_FEATURE_NAME) is
		local
			flame: LIBERTY_FLAME
			incubator: like types_incubator
		do
			create incubator.with_capacity(1024, 0)
			from
			until
				types_incubator.is_empty
			loop
				flame := torch.flame
				build_to_incubator(incubator)
				mark_reachable_code(root_type, root_feature_name)
				resolve_delayed_types
				incubator := check_flame_and_swap_incubator(flame, incubator)
			end
			debug
				debug_types(types_incubator)
			end
		end

feature {ANY} -- Kernel types
	type_any: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("ANY", visit_type_any)
		end

	type_pointer: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("POINTER", visit_type_pointer)
		end

	type_integer_64: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("INTEGER_64", visit_type_integer_64)
		end

	type_integer, type_integer_32: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("INTEGER_32", visit_type_integer_32)
			Result.add_converter(type_integer_64, convert_integer_32_64)
		end

	type_integer_16: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("INTEGER_16", visit_type_integer_16)
			Result.add_converter(type_integer_32, convert_integer_16_32)
			Result.add_converter(type_integer_64, convert_integer_16_64)
		end

	type_integer_8: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("INTEGER_8", visit_type_integer_8)
			Result.add_converter(type_integer_16, convert_integer_8_16)
			Result.add_converter(type_integer_32, convert_integer_8_32)
			Result.add_converter(type_integer_64, convert_integer_8_64)
		end

	type_real_128: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("REAL_128", visit_type_real_128)
		end

	type_real_80: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("REAL_80", visit_type_real_80)
			Result.add_converter(type_real_128, convert_real_80_128)
		end

	type_real, type_real_64: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("REAL_64", visit_type_real_64)
			Result.add_converter(type_real_80, convert_real_64_80)
			Result.add_converter(type_real_128, convert_real_64_128)
		end

	type_real_32: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("REAL_32", visit_type_real_32)
			Result.add_converter(type_real_64, convert_real_32_64)
			Result.add_converter(type_real_80, convert_real_32_80)
			Result.add_converter(type_real_128, convert_real_32_128)
		end

	type_character: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("CHARACTER", visit_type_character)
		end

	type_string: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("STRING", visit_type_string)
		end

	type_boolean: LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		once
			Result := kernel_type("BOOLEAN", visit_type_boolean)
		end

	type_native_array (effective_generics: TRAVERSABLE[LIBERTY_TYPE]; position: LIBERTY_POSITION): LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		local
			td: LIBERTY_TYPE_DESCRIPTOR
			ast: LIBERTY_AST_ONE_CLASS
		do
			create td.make(native_array_class_descriptor, effective_generics)
			Result := types.reference_at(td)
			if Result = Void then
				ast := parse_class(td.cluster, td.name, Void)
				create Result.make(td, standard_generics_checker, ast, visit_type_native_array)
				start_to_build_type(Result)
			end
		ensure
			Result /= Void
		end

	type_tuple (effective_generics: TRAVERSABLE[LIBERTY_TYPE]; position: LIBERTY_POSITION): LIBERTY_ACTUAL_TYPE is
		require
			effective_generics /= Void
			not errors.has_error
		local
			td: LIBERTY_TYPE_DESCRIPTOR
			tuple_ast: LIBERTY_AST_CLASSES
			ast: LIBERTY_AST_ONE_CLASS
			tuple_count: INTEGER
		do
			tuple_count := effective_generics.count
			create td.make(tuple_class_descriptor, effective_generics)
			Result := types.reference_at(td)
			if Result = Void then
				tuple_ast := parse_tuple_classes(Void)
				check tuple_ast.classes.lower = 0 end
				if tuple_count > tuple_ast.classes.upper then
					errors.add_position(position)
					errors.set(level_fatal_error, "TUPLE does not support more than " + tuple_ast.classes.upper.out
								  + " generic parameters.%NYou might want a named class with named attributes instead.")
				end
				ast ::= tuple_ast.classes.item(tuple_count)
				create Result.make(td, tuple_generics_checker, ast, visit_type_tuple)
				start_to_build_type(Result)
			end
		ensure
			Result /= Void
		end

	type_procedure (effective_generics: TRAVERSABLE[LIBERTY_TYPE]; position: LIBERTY_POSITION): LIBERTY_ACTUAL_TYPE is
		require
			effective_generics /= Void
		do
			Result := agent_type(procedure_class_descriptor, {FAST_ARRAY[LIBERTY_TYPE] << type_tuple(effective_generics, position) >> }, position, visit_type_procedure)
		end

	type_function (effective_generics: TRAVERSABLE[LIBERTY_TYPE]; result_type: LIBERTY_TYPE; position: LIBERTY_POSITION): LIBERTY_ACTUAL_TYPE is
		require
			effective_generics /= Void
			result_type /= Void
			result_type /= type_boolean
		do
			Result := agent_type(function_class_descriptor, {FAST_ARRAY[LIBERTY_TYPE] << type_tuple(effective_generics, position), result_type >> }, position, visit_type_function)
		end

	type_predicate (effective_generics: TRAVERSABLE[LIBERTY_TYPE]; position: LIBERTY_POSITION): LIBERTY_ACTUAL_TYPE is
		require
			effective_generics /= Void
		do
			Result := agent_type(predicate_class_descriptor, {FAST_ARRAY[LIBERTY_TYPE] << type_tuple(effective_generics, position) >> }, position, visit_type_predicate)
		end

feature {}
	reachable_counter: COUNTER is
		once
			create Result
		end

	mark_reachable_code (root_type: LIBERTY_ACTUAL_TYPE; root_feature_name: LIBERTY_FEATURE_NAME) is
		local
			root_feature: LIBERTY_FEATURE_DEFINITION
		do
			reachable_counter.increment
			root_type.set_reachable(reachable_counter.value)
			if root_type.has_loaded_features then
				if not root_type.has_feature(root_feature_name) then
					std_error.put_string("No method '")
					std_error.put_string(root_feature_name.name)
					std_error.put_string("' feature in type ")
					std_error.put_string(root_type.full_name)
					std_error.put_line(". Giving up.")
					die_with_code(1)
				end
				root_feature := root_type.feature_definition(root_feature_name)
				reachable_counter.increment
				debug
					std_output.put_string(once " +++ Marking reachable code (")
					std_output.put_integer(reachable_counter.value)
					std_output.put_line(once ")...")
				end
				root_feature.set_reachable(reachable_counter.value)
				debug
					std_output.put_line(once "     Reachable code marked.")
				end
			end
		end

	resolve_delayed_types is
		local
			delayed_types: COLLECTION[LIBERTY_DELAYED_TYPE]
			delayed_type: LIBERTY_DELAYED_TYPE
			n: INTEGER; more: BOOLEAN
		do
			delayed_types := type_lookup.resolver.delayed_types
			from
				more := True
			until
				not more or else delayed_types.is_empty
			loop
				more := False
				from
					n := delayed_types.count
				until
					n = 0
				loop
					delayed_type := delayed_types.first
					delayed_types.remove_first
					if delayed_type.can_resolve then
						delayed_type.resolve
						debug
							std_output.put_string(once " ===> resolved ")
							std_output.put_line(delayed_type.out)
						end
						more := True
					else
						delayed_types.add_last(delayed_type)
					end
					n := n - 1
				end
			end
			debug
				std_output.put_string(once " === ")
				std_output.put_integer(delayed_types.count)
				if delayed_types.count = 1 then
					std_output.put_line(once " delayed type yet to be resolved.")
				else
					std_output.put_line(once " delayed types yet to be resolved.")
				end
			end
		end

	build_to_incubator (incubator: like types_incubator) is
		require
			not types_incubator.is_empty
		local
			type: LIBERTY_ACTUAL_TYPE
		do
			from
			until
				types_incubator.is_empty
			loop
				type := types_incubator.first
				types_incubator.remove_first
				type.build_more
				if not type.is_built then
					incubator.add_last(type)
				end
			end
		end

	check_flame_and_swap_incubator (flame: LIBERTY_FLAME; incubator: like types_incubator): like types_incubator is
		require
			types_incubator.is_empty
		do
			if not torch.still_burns(flame) then
				clean_unreachable_types(incubator)
				if not incubator.is_empty then
					debug
						debug_types(incubator)
					end
					errors.set(level_system_error, once "Compiler stalled.")
					check
						dead: False
					end
				end
			end
			Result := types_incubator
			types_incubator := incubator
			debug
				std_output.put_line(once "Swapped incubator")
			end
		ensure
			types_incubator = incubator
			Result = old types_incubator
		end

	clean_unreachable_types (incubator: like types_incubator) is
		local
			i: INTEGER
		do
			clean_unreachable_types_from_incubator(incubator)
			from
				i := types.lower
			until
				i > types.upper
			loop
				if not types.item(i).is_reachable then
					types.fast_remove(types.key(i))
				else
					i := i + 1
				end
			end
		end

	clean_unreachable_types_from_incubator (incubator: like types_incubator) is
		local
			i: INTEGER
		do
			from
				i := incubator.lower
			until
				i > incubator.upper
			loop
				if not incubator.item(i).is_reachable then
					debug
						std_output.put_string(once "Removing ")
						std_output.put_string(incubator.item(i).full_name)
						std_output.put_line(once ": not reachable")
					end
					incubator.remove(i)
				else
					i := i + 1
				end
			end
		end

feature {} -- debug
	debug_types (incubator: like types_incubator) is
		local
			i: INTEGER
			all_types: FAST_ARRAY[LIBERTY_ACTUAL_TYPE]
			c: COMPARATOR_COLLECTION_SORTER[LIBERTY_ACTUAL_TYPE]
		do
			from
				create all_types.with_capacity(types.count)
				c.set_comparator(agent debug_compare_type_names)
				i := types.lower
			until
				i > types.upper
			loop
				c.add(all_types, types.item(i))
				i := i + 1
			end
			check
				all_types.count = types.count
			end
			std_output.put_line(once "--8<--------")
			from
				i := all_types.lower
			until
				i > all_types.upper
			loop
				std_output.put_integer(i - all_types.lower + 1)
				std_output.put_string(once ": ")
				all_types.item(i).debug_display(std_output, False)
				i := i + 1
			end
			std_output.put_line(once "-------->8--")
			if incubator.is_empty then
				std_output.put_integer(all_types.count)
				std_output.put_line(once " types (total), incubator is empty")
			else
				std_output.put_integer(all_types.count)
				std_output.put_string(once " types (total), including ")
				std_output.put_integer(incubator.count)
				std_output.put_line(once " types in incubator:")
				std_output.put_line(once "--8<--------")
				from
					i := incubator.lower
				until
					i > incubator.upper
				loop
					std_output.put_integer(i - incubator.lower + 1)
					std_output.put_string(once ": ")
					incubator.item(i).debug_display(std_output, False)
					i := i + 1
				end
				std_output.put_line(once "-------->8--")
			end
			sedb_breakpoint
		end

	debug_compare_type_names (t1, t2: LIBERTY_ACTUAL_TYPE): BOOLEAN is
		do
			Result := t1.full_name < t2.full_name
		end

feature {}
	start_to_build_type (type: LIBERTY_ACTUAL_TYPE) is
		require
			not types.has(type.descriptor)
		do
			types.add(type, type.descriptor)
			type.start_build(Current)
			if not type.is_built then
				types_incubator.add_last(type)
			end
			torch.burn
		end

	native_array_class_descriptor: LIBERTY_CLASS_DESCRIPTOR is
		local
			cluster: LIBERTY_CLUSTER
		once
			cluster := root.find("NATIVE_ARRAY")
			create Result.make(cluster, "NATIVE_ARRAY".intern, Void)
		end

	tuple_class_descriptor: LIBERTY_CLASS_DESCRIPTOR is
		local
			cluster: LIBERTY_CLUSTER
		once
			cluster := root.find("TUPLE")
			create Result.make(cluster, "TUPLE".intern, Void)
		end

	procedure_class_descriptor: LIBERTY_CLASS_DESCRIPTOR is
		local
			cluster: LIBERTY_CLUSTER
		once
			cluster := root.find("PROCEDURE")
			create Result.make(cluster, "PROCEDURE".intern, Void)
		end

	function_class_descriptor: LIBERTY_CLASS_DESCRIPTOR is
		local
			cluster: LIBERTY_CLUSTER
		once
			cluster := root.find("FUNCTION")
			create Result.make(cluster, "FUNCTION".intern, Void)
		end

	predicate_class_descriptor: LIBERTY_CLASS_DESCRIPTOR is
		local
			cluster: LIBERTY_CLUSTER
		once
			cluster := root.find("PREDICATE")
			create Result.make(cluster, "PREDICATE".intern, Void)
		end

	kernel_type (class_name: STRING; visit: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]]): LIBERTY_ACTUAL_TYPE is
			-- Called only once per kernel type
		require
			not errors.has_error
		local
			cd: LIBERTY_CLASS_DESCRIPTOR; td: LIBERTY_TYPE_DESCRIPTOR
			ast: LIBERTY_AST_ONE_CLASS
			cluster: LIBERTY_CLUSTER
		do
			cluster := root.find(class_name)
			if cluster = Void then
				errors.set(level_fatal_error, "Kernel class not found: " + class_name)
			end
			create cd.make(cluster, class_name.intern, Void)
			create td.make(cd, no_parameters)
			Result := types.reference_at(td)
			if Result = Void then
				ast := parse_class(cluster, class_name, Void)
				create Result.make(td, standard_generics_checker, ast, visit)
				start_to_build_type(Result)
			end
		ensure
			Result /= Void
		end

	agent_type (class_descriptor: LIBERTY_CLASS_DESCRIPTOR; agent_generics: TRAVERSABLE[LIBERTY_TYPE]; position: LIBERTY_POSITION;
					visit: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]]): LIBERTY_ACTUAL_TYPE is
		require
			class_descriptor /= Void
			agent_generics /= Void
		local
			td: LIBERTY_TYPE_DESCRIPTOR
			ast: LIBERTY_AST_ONE_CLASS
		do
			create td.make(class_descriptor, agent_generics)
			Result := types.reference_at(td)
			if Result = Void then
				ast := parse_class(td.cluster, td.name, position)
				create Result.make(td, agent_generics_checker, ast, visit)
				start_to_build_type(Result)
			end
		end

feature {LIBERTY_TYPE_RESOLVER}
	get_type_from_descriptor (descriptor: LIBERTY_TYPE_DESCRIPTOR): LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		do
			Result := do_get_type_from_descriptor(descriptor)
		ensure
			Result.cluster.is_equal(descriptor.cluster)
			Result.name.is_equal(descriptor.name)
			Result.parameters.is_equal(descriptor.parameters)
		end

	get_type_from_type_definition (type_definition: LIBERTY_AST_TYPE_DEFINITION; cluster: LIBERTY_CLUSTER): LIBERTY_ACTUAL_TYPE is
		require
			not type_definition.is_anchor
			not errors.has_error
		local
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
		do
			class_name := type_definition.type_name.image.image
			inspect
				class_name
			when "INTEGER" then
				Result := type_integer
			when "INTEGER_64" then
				Result := type_integer_64
			when "INTEGER_32" then
				Result := type_integer_32
			when "INTEGER_16" then
				Result := type_integer_16
			when "INTEGER_8" then
				Result := type_integer_8
			when "ANY" then
				Result := type_any
			when "REAL" then
				Result := type_real
			when "REAL_32" then
				Result := type_real_32
			when "REAL_64" then
				Result := type_real_64
			when "REAL_80" then
				Result := type_real_80
			when "REAL_128" then
				Result := type_real_128
			when "POINTER" then
				Result := type_pointer
			when "CHARACTER" then
				Result := type_character
			when "STRING" then
				Result := type_string
			when "BOOLEAN" then
				Result := type_boolean
			when "NATIVE_ARRAY" then
				parameters := get_parameters(type_definition.type_parameters)
				Result := type_native_array(parameters, type_lookup.resolver.position(type_definition))
			when "TUPLE" then
				parameters := get_parameters(type_definition.type_parameters)
				Result := type_tuple(parameters, type_lookup.resolver.position(type_definition))
			when "PROCEDURE" then
				parameters := get_parameters(type_definition.type_parameters)
				check
					parameters.count = 1
					parameters.first.is_actual_type_set
				end
				Result := type_procedure(parameters.first.actual_type.parameters, type_lookup.resolver.position(type_definition))
			when "PREDICATE" then
				parameters := get_parameters(type_definition.type_parameters)
				check
					parameters.count = 1
					parameters.first.is_actual_type_set
				end
				Result := type_predicate(parameters.first.actual_type.parameters, type_lookup.resolver.position(type_definition))
			when "FUNCTION" then
				parameters := get_parameters(type_definition.type_parameters)
				check
					parameters.count = 2
					parameters.first.is_actual_type_set
				end
				Result := type_function(parameters.first.actual_type.parameters, parameters.last, type_lookup.resolver.position(type_definition))
			else
				parameters := get_parameters(type_definition.type_parameters)
				Result := do_get_type(cluster, type_lookup.resolver.position(type_definition), class_name, parameters)
			end
		end

feature {}
	do_get_type (cluster: LIBERTY_CLUSTER; position: LIBERTY_POSITION; class_name: STRING; effective_type_parameters: TRAVERSABLE[LIBERTY_TYPE]): LIBERTY_ACTUAL_TYPE is
		require
			position /= Void
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR
			c: like cluster
		do
			if cluster = Void then
				c := root.find(class_name)
			else
				c := cluster.find(class_name)
			end
			if c = Void then
				errors.add_position(position)
				errors.set(level_fatal_error, "Unknown class: " + class_name)
			end
			create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(c, class_name.intern, position), effective_type_parameters)
			Result := do_get_type_from_descriptor(descriptor)
		ensure
			Result.name.is_equal(class_name)
			Result.parameters.is_equal(effective_type_parameters)
		end

	do_get_type_from_descriptor (descriptor: LIBERTY_TYPE_DESCRIPTOR): LIBERTY_ACTUAL_TYPE is
		require
			not errors.has_error
		local
			ast: LIBERTY_AST_ONE_CLASS
		do
			Result := types.reference_at(descriptor)
			if Result = Void then
				ast := parse_class(descriptor.cluster, descriptor.name.out, descriptor.position)
				create Result.make(descriptor, standard_generics_checker, ast, visit_user_type)
				start_to_build_type(Result)
			end
		ensure
			Result.cluster.is_equal(descriptor.cluster)
			Result.name.is_equal(descriptor.name)
			Result.parameters.is_equal(descriptor.parameters)
		end

feature {} -- Type parameters fetching
	get_parameters (type_parameters: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameter: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER
			type_definition: LIBERTY_AST_TYPE_DEFINITION
			type: LIBERTY_TYPE
			i: INTEGER
		do
			if type_parameters.list_is_empty then
				Result := no_parameters
			else
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.list_lower
				until
					i > type_parameters.list_upper
				loop
					type_parameter := type_parameters.list_item(i)
					type_definition := type_parameter.type_definition
					type := type_lookup.resolver.type(type_definition)
					Result.add_last(type)
					i := i + 1
				end
			end
		end

	no_parameters: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

feature {LIBERTY_TYPE_RESOLVER_IN_TYPE}
	parse_class (cluster: LIBERTY_CLUSTER; class_name: ABSTRACT_STRING; pos: LIBERTY_POSITION): LIBERTY_AST_ONE_CLASS is
		local
			code: STRING; class_descriptor: LIBERTY_CLASS_DESCRIPTOR
			ast: LIBERTY_AST_CLASS
		do
			create class_descriptor.make(cluster, class_name.intern, pos)
			Result := classes.reference_at(class_descriptor)
			if Result = Void then
				debug
					std_output.put_string(once "Parsing ")
					std_output.put_line(class_name)
				end
				code := once ""
				code.clear_count
				read_file_in(class_descriptor, code)
				parser_buffer.initialize_with(code)

				eiffel.reset
				parser.eval(parser_buffer, eiffel.table, once "Class")
				if parser.error /= Void then
					errors.emit_syntax_error(parser.error, code, class_descriptor.file.intern)
				end
				ast ::= eiffel.root_node
				Result := ast.one_class
				classes.put(Result, class_descriptor)
				debug
					std_output.put_string(class_name)
					std_output.put_line(once " parsed.")
				end
			end
		ensure
			Result /= Void
		end

feature {} -- AST building
	read_file_in (descriptor: LIBERTY_CLASS_DESCRIPTOR; code: STRING) is
		require
			descriptor /= Void
			code.is_empty
		local
			file: FIXED_STRING
		do
			file := descriptor.file
			parser_file.connect_to(file)
			if not parser_file.is_connected then
				std_error.put_string(" *** Could not read file " + file)
				die_with_code(1)
			end

			from
				parser_file.read_line
			until
				parser_file.end_of_input
			loop
				code.append(parser_file.last_string)
				code.extend('%N')
				parser_file.read_line
			end
			code.append(parser_file.last_string)
			parser_file.disconnect
		end

	parse_tuple_classes (pos: LIBERTY_POSITION): LIBERTY_AST_CLASSES is
		local
			code: STRING; class_descriptor: LIBERTY_CLASS_DESCRIPTOR
			tuple_cluster: LIBERTY_CLUSTER
			i: INTEGER; file: FIXED_STRING
			one_class: LIBERTY_AST_ONE_CLASS
		once
			debug
				std_output.put_line(once "Parsing TUPLE")
			end
			tuple_cluster := root.find("TUPLE")
			if tuple_cluster = Void then
				errors.set(level_fatal_error, "Kernel class not found: TUPLE")
			end
			create class_descriptor.make(tuple_cluster, "TUPLE".intern, pos)
			code := once ""
			code.clear_count
			read_file_in(class_descriptor, code)
			parser_buffer.initialize_with(code)

			eiffel.reset
			parser.eval(parser_buffer, eiffel.table, once "Classes")
			if parser.error /= Void then
				errors.emit_syntax_error(parser.error, code, class_descriptor.file.intern)
			end
			Result ::= eiffel.root_node
			file := class_descriptor.file.intern
			from
				i := Result.classes.lower
				check i = 0 end
			until
				i > Result.classes.upper
			loop
				one_class ::= Result.classes.item(i)
				check_tuple_class(one_class, i, Result, file)
				i := i + 1
			end
		ensure
			Result /= Void
		end

	check_tuple_class (a_tuple_class: LIBERTY_AST_ONE_CLASS; generics_count: INTEGER; ast: LIBERTY_AST_CLASSES; file: FIXED_STRING) is
			-- minimal integrity check
		local
			classname: STRING
			gencount: INTEGER
		do
			classname := a_tuple_class.class_header.class_name.image.image
			if not classname.is_equal(once "TUPLE") then
				errors.add_position(errors.semantics_position(a_tuple_class.class_header.class_name.image.index, ast, file))
				errors.set(level_fatal_error, "Invalid TUPLE class: does not contain TUPLE")
			end
			gencount := a_tuple_class.class_header.type_parameters.list_count
			if gencount /= generics_count then
				errors.add_position(errors.semantics_position(a_tuple_class.class_header.class_name.image.index, ast, file))
				if generics_count = 1 then
					errors.set(level_fatal_error, "Invalid TUPLE class: expected 1 generic parameter")
				else
					errors.set(level_fatal_error, "Invalid TUPLE class: expected " + generics_count.out + " generic parameters")
				end
			end
		ensure
			not errors.has_error
		end

	parser_file: TEXT_FILE_READ is
		once
			create Result.make
		end

	parser_buffer: MINI_PARSER_BUFFER is
		once
			create Result
		end

	parser: DESCENDING_PARSER is
		once
			create Result.make
		end

	eiffel: EIFFEL_GRAMMAR is
		once
			create Result.make(create {LIBERTY_NODE_FACTORY}.make)
		end

feature {}
	default_type_capacity: INTEGER is 4096

	make (universe_path: STRING) is
		local
			tr: LIBERTY_TYPE_RESOLVER_IN_UNIVERSE
		do
			type_lookup.set_universe(Current)
			create root.make(universe_path)
			create {HASHED_DICTIONARY[LIBERTY_AST_ONE_CLASS, LIBERTY_CLASS_DESCRIPTOR]} classes.with_capacity(default_type_capacity)
			create {HASHED_DICTIONARY[LIBERTY_ACTUAL_TYPE, LIBERTY_TYPE_DESCRIPTOR]} types.with_capacity(default_type_capacity)
			create types_incubator.with_capacity(default_type_capacity, 0)
			create tr.make(Current)
			type_lookup.push(tr)
		end

	root: LIBERTY_CLUSTER

	classes: DICTIONARY[LIBERTY_AST_ONE_CLASS, LIBERTY_CLASS_DESCRIPTOR]
	types: DICTIONARY[LIBERTY_ACTUAL_TYPE, LIBERTY_TYPE_DESCRIPTOR]

	types_incubator: RING_ARRAY[LIBERTY_ACTUAL_TYPE]

	errors: LIBERTY_ERRORS
	torch: LIBERTY_ENLIGHTENING_THE_WORLD
	type_lookup: LIBERTY_TYPE_LOOKUP

	standard_generics_checker: LIBERTY_GENERICS_CONFORMANCE_CHECKER is
		once
			create {LIBERTY_STANDARD_GENERICS_CONFORMANCE_CHECKER} Result.make
		end

	tuple_generics_checker: LIBERTY_GENERICS_CONFORMANCE_CHECKER is
		once
			create {LIBERTY_TUPLE_CONFORMANCE_CHECKER} Result.make
		end

	agent_generics_checker: LIBERTY_GENERICS_CONFORMANCE_CHECKER is
		once
			create {LIBERTY_AGENT_CONFORMANCE_CHECKER} Result.make
		end

feature {}
	visit_type_any: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_any
		end

	visit_type_pointer: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_pointer
		end

	visit_type_integer_64: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_integer_64
		end

	visit_type_integer_32: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_integer_32
		end

	visit_type_integer_16: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_integer_16
		end

	visit_type_integer_8: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_integer_8
		end

	visit_type_real_64: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_real_64
		end

	visit_type_real_32: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_real_32
		end

	visit_type_real_80: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_real_80
		end

	visit_type_real_128: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_real_128
		end

	visit_type_character: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_character
		end

	visit_type_string: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_string
		end

	visit_type_boolean: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_boolean
		end

	visit_type_native_array: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_native_array
		end

	visit_type_tuple: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_tuple
		end

	visit_type_procedure: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_procedure
		end

	visit_type_function: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_function
		end

	visit_type_predicate: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_type_predicate
		end

	visit_user_type: PROCEDURE[TUPLE[LIBERTY_TYPE_VISITOR, LIBERTY_ACTUAL_TYPE]] is
		once
			Result := agent {LIBERTY_TYPE_VISITOR}.visit_user_type
		end

feature {}
	convert_integer_8_16: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_integer_8_16
		end

	convert_integer_8_32: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_integer_8_32
		end

	convert_integer_8_64: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_integer_8_64
		end

	convert_integer_16_32: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_integer_16_32
		end

	convert_integer_16_64: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_integer_16_64
		end

	convert_integer_32_64: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_integer_32_64
		end

	convert_real_32_64: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_real_32_64
		end

	convert_real_32_80: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_real_32_80
		end

	convert_real_32_128: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_real_32_128
		end

	convert_real_64_80: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_real_64_80
		end

	convert_real_64_128: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_real_64_128
		end

	convert_real_80_128: PROCEDURE[TUPLE[LIBERTY_TYPE_CONVERTER]] is
		once
			Result := agent {LIBERTY_TYPE_CONVERTER}.convert_real_80_128
		end

invariant
	types /= Void
	classes /= Void
	types_incubator /= Void

end
