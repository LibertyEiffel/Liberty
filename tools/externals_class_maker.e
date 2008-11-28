class EXTERNALS_CLASS_MAKER

inherit
	CLASS_MAKER
		redefine 
			is_initialized,
			emit_structure
		end

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
	append_function_body(a_node: XML_COMPOSITE_NODE) is
		local function_header: STRING
		do
			if header=Void then
				function_header := files_by_id.at(a_node.attribute_at (once U"file")).attribute_at (once U"name").to_utf8
			else function_header := header
			end
			
			buffer.append(once " is%N")
			if variadic then buffer.append(variadic_function_note) end
			buffer.append(once "%T%Texternal %"C use <")
			buffer.append(function_header)
			buffer.append(">%"%N%T%Tend%N")
		end

feature -- Structure emission
	emit_structure (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local 
			structure_header: STRING
		do 
			if header=Void then
				structure_header := files_by_id.at(a_node.attribute_at (once U"file")).attribute_at (once U"name").to_utf8
			else structure_header := header
			end
			Precursor (a_node, a_structure_name)
		end

	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local fieldname, type: STRING
		do
			fieldname := adapt(a_field.attribute_at (once U"name").to_utf8)
			type := translate.eiffel_type_of(a_field)
			if type/=Void then
				log(once "Appending query for @(1)%N",<<fieldname>>) 
				queries_printer.put_message
				(once "[
						get_@(1) (a_structure: POINTER): @(2) is
							external "C struct @(3) get @(4) use <@(5)>"
							end
						]",
						<<fieldname, type, a_structure_name, fieldname, header>>)
				log(once "Appending setter for @(1)%N",<<fieldname>>) 
				setters_printer.put_message
				(once "[
				low_level_set_@(1) (a_structure: POINTER; a_value: @(2)) is
					external "C struct @(3) set @(4) use <@(5)>"
					end
					]",
				 <<fieldname, type, a_structure_name, fieldname, header>>)
			else -- unwrappable type
				log (once "Field @(1) in structure @(2) is not wrappable: @(3)", <<fieldname,a_structure_name,translate.last_error>>)
				queries_printer.put_message(once "%T-- Unwrappable @(1): @(2)%N", <<fieldname, translate.last_error>>)
			end
		end

feature -- Enumeration emitter
	append_enumeration_value_low_level (an_eiffel_value, a_c_value, a_file_name: STRING) is
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
