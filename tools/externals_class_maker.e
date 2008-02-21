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
			Precursor
		end

	is_initialized: BOOLEAN is
		do
			Result := Precursor and then (headers /= Void )
		end

feature 
	emit_function (a_node: XML_NODE; a_name: STRING) is
		local 
			name, returns, argument_placeholder, argument_type: STRING
			an_argument: XML_NODE; i: INTEGER; 
			unwrappable, variadic: BOOLEAN
			function: STRING
		do 
			name := a_node.attribute_at(once "name")
			function := name.twin
			if a_node.children_count>0 then 
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
						function.append(once "; ")
					elseif an_argument.name.is_equal(once "Ellipsis") then variadic := True
					else 
						function.append(once "Unknown XML child in funtion")
					end
					i := i+1
				end
				function.append(once ")")
			end
			
			-- emit return type
			returns := translate.eiffel_type_of_string(a_node.attribute_at(once "returns"))
			if returns=Void 
			then function.append(once "unhandled type!"); unwrappable:=True 
			elseif returns = translate.void_type then -- Nothing
			else function.append(returns) 
			end
			function.append(once " is%N")
			if variadic then 
				function.append(variadic_function_note) 
			end
			if unwrappable then 
				if verbose then
					std_error.put_line("Unwrappable functions: "+name)
				end
			else output.put_line(function)
			end
		end

feature
	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		local 
			classname, filename, id, members, fieldname: STRING; 
			field: XML_NODE; 
			members_iter: ITERATOR[STRING]
			content: STRING_OUTPUT_STREAM
			printer: STRING_PRINTER
			file: TEXT_FILE_WRITE
		do 
			if is_public(structure_name) then
				create content.make
				create printer.make(content)

				filename := eiffel_class_file_name(structure_name+once "_struct")
				if verbose then put_strings 
					(std_output, 
					 << once "Wrapping structure ",
						 structure_name, once " to class ",
						 classname, once " in file ",
						 filename>>) -- TODO: use string_printer on std_error
				end

				put_strings(content, 
								<<automatically_generated_header,
								  deferred_class, eiffel_class_name(structure_name),struct
								  struct_inherits>>)
				
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
								printer.put_message
								("[
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
				else put_strings(std_output,<<structure_name, once " is not public">>)
				end -- name is public
			end
			
	emit_enumeration (a_node: XML_NODE; a_name: STRING) is
		require 
			node_not_void: a_node/=Void
			is_enumeration: a_node.name.is_equal(once "Enumeration")
			name_not_void: a_name/=Void
		local i, prefix_length: INTEGER; a_child: XML_NODE; value, filename: STRING
		do 
			-- Set the file TODO: put an actual file.
			output := std_output
			
			output.put_string(automatically_generated_header)
			output.put_string(deferred_class) 
			output.put_line(a_name)
			output.put_string(once "insert ENUM%N%N")
			output.put_string(once "creation default_create")

			output.put_line(once "feature -- Setters") 
			output.put_string(once "%Tdefault_create, ")
			prefix_length:=longest_prefix_of_children_of(a_node)
			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child.name.is_equal(once "EnumValue") then
					create value.copy(a_child.attribute_at(once "name"))
					value.remove_head(prefix_length)
					output.put_string(once "set_")
					output.put_string(value)
					output.put_string(once " is%N%T%Tdo%N%T%T%Tvalue := ")
					output.put_string(value)
					output.put_string(once "%N%T%Tend%N")
				else  debug io.put_string("Unhandled child in Enumeration at line"+a_child.line.out) end
				end
				i:=i+1
			end

			output.put_line(once "feature -- Queries")
			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child.name.is_equal(once "EnumValue") then
					value := a_child.attribute_at(once "name")
					check value/=Void end
					output.put_string(once "is_")
					output.put_string(value)
					output.put_string(once ": BOOLEAN is%N%T%Tdo%N%T%T%TResult := (value=")
					output.put_string(value)
					output.put_string(once ")%N%T%Tend%N")
				else  debug io.put_string("Unhandled child in Enumeration at line"+a_child.line.out) end
				end
				i:=i+1
			end

			output.put_line(once "feature {WRAPPER, WRAPPER_HANDLER} -- Low level values")
			-- Obtain the path of the file where the enumeration is
			-- declared. TODO: make it cleaner, currently it is a mess.
			filename := files_by_id.at(a_node.attribute_at(once "file")).attribute_at(once "name")
			from i:=1 until i>a_node.children_count loop
				a_child := a_node.child(i)
				if a_child.name.is_equal(once "EnumValue") then
					value := a_child.attribute_at(once "name")
					check value/=Void end
					output.put_character('%T')
					output.put_string(value)
					output.put_string(once ": INTEGER is%N%T%Texternal %"C macro use <")
					if header/=Void then output.put_string(header)
					else output.put_string(filename)
					end
					output.put_string(once ">%"%N%T%Talias %"")
					output.put_string(value)
					output.put_string(once "%"%N%T%Tend%N")
				else  debug io.put_string("Unhandled child in Enumeration at line"+a_child.line.out) end
				end
				i:=i+1
			end
		end

feature 
	header: STRING
end
