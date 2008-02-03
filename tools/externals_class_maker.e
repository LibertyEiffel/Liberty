class EXTERNALS_CLASS_MAKER

inherit 
	CLASS_MAKER
		redefine 
			initialize,
			is_initialized 
		end

creation with_header, without_header

feature 
	with_header (an_header: STRING) is
		require header_not_void: an_header/=Void
		do
			header:=an_header
			initialize
		end

	without_header is do header:="Che schifo!"; initialize end

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
			name, returns, argument_placeholder: STRING
			an_argument: XML_NODE; i: INTEGER; variadic: BOOLEAN
		do 
			name := a_node.attribute_at(once "name")
			returns := a_node.attribute_at(once "returns")	
			std_output.put_string("Function "+name)
			if a_node.children_count>0 then 
				std_output.put_string(once " (")
				from i:=1 until i>a_node.children_count loop
					an_argument :=a_node.child(i)
					argument_placeholder := an_argument.attribute_at(once "name")
					if argument_placeholder /= Void and then 
						an_argument.name.is_equal(once "Argument") then 
						std_output.put_string(argument_placeholder)
						std_output.put_string(once ": ")
						std_output.put_string(type_translator.eiffel_type_of(an_argument))
						std_output.put_string(once "; ")
					elseif an_argument.name.is_equal(once "Ellipsis") then variadic := True
					end
					i := i+1
				end
				std_output.put_string(once ")")
			end
			-- emit return type
			std_output.put_line(once " is")
			if variadic then 
				std_output.put_line(variadic_function_note) 
			end
		end

feature
	emit_structure (a_node: XML_NODE; structure_name: STRING) is
		local 
			classname, filename, id, members, fieldname: STRING; 
			field: XML_NODE; 
			members_iter: ITERATOR[STRING]
			file: TEXT_FILE_WRITE
		do 
			if is_public(structure_name) then
				classname := eiffel_class_name(structure_name)+(once "_STRUCT")
				filename := eiffel_class_file_name(structure_name+once "_struct")
				put_strings (std_output, 
								 << once "Wrapping structure ",
									 structure_name, once " to class ",
									 classname, once " in file ",
									 filename>>)
				create file.connect_to (filename)
				if file.is_connected then 
					put_strings
					(file,
					 << automatically_generated_header,
						 once "deferred class ",classname,
						 once "[

								 inherit ANY undefine is_equal, copy end
								 
								 ]" >>)
					members := a_node.attribute_at(once "members")
					if members/=Void then
						members_iter := members.split.get_new_iterator
						-- Emit getters
						file.put_string(once "feature {} -- getters%N")
						from members_iter.start until members_iter.is_off loop
							id := members_iter.item
							field := fields.reference_at(id)
							if field/=Void then
								fieldname := field.attribute_at(once "name")
								check	fieldname/=Void end
								put_strings 
								(file,
								 <<once "%Tget_",fieldname,
									once " (a_structure: POINTER): ",
									type_translator.eiffel_type_of(field),
									once " is %N%T%Texternal %"C struct ",
									structure_name, once " get ", fieldname
									once " use <",
									header,
									once ">%"%N%Tend%N">>)
								if verbose then
									std_output.put_string(once " ")
									std_output.put_string(field.attribute_at(once "name"))
								end
							else -- Void field
								if verbose then
									io.put_string("(no field with id "+id+" probably a Constructor) ") 
								end
							end -- field is void?
							members_iter.next
						end -- loop over members
						-- Emit setters
						file.put_string(once "feature {} -- setters%N")
						from members_iter.start until members_iter.is_off loop
							id := members_iter.item
							field := fields.reference_at(id)
							if field/=Void then
								fieldname := field.attribute_at(once "name")
								check	fieldname/=Void end
								put_strings 
								(file,
								 <<once "%Texternal_set_",fieldname,
									once " (a_structure: POINTER; a_value: ",
									type_translator.eiffel_type_of(field),
									once ") is %N%T%Texternal %"C struct ",
									structure_name, once " set ", fieldname
									once " use <",
									header,
									once ">%"%N%Tend%N">>)
								if verbose then
									std_output.put_string(once " ")
									std_output.put_string(field.attribute_at(once "name"))
								end
							else -- Void field
								if verbose then
									io.put_string("(no field with id "+id+" probably a Constructor) ") 
								end
							end -- field is void?
							members_iter.next
						end -- loop over members
					else -- void members
						if verbose then
							std_output.put_line("Found a structure with no fields")
						end
					end
					put_strings(file, <<"end -- class ",classname>> )
					file.disconnect
				else put_strings (std_output, 
										<< once "Couldn't open file ",
											filename>>)
				end -- if file.is_connected
			else put_strings(std_output,<<structure_name, once " is not public">>)
			end -- name is public
		end

feature 
	header: STRING
end
