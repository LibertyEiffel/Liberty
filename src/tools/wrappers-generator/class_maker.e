deferred class CLASS_MAKER
	-- Outputs wrapper classes for functions, structures and enumerations.
	-- Implementation notes

	-- Note:
	-- "XML is born together with Unicode"; trying to use plain ASCII strings
	-- is a vain effort; Eiffel source-code is expected to be an ASCII text or
	-- an UTF8 encoded text where all non-ASCII characters are enclosed into
	-- comments or in string bodies. Given these premises all the processing is
	-- made using UNICODE_STRINGs; conversion to UTF8 is the last step before
	-- emission of generated source code.


	-- Stylistical note: multi-line strings are formatted like:
	
	-- "foo is %N%
	-- %	do .....%N%
	-- % end"

	-- using '%' to break lines. In fact we are generating Eiffel code; using
	-- the "[ ]" syntax will confuse code-formatter of some editor. Real tabs
	-- are used instead of "%T" becuase otherwise the code formatted with the
	-- latter is difficult to read.

insert
	TYPE_TRANSLATOR
	SHARED_SETTINGS
	EIFFEL_NAME_CONVERTER
	EIFFEL_GCC_XML_EXCEPTIONS
	FILE_TOOLS
	MEMORY

feature {ANY} -- Initialization
	initialize is
			-- Initialize the data structures
		do
			-- Initialize data structures
			create files.make
			create files_by_id.make
			create functions.make
			create structures.make
			create enumerations.make
			create fields.make
			create types.make
			create typedefs.make
			-- Initialize output formatters for functions, structures and enumerations.
			create buffer
			create queries
			create setters
			create low_level_values
			create validity_query
			create class_descriptions.make
			create feature_descriptions.make
			create flags.make
		end

	is_initialized: BOOLEAN is
		do
			Result := files /= Void and then functions /= Void and then structures /= Void and then enumerations /= Void and then fields /= Void and then headers /= Void and then types /= Void and then typedefs /= Void
		end

