class EXTERNALS_CLASS_MAKER

inherit
	CLASS_MAKER
		redefine is_initialized, emit_structure
		end

insert
	EXCEPTIONS

creation {ANY}
	with_header, without_header

feature {ANY} -- Creation and initialization
	with_header (an_header: STRING) is
		require
			header_not_void: an_header /= Void
		do
			header := an_header
			initialize
		end

	without_header is
		do
			initialize
		end

	is_initialized: BOOLEAN is
		do
			Result := Precursor and then headers /= Void
		end

feature {ANY}
	header: STRING
			-- The C header that shall be included to use the wrapped
			-- features.

feature {ANY} -- Functions emittion
	append_function_body (a_node: XML_COMPOSITE_NODE) is
		local
			function_header: STRING
		do
			if header = Void then
				function_header := files_by_id.at(a_node.attribute_at(once U"file")).attribute_at(once U"name").to_utf8
			else
				function_header := header
			end
			buffer.append(once " is%N")
			if variadic then
				buffer.append(variadic_function_note)
			end
			buffer.put_message(once "		external %"C use <@(1)>%"%N%
			%		end%N",
			<<function_header>>)
		end

feature {ANY} -- Structure emission
	emit_structure (a_node: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local
			structure_header: STRING
		do
			if header = Void then
				structure_header := files_by_id.at(a_node.attribute_at(once U"file")).attribute_at(once U"name").to_utf8
			else
				structure_header := header
			end
			Precursor(a_node, a_structure_name)
		end

	emit_structure_field (a_field: XML_COMPOSITE_NODE; a_structure_name: STRING) is
		local
			fieldname, type: STRING
		do
			fieldname := adapt(a_field.attribute_at(once U"name").to_utf8)
			type := translate.eiffel_type_of(a_field)
			if type /= Void then
				log(once "Appending query for @(1)%N",
				<<fieldname>>)
				queries.put_message(once "	get_@(1) (a_structure: POINTER): @(2) is%N%
				%		external %"C struct @(3) get @(4) use <@(5)>%"%N%
				%		end%N%N",
				<<fieldname, type, a_structure_name, fieldname, header>>)
				log(once "Appending setter for @(1).@(2)%N",
				<<a_structure_name, fieldname>>)
				setters.put_message(once "	low_level_set_@(1) (a_structure: POINTER; a_value: @(2)) is%N%
				%		external %"C struct @(3) set @(4) use <@(5)>%"%N%
				%		end%N%N",
				<<fieldname, type, a_structure_name, fieldname, header>>)
			else
				log(once "Field @(1) in structure @(2) is not wrappable: @(3)",
				<<fieldname, a_structure_name, translate.last_error>>)
				queries.put_message(once "	-- Unwrappable @(1): @(2)%N",
				<<fieldname, translate.last_error>>)
			end
		end

feature {ANY} -- Enumeration emitter
	append_enumeration_value_low_level (an_eiffel_value, a_c_value, a_file_name: STRING) is
		local
			location: STRING
		do
			if header /= Void then
				location := header
			else
				location := a_file_name
			end
			low_level_values.put_message(once "	@(1): INTEGER is%N%
			%		external %"C macro use <@(2)%N%
			%		alias %"@(3)%"%N%
			%		end%N%N",
			<<an_eiffel_value, location, a_c_value>>)
		end

end -- class EXTERNALS_CLASS_MAKER
