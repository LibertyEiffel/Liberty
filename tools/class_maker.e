deferred class CLASS_MAKER
	-- Outputs wrapper classes for functions, structures and enumerations.

insert 
	SHARED_SETTINGS
	EIFFEL_NAME_CONVERTER
	EIFFEL_GCC_XML_EXCEPTIONS
	FILE_TOOLS

feature 
	initialize is
			-- Initialize the data structures
		do
			-- Initialize data structure
			create files.make
			create files_by_id.make
			create functions.make 
			create structures.make
			create enumerations.make
			create translate.make
			create fields.make

			-- Initialize output buffers, streams and message printers
			-- for functions, structures and enumerations.
			create buffer.with_capacity(2048)
			create buffer_stream.make
			create printer.make(buffer_stream)
			create log.make(std_error)

			create setters.with_capacity(2048)
			create setters_stream.make
			create setters_printer.make(setters_stream)

			create queries.with_capacity(2048)
			create queries_stream.make
			create queries_printer.make(queries_stream)
		end

	is_initialized: BOOLEAN is
		do
			Result := ((files /= Void ) and then
						  (functions /= Void ) and then 
						  (structures /= Void ) and then
						  (enumerations /= Void ) and then
						  (fields /= Void) and then
						  (headers/=Void) and then
						  (translate/=Void))
			end

feature -- Settings 
	set_headers (some_headers: HASHED_SET[STRING]) is do headers := some_headers end
	set_input (an_input: INPUT_STREAM) is do input := an_input end

