class PLUGIN_CLASS_MAKER

inherit CLASS_MAKER

creation with_location_and_module 

feature
	with_location_and_module (a_location, a_module: STRING) is
	-- Create and initialize a new plugin class maker at a_location
	require
		a_location/=Void
		a_module/=Void
		-- TODO: location shall be a directory
	local
		location_path, module_path: POSIX_PATH_NAME; dir: BASIC_DIRECTORY
	do
		location:=a_location
		module:=a_module

		create location_path.make_from_string(location)
		module_path := location_path/module 
		
		if not location_path.is_directory and then
			not dir.create_new_directory(location_path.to_string) then
			log("Couldn't create or open location directory `@(1)'",<<location_path.to_string>>)
			raise(cannot_create_directory)
		end
		
		if not module_path.is_directory and then
			not dir.create_new_directory(module_path.to_string) then
			log("Couldn't create or open module directory `@(1)'",<<module_path.to_string>>)
			raise(cannot_create_directory)
		end
		
		create c_include.connect_to ((module_path/"header.h").to_string)
		create c_source.connect_to ((module_path/"source.c").to_string)
			
		check c_include.is_connected; c_source.is_connected end
		create to_include.make(c_include)
		create to_source.make(c_source)
		log ("C source file: '@(1)'%NC header file: '@(2)'%N",<<c_source.path,c_include.path>>)
		initialize
		rescue	
		log("Incorrect plugin location: @(1) is not an existing directory.%N",<<a_location>>)
			die_with_code(exit_failure_code)
	end

feature {} -- setup
	setup_directories is
		-- Makes sure that `location' and `module' are directories

	do
	end
feature -- Function emission
	append_function_body (a_node: XML_COMPOSITE_NODE) is
		do
			buffer.append(once " is%N")
			if variadic then buffer.append(variadic_function_note) end
			printer.put_message	
			(once "[
					external "plug_in"
					alias "{
						location: "@(1)"
						module_name: "@(2)"
						feature_name: "@(3)"
						}"
					end

					]", <<location, module,c_function_name>>)
		end

feature -- Structure emission
	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local 
			 -- Strings containing field name in C and Eiffel
			 c_field, eiffel_field,
			 -- String containing type name in C and Eiffel
			 eiffel_type,
			 -- Setter and getter function name; they are
			 -- shared by Eiffel and C to make things
			 -- clearer, since a valid EIffel feature name
			 -- is also a valid C function
			 getter, setter: STRING
		do
			c_field := a_field.attribute_at (once U"name").to_utf8
			eiffel_field := adapt(c_field)
			eiffel_type := translate.eiffel_type_of(a_field)
			
			setter := a_structure_name+"_set_"+eiffel_field
			getter := a_structure_name+"_get_"+eiffel_field
			setter.to_lower; getter.to_lower
			log(once "Appending query for @(1)%N",<<c_field>>)
			queries_printer.put_message 
			(once "[
			@(1) (a_structure: POINTER): @(2) is 
				external "plug_in"
				alias "{
					location: "@(3)"
					module_name: "@(4)"
					feature_name: "@(5)"
				}"
			end
			]",<<getter,eiffel_type,location,module,c_field>>)

			log(once "Appending setter for @(1)%N",<<c_field>>) 
			setters_printer.put_message
			(once "[
			@(1) (a_structure: POINTER; a_value: @(2)) is
				external "plug_in"
				alias "{
					location: "@(3)"
					module_name: "@(4)"
					feature_name: "@(5)"
				}"
			end
			]",<<setter,eiffel_type,location,module,setter>>)
			
			-- Emission of C getter and setter macros. Type safety is assured
			-- by Eiffel and GCC-XML so we can be less type-strict-paranoid
			-- here

			to_include.put_message 
			(once "#define @(1)(a_structure) ((a_structure).@(2))%N",
			<<getter, c_field>>)
			
			to_include.put_message 
			(once "#define @(1)(a_structure,a_value) (a_structure->@(2) = a_value;%N",
			<<setter,c_field>>)
		rescue
			log (once "Field @(1) in structure @(2) is not wrappable: @(3)", 
			<<c_field,a_structure_name,translate.last_error>>)
			queries_printer.put_message
			(once "%T-- Unwrappable @(1): @(2)%N", <<c_field, translate.last_error>>)
		end

feature -- Enumeration emission
	append_enumeration_value_low_level (an_eiffel_value, a_low_level_value, a_file_name: STRING) is
		do
			-- Append in `low_level_values' a declaration labelled
			-- `an_eiffel_value' to access `a_low_level_value' found in `a_file_name'
			low_level_values.append(format("[
			@(1): INTEGER is 
				external "plug_in"
				alias "{
					location: "@(2)"
					module: "@(3)"
					feature_name: "@(4)"
					}"
				end
				]", <<an_eiffel_value, location, module, a_low_level_value>>))
		end

feature
	location: STRING
	module: STRING

	to_include, to_source: STRING_PRINTER
	-- The message formatters used to print to plug-in's include and source
	-- file.

	plugin_stream: STRING_OUTPUT_STREAM

	c_include: TEXT_FILE_WRITE
	-- The C include file where all macros are written

	c_source: TEXT_FILE_WRITE
	-- The C source file where all plugin code is outputted

feature {} -- Constants
	cannot_create_directory: STRING is "Cannot create directory for plugin output"
end -- class PLUGIN_CLASS_MAKER
