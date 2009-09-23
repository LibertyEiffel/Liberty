deferred class CLASS_MAKER
	-- Outputs wrapper classes for functions, structures and enumerations.
	-- Implementation notes

	-- Note:
	-- "XML is born together with Unicode"; trying to use plain ASCII strings
	-- is a vain effort; Eiffel source-code is expected to be an ASCII text.
	-- It can actually be an UTF8 encoded text where all non-ASCII characters
	-- are enclosed into comments or in string bodies; told in another way all
	-- the features shall be plain ASCII and not UTF-8. Given these premises
	-- all the processing is made using UNICODE_STRINGs; conversion to UTF8 is
	-- the last step before emission of generated source code.

	-- Stylistical note: multi-line strings are formatted like:
	
	-- "foo is %N%
	-- %	do .....%N%
	-- % end"

	-- using '%' to break lines. As we are generating Eiffel code using the "[
	-- ]" syntax will confuse code-formatter of some editor. Real tabs are used
	-- instead of "%T" becuase otherwise the code formatted with the latter is
	-- difficult to read.

insert
	TYPE_TRANSLATOR
	SHARED_SETTINGS
	DESCRIPTIONS
	NAME_CONVERTER
	WRAPPER_GENERATOR_EXCEPTIONS	
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
			create unions.make
			create enumerations.make
			create fields.make
			create types.make
			create typedefs.make
			-- Initialize output formatters for functions, structures and enumerations.
			create queries
			create setters
			create low_level_values
			create validity_query
			create typedef_queries
			-- create class_descriptions.make
			-- create feature_descriptions.make
			create flags.make
			create avoided.make
		end

	is_initialized: BOOLEAN is
		do
			Result := files /= Void and then functions /= Void and then structures /= Void and then enumerations /= Void and then fields /= Void and then headers /= Void and then types /= Void and then typedefs /= Void
		end

