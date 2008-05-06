class EXTERNALS_CLASS_MAKER

inherit CLASS_MAKER redefine is_initialized end

insert EXCEPTIONS

creation with_header, without_header

feature -- Creation and initialization
	with_header (an_header: STRING) is
		require header_not_void: an_header/=Void
		do
			header:=an_header
			initialize
		end

	without_header is do initialize end

	is_initialized: BOOLEAN is
		do
			Result := Precursor and then (headers /= Void )
		end

feature 
	header: STRING
			-- The C header that shall be included to use the wrapped
			-- features.
	
feature -- Functions emittion 

	variadic: BOOLEAN 
			-- Is the function currently being emitted variadic?

	emit_function (a_file_name: STRING; a_node: XML_NODE) is
		local 
			name: STRING; unwrappable: BOOLEAN
		do 
			if unwrappable then
				if verbose then log.put_message(once "Function @(1) is not wrappable: ", <<name>>) end
				buffer.clear_count
				if is_developer_exception 
				 then printer.put_message(once "%T-- Function @(1) is wrappable: @(2)", <<name, developer_exception_name>>)
				else printer.put_message(once "%T-- Function @(1) not wrappable: exception code @(2)", <<name, exception.out>>)
				end
				output.put_line(buffer)
				output.flush
			else 
				name := a_node.attribute_at(once "name").as_lower
				if is_public(name) then 
					buffer.clear_count
					buffer.append_character('%T')
					buffer.append_string(name)
					if a_node.children_count>0 then append_function_arguments(a_node) end
					append_return_type(a_node)
					append_function_body(a_node)
					output.put_line(buffer)
					output.flush
				else 
					if verbose then log.put_message(once "Skipping 'hidden' function @(1)",<<name>>) end
				end -- if is_public(name)
			end -- if unwrappable
		rescue
			unwrappable:=True
			retry
		end

	append_function_arguments (a_node: XML_NODE) is
			-- Append the arguments of function referred by `a_node' into
			-- `buffer'. If an Ellipsis ("...") is found `variadic' flag
			-- is set to True
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
			has_arguments: a_node.children_count>0
		local		
			argument_placeholder, argument_type: STRING
			an_argument: XML_NODE; i: INTEGER
		do
			variadic := False
			buffer.append(once " (")
			from i:=1 until i>a_node.children_count loop
				an_argument :=a_node.child(i)
				argument_placeholder := an_argument.attribute_at(once "name")
				if argument_placeholder /= Void and then 
					an_argument.name.is_equal(once "Argument") then 
					buffer.append(once "a_")
					buffer.append(argument_placeholder)
					buffer.append(once ": ")
					argument_type := translate.eiffel_type_of(an_argument)
					-- if argument_type=Void then buffer.append(once
					-- "unhandled type!"); else
					buffer.append(argument_type)
					if i<a_node.children_count then buffer.append(once "; ") end
				elseif an_argument.name.is_equal(once "Ellipsis") then variadic := True
				else buffer.append(once "Unknown XML child in function")
				end
				i:=i+1
			end
			buffer.append(once ")")
		end

	append_return_type (a_node: XML_NODE) is
			-- Append the Eiffel equivalent type of the return type of
			-- `a_node' to `buffer', i.e. ": INTEGER_32" or ":
			-- POINTER". Do nothing when result of `a_node' is "void".
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
		local returns: STRING
		do
			returns := a_node.attribute_at(once "returns")
			if returns = translate.void_type then -- Nothing
			else buffer.append(once ": "); buffer.append(translate.eiffel_type_of_string(returns))
			end
		end

	append_function_body(a_node: XML_NODE) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
		do
			buffer.append(once " is%N")
			if variadic then buffer.append(variadic_function_note) end
			buffer.append(once "%T%Texternal %"C use <")
			buffer.append(header)
			buffer.append(">%"%N%T%Tend%N")
		end

feature -- Structure emission
	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		local 
			classname, filename: STRING; 
			file_path: POSIX_PATH_NAME;
			unwrappable: BOOLEAN
		do 
			if unwrappable then
				buffer.clear_count
				printer.put_message(once "%T-- @(1) is not wrappable", <<structure_name>>)	
				-- printer.append_in(buffer)
				output.put_line(buffer)
				output.flush
			else
				if is_public(structure_name) then
					classname := eiffel_class_name(structure_name+once "_struct")
					if directory=Void then -- Output to standard output
						output := std_output
						if verbose 
						 then log.put_message(once "Wrapping structure @(1) to class @(2) to standard output%N",
													 <<structure_name,classname>>)
						end
					else  
						create file_path.make_from_string(directory)
						file_path.add_last(eiffel_class_file_name(structure_name+once "_struct"))
						filename := file_path.to_string
						if verbose 
						 then log.put_message(once "Wrapping structure @(1) to class @(2) in file @(3)%N",
													 <<structure_name,classname,filename>>)
						end
						create {TEXT_FILE_WRITE} output.connect_to(filename)	
					end
					append_structure_header(structure_name)
					append_structure_members (a_node,structure_name)
					buffer.append(once "end%N")
					output.put_string(buffer)
				else 
					if verbose then log.put_message(once "Skipping 'hidden' structure @(1)",<<structure_name>>) end
				end -- name is public
			end -- if unwrappable 
		rescue 
			if not unwrappable then
				unwrappable:=True
				retry
			end
		end

	append_structure_header (a_structure_name: STRING) is
			-- Append the header of a structure named `a_structure_name' to buffer.
		require 
			a_structure_name/=Void
		do
			buffer.append(automatically_generated_header)
			buffer.append(deferred_class)
			buffer.append(eiffel_class_name(a_structure_name))
			buffer.append(struct) 
			buffer.append(struct_inherits)
		ensure buffer_grew: buffer.count > old buffer.count
		end

	append_structure_members (a_node: XML_NODE; structure_name: STRING) is
		require 
			node_not_void: a_node/=Void
			name_not_void: structure_name/=Void
		local	
			members: STRING 
			members_iter: ITERATOR[STRING]
			id, fieldname: STRING; 
			field: XML_NODE; 		
		do
			members := a_node.attribute_at(once "members")
			if members/=Void then
				from 
					setters.copy(setters_header); setters_stream.clear
					queries.copy(queries_header); queries_stream.clear
					members_iter := members.split.get_new_iterator
					members_iter.start
				until members_iter.is_off loop
					id := members_iter.item
					field := fields.reference_at(id)
					if field/=Void then
						fieldname := field.attribute_at(once "name")
						if verbose then 
							log.put_message(once "Appending query for @(1)",<<field.attribute_at(once "name")>>) 
						end
						queries_printer.put_message
						(once "%Tget_@(1) (a_structure: POINTER): @(2) is%N%
									%%T%Texternal %"C struct @(3) get @(4) use <@(5)>%"%N%T%Tend%N%N",
						 <<fieldname, translate.eiffel_type_of(field), structure_name, fieldname, header>>)
						if verbose then
							log.put_message(once "Appending setter for @(1)",<<field.attribute_at(once "name")>>)
						end
						setters_printer.put_message
						(once "%Tlow_level_set_@(1) (a_structure: POINTER; a_value: @(2)) is%N%
									%%T%Texternal %"C struct @(3) set @(4) use <@(5)>%"%N%
									%%T%Tend%N%N",
									<<fieldname, translate.eiffel_type_of(field),
									  structure_name, fieldname,	header>>)
					else -- Void field
						if verbose then
							log.put_message(once "No field with id @(1) probably a Constructor.", <<id>>) 
						end
					end -- field is void?
					members_iter.next
				end -- loop over members
				setters_stream.append_in(setters)
				queries_stream.append_in(queries)
				buffer.append(setters)
				buffer.append(queries)
			else -- void members
				if verbose then log.put_message(once "Structure @(1) have no fields", <<structure_name>>)
				end
			end
		ensure buffer_grew: buffer.count > old buffer.count
		end
			
feature -- Enumeration emitter
	
	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		local 
			i, prefix_length: INTEGER; a_child: XML_NODE; 
			label, eiffel_value, c_value, filename: STRING
			creation_flag: BOOLEAN
		do 
			if is_public(a_name) then
				-- Set the file TODO: put an actual file.
				output := std_output
				setters.clear_count
				queries.clear_count
				low_level_values.clear_count
				emit_enumeration_header(a_name)
				if a_node.children_count=0 then
					debug std_error.put_string(once "-- Degenerate case: an enumeration without values%N") end
				else				
					if a_node.children_count>1 then prefix_length:=longest_prefix_of_children_of(a_node) end
					-- Obtain the path of the file where the enumeration is
					-- declared. TODO: make it cleaner, currently it is a
					-- mess.
					filename := files_by_id.at(a_node.attribute_at(once "file")).attribute_at(once "name")
					from creation_flag:=True; i:=1 until i>a_node.children_count loop
						a_child := a_node.child(i)
						check a_child.name.is_equal(once "EnumValue") end
						c_value := a_child.attribute_at(once "name")
						eiffel_value := c_value.as_lower						
						create label.copy(eiffel_value)
						label.remove_head(prefix_length)
						append_enumeration_value_setter(label,eiffel_value,creation_flag)
						append_enumeration_value_query(label,eiffel_value)
						append_enumeration_value_low_level(eiffel_value,c_value,filename)
						creation_flag:=False -- All the following setters won't be creation
						i:=i+1
					end -- loop over children
					output.put_line(once "feature -- Setters")	
					output.put_line(setters)
					output.put_line(once "feature -- Queries")
					output.put_line(queries)
					output.put_line(once "feature {WRAPPER, WRAPPER_HANDLER} -- Low level values")
					output.put_line(low_level_values)
				end -- if a_node.children_count=0
			else -- not public
				if verbose then
					std_error.put_line("Skipping 'hidden' enumeration "+a_name)
				end
			end -- is_public(name)
		end

	emit_enumeration_header (a_name: STRING) is 
			-- Put the header of an enumeration class with `a_name' on `output'
		require name_not_void: a_name/=Void
		do
			output.put_string(automatically_generated_header)
			output.put_string(deferred_class) 
			output.put_line(eiffel_class_name(a_name))
			output.put_string(once "insert ENUM%N%N")
			output.put_string(once "creation default_create%N")
		end

	append_enumeration_value_setter (a_name, a_value: STRING; is_creation: BOOLEAN) is
			-- Append to `setters'
		require 
			name_not_void: a_name/=Void
			value_not_void: a_value/=Void
			setters_not_void: setters/=Void
		do
			if is_creation 
			then setters.append(once "%Tdefault_create, ")
			else setters.append(once "%T")
			end
			setters.append(once "set_")
			setters.append(a_name)
			setters.append(once " is%N%T%Tdo%N%T%T%Tvalue := ")
			setters.append(a_value)
			setters.append(once "%N%T%Tend%N%N")
		end

	append_enumeration_value_query (a_name, a_value: STRING) is
			-- Append in `queries' the text of a query for an
			-- enumeration value with `a_name' with a low level value
			-- `a_value'.
		require 
			queries_not_void: queries/=Void
			name_not_void: a_name/=Void
			value_not_void: a_value/=Void
		do
			queries.append(once "%Tis_") queries.append(a_name)
			queries.append(once ": BOOLEAN is%N%T%Tdo%N%T%T%TResult := (value=")
			queries.append(a_value)
			queries.append(once ")%N%T%Tend%N%N")
		end
	
	append_enumeration_value_low_level (an_eiffel_value, a_c_value, a_file_name: STRING) is
			-- Append in `low_level_values' a declaration labelled
			-- `an_eiffel_value' to access `a_c_value' found in `a_file_name'
		require 
			an_eiffel_value_not_void: an_eiffel_value/=Void
			a_c_value_not_void: a_c_value/=Void
			a_file_name_not_void: a_file_name/=Void
			low_level_values_not_void: low_level_values/=Void
		do
			low_level_values.append_character('%T')
			low_level_values.append(an_eiffel_value)
			low_level_values.append(once ": INTEGER is%N%T%Texternal %"C macro use <")
			if header/=Void then low_level_values.append(header)
			else low_level_values.append(a_file_name)
			end
			low_level_values.append(once ">%"%N%T%Talias %"")
			low_level_values.append(a_c_value)
			low_level_values.append(once "%"%N%T%Tend%N%N")
		end

end
