class EXTERNALS_CLASS_MAKER

inherit 
	CLASS_MAKER
		redefine 
			initialize,
			is_initialized
		end

insert
	EXCEPTIONS

creation with_header, without_header

feature 
	with_header (an_header: STRING) is
		require header_not_void: an_header/=Void
		do
			header:=an_header
			initialize
		end

	without_header is do initialize end

feature 
	initialize is
		do
			create headers.make
			create function.with_capacity(2048)
			Precursor
		end

	is_initialized: BOOLEAN is
		do
			Result := Precursor and then (headers /= Void )
		end

feature 
	function: STRING 
			-- Buffer to render the text of an external function call
	
	unwrappable: BOOLEAN
			-- Is the function currently being emitted unwrappable?

	variadic: BOOLEAN
			-- Is the function currently being emitted variadi?

	emit_function (a_file_name: STRING; a_node: XML_NODE) is
		local name: STRING
		do 
			name := a_node.attribute_at(once "name")
			unwrappable:=False; variadic:=False
			if is_public(name) then 
				function := "%T"+name
				if a_node.children_count>0 then append_function_arguments(a_node) end
				append_return_type(a_node)
				append_function_body(a_node)
				if unwrappable then 
					if verbose then std_error.put_line("Unwrappable functions: "+name) end
					output.put_line("%T-- Unwrappable "+name)
				else output.put_line(function)
				end
			else 
				if verbose then std_error.put_line("Skipping 'hidden' function "+name) end
			end -- if is_public(name)
		end

	append_function_arguments (a_node: XML_NODE) is
			-- Append the arguments of `a_node' into `function'.
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
			has_arguments: a_node.children_count>0
		local		
			argument_placeholder, argument_type: STRING
			an_argument: XML_NODE; i: INTEGER
		do
			function.append(once " (")
			from i:=1 until i>a_node.children_count loop
				an_argument :=a_node.child(i)
				argument_placeholder := an_argument.attribute_at(once "name")
				if argument_placeholder /= Void and then 
					an_argument.name.is_equal(once "Argument") then 
					function.append(once "a_")
					function.append(argument_placeholder)
					function.append(once ": ")
					argument_type := translate.eiffel_type_of(an_argument)
					if argument_type=Void
					then function.append(once "unhandled type!"); unwrappable:=True
					else function.append(argument_type)
					end
					if i<a_node.children_count then function.append(once "; ") end
				elseif an_argument.name.is_equal(once "Ellipsis") then variadic := True
				else function.append(once "Unknown XML child in funtion")
				end
				i:=i+1
			end
			function.append(once ")")
		end

	append_return_type (a_node: XML_NODE) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
		local returns: STRING
		do
			-- emit return type
			returns := translate.eiffel_type_of_string(a_node.attribute_at(once "returns"))
			if returns=Void 
			then function.append(once "unhandled type!"); unwrappable:=True 
			elseif returns = translate.void_type then -- Nothing
			else function.append(once ": "); function.append(returns) 
			end
		end

	append_function_body(a_node: XML_NODE) is
		require 
			node_not_void: a_node/=Void
			is_function_node: a_node.name.is_equal(once "Function")
		do
			function.append(once " is%N")
			if variadic then function.append(variadic_function_note) end
			if unwrappable then function.append(unwrappable_function_note) end
			function.append(once "%T%Texternal %"C use <")
			function.append(header)
			function.append(">%"%N%T%Tend%N")
		end

feature
	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		local 
			classname, filename, id, members, fieldname: STRING; 
			field: XML_NODE; 
			members_iter: ITERATOR[STRING]
			content: STRING_OUTPUT_STREAM
			printer, logger: STRING_PRINTER
			-- file: TEXT_FILE_WRITE
		do 
			if is_public(structure_name) then
				create content.make
				create printer.make(content)
				create logger.make(std_error)
				filename := eiffel_class_file_name(structure_name+once "_struct")
				classname := eiffel_class_name(structure_name+once "_struct")
				if verbose then logger.put_message
					(once "Wrapping structure @(1) to class @(2) in file @(3)%N",
					 <<structure_name,classname,filename>>)
				end

				-- emit_structure_header(structure_name
				content.put_string(automatically_generated_header)
				content.put_string(deferred_class)
				content.put_string(eiffel_class_name(structure_name))
				content.put_string(struct) 
				content.put_string(struct_inherits)
				
				members := a_node.attribute_at(once "members")
				if members/=Void then
					members_iter := members.split.get_new_iterator
					-- Emit getters
					content.put_string(getters_header)
					from members_iter.start until members_iter.is_off loop
						id := members_iter.item
						field := fields.reference_at(id)
						if field/=Void then
							fieldname := field.attribute_at(once "name")
							check	fieldname/=Void end
							put_strings
							(content,
							 <<once "%Tget_", fieldname, once " (a_structure: POINTER): ",
								translate.eiffel_type_of(field), once " is%N",
								once "%T%Texternal %"C struct ",
								structure_name, once " get ",fieldname,
								" use <",header,">%"%N%T%Tend%N">>)
							if verbose then
								std_output.put_string(once " ")
								std_output.put_string(fieldname)
							end
						else -- Void field
							if verbose then
								io.put_string("(no field with id "+id+" probably a Constructor) ") 
							end
						end -- field is void?
						members_iter.next
					end -- loop over members
					-- Emit setters
					content.put_string(setters_header)
					from members_iter.start until members_iter.is_off loop
						id := members_iter.item
						field := fields.reference_at(id)
						if field/=Void then
							fieldname := field.attribute_at(once "name")
							check	fieldname/=Void end
							printer.put_message("[
														external_set_@(0) (a_structure: POINTER; a_value: @(1)) is 
														external "C struct @(2) set @(3) use <@(4)>"  
														end
														]",
														 <<fieldname, translate.eiffel_type_of(field),
															structure_name, fieldname,	header>>)
							if verbose then
								std_output.put_string(once " setter ")
								std_output.put_string(field.attribute_at(once "name"))
							end
						else -- Void field
							if verbose then
								std_output.put_string("(no field with id "+id+" probably a Constructor) ") 
							end
						end -- field is void?
						members_iter.next
					end -- loop over members
				else -- void members
					if verbose then
						std_output.put_line("Found a structure with no fields")
					end
				end
				content.put_string(once "end")
				-- Actual output only when no error found.
				-- create file.connect_to (filename)
				output.put_string(content.to_string)
			else 
				if verbose then std_error.put_line("Skipping 'hidden' structure "+structure_name) end
			end -- name is public
		end

	emit_struct_setters is
		do
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
					debug io.put_string(once "-- Degenerate case: an enumeration without values%N") end
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

feature 
	header: STRING
end