feature	
	process is
		require 
			input_not_void: input/=Void
			connected_input: input.is_connected
			initialized: is_initialized
		local bd: BASIC_DIRECTORY
		do
			if verbose then std_error.put_line(once "Reading XML file.") end
			create_tree

			if verbose then std_error.put_line(once "Examining XML tree.") end
			visit(tree.root)

			if directory=Void then
				if verbose then std_error.put_line(once "Outputting everything on standard output.") end
			else
				if not is_directory(directory) then
					if not bd.create_new_directory(directory) then
						if verbose then std_error.put_line(once "Couldn't create directory "+directory) end
						die_with_code(exit_failure_code)
					else 
						if verbose then std_error.put_line("Successfully created "+directory) end
					end -- if create directory
				end -- is directory
			end

			-- debug std_output.put_line(once "Outputting everything to
			-- standard output.")  output:=std_output end

			if verbose then std_error.put_line(once "Making external functions classes.") end
			make_external_classes
			
			if verbose then std_error.put_line(once "Making structure accessing classes.")	end
			make_structures

			if verbose then std_error.put_line(once "Making enumerations classes.")	end
			make_enumerations
		end

	create_tree is
		do
			create tree.make(input)
		rescue
			std_error.put_string
			("[
			  Couldnt correctly parse XML file, probably because of some
			  glitches in current implementation of XML parser in
			  SmartEiffel 2.3 standard library.

			  As a temporary solution you can recompile this program
			  replacing the original XML_TREE and XML_CALLBACKS with
			  those found in workaround directory.  
			  ]")
		end

	visit (a_node: XML_NODE) is
		require node_not_void: a_node/=Void
		local i: INTEGER; a_child: XML_NODE; c_name,file_id,id: STRING;
			functions_in_file: LINKED_LIST[XML_NODE]
		do
			id := a_node.attribute_at(once "id")
			c_name := a_node.attribute_at(once "name")
			file_id := a_node.attribute_at(once "file")

			inspect a_node.name
			when "Function" then 
				check file_id/=Void end
				functions_in_file := functions.reference_at(file_id)
				if functions_in_file=Void then
					-- This is the first function belonging to `file'
					-- found. Let's add a list for them.
					create functions_in_file.make
					functions.add(functions_in_file, file_id)
				end
				functions_in_file.add_last(a_node)
			when "Struct" then 
				check file_id/=Void end
				if c_name/=Void then 
					translate.types.put(a_node,id)
					structures.fast_put(a_node,c_name)
				else -- void name
					if verbose then std_error.put_line("Skipping nameless structure in line "+a_node.line.out) end
				end
			when "Field" then 
				check id_not_void: id/=Void end
				fields.fast_put(a_node, id)
			when "Enumeration" then 
				check id/=Void; c_name/=Void end
				enumerations.fast_put(a_node,c_name)
				translate.types.put(a_node,id)
				
			when -- Type system
				"ArrayType", "FunctionType", "FundamentalType", 
				"PointerType", "ReferenceType",  
				"Typedef", "Union", "Variable" then 
				check id/=Void end
				translate.types.put(a_node,id)

				-- The rest
			when "File" then 
				check c_name/=Void end
				files.fast_put(a_node,c_name)
				files_by_id.fast_put(a_node,id)
			else 
				-- Ignoring other nodes: Ellipsis (which stands for
				-- the feared variadic functions),
				-- Argument, EnumValue, GCC_XML,
				-- CvQualifiedType, Namespace,   
				-- Recursively visit all children:
				from i:=1 until i>a_node.children_count loop
					a_child := a_node.child(i)
					if a_child/=Void then visit(a_child) end
					i:=i+1
				end
			end
		end
	
feature -- Functions-providing external classes making
	make_external_classes is
		do
			functions.do_all(agent examine_functions)
		end

	examine_functions (some_functions: LINKED_LIST[XML_NODE]; a_file_id: STRING) is
		require 
			not_void_functions: some_functions/=Void 
			file_name_not_void: a_file_id/=Void
		local 
			header_name, wrapper_name: STRING
			path, file_path: POSIX_PATH_NAME
		do
			create header_name.copy(files_by_id.at(a_file_id).attribute_at(once "name"))
			if is_to_be_emitted (header_name) then
				if directory=Void then 
					if verbose then log.put_message("Outputting wrapper for functions found in file @(1) on standard error",<<header_name>>) end
					output:=std_output
				else
					-- Compute Eiffel class name from header name
					create file_path.make_from_string(header_name)
					create wrapper_name.copy(file_path.last)
					wrapper_name.remove_suffix(".h")
					wrapper_name:=eiffel_class_file_name(wrapper_name+"_externals")
					file_path.make_from_string(wrapper_name)
					create path.make_from_string(directory)
					path.join(file_path)
					if verbose then std_error.put_line("Outputting wrapper for functions found in file "+header_name+" on "+path.to_string) end

					create {TEXT_FILE_WRITE} output.connect_to(path.to_string)	
				end
				emit_functions_class_headers(header_name)
				some_functions.do_all(agent emit_function(header_name,?))
				output.put_line(footer)
				output.disconnect
			else 
				if verbose then
					std_error.put_string(once "Skipping '")
					std_error.put_string(header_name)					
					std_error.put_string(once "': it doesn't belong to ") 					
					std_error.put_line(headers.out)
				end -- if verbose
			end -- if is_to_be_emitted (header_name) 
		end
	
	emit_functions_class_headers (a_file_name: STRING) is
			-- Put on `output' the header on an "external" class
			-- containing the functions declared in `a_file_name,' from
			-- the beginning until the "feature {} -- External calls"
			-- label included
		require a_file_name/=Void
		local class_name: STRING; path: POSIX_PATH_NAME
		do
			create path.make_from_string(a_file_name)
			class_name := path.last -- basaname
			class_name.remove_suffix(once ".h")
			class_name:=eiffel_class_name(class_name)+once "_EXTERNALS"
			output.put_string(automatically_generated_header)
			output.put_string(deferred_class)
			output.put_line(class_name)
			output.put_line(struct_inherits)
			output.put_line(externals_header)
		end

	emit_function (a_file_name: STRING; a_node: XML_NODE) is
			-- Put the declaration for the function at `a_node' on
			-- `output'.
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
			output_not_void: output/=Void
			connected_output: output.is_connected
		deferred 
		end

feature -- Low-level structure class creator
	make_structures is
		local
			typedef, structure: XML_NODE; iterator: ITERATOR[XML_NODE];
			name, referred_type, file_name, file_id: STRING
		do
			iterator := structures.get_new_iterator_on_items
			from iterator.start until iterator.is_off loop
				structure := iterator.item
				name := structure.attribute_at(once "name")
				file_id := structure.attribute_at(once "file")
				file_name := files_by_id.reference_at(file_id).attribute_at(once "name")
				if is_to_be_emitted (file_name) then 
					std_error.put_string("Wrapping structure ") std_error.put_line(name)
					emit_structure(structure, name)
				else -- structure not in a desired header
					if verbose then
						std_error.put_string(name)
						std_error.put_line(" skipped.")
					end
				end
				iterator.next
			end

			-- Many structures are often "hidden behind" a typedef.
			-- typedefs.do_all(agent emit_typedeffed_structure)
			iterator := translate.typedefs.get_new_iterator
			from iterator.start until iterator.is_off loop
				typedef := iterator.item
				referred_type := typedef.attribute_at(once "type")
				name := typedef.attribute_at(once "name")
				check  
					referred_type_not_void: referred_type/=Void
					name_not_void: name/=Void
				end
				structure := structures.reference_at(referred_type)
				if structure/=Void then
					-- Referred type is actually a structure
					file_id := structure.attribute_at(once "file")
					file_name := files.at(file_id).attribute_at(once "name")
					if is_to_be_emitted (file_name) then 
						std_error.put_string(once "Wrapping typedef structure ")
						std_error.put_line(name)
						emit_structure(structure, name)
					else -- structure not in a desired header
						if verbose then std_error.put_line(structure.name+" skipped: defined in an included file. ") end
					end
				end -- void structure
				iterator.next
			end
		end

	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Struct")
			name_not_void: structure_name/=Void
		deferred 
		end

feature -- Enumeration class creator
	make_enumerations is
		do
			setters.clear_count
			queries.clear_count
			create low_level_values.make_empty
			enumerations.do_all(agent emit_enumeration)
		end

	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_enumeration: a_node.name.is_equal(once "Enumeration")
			name_not_void: a_name/=Void
		deferred 
		end

	is_flag_enumeration (a_node: XML_NODE): BOOLEAN is
			-- Does `a_node' represent some flags? i.e. is it an
			-- enumeration with all values set to 2^n with no n repeated?
		require 
			node_not_void: a_node/=Void
			is_enumeration: a_node.name.is_equal(once "Enumeration")
		local i, flags_so_far, value: INTEGER; child: XML_NODE
		do
			from i:=1; Result:=True; variant i
			until Result=False or else i>a_node.children_count 
			loop
				child:=a_node.child(i)
				if child/=Void then 
					if (once "EnumValue").is_equal(child.attribute_at(once "name")) then
						value:=child.attribute_at(once "init").to_integer
						if not value.is_a_power_of_2 then Result:=False
						elseif flags_so_far & value = 0 then
							-- They are indipendent
							flags_so_far := flags_so_far + value 
						else Result:=False
						end 
					else  
						debug 
							std_error.put_string("Unhandled child in Enumeration at line"+child.line.out)
						end -- debug
					end -- Is an EnumValue
				else -- child is void
					debug
						std_error.put_string("Void child in Enumeration!") 
					end
				end -- Void child
				i:=i+1
			end -- loop over childs
		end

feature 
	is_to_be_emitted (a_file_name: STRING): BOOLEAN is
			-- Shall the declaration in file named `a_file_name' be
			-- wrapped? The content of a file will be emitted when global
			-- is True or if `a_file_name' is in `headers' hashed set.
		require is_initialized
		do
			Result := global or else headers.has(a_file_name)
		end
	
feature -- Data 

	input: INPUT_STREAM
	output: TERMINAL_OUTPUT_STREAM

	tree: XML_TREE

	translate: TYPE_TRANSLATOR

	headers: HASHED_SET[STRING]

	files_by_id: HASHED_DICTIONARY [XML_NODE, STRING] 
			-- Files by id

	files, structures, enumerations: HASHED_DICTIONARY [XML_NODE, STRING]
			-- Files, structures, enumeration by their name

	functions: HASHED_DICTIONARY[LINKED_LIST[XML_NODE], STRING]
			-- Functions grouped by the id of the file they are defined
			-- in, i.e. "f0" "f12".
	
	fields: HASHED_DICTIONARY [XML_NODE, STRING]
			-- Fields by their id

feature {} -- Implementation 
	buffer: STRING 
			-- Buffer to render the text of the feature currently being
			-- wrapped (a function call, a structure or an enumeration).
	
	printer: STRING_PRINTER
			-- The string formatter used put output in buffer

	log: STRING_PRINTER
			-- The formatter used to log messages

	setters, queries, low_level_values: STRING
			-- Temporary strings used to build enumerations and structures external classes
	buffer_stream, queries_stream, setters_stream: STRING_OUTPUT_STREAM
			-- Streams linked to setter and getter buffers.
	queries_printer, setters_printer: STRING_PRINTER
			-- String printer formatter for setters and queries.


feature {} -- Constants
	variadic_function_note: STRING is "%T%T%T-- Variadic call%N"
	unwrappable_function_note: STRING is "%T%T%T-- Unwrappable function%N%T%Tobsolete %"Unwrappable C function%"%N"
	
	deferred_class: STRING is "deferred class "
	struct: STRING is "_STRUCT"
	struct_inherits: STRING is "%N%Ninherit ANY undefine is_equal, copy end%N%N"
	queries_header: STRING is "feature {} -- Low-level queries%N"
	setters_header: STRING is "feature {} -- Low-level setters%N"
	externals_header: STRING is "feature {} -- External calls%N"
	footer: STRING is "end"
	automatically_generated_header: STRING is
		"[
		 -- This file have been created by eiffel-gcc-xml.
		 -- Any change will be lost by the next execution of the tool.
		 
		 ]"
		 

feature {} -- Auxiliary features
	put_strings (a_file: OUTPUT_STREAM; some_strings: COLLECTION[STRING]) is
		local i: ITERATOR[STRING]; s: STRING
		do
			from i:=some_strings.get_new_iterator; i.start until i.is_off loop
				s := i.item
				if s/=Void then a_file.put_string(s) end
				i.next
			end
			a_file.put_new_line
		end
end
