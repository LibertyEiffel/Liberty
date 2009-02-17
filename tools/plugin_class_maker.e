class PLUGIN_CLASS_MAKER

inherit
	CLASS_MAKER

creation {ANY}
	with_location_and_module

feature {ANY}
	with_location_and_module (a_location, a_module: STRING) is
			-- Create and initialize a new plugin class maker at a_location
		require
			a_location /= Void
			a_module /= Void -- TODO: location shall be a directory
		local
			location_path, module_path: POSIX_PATH_NAME; dir: BASIC_DIRECTORY
		do
			initialize
			location := a_location
			module := a_module
			create location_path.make_from_string(location)
			module_path := location_path / module
			if not location_path.is_directory and then not dir.create_new_directory(location_path.to_string) then
				log("Couldn't create or open location directory `@(1)'",
				<<location_path.to_string>>)
				raise(cannot_create_location_directory)
			end
			if not module_path.is_directory and then not dir.create_new_directory(module_path.to_string) then
				log("Couldn't create or open module directory `@(1)'",
				<<module_path.to_string>>)
				raise(cannot_create_module_directory)
			end
			create include
			create source
			create include_file.connect_to((module_path / once "header.h").to_string)
			create source_file.connect_to((module_path / once "source.c").to_string)
			check
				include_file.is_connected
				source_file.is_connected
			end
			log(once "C source file: @(1)%NC header file: @(2)%N",
			<<source_file.path, include_file.path>>)
			include_file.put_string(automatically_generated_c_header)
			source_file.put_string(automatically_generated_c_header)
		end

feature {ANY} -- Function emission
	append_function_body (a_node: XML_COMPOSITE_NODE) is
		local
			description: STRING
		do
			--if feature_descriptions.has(
			if variadic then
				description := c_function_name + variadic_function_note
			else
				description := c_function_name
			end
			buffer.put_message(once "%
			% 		-- @(1)%N%
			%		external %"plug_in%"%N%
			%		alias %"{%N%
			%			location: %"@(2)%"%N%
			%			module_name: %"@(3)%"%N%
			%			feature_name: %"@(4)%"%N%
			%		}%"%N%
			%		end%N%N",
			<<description, location, module, c_function_name>>)
		end

feature {ANY} -- Structure emission
	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local
			c_field, eiffel_field, eiffel_type, getter, setter: STRING
			setter_description, getter_description: STRING
			descriptions: HASHED_DICTIONARY[COLLECTION[STRING],STRING]
		do
			-- Setter and getter function names are
			-- shared by Eiffel and C to make things
			-- clearer, since a valid Eiffel feature name
			-- is also a valid C function name.
			c_field := a_field.attribute_at(once U"name").to_utf8
			eiffel_field := adapt(c_field)
			eiffel_type := eiffel_type_of(a_field)
			if eiffel_type /= Void then
				setter := a_structure_name + once "_set_" + eiffel_field
				getter := a_structure_name + once "_get_" + eiffel_field
				setter.to_lower
				getter.to_lower
				descriptions := feature_descriptions.reference_at(a_structure_name)	
				if descriptions /= Void then
					setter_description:=formatted_description(descriptions.reference_at(eiffel_field))
					getter_description:=formatted_description(descriptions.reference_at(eiffel_field))
				else setter_description:=once ""; getter_description:=once ""
				end
				log(once "Field @(1).@(2) (%"@(3)%", %"@(4)%" ",
				<<a_structure_name, c_field, setter_description,getter_description>>)
				queries.put_message(once "	@(1) (a_structure: POINTER): @(2) is%N%
				%			-- Query for @(5) field of @(6) structure.%N%
				%			@(7)%N%	
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %"@(3)%"%N%
				%			module_name: %"@(4)%"%N%
				%			feature_name: %"@(1)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<getter, eiffel_type, location, 
				module, c_field, a_structure_name,
				getter_description>>)
				log_string(once "query, ")
				setters.put_message(once "	@(1) (a_structure: POINTER; a_value: @(2)) is%N%
				%			-- Setter for @(5) field of @(6) structure.%N%
				%			@(7)%N%
				%		external %"plug_in%"%N%
				%		alias %"{%N%
				%			location: %"@(3)%"%N%
				%			module_name: %"@(4)%"%N%
				%			feature_name: %"@(1)%"%N%
				%		}%"%N%
				%		end%N%N",
				<<setter, eiffel_type, location, 
				module, c_field, a_structure_name,
				setter_description>>)
				log_string(once "command, ")
				-- Note: Type safety is assured by Eiffel and GCC-XML so we can
				-- be less type-strict-paranoid here and use some type-casts.
				include.put_message(once "#define @(1)(a_structure) (((@(2)*) a_structure).@(3))%N%N",
				<<getter, a_structure_name, c_field>>)
				include.put_message(once "#define @(1)(a_structure,a_value) ((@(2)*) a_structure)->@(3) = a_value;%N%N",
				<<setter, a_structure_name, c_field>>)
				include.print_on(include_file)
				log_string(once "macros made).%N")
			else
				log(once "Field @(1) in structure @(2) is not wrappable: @(3)",
				<<c_field, a_structure_name, last_error>>)
				queries.put_message(once "%T-- Unwrappable field @(1): @(2)%N",
				<<c_field, last_error>>)
				last_error := Void -- Error handled, resetting it.
			end
		end

feature {ANY} -- Enumeration emission
	append_enumeration_value_low_level (an_eiffel_value, a_low_level_value, a_file_name: STRING) is
			-- Append in `low_level_values' a declaration labelled
			-- `an_eiffel_value' to access `a_low_level_value' found in
			-- `a_file_name'
		do
			low_level_values.put_message(once "	@(1): INTEGER is%N%
		%		external %"plug_in%"%N%
		% 		alias %"{%N%
		% 			location: %"@(2)%"%N%
		% 			module: %"@(3)%"%N%
		% 			feature_name: %"@(4)%"%N%
		% 			}%"%N%
		% 		end%N%N",
			<<an_eiffel_value, location, module, a_low_level_value>>)
		end

feature {ANY}
	location: STRING

	module: STRING

	include, source: FORMATTER
			-- The message formatters used to print to plug-in's include and source
			-- file.

	plugin_stream: STRING_OUTPUT_STREAM

	include_file: TEXT_FILE_WRITE
			-- The C include file where all macros are written

	source_file: TEXT_FILE_WRITE
			-- The C source file where all plugin code is outputted

feature {} -- Constants
	cannot_create_location_directory: STRING is "Cannot create location directory for plugin output"

	cannot_create_module_directory: STRING is "Cannot create module directory for plugin output"
			-- Message also used as an exception

	automatically_generated_c_header: STRING is "[
		/*
		** This file has been automatically generated by eiffel-gcc-xml tool.
		** Any changes will be lost by the next execution of the tool.
		*/


		]"

end -- class PLUGIN_CLASS_MAKER
-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