feature {ANY} -- Settings
	set_input (an_input: INPUT_STREAM) is
		do
			input := an_input
		end
	
	read_flags_from (a_file_name: STRING) is
		-- Read the list of enumeration that shall be wrapped as flags from the
		-- file named `a_file_name'.
	require
		a_file_name/=Void
		file_exists(a_file_name)
		is_file(a_file_name) 
	do
		create flags.make
		flags.add_from_file(a_file_name)
	end

	read_avoided_from (a_file_name: STRING) is
		-- Read from the file named `a_file_name' the list of symbols that will
		-- be avoided, i.e. not wrapped. 
	require
		a_file_name/=Void
		file_exists(a_file_name)
		is_file(a_file_name) 
	do
		avoided.add_from_file(a_file_name)
	end

	set_typedefs (a_class_name: STRING) is
		-- Set the class name that will contains all the aliases of fundamental
		-- types made using typedef.
	require
		name_not_void: a_class_name/=Void
		valid_name: is_valid_class_name(a_class_name)
	do
		create typedefs_class_name.copy(a_class_name)
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
			log(once "@(1) bytes allocated%NLoading XML file: ",<<allocated_bytes.out>>)
			create tree.make(input.url)
			-- visit(tree.root)
			log(once "done. @(1) bytes allocated%N",<<allocated_bytes.out>>)
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
			tree.files.do_all (agent {C_FILE}.emit_functions)
			log_string(once "Processing typedefs.%N")
			--setup_typedefs_file
			--typedefs.do_all(agent examine_typedef)
			--finalize_typedefs_file
			--log_string(once "Making structure accessing classes.%N")
			--structures.do_all(agent examine_structure)
			--log_string(once "Making union accessing classes.%N")

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
						
						-- debug log(once " structure @(1) in line @(2) ", <<c_name_utf8, a_node.line.out>>) end
						types.put(a_node, id)
						if is_public(c_name) then 
							structures.fast_put(a_node, c_name) 
						end
						-- else debug log(once " skipping nameless structure in
						-- line @(1) ", <<a_node.line.out>>) end
					end
				elseif name.is_equal(once U"Typedef") then
					debug log(once " typedef @(1) ",<<a_node.attribute_at(once U"name").as_utf8>>) end
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
					name.is_equal(once U"CvQualifiedType") or else
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
					-- Ignoring other nodes: Ellipsis (which stands for the feared
					-- variadic functions), Argument, EnumValue, GCC_XML,
					-- Namespace.

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
				-- else log(once "Skipping '@(1)'%N", <<header_name>>)
				end
			end

		emit_functions_class_headers is
			-- Put on `output' the header on an "external" class named 'class_name'
			-- from the beginning until the "feature {} -- External calls" label
			-- included
		do
			buffer.append(automatically_generated_header)
			buffer.append(deferred_class)
			buffer.append(class_name) -- line
			buffer.put('%N')
			emit_description(class_descriptions.reference_at(class_name))
			buffer.append(struct_inherits) --line
			buffer.put_message(once "insert @(1)%N",<<typedefs_class_name>>)
			buffer.append(externals_header) --line
		end

		emit_description (a_description: COLLECTION[STRING]) is
			-- Put 'a_description' on 'buffer' formatting it as an Eiffel comment
			-- with lines shorter that 'description_lenght' characters.  Nothing is
			-- done when `a_description' is Void.
		local word: STRING; iter: ITERATOR[STRING]; length,new_length: INTEGER
		do
			if a_description/=Void then
				from 
					iter:=a_description.get_new_iterator; iter.start; 
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
			if is_public_name(name) then
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
			-- else log(once "Skipping 'hidden' function @(1)%N", <<name>>)
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
				log(once "(@(1) args: ",<<a_node.children_count.out>>)
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

	feature {ANY} -- Typedefs 
		examine_typedef (a_typedef: XML_COMPOSITE_NODE) is
			-- Examine `a_typedef' emitting the proper wrapper depending on the
			-- actual symbol referred by `a_typedef'.  If the element referred by
			-- 'a_typedef' is a structure to be emitted `emit_structure' is invoked
			-- for the referred structure and it is removed from the 'structures'
			-- dictionary. In fact many structures that are meant to be used by the
			-- end-user of a library are often "hidden behind" a typedef: the
			-- typedef has a meaningful name while the actual name of the used
			-- structure seems private/non-exported (i.e. "typedef struct
			-- _GtkButton GtkButton"). 

			-- If `a_typedef' ultimately refers to a FundamentalType emit on
			-- `typedefs_file' a query named like the typedef itself of type of the
			-- fundamental referred type. i.e.  when invoked with the XML
			-- representation of "typedef unsigned long gulong;" it will produce
			-- "gulong: INTEGER_64 is do end" on a 64 bit machine and "gulong:
			-- INTEGER_32 is do end" on a 32 bit machine.
		
		require
			not_void: a_typedef/=Void 
			is_typedef_node: a_typedef.name.is_equal(once U"Typedef") 
		local 
			referred: XML_COMPOSITE_NODE; name: STRING	 
		do
			name := a_typedef.attribute_at(once U"name").to_utf8
			if is_public_name(name) and then is_to_be_emitted(file_containing(a_typedef)) then
				referred := referred_type(a_typedef)
				inspect referred.name.to_utf8 
				when "Struct" then 
					log(once "Wrapping typedef struct @(1)%N",<<name>>)
					emit_structure(referred,name)
					structures.fast_remove(referred.attribute_at(once U"name"))
				when "FundamentalType" then
					log(once "Wrapping typedef to fundamental type @(1)%N",<<name>>)
					emit_typedef(referred,name)
				else
				end
			else
				log("Skipping typedef @(1).%N", <<name>>)
				typedef_queries.put_message (once "%T-- @(1) not wrapped.%N", <<name>>)
			end -- is_public
		end

		typedefs_file: TERMINAL_OUTPUT_STREAM

		setup_typedefs_file is
			-- Start a class named as in `typedefs_class_name' in `typedefs_file'
			-- containing dummy queries used for anchored declarations.
			
			-- Each query is named like a C typedef and its Result type is the
			-- Eiffel equivalent of the fundamental type the typedef refers to.

			-- For example:

			-- gsize: INTEGER_64 is
			--    -- typedef unsigned long int gsize;
			-- do
			-- end

			-- Those queries shall never be invoked but rather used in other
			-- features as anchors like: do_stuff (a_size: like gsize)
		local path: POSIX_PATH_NAME; pathname: STRING
		do
			create path.make_from_string(directory)
			path.add_last(typedefs_class_name.as_lower+once ".e")
			pathname := path.to_string
			log(once "Outputting anchor queries (for typedefs) into @(1) on `@(2)'.%N",
			<<typedefs_class_name, pathname>>)
			create {TEXT_FILE_WRITE} typedefs_file.connect_to(pathname)
			typedef_queries.reset
			typedef_queries.append(automatically_generated_header)
			typedef_queries.append(deferred_class)
			typedef_queries.append(typedefs_class_name) 
			typedef_queries.append_new_line
			typedef_queries.append(struct_inherits) --line
			typedef_queries.append(typedefs_features_header)
		ensure 
			typedefs_file /= Void
			typedefs_file.is_connected
		end

		emit_typedef (a_typedef: XML_COMPOSITE_NODE; a_name: STRING) is
			-- Emit the `a_name' query on `typedefs_file' with the type of
			-- `a_typedef' as an anchored declaration , i.e.: "gchar: CHARACTER is
			-- do end" 
		require
			a_typedef /= Void
			a_typedef.name.is_equal(U"FundamentalType")
		local type, query_name: STRING
		do
			type := type_of(a_typedef,resolved_typedefs)
			inspect type
			when "void" then typedef_queries.put_message (once "%T-- @(1) typedef to void%N", <<a_name>>)
			when "" then typedef_queries.put_message (once "%T-- @(1) unwrappable: no wrapper type.%N", <<a_name>>)
			else
				query_name := eiffel_feature(a_name)
				log(once "@(1)->@(2), ",<<a_name,query_name>>)
				typedef_queries.put_message (once 
				"	@(1): @(2) is%N%
				%		-- typedef @(3)%N%
				%		-- Empty by design, used for anchored declarations.%N%
				%	do%N%
				%	ensure Result.is_default%N%
				%	end%N%
				%%N", <<query_name, type, a_name>>)
			end
		end

		finalize_typedefs_file is
			-- Append footer to `typedefs_file' ann close it
		do
			typedef_queries.append(footer)
			typedef_queries.print_on(typedefs_file)
			typedefs_file.disconnect
			log_string(once " done.%N")
		end

	feature {ANY} -- Low-level structure class creator
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
					buffer.put_message(once "%T-- @(1) is not wrappable",
					<<a_structure_name>>)
					buffer.print_on(output)
					output.flush
					output.disconnect
				else
					if is_public_name(a_structure_name) then
						filename := a_structure_name + once "_struct"
						class_name := eiffel_class_name(filename)
						if directory = Void then
							-- Output to standard output
							output := std_output
							log(once "Struct @(1) on @(2) to standard output%N",
							<<a_structure_name, class_name>>)
						else
							create path.make_from_string(directory)
							path.add_last(eiffel_class_file_name(filename))
							filename := path.to_string
							if path.is_file then
								log(once "Copying existing file @(1) onto @(1).orig.%N",<<filename>>)
								copy_to(filename, filename+once ".orig")
							end
		
							log(once "Struct @(1) to @(2) in @(3)%N",
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
				buffer.put_message(once "insert @(1)%N",<<typedefs_class_name>>)
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
					members_iter := members.split.get_new_iterator
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
	feature {ANY} -- Union class creator
		examine_union (a_union: XML_COMPOSITE_NODE) is
			-- Decide if `a_union' has to be emitted. is declared into a file given by 
			require
				union_not_void: a_union/=Void
				is_union_node: a_union.name.is_equal(once U"Union")
			local
				name, file_name: STRING file_id: UNICODE_STRING
			do
				name := a_union.attribute_at(once U"name").to_utf8
				file_id := a_union.attribute_at(once U"file")
				file_name := files_by_id.reference_at(file_id).attribute_at(once U"name").to_utf8
				if is_to_be_emitted(file_name) then
					emit_union(a_union, name)
				else
					log(once "Structure @(1) skipped: not declared in a given header.%N",
					<<name>>)
				end
			end

		emit_union (a_union: XML_COMPOSITE_NODE; a_name: STRING) is
			--
		do
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
				if is_public_name(name) then
					class_name := eiffel_class_name(name)
					if directory = Void then
						-- Output to standard output
						output := std_output
						log(once "Wrapping enum @(1) as @(2) to standard output ",
						<<name, class_name>>)
					else
						create path.make_from_string(directory)
						path.add_last(eiffel_class_file_name(name))
						filename := path.to_string
						log(once "Wrapping enum @(1) as @(2) on @(3)",
						<<name, class_name, filename>>)
						create {TEXT_FILE_WRITE} output.connect_to(filename)
					end
					emit_enumeration_header(class_name)
					if a_node.children_count>0 then
						if flags.has(name) then 
							log_string(once ", forcefully wrapped as flag.%N")
							append_flag_items(a_node)
						elseif have_flags_values(a_node) then 
							log_string(once ", as flag.%N")
							append_flag_items(a_node)
						else 
							log_string(once ", as an enumeration.%N")
							append_enumeration_items(a_node)
						end
					else log(once "... fieldless.%N",<<name>>)
					end
					emit_enumeration_items
					output.flush
					output.disconnect
				-- else log("Skipping 'hidden' enumeration @(1)%N", <<name>>)
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
				log(once "enum item @(1) wrapped as @(2)",<<c_value,label>>)
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
		local file: XML_COMPOSITE_NODE
		do
			file := files_by_id.reference_at(a_node.attribute_at(once U"file"))
			if file/=Void then
				Result := file.attribute_at(once U"name").to_utf8
			end
		ensure Result/=Void
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
					iter:=a_description.get_new_iterator; iter.start; 
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

		typedefs_class_name: STRING
		-- The name of the class containing empty queries named like typedefs,
		-- useful for anchored declarations (i.e. "gsize: INTEGER_32 is do end")

		tree: GCCXML_TREE

	flags: WORDS -- HASHED_SET[STRING]
	-- Enumerations that will be forcefully wrapped as a flag.

	avoided: WORDS
	-- Symbols that will not be wrapped.

	files_by_id: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
	-- Files by id

	files, structures, enumerations, unions: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
	-- Files, structures, enumeration by their name

	functions: HASHED_DICTIONARY[LINKED_LIST[XML_COMPOSITE_NODE], UNICODE_STRING]
	-- Functions grouped by the id of the file they are defined
	-- in, i.e. "f0" "f12".

	fields: HASHED_DICTIONARY[XML_COMPOSITE_NODE, UNICODE_STRING]
	-- Fields by their id


feature {} -- Implementation
		queries: FORMATTER

	setters: FORMATTER

	low_level_values: FORMATTER

	validity_query: FORMATTER
			-- Temporary strings used to build enumerations and structures external classes

	typedef_queries: FORMATTER
end -- class CLASS_MAKER

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

