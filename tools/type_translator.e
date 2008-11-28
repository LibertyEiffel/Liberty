class TYPE_TRANSLATOR

insert
	SHARED_SETTINGS 
	EIFFEL_GCC_XML_EXCEPTIONS
	EXCEPTIONS

creation make

feature -- Creation
	make is
		do
			create types.make
			create typedefs.make
		end

feature -- Type-system translations
	is_void (an_argument: XML_COMPOSITE_NODE): BOOLEAN is
		require argument_not_void: an_argument/=Void
		local type:UNICODE_STRING
		do
			if an_argument.name.is_equal(once U"FundamentalType") then
				if an_argument.attribute_at(once U"name").is_equal(U"void") 
				then Result := True
				else Result := False
				end
			else
				type := an_argument.attribute_at(once U"type")
				if type=Void then Result:=False
				else Result:=is_void(types.at(type))
				end
			end
		end

	-- eiffel_type_of_unicode (an_id: UNICODE_STRING): STRING is
	-- 		-- The Eiffel type name correspondent to the C type contained in `an_id'
	-- 	require an_id/=Void
	-- 	local a_type: XML_COMPOSITE_NODE
	-- 	do
	-- 		a_type := types.reference_at(deconst(an_id.as_utf8))
	-- 		if a_type/=Void then Result := eiffel_type_of(a_type) end
	-- 	end

	eiffel_type_of_string (an_id: UNICODE_STRING): STRING is
			-- The Eiffel type name correspondent to the C type contained in `an_id'
		require an_id/=Void
		local a_type: XML_COMPOSITE_NODE
		do
			a_type := types.reference_at(deconst(an_id))
			if a_type/=Void then Result := eiffel_type_of(a_type) end
		end

	eiffel_type_of (an_argument: XML_COMPOSITE_NODE): STRING is
			-- The Eiffel type usable to wrap `an_argument'. If it does
			-- not have a proper wrapper type Result is Void and
			-- `last_error' describes the issue using one of the strings
			-- from EIFFEL_GCC_XML_EXCEPTIONS. "Expanded" structures,
			-- unions,
		require 
			argument_not_void: an_argument /= Void
		local 
			name: UNICODE_STRING; size: INTEGER
		do
			Result := Void
			last_error := Void
			-- Known nodes: FundamentalType Constructor Ellipsis Typedef
			-- ArrayType Argument Enumeration PointerType EnumValue
			-- Struct GCC_XML CvQualifiedType Namespace FunctionType
			-- Variable File Field Function Union ReferenceType

			if an_argument.name.is_equal(once U"FundamentalType") then
				name := an_argument.attribute_at(once U"name")
				if name.is_equal(U"void") then Result := once ""
				else 
					size := an_argument.attribute_at(once U"size").to_utf8.to_integer
					if name.has_substring(once U"char") then
						-- check size=8 end
						Result:=once "CHARACTER"
					elseif name.has_substring(once U"complex") then 
						-- could be "complex double" "complex float",
						-- "complex long double" 
						std_error.put_line("Unhandled complex type found: "+name.to_utf8)
						last_error := unhandled_complex_type
						-- raise(unhandled_complex_type) 
					elseif name.has_substring(once U"unsigned") then
						-- check name.has_substring(once U"int") end
						if are_naturals_used then
							inspect size
							when 16 then Result:=once "NATURAL_16"
							when 32 then Result:=once "NATURAL_32"
							when 64 then Result:=once "NATURAL_64"
							else 
								std_error.put_line("Unknown unsigned int of size"+size.out) 
								last_error := unhandled_unsigned_integer_type
								-- raise(unhandled_unsigned_integer_type)
							end
						else
							inspect size
							when 16 then Result:=once "INTEGER_16"
							when 32 then Result:=once "INTEGER_32"
							when 64 then Result:=once "INTEGER_64"
							else 
								std_error.put_line("Unknown unsigned int of size"+size.out) 
								last_error := unhandled_unsigned_integer_type
								-- raise(unhandled_unsigned_integer_type)
							end
						end
					elseif name.has_substring(once U"int") then
						inspect size
						when 16 then Result:=once "INTEGER_16"
						when 32 then Result:=once "INTEGER_32"
						when 64 then Result:=once "INTEGER_64"
						else
							std_error.put_line("Unknown int of size"+size.out)
							last_error := unhandled_integer_type
							-- raise(unhandled_integer_type)
						end
					elseif name.has_substring(once U"float") then
						-- check size=32 end
						Result:=once "REAL_32"
					elseif name.has_substring(once U"double") then
						inspect size 
						when 32 then 
							std_error.put_line(once "What a pretty strange thing: a 32 bit double! They are usually called float.")
							Result := once "REAL_32"
						when 64 then Result := once "REAL_64"
						when 80 then Result := once "REAL_80"
						when 128 then Result := once "REAL_128"
						else
							std_error.put_line("Double of unhandled length "+size.out+" using REAL_128")
							last_error := unhandled_double_type 
							-- raise(unhandled_double_type) -- Result:= once "REAL_128"
						end
					else std_error.put_line(unhandled_type+name.to_utf8)
						last_error := unhandled_type
						-- raise(unhandled_type)
					end -- searching name substrings
				end -- if name.is_equal(once U"void")
			elseif (an_argument.name.is_equal(once U"Argument") or else
					  an_argument.name.is_equal(once U"Typedef") or else
					  an_argument.name.is_equal(once U"Variable")) then
				-- Recursively discover the correct type: the actual type
				-- of a typedef is the type it is referring to.
				Result:=eiffel_type_of(types.at(deconst(an_argument.attribute_at(once U"type"))))
			elseif an_argument.name.is_equal(once U"Enumeration") then
				Result:=once "INTEGER_32"						
			elseif (an_argument.name.is_equal(once U"ArrayType") or else
					  an_argument.name.is_equal(once U"PointerType")) then
				Result:=once "POINTER"
			elseif an_argument.name.is_equal(once U"FunctionType") then
				std_error.put_line(once "FunctionType wrapped as a POINTER.")
				Result:=once "POINTER"
			elseif an_argument.name.is_equal(once U"Struct") then
				std_error.put_line(once "TODO: A function argument made by a C structure passed-by-value shall be wrapped using expandended external types.")
				last_error := unhandled_structure_type
				not_yet_implemented
				-- raise(unhandled_structure_type)
			elseif an_argument.name.is_equal(once U"Field") then -- recursively find
				Result:=eiffel_type_of(types.at(deconst(an_argument.attribute_at(once U"type"))))
			elseif an_argument.name.is_equal(once U"Function") then 
				std_error.put_line(once "C functions does not have a valid Eiffel wrapper type (a function pointer does have it).")
				last_error := unhandled_type
				-- raise(unhandled_type)
			elseif an_argument.name.is_equal(once U"Union") then
				std_error.put_line(once "TODO: C unions could be wrapped using external expanded types.")
				last_error := unhandled_union_type
				-- raise(unhandled_union_type)
			elseif an_argument.name.is_equal(once U"ReferenceType") then
				std_error.put_line(once "C++ reference does not have a valid Eiffel wrapper type.")
				last_error := unhandled_reference_type 
				-- raise(unhandled_reference_type)
			end
		ensure 
			when_void_last_error_is_set: Result=Void implies last_error/=Void
		end

	has_type_error: BOOLEAN is
		-- Is `last_error' related to types?
	do
		Result:= (last_error=unhandled_type or else 
		last_error=unhandled_complex_type or else
		last_error=unhandled_unsigned_integer_type or else
		last_error=unhandled_integer_type or else
		last_error=unhandled_double_type or else
		last_error=unhandled_structure_type or else
		last_error=unhandled_union_type or else
		last_error=unhandled_reference_type)
	end

	last_error: STRING
			-- A description of the latest error occurred 

	types: HASHED_DICTIONARY [XML_COMPOSITE_NODE,UNICODE_STRING]
			-- Types by their name

	typedefs: LINKED_LIST[XML_COMPOSITE_NODE]

feature {} -- Implementation
	deconst (a_string: UNICODE_STRING): UNICODE_STRING is
			-- `a_string' if it does not end with 'c' or 'r'; otherwise it is a
			-- copy of `a_string' with the last character ('c' or 'r')
			-- removed. In gcc-xml output 'c' should mean that the referred id
			-- shall be constant, 'r' a reference type.
		require not_void: a_string/=Void
		do
			inspect a_string.last.to_character
			when 'c', 'r' then 
				Result := a_string.substring(a_string.lower, a_string.upper-1)
			else Result:=a_string
			end
		end

feature -- Constants
	integer_size: INTEGER is once Result:=({INTEGER 1}.object_size//8) end
	real_size: INTEGER is once Result:=({REAL 1.0}.object_size//8) end

	-- External types are described in
	-- http://smarteiffel.loria.fr/wiki/en/index.php/External_types
	-- could be obsolete.
end