feature -- Descriptions reading
	read_descriptions_from (a_file_name: STRING) is
		-- Read description comment for classes and features from the file named
		-- `a_file_name', creating and filling `class_descriptions' and
		-- `feature_descriptions'. Leading and trailing spaces are removed.
		-- Lines starting with "--" are ignored as comments. Class descriptions
		-- are in the form "CLASS_NAME Description text", feature descriptions
		-- are "CLASS_NAME.feature Description text".
	require
		a_file_name/=Void
		file_exists(a_file_name)
		is_file(a_file_name) 
	local 
		line, described: STRING; 
		words: LINKED_LIST[STRING]
		descriptions: TEXT_FILE_READ
	do
		create descriptions.connect_to(a_file_name)
		if descriptions.is_connected then
			from descriptions.read_line 
			until descriptions.end_of_input
			loop
				line := descriptions.last_string
				line.left_adjust; line.right_adjust
				if line.has_prefix(once "--") then 
					debug
						log3([once "Comment %"",line,"%".%N"])
					end
				else 
					create words.make
					line.split_in (words)
					if not words.is_empty then
						described := words.first
						words.remove_first
						read_description(described,words)
					end
				end
				descriptions.read_line
			end
			check descriptions.end_of_input end
			descriptions.disconnect
		else
			debug
				log(once "Couldn't connect to '@(1)' to read descriptions.%N",<<a_file_name>>)
			end
		end
	end

	read_description (a_described: STRING; a_description: COLLECTION[STRING]) is
		-- Looks if `a_described' could be a class name (i.e. "CLASS_NAME_01") or a
		-- class with a feature name ("ANOTHER_CLASS.my_feature_12_foo"); adds
		-- `a_description' into `class_descriptions' in the former case and into
		-- `feature_descriptions' in the latter.

		-- Leading and trailing spaces are removed from `a_described'; comments -
		-- starting with "--" are skipped; See `read_comments' for further
		-- informations.
	local 
		described_class, described_feature: STRING; dot: INTEGER
		subdictionary: HASHED_DICTIONARY[COLLECTION[STRING],STRING]	
	do
		-- Remove leading and trailing spaces
		a_described.left_adjust; a_described.right_adjust
		if not a_described.has_prefix(once "--") then
			-- Look for class name and feature name
			inspect a_described.occurrences('.') 
			when 0 then -- could be a class
				if is_valid_class_name(a_described) then
					log(once "Description for class @(1) is %"",<<a_described>>)
					a_description.do_all(agent log_word)
					log_string(once "%".%N")
					class_descriptions.put(a_description,a_described)
				else log3([once "Comment file: invalid class name `",a_described,once "'.%N"])
				end
			when 1 then -- could be a feature (i.e. CLASS.feature) 
				-- Look for the dot and see if has a meaningful position
				dot:=a_described.first_index_of('.')
				if dot>a_described.lower and dot<a_described.count then
					described_class   := a_described.substring(1,dot-1)
					described_feature := a_described.substring(dot+1,a_described.count)
					log(once "Description for feature @(1) of @(2) is %"",<<described_feature,described_class>>)
					a_description.do_all(agent log_word)
					log_string(once "%".%N")
					subdictionary := feature_descriptions.reference_at(described_class)
					if subdictionary=Void then
						create subdictionary.make
						feature_descriptions.put(subdictionary,described_class)
					end
					subdictionary.put(a_description,described_feature)
				else log3([once "Comment file: empty class or feature name %"",a_described,once "%".%N"])
				end
			else log3([once "Comment file: feature name %"",a_described,once "%" has too many dots.%N"])
			end -- inspect
		end -- if has "--" prefix
	end

feature {ANY} -- Settings
	set_headers (some_headers: HASHED_SET[STRING]) is
		do
			headers := some_headers
		end

	set_input (an_input: INPUT_STREAM) is
		do
			input := an_input
		end

feature {ANY} -- Processing XML input
	process is
		require
			input_not_void: input /= Void
			connected_input: input.is_connected
			initialized: is_initialized
		local
			bd: BASIC_DIRECTORY
		do
			log_string(once "Processing XML file: ")
			create tree.make(input.url)
			visit(tree.root)
			log_string(once "done.%N")
			if directory = Void then
				log_string(once "Outputting everything on standard output.")
			else
				if not is_directory(directory) then
					if not bd.create_new_directory(directory) then
						log(once "Couldn't create directory @(1).%N",
						<<directory>>)
						die_with_code(exit_failure_code)
					else
						log(once "Successfully created directory @(1).%N",
						<<directory>>)
					end
				end
			end
			log_string(once "Making external functions classes.%N")
			functions.do_all(agent examine_functions)	
			log_string(once "Making typedeffed structure accessing classes.%N")
			typedefs.do_all(agent examine_typedeffed_structure)
			log_string(once "Making structure accessing classes.%N")
			structures.do_all(agent examine_structure)
			log_string(once "Making enumerations classes.%N")
			enumerations.do_all(agent emit_enumeration)	
		end

	visit (a_node: XML_COMPOSITE_NODE) is
		require
			node_not_void: a_node /= Void
		local
			i: INTEGER; a_child: XML_COMPOSITE_NODE; 
			name, c_name, file_id, id: UNICODE_STRING
			c_name_utf8: STRING
			functions_in_file: LINKED_LIST[XML_COMPOSITE_NODE]
		do
			log_string(once ".")
			id := a_node.attribute_at(once U"id")
			c_name := a_node.attribute_at(once U"name")
			file_id := a_node.attribute_at(once U"file")
			name := a_node.name
			if name.is_equal(once U"Function") then
				check
					file_id /= Void
				end
				functions_in_file := functions.reference_at(file_id)
				if functions_in_file = Void then
					-- This is the first function belonging to `file'
					-- found. Let's add a list for them.
					create functions_in_file.make
					functions.add(functions_in_file, file_id)
				end
				functions_in_file.add_last(a_node)
			elseif name.is_equal(once U"Struct") then
				check
					file_id /= Void
				end
				if c_name /= Void then 
					c_name_utf8 := c_name.as_utf8
					-- non-public structures shall be nevertheless be added to
					-- the types dictionary otherwise the type translator will
					-- get confused when dealing with typedefs referring to
					-- those structures
					debug
						log(once " structure @(1) in line @(2) ", <<c_name_utf8, a_node.line.out>>)
					end
					types.put(a_node, id)
					if is_public(c_name_utf8) then 
						structures.fast_put(a_node, c_name)
					end
				else
					debug 
						log(once " skipping nameless structure in line @(1) ", <<a_node.line.out>>)
					end
				end
			elseif name.is_equal(once U"Typedef") then
				-- Store typedefs 
				debug
					log(once " typedef @(1) ",<<a_node.attribute_at(once U"name").as_utf8>>)
				end
				typedefs.add_last(a_node)
				types.put(a_node,id)
			elseif name.is_equal(once U"Field") then
				check
					id_not_void: id /= Void
				end
				fields.fast_put(a_node, id)
			elseif name.is_equal(once U"Enumeration") then
				check
					id /= Void
					c_name /= Void
				end
				enumerations.fast_put(a_node, c_name)
				types.put(a_node, id)
		elseif (name.is_equal(once U"ArrayType") or else
				name.is_equal(once U"FunctionType") or else 
				name.is_equal(once U"FundamentalType") or else 
				name.is_equal(once U"PointerType") or else 
				name.is_equal(once U"ReferenceType") or else 
				name.is_equal(once U"Union") or else
				name.is_equal(once U"Variable")) then
				check
					id /= Void
				end
				types.put(a_node, id)
			elseif name.is_equal(once U"File") then
				check c_name /= Void end
				files.fast_put(a_node, c_name)
				files_by_id.fast_put(a_node, id)
			else
				-- Ignoring other nodes: Ellipsis (which stands for
				-- the feared variadic functions),
				-- Argument, EnumValue, GCC_XML,
				-- CvQualifiedType, Namespace,
				-- Recursively visit all children:
				from i := 1
				until i > a_node.children_count
				loop
					a_child ?= a_node.child(i)
					if a_child /= Void then visit(a_child) end
					i := i + 1
				end
			end
		end

feature {ANY} -- Creation of external classes providing access to C functions
	examine_functions (some_functions: LINKED_LIST[XML_COMPOSITE_NODE]; a_file_id: UNICODE_STRING) is
	-- Emit the wrappers for each function in `some_functions' that are
	-- contained in the file idenitied in the XML description by `a_file_id'
	-- (note that this is not the name of the file).
		require
			not_void_functions: some_functions /= Void
			file_name_not_void: a_file_id /= Void
		local
			header_name: STRING; path: POSIX_PATH_NAME
		do
			header_name := files_by_id.at(a_file_id).attribute_at(once U"name").to_utf8
			if is_to_be_emitted(header_name) then
				if directory = Void then
					log(once "Outputting wrapper for functions in file @(1) on standard output.%N",
					<<header_name>>)
					output := std_output
				else
					-- Compute Eiffel class name from header name
					class_name := class_name_from_header(header_name)
					create path.make_from_string(directory)
					path.add_last(class_name.as_lower+once ".e")
					if path.is_file then
						log(once "Copying existing file @(1) onto @(1).orig.%N",<<path.to_string>>)
						copy_to(path.to_string, path.to_string+once ".orig")
					end
					log(once "Outputting wrapper for functions found in file @(1) on @(2).%N",
					<<header_name, path.to_string>>)
					create {TEXT_FILE_WRITE} output.connect_to(path.to_string)
				end
				emit_functions_class_headers
				some_functions.do_all(agent emit_function)
				buffer.append(footer)
				buffer.print_on(output)
				output.disconnect
			else
				log(once "Skipping '@(1)'%N",
				<<header_name>>)
			end
		end

	emit_functions_class_headers is
		-- Put on `'output' the header on an "external" class named 'class_name'
		-- from the beginning until the "feature {} -- External calls" label
		-- included
	do
		buffer.append(automatically_generated_header)
		buffer.append(deferred_class)
		buffer.append(class_name) -- line
		buffer.put('%N')
		emit_description(class_descriptions.reference_at(class_name))
		buffer.append(struct_inherits) --line
		buffer.append(externals_header) --line
	end

	feature_description (a_class_name, a_feature_name: STRING): COLLECTION[STRING] is
		-- The description of `a_feature_name' in `a_class_name'. Void when
		-- there is no description.
	require a_class_name/=Void
	local dictionary: HASHED_DICTIONARY[COLLECTION[STRING],STRING] 	
	do
		dictionary := feature_descriptions.reference_at(a_class_name)
		if dictionary/=Void then 
			Result:=dictionary.reference_at(a_feature_name)
			-- debug
			-- 	log(once "feature_description(%"@(1)%",%"@(2)%")=%"@(3)%"%N",<<a_class_name,a_feature_name,formatted_description(Result)>>)
			-- end
		end
	end

	emit_description (a_description: COLLECTION[STRING]) is
		-- Put 'a_description' on 'buffer' formatting it as an Eiffel comment
		-- with lines shorter that 'description_lenght' characters.  Nothing is
		-- done when `a_description' is Void.
	local word: STRING; iter: ITERATOR[STRING]; length,new_length: INTEGER
	do
		if a_description/=Void then
			from 
				iter:=a_description.new_iterator; iter.start; 
				buffer.append(comment); length:=0
			until iter.is_off loop
				word := iter.item
				new_length := length + word.count
				if new_length>description_lenght then
					buffer.append(comment)
					length := 0
				else
					buffer.put(' ')
					length := new_length + 1
				end
				buffer.append(word)
				iter.next
			end
		end
	end

	c_function_name: STRING
		-- The untranslated C name of the function currently being wrapped

	variadic: BOOLEAN
		-- Is the function currently being emitted variadic?

	unwrappable: BOOLEAN 
		-- Is the function currently being emitted unwrappable?

	emit_function (a_node: XML_COMPOSITE_NODE) is
		-- Put the declaration for the function at `a_node' on
		-- `output'.
	require
		node_not_void: a_node /= Void
		is_function_node: a_node.name.is_equal(once U"Function")
		output_not_void: output /= Void
		connected_output: output.is_connected
	local name: STRING
	do
		unwrappable:=False
		c_function_name := a_node.attribute_at(once U"name").to_utf8
		name := adapt(c_function_name.as_lower)
		-- TODO: this way of assigning feature names is not entirely
		-- bullet-proof. In fact MyFunction and myfunction will get the same
		-- Eiffel feature name. Let me say that if the code you are going
		-- wrapping presents such issues it is not worth your time AFAIK. Paolo
		-- 2009-02-06.
		if is_public(name) then
			log(once "Function @(1)",<<name>>)
			buffer.put_message(once "%T@(1)", <<name>>)
			if a_node.children_count > 0 then
				append_function_arguments(a_node)
			end
			append_return_type(a_node)
			emit_description(feature_description(class_name, name))
			append_function_body(a_node)
			-- if unwrappable then log("Function @(1) is not wrappable.%N", <<name>>) end
			log_string(once "%N")
			buffer.print_on(output)
		else log(once "Skipping 'hidden' function @(1)%N", <<name>>)
		end
	end

	append_function_arguments (a_node: XML_COMPOSITE_NODE) is
			-- Append the arguments of function referred by `a_node' into
			-- `buffer'. If an Ellipsis ("...") is found `variadic' flag
			-- is set to True
		require
			node_not_void: a_node /= Void
			is_function_node: a_node.name.is_equal(once U"Function")
			has_arguments: a_node.children_count > 0
		local
			i: INTEGER; child: XML_NODE
		do
			variadic := False
			buffer.append(once " (")
			log(once "( (@(1) args) ",<<a_node.children_count.out>>)
			append_function_argument(a_node.child(1))
			from i:=2 until i>a_node.children_count or variadic or unwrappable loop
				buffer.append(once "; ") -- check a_node/=Void end
				child:=a_node.child(i) -- check child/=Void end 
				append_function_argument(child)
				i := i + 1
			end
			log_string(once ")")
			buffer.append(once ")")
		end

	append_function_argument (a_node: XML_NODE) is
			-- If `a_node' is an XML_COMPOSITE_NODE with the attribute "name" 
		require
			a_node /= Void
		local
			an_argument: XML_COMPOSITE_NODE; placeholder, argument_type: STRING
		do
			an_argument?=a_node
			if an_argument/=Void then
				if an_argument.name.is_equal(once U"Argument") then
					placeholder := an_argument.attribute_at(once U"name").to_utf8
					if placeholder = Void then
						-- Nameless prototype: providing sound default, using
						-- line and column, which are locally unique.
						placeholder := "an_argument_l"
						an_argument.line.append_in(placeholder)
						placeholder.append(once "_c")
						an_argument.column.append_in(placeholder)
					else
						placeholder := eiffel_argument(placeholder) -- Eiffellize it
					end
					argument_type := eiffel_type_of(an_argument)
					if argument_type=Void then 
						unwrappable:=True
						log(once "Unwrappable argument @(1): @(2).%N", <<placeholder, last_error>>)
						buffer.put_message (once "%N%T%T%T-- argument @(1) unwrappable: @(2)%N",<<placeholder, last_error>>)
						last_error:=Void -- Error handled, reset it.
					else
						log(once "@(1): @(2) ", <<placeholder, argument_type>>)
						buffer.put_message (once "@(1): @(2)", <<placeholder, argument_type>>)
					end
				elseif an_argument.name.is_equal(once U"Ellipsis") then
					log_string(once " .... ")
					variadic := True
				else
					log_string(once "Unknown XML child in function%N")
				end
			end
		end

	append_return_type (a_node: XML_COMPOSITE_NODE) is
			-- Append the Eiffel equivalent type of the return type of
			-- `a_node' to `buffer' and the "is" keyword, i.e. ": INTEGER_32 is " or ":
			-- POINTER is". When result of `a_node' is "void" only " is" is appended.
		require
			node_not_void: a_node /= Void
			is_function_node: a_node.name.is_equal(once U"Function")
		local
			returns: STRING
		do
			returns := eiffel_type_of_string(a_node.attribute_at(once U"returns"))
			if returns = Void then
				buffer.put_message ("%N%T%T%T-- unwrappable return type: @(1)%N", <<last_error>>)
				log(once "Unwrappable return type: @(1)... ",<<last_error>>)
				unwrappable:=True
				last_error := Void -- Error handled, reset it.
			elseif returns.is_empty then
				-- Nothing; the correct "return type" of a C function returning void (i.e. a command) is an empty string.
			else
				buffer.append(once ": ")
				buffer.append(returns)
			end
			buffer.append(once " is%N")
		end

	append_function_body (a_node: XML_COMPOSITE_NODE) is
			-- Append the body of function referred by `a_node'
		require
			node_not_void: a_node /= Void
			is_function_node: a_node.name.is_equal(once U"Function")
			c_function_name_not_void: c_function_name /= Void
		deferred
		end

feature {ANY} -- Low-level structure class creator
	examine_typedeffed_structure (a_typedef: XML_COMPOSITE_NODE) is
		-- Many structures are often "hidden behind" a typedef.  If the
		-- element referred by 'a_typedef' is a structure to be emitted
		-- emit_structure is invoked for the referred structure and it is
		-- removed from the 'structures' dictionary.
	require
		typedef_not_void: a_typedef/=Void
		is_typedef_node: a_typedef.name.is_equal(once U"Typedef")
	local
		structure, file_node: XML_COMPOSITE_NODE; 
		name, file_name: STRING
		referred_id, structure_name, file_id: UNICODE_STRING
	do
		referred_id := a_typedef.attribute_at(once U"type")
		name := a_typedef.attribute_at(once U"name").to_utf8
		file_id := a_typedef.attribute_at(once U"file")
		check
			referred_id_not_void: referred_id /= Void
			name_not_void: name /= Void
			file_id /= Void
		end
		structure := types.reference_at(referred_id)
		if structure /= Void and then 
			structure.name.is_equal(once U"Struct") then
			-- Referred type is actually a structure
			log(once "Typedef @(1) (file id @(3)) refers to structure @(2) ", 
			<<name,structure.attribute_at(once U"name").to_utf8, file_id.to_utf8>>)
			file_node := files_by_id.reference_at(file_id)
			if file_node/=Void then 
				file_name := file_node.attribute_at(once U"name").to_utf8
				if is_to_be_emitted(file_name) then
					log_string(once " wrapping.%N")
					emit_structure(structure, name)
					structure_name := structure.attribute_at(once U"name")
					debug log(once "Removing @(1) from structures",<<structure_name.as_utf8>>) end
					structures.fast_remove(structure_name)
				else
					log("Typedef @(1) skipped: not in a requested header file.%N",<<name>>)
				end
			else
				log_string(once " no file!!!%N")
			end
		else
			log("Typedef @(1) skipped: not referring to a struct.%N", <<name>>)
		end
	end

	examine_structure (a_structure: XML_COMPOSITE_NODE) is
		require
			structure_not_void: a_structure/=Void
			is_structure_node: a_structure.name.is_equal(once U"Struct")
		local
			name, file_name: STRING file_id: UNICODE_STRING
		do
			name := a_structure.attribute_at(once U"name").to_utf8
			file_id := a_structure.attribute_at(once U"file")
			file_name := files_by_id.reference_at(file_id).attribute_at(once U"name").to_utf8
			if is_to_be_emitted(file_name) then
				emit_structure(a_structure, name)
			else
				log(once "Structure @(1) skipped: not declared in a given header.%N",
				<<name>>)
			end
		end

	emit_structure (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		require
			node_not_void: a_node /= Void
			is_structure_node: a_node.name.is_equal(once U"Struct")
			name_not_void: a_structure_name /= Void
		local
			filename: STRING; path: POSIX_PATH_NAME
		do
			if unwrappable then
				-- buffer.reset
				buffer.put_message(once "%T-- @(1) is not wrappable",
				<<a_structure_name>>)
				buffer.print_on(output)
				output.flush
				output.disconnect
			else
				if is_public(a_structure_name) then
					-- buffer.reset
					filename := a_structure_name + once "_struct"
					class_name := eiffel_class_name(filename)
					if directory = Void then
						-- Output to standard output
						output := std_output
						log(once "Struct @(1) to class @(2) to standard output%N",
						<<a_structure_name, class_name>>)
					else
						create path.make_from_string(directory)
						path.add_last(eiffel_class_file_name(filename))
						filename := path.to_string
						if path.is_file then
							log(once "Copying existing file @(1) onto @(1).orig.%N",<<filename>>)
							copy_to(filename, filename+once ".orig")
						end
	
						log(once "Struct @(1) to class @(2) in @(3)%N",
						<<a_structure_name, class_name, filename>>)
						create {TEXT_FILE_WRITE} output.connect_to(filename)
					end
					append_structure_header(a_structure_name)
					buffer.print_on(output)
					append_structure_members(a_node, a_structure_name)
					append_structure_size(a_node,a_structure_name)
					output.put_string(once "end%N")
					output.flush
					output.disconnect
				else
					log(once "Struct @(1) skipped%N", <<a_structure_name>>)
				end
			end
		end

	append_structure_header (a_structure_name: STRING) is
			-- Append the header of a structure named `a_structure_name' to buffer.
		require
			a_structure_name /= Void
		local structure_class_name: STRING
		do
			structure_class_name:=eiffel_class_name(a_structure_name)
			structure_class_name.append(once "_STRUCT")
			buffer.append(automatically_generated_header)
			buffer.append(deferred_class)
			buffer.append(structure_class_name)
			emit_description(class_descriptions.reference_at(class_name))
			buffer.append(struct_inherits)
		ensure
			buffer_grew: buffer.count > old buffer.count
		end

	append_structure_members (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		require
			node_not_void: a_node /= Void
			name_not_void: a_structure_name /= Void
		local
			id, members: UNICODE_STRING; members_iter: ITERATOR[UNICODE_STRING]; field: XML_COMPOSITE_NODE
		do
			-- setters.reset; queries.reset
			members := a_node.attribute_at(once U"members")
			if members /= Void then
				setters.append(setters_header)
				queries.append(queries_header)
				members_iter := members.split.new_iterator
				from members_iter.start until members_iter.is_off
				loop
					id := members_iter.item
					field := fields.reference_at(id)
					if field /= Void then emit_structure_field(field, a_structure_name)
					else
						log(once "@(1) in @(2) is not a field but probably a C++ constructor.%N",
						<<id.as_utf8, a_structure_name>>)
					end
					members_iter.next
				end
				setters.print_on(output)
				queries.print_on(output)
			else
				output.put_string(once "%T-- Fieldless structure%N")
				log(once "Structure @(1) have no fields%N", <<a_structure_name>>)
			end
		end

	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		-- Append a query for `a_field' of a structure named
		-- `a_structure_name' (defined in `an_header') to `queries'
		-- and a setter to `setters'.
	require
		a_field /= Void
		a_structure_name /= Void
		is_field_node: a_field.name.is_equal(once U"Field")
		deferred
		end

	append_structure_size (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		-- Append to `output' the `struct_size' query for `a_structure_name'
	require
		node_not_void: a_node /= Void
		is_structure_node: a_node.name.is_equal(once U"Struct")
		name_not_void: a_structure_name /= Void
		deferred
		end

feature {ANY} -- Enumeration class creator
	emit_enumeration (a_node: XML_COMPOSITE_NODE; an_enum_name: UNICODE_STRING) is
		require
			node_not_void: a_node /= Void
			is_enumeration: a_node.name.is_equal(once U"Enumeration")
			name_not_void: an_enum_name /= Void
		local
			name, filename: STRING; path: POSIX_PATH_NAME
		do
			name := an_enum_name.to_utf8
			if is_public(name) then
				class_name := eiffel_class_name(name)
				if directory = Void then
					-- Output to standard output
					output := std_output
					log(once "Wrapping enumeration @(1) to class @(2) to standard output%N",
					<<name, class_name>>)
				else
					create path.make_from_string(directory)
					path.add_last(eiffel_class_file_name(name))
					filename := path.to_string
					log(once "Wrapping enumeration @(1) to class @(2) in file @(3)%N",
					<<name, class_name, filename>>)
					create {TEXT_FILE_WRITE} output.connect_to(filename)
				end
				-- setters.reset queries.reset low_level_values.reset
				emit_enumeration_header(class_name)
				if a_node.children_count>0 then
					if flags.has(name) then 
						log(once "Forcefully wrapping @(1) as flag.%N",<<name>>)
						append_flag_items(a_node)
					elseif have_flags_values(a_node) then 
						log(once "Wrapping @(1) as flag.%N",<<name>>)
						append_flag_items(a_node)
					else append_enumeration_items(a_node)
					end
				end
				emit_enumeration_items
				output.flush
				output.disconnect
			else
				log("Skipping 'hidden' enumeration @(1)%N",
				<<name>>)
			end
		end

	emit_enumeration_header (an_enum_name: STRING) is
			-- Put the header of an enumeration class with `an_enum_name'
			-- on `output'
		require
			name_not_void: an_enum_name /= Void
			is_valid_class_name: is_valid_class_name(an_enum_name)
		do
			buffer.reset_with(automatically_generated_header)
			buffer.append(expanded_class)
			buffer.append(an_enum_name)
			buffer.append_new_line
			emit_description(class_descriptions.reference_at(an_enum_name))
			buffer.append(once "%Ninsert ENUM%N%Ncreation default_create%N")
			buffer.print_on(output)
		end

	prefix_length: INTEGER 
		-- The length of the longest common prefix of the enumeration - either plain or flag-like - currently being wrapped.
		
	emit_enumeration_items is
			-- Append to `output' validity queries, setters, getters and
			-- low level values of current enumeration.
		do
			output.put_line(once "feature -- Validity")
			validity_query.print_on(output)
			output.put_line(once "feature -- Setters")
			setters.print_on(output)
			output.put_line(once "feature -- Queries")
			queries.print_on(output)
			output.put_line(once "feature {WRAPPER, WRAPPER_HANDLER} -- Low level values")
			low_level_values.print_on(output)
			output.put_line(once "end%N")
		end

	append_enumeration_value_low_level (an_eiffel_value, a_low_level_value, a_file_name: STRING) is
			-- Append in `low_level_values' a declaration labelled
			-- `an_eiffel_value' to access `a_low_level_value' found in `a_file_name'
		require
			an_eiffel_value_not_void: an_eiffel_value /= Void
			a_low_level_value_not_void: a_low_level_value /= Void
			a_file_name_not_void: a_file_name /= Void
			low_level_values_not_void: low_level_values /= Void
		deferred
		end

	have_flags_values (an_enumeration: XML_COMPOSITE_NODE): BOOLEAN is
			-- Can the values of `an_enumeration' be used as flags? They can be
			-- used as flags when they are different powers of 2, i.e.  setting
			-- each a different bit, and there is no zero value.
		require
			node_not_void: an_enumeration /= Void
			is_enumeration: an_enumeration.name.is_equal(once U"Enumeration")
			has_children: an_enumeration.children_count>0
		local
			i: COUNT; flags_so_far, value: INTEGER; child: XML_COMPOSITE_NODE
		do
			from i.set(1) Result := True
			variant an_enumeration.children_count - i.value
			until Result = False or else i > an_enumeration.children_count
			loop
				child ?= an_enumeration.child(i.value)
				if child /= Void then
					if (once U"EnumValue").is_equal(child.name) then
						value := child.attribute_at(once U"init").as_utf8.to_integer
						if value > 0 and then value.is_a_power_of_2 and flags_so_far & value = 0 then
							-- value is valid and indipendent from values so far.
							flags_so_far := flags_so_far | value
						else Result := False
						end
					else log(once "Unhandled child in Enumeration at line @(1)%N", <<child.line.out>>)
					end
				else log(once "CLASS_MAKER.have_flags_values: non-composite child in Enumeration!", Void)
				end
				i.increment
			end
		end

	append_enumeration_items (a_node: XML_COMPOSITE_NODE) is
			-- For each child of `a_node':
			-- * consider it into the `is_valid' query,
			-- * append a query into `getters',
			-- * append a setting command into `setters',
			-- * append a low-level external value to `low_level_values'.
		require
			node_not_void: a_node /= Void
			enumeration_node: a_node.name.is_equal(once U"Enumeration")
			has_children: a_node.children_count>0
			is_plain_enumeration: not have_flags_values(a_node)
		local
			i: INTEGER; filename: STRING; a_child: XML_COMPOSITE_NODE
			is_first,is_last: BOOLEAN
		do
			-- Note: no need to handle the degenerate case of an enumeration
			-- without values, since there is the precondition has_children:
			-- a_node.children_count>0
			if a_node.children_count > 1 then
				prefix_length := longest_prefix_of_children_of(a_node)
			end
			filename := file_containing(a_node)
			initialize_validity_query
			from i := 1
			until i > a_node.children_count
			loop
				a_child ?= a_node.child(i) 
				if a_child /= Void then
					is_first := (i = 1)
					is_last := (i = a_node.children_count)
					append_enumeration_item(a_child, filename, is_first , is_last)
				end
				i := i + 1
			end
			finalize_validity_query
		end

	append_enumeration_item (a_node: XML_COMPOSITE_NODE; a_filename: STRING; is_first, is_last: BOOLEAN) is
		require
			node_not_void: a_node /= Void
			node_is_an_enum_value: a_node.name.is_equal(once U"EnumValue")
		local
			c_value, eiffel_value, label: STRING
		do
			c_value := a_node.attribute_at(once U"name").to_utf8
			eiffel_value := c_value.as_lower
			create label.copy(eiffel_value)
			label.remove_head(prefix_length)
			label := adapt(label)
			append_enumeration_validity_value(eiffel_value, is_first, is_last)
			append_enumeration_value_setter(label, eiffel_value, is_first)
			append_enumeration_value_query(label, eiffel_value)
			append_enumeration_value_low_level(eiffel_value, c_value, a_filename)
		end

	initialize_validity_query is
		do
			validity_query.reset_with
			(once "	is_valid_value (a_value: INTEGER): BOOLEAN is%N%
			%		do%N%
			%			Result := (")
		end

	append_enumeration_validity_value (a_value: STRING; is_first, is_last: BOOLEAN) is
		require
			value_not_void: a_value /= Void
		do
			if is_first then validity_query.append(once "(a_value = ")
			else validity_query.append(once "%T%T%T%T(a_value = ")
			end
			validity_query.append(a_value)
			if is_last then validity_query.append(once ")")
			else validity_query.append(once ") or else %N")
			end
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	finalize_validity_query is
		do
			validity_query.append(once ")%N%T%Tend%N%N")
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	append_enumeration_value_setter (a_name, a_value: STRING; is_first: BOOLEAN) is
			-- Append to `setters'
		require
			name_not_void: a_name /= Void
			value_not_void: a_value /= Void
			setters_not_void: setters /= Void
		local creation_tense, setter_name: STRING
		do
			if is_first then creation_tense:=once "%Tdefault_create, "
			else creation_tense := once "%T"
			end
			setter_name := "set_"+a_name
			setters.put_message
			(once "@(1) @(2) is%N%
			%	@(3)%N%
			%		do%N%
			%			value := @(4)%N%
			%		end%N%N", 
			<<creation_tense, setter_name, 
			formatted_description(feature_description(class_name,setter_name))
			a_value >>)
		end

	append_enumeration_value_query (a_name, a_value: STRING) is
			-- Append in `queries' the text of a query for an
			-- enumeration value with `a_name' with a low level value
			-- `a_value'.
		require
			queries_not_void: queries /= Void
			name_not_void: a_name /= Void
			value_not_void: a_value /= Void
		local getter_name: STRING
		do
			getter_name:="is_"+a_name
			queries.put_message
			(once "	@(1): BOOLEAN is%N%
			%		@(2)%N%
			%		do%N%
			%			Result := (value=@(3))%N%
			%		end%N%N",
			<<getter_name, 
			formatted_description(feature_description(class_name,getter_name)),
			a_value>>)
		end

feature {ANY} -- Flag enumeration
	read_flags_from (a_file_name: STRING) is
		-- Read the list of enumeration that shall be wrapped as flags from the file named `a_file_name'.
	require
		a_file_name/=Void
		file_exists(a_file_name)
		is_file(a_file_name) 
	local words: ARRAY[STRING]; line: STRING; file: TEXT_FILE_READ
	do
		create file.connect_to(a_file_name)
		if file.is_connected then
			debug log_string(once "TODO: remove work-around for Flags:") end
			from file.read_line
			until file.end_of_input
			loop
				line := file.last_string
				if line/=Void then 
					words := line.split
					if words/=Void then
						words.do_all(agent flags.add)
					end
				end
				file.read_line
			end
			debug log_string(once ".%N") end
		else debug log(once "Coulnd't read file '@(1)' for the list of flags.%N",<<a_file_name>>) end
		end
	end

	append_flag_items (a_node: XML_COMPOSITE_NODE) is
			-- For each child of `a_node':
			-- * consider it into the `is_valid' query,
			-- * append a query into `getters',
			-- * append a setting command into `setters',
			-- * append a low-level external value to `low_level_values'.
		require
			node_not_void: a_node /= Void
			enumeration_node: a_node.name.is_equal(once U"Enumeration")
			has_children: a_node.children_count>0
			-- Some enumeration are forcefully wrapped as flags, so
			-- is_flag_enumeration: have_flags_values(a_node) does not hold
			-- anymore. have_flags_values is not able to soundly distinguish
			-- between an enumeration and a flag
		local
			i: INTEGER; filename: STRING; a_child: XML_COMPOSITE_NODE
			is_first, is_last: BOOLEAN
		do
			if a_node.children_count = 0 then
				debug
					log(once "-- Degenerate case: a flag enumeration @(1) without values.",
					<<a_node.attribute_at(once U"name").as_utf8>>)
				end
			else
				if a_node.children_count > 1 then
					prefix_length := longest_prefix_of_children_of(a_node)
				end
				-- Obtain the path of the file where the enumeration is
				-- declared. 
				filename := files_by_id.at(a_node.attribute_at(once U"file")).attribute_at(once U"name").to_utf8
				initialize_flag_validity_query
				from i := 1
				until i > a_node.children_count
				loop
					a_child ?= a_node.child(i)
					if a_child /= Void then
						is_first := i=1
						is_last := i=a_node.children_count
						append_flag_item (a_child, filename, is_first,is_last)
					-- else raise("A flag item is not a XML_COMPOSITE_CHILD")
					end
					i := i + 1
				end
				finalize_flag_validity_query
			end
		end

	append_flag_item (a_node: XML_COMPOSITE_NODE; a_filename: STRING; is_first, is_last: BOOLEAN) is
		require
			node_not_void: a_node /= Void
			node_is_enuma_value: a_node.name.is_equal(once U"EnumValue")
		local
			c_value, eiffel_value, label: STRING
		do
			c_value := a_node.attribute_at(once U"name").to_utf8
			eiffel_value := c_value.as_lower
			create label.copy(eiffel_value)
			label.remove_head(prefix_length)
			label := adapt(label)
			append_flag_validity_value(eiffel_value, is_first, is_last)
			append_flag_value_setter(label, eiffel_value, is_first)
			append_flag_value_query(label, eiffel_value)
			append_enumeration_value_low_level(eiffel_value, c_value, a_filename)
		end

	initialize_flag_validity_query is
		do
			validity_query.reset_with
			(once "%Tis_valid_value (some_flags: INTEGER): BOOLEAN is%N%
					%%T%Tdo%N%
					%%T%T%TResult := (some_flags & (")
		end

	append_flag_validity_value (a_value: STRING; is_first, is_last: BOOLEAN) is
		require
			value_not_void: a_value /= Void
		do
			if not is_first then
				validity_query.append(once "%T%T%T%T")
			end
			validity_query.append(a_value)
			if not is_last then
				validity_query.append(once " | %N")
			end
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	finalize_flag_validity_query is
		do
			validity_query.append(once ")).to_boolean%N%T%Tend%N%N")
		ensure
			validity_query_grew: validity_query.count > old validity_query.count
		end

	append_flag_value_setter (a_name, a_value: STRING; is_first: BOOLEAN) is
		require
			name_not_void: a_name /= Void
			value_not_void: a_value /= Void
			setters_not_void: setters /= Void
		local setter_name, unsetter_name: STRING
		do
			setter_name:="set_"+a_name
			unsetter_name:="unset_"+a_name
			if is_first then
				setters.append(once "%Tdefault_create is%N%T%T-- Default creation feature; it leaves all the bits cleared.%N%Tdo%N%Tend%N%N")
			end
			setters.put_message (once 
			"	@(1) is%N%
			%		@(2)%N%
			%	do%N%
			%		value := value.bit_or(@(3))%N%
			%	end%N%
			%%N%
			%	@(4) is%N%
			%		@(5)%N%
			%	do%N%
			%		value := value.bit_xor(@(3))%N%
			%	end%N%
			%%N", 
			<<setter_name, 
			formatted_description(feature_description(class_name,setter_name)),
			a_value,
			unsetter_name,
			formatted_description(feature_description(class_name,unsetter_name))>>)
		end

	append_flag_value_query (a_name, a_value: STRING) is
			-- Append in `queries' the text of a query for an
			-- enumeration value with `a_name' with a low level value
			-- `a_value'.
		require
			queries_not_void: queries /= Void
			name_not_void: a_name /= Void
			value_not_void: a_value /= Void
		local query_name: STRING
		do
			query_name:="is_"+a_name
			queries.put_message
			(once 
			"	@(1): BOOLEAN is%N%
			%		@(2)%N%
			%	do%N%
			%		Result := (value & @(3)).to_boolean%N%
			%	end%N%N", 
			<<query_name,
			formatted_description(feature_description(class_name,query_name)),
			a_value>>)
		end

feature {ANY} -- Auxiliary features
	file_containing (a_node: XML_COMPOSITE_NODE): STRING is
		-- The path of the file where the C entity described by `a_node' is declared.
	require a_node/=Void
	do
		Result := files_by_id.at(a_node.attribute_at(once U"file")).attribute_at(once U"name").to_utf8
	ensure Result/=Void
	end

	is_to_be_emitted (a_file_name: STRING): BOOLEAN is
		-- Shall the declaration in file named `a_file_name' be
		-- wrapped? The content of a file will be emitted when global
		-- is True or if `a_file_name' is in `headers' hashed set.
	require
		is_initialized
	do
		Result := (global or else 
					(a_file_name/=Void and then headers.has(a_file_name)))
	end

	apply_patches (a_file_name: STRING) is
		-- Apply to `a_file_name' the differences found in the file with name `a_file_name' replacing ".e" suffix with ".diff"
	local diff_file_name: STRING; system: SYSTEM
	do
		if a_file_name.has_suffix(once ".e") and then file_exists(a_file_name) then
			create diff_file_name.copy(a_file_name)
			diff_file_name.remove_suffix(once ".e")
			diff_file_name.append_string(once ".diff")
			if file_exists(diff_file_name) then
				log(once "Applying patches from @(1) to @(2)%N",<<diff_file_name,a_file_name>>)
				system.execute_command_line("patch "+a_file_name+" "+diff_file_name)
			end	
		end
	end

	formatted_description (a_description: COLLECTION[STRING]): STRING is
		-- A newly created string containing 'a_description' formatted as an
		-- Eiffel comment with lines shorter that 'description_lenght'
		-- characters. If `a_description' is Void Result is the empty string
	local word: STRING; iter: ITERATOR[STRING]; length,new_length: INTEGER
	do
		if a_description=Void then Result:=""
		else
			create Result.with_capacity(a_description.count * 8)
			-- We assume that the average word is 6 charcter long, plus a
			-- whitespace between each one. Actually words are usually shorter
			-- but we shall take in count the space taken by "--" 
			from
				Result.append(once "%T--"); 
				iter:=a_description.new_iterator; iter.start; 
				length:=0
			until iter.is_off loop
				word := iter.item
				new_length := length + word.count
				if new_length>description_lenght then
					Result.append(comment)
					length := 0
				else
					Result.append_character(' ')
					length := new_length + 1
				end
				Result.append(word)
				iter.next
			end
		end
	ensure 
		Result/=Void
		a_description=Void implies Result.is_empty
	end

	
feature {ANY} -- Data structures
	input: INPUT_STREAM

	output: TERMINAL_OUTPUT_STREAM

	class_name: STRING
	-- The name of the class currently being emitted/outputted.

	tree: XML_TREE

	headers: HASHED_SET[STRING]

	flags: HASHED_SET[STRING]
	-- The enumerations that will be forcefully wrapped as a flag.

	files_by_id: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
	-- Files by id

	files, structures, enumerations: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
	-- Files, structures, enumeration by their name

	functions: HASHED_DICTIONARY[LINKED_LIST[XML_COMPOSITE_NODE], UNICODE_STRING]
	-- Functions grouped by the id of the file they are defined
	-- in, i.e. "f0" "f12".

	fields: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
	-- Fields by their id

	class_descriptions: HASHED_DICTIONARY[COLLECTION[STRING],STRING]
	-- Class description comments. Key is classname.

	feature_descriptions: HASHED_DICTIONARY[HASHED_DICTIONARY[COLLECTION[STRING],STRING],STRING]
	-- Feature descriptions dictionary. The outer dictionary is indexed by
	-- classname, the inner one by feature name. So to get the description of
	-- feature foo in class BAR you shall invoke
	-- feature_descriptions.at("BAR").at("foo")

feature {} -- Implementation
	buffer: FORMATTER
	-- Buffer to render the text of the feature currently being
	-- wrapped (a function call, a structure or an enumeration).

	queries: FORMATTER

	setters: FORMATTER

	low_level_values: FORMATTER

	validity_query: FORMATTER
			-- Temporary strings used to build enumerations and structures external classes

feature {} -- Constants
	comment: STRING is "%N%T%T-- "

	variadic_function_note: STRING is "%T%T%T-- Variadic call%N"

	unwrappable_function_note: STRING is "%T%T%T-- Unwrappable function%N%T%Tobsolete %"Unwrappable C function%"%N"

	expanded_class: STRING is "expanded class "

	deferred_class: STRING is "deferred class "

	-- struct: STRING is "_STRUCT"

	-- enum: STRING is "_ENUM"

	struct_inherits: STRING is "%N%Ninherit ANY undefine is_equal, copy end%N%N"

	queries_header: STRING is "feature {} -- Low-level queries%N%N"

	setters_header: STRING is "feature {} -- Low-level setters%N%N"

	externals_header: STRING is "feature {} -- External calls%N%N"

	footer: STRING is "end%N"

	automatically_generated_header: STRING is "[
		-- This file have been created by eiffel-gcc-xml.
		-- Any change will be lost by the next execution of the tool.


		]"

	automatically_patched_header: STRING is 
		-- Label 
		"[
		-- This file have been automatically created combining the output file
		-- of eiffel-gcc-xml @(1)
		-- with the differences patches found into @(2)

		-- Any change will be lost by the next execution of the tool.

		]"

	description_lenght: INTEGER is 70

feature {} -- Auxiliary features
	formatter: FORMATTER is
			-- Shared formatter used to format various strings.
		once
			create Result
		end

end -- class CLASS_MAKER
