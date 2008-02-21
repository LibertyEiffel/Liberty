
class TYPE_TRANSLATOR
	-- 

insert EXCEPTIONS

creation make

feature -- Creation
	make is
		do
			create types.make
			create typedefs.make
		end

feature -- Type-system translations
	is_void (an_argument: XML_NODE): BOOLEAN is
		require argument_not_void: an_argument/=Void
		local type: STRING
		do
			if an_argument.name.is_equal(once "FundamentalType") then
				if an_argument.attribute_at(once "name").is_equal("void") 
				then Result := True
				else Result := False
				end
			else
				type := an_argument.attribute_at(once "type")
				if type=Void then Result:=False
				else Result:=is_void(types.at(type))
				end
			end
		end

	eiffel_type_of_string (an_id: STRING): STRING is
		require types.has(deconst(an_id))
		do
			Result := eiffel_type_of(types.at(deconst(an_id)))
		end

	eiffel_type_of (an_argument: XML_NODE): STRING is
			-- The Eiffel type usable to wrap `an_argument'. Can be Void
			-- if it does not have a proper wrapper type. "Expanded" structures, unions,
		require 
			argument_not_void: an_argument /= Void
		local 
			name: STRING; size: INTEGER
		do
			Result := once "Unhandled type"
			-- Known nodes: FundamentalType Constructor Ellipsis Typedef
			-- ArrayType Argument Enumeration PointerType EnumValue
			-- Struct GCC_XML CvQualifiedType Namespace FunctionType
			-- Variable File Field Function Union ReferenceType

			if an_argument.name.is_equal(once "FundamentalType") then
				name := an_argument.attribute_at(once "name")
				if name.is_equal("void") 
				then Result := void_type
				else 
					size := an_argument.attribute_at(once "size").to_integer
					if name.has_substring(once "char") then
						-- check size=8 end
						Result:=once "CHARACTER"
					elseif name.has_substring(once "complex") then 
						-- could be "complex double" "complex float",
						-- "complex long double" 
						std_error.put_line("Unhandled complex type found: "+name)
						debug raise(unhandled_type) end
					elseif name.has_substring(once "unsigned") then
						-- check name.has_substring(once "int") end
						inspect size
						when 16 then Result:=once "NATURAL_16"
						when 32 then Result:=once "NATURAL_32"
						when 64 then Result:=once "NATURAL_64"
						else 
							std_error.put_line("Unknown unsigned int of size"+size.out) 
							debug raise(unhandled_type) end
						end
					elseif name.has_substring(once "int") then
						inspect size
						when 16 then Result:=once "INTEGER_16"
						when 32 then Result:=once "INTEGER_32"
						when 64 then Result:=once "INTEGER_64"
						else
							std_error.put_line("Unknown int of size"+size.out)
							debug raise(unhandled_type) end
						end
					elseif name.has_substring(once "float") then
						-- check size=32 end
						Result:=once "REAL_32"
					elseif name.has_substring(once "double") then
						inspect size 
						when 32 then 
							std_error.put_line(once "What a pretty strange thing: a 32 bit double! They are usually called float.")
							Result := once "REAL_32"
						when 64 then Result := once "REAL_64"
						when 80 then Result := once "REAL_80"
						when 128 then Result := once "REAL_128"
						else
							std_error.put_line("Double of unhandled length "+size.out+" using REAL_128")
							Result:= once "REAL_128"
						end
					else std_error.put_line(unhandled_type+name)
					end -- searching name substrings
				end -- if name.is_equal(once "void")
			elseif (an_argument.name.is_equal(once "Argument") or else
					  an_argument.name.is_equal(once "Typedef") or else
					  an_argument.name.is_equal(once "Variable")) then
				-- Recursively discover the correct type: the actual type
				-- of a typedef is the type it is referring to.
				Result:=eiffel_type_of(types.at(deconst(an_argument.attribute_at(once "type"))))
			elseif an_argument.name.is_equal(once "Enumeration") then
				Result:=once "INTEGER_32"						
			elseif (an_argument.name.is_equal(once "ArrayType") or else
					  an_argument.name.is_equal(once "PointerType")) then
				Result:=once "POINTER"
			elseif an_argument.name.is_equal(once "FunctionType") then
				std_error.put_line(once "FunctionType wrapped as a POINTER.")
				Result:=once "POINTER"
			elseif an_argument.name.is_equal(once "Struct") then
				std_error.put_line(once "(expanded) C structures does not have a valid Eiffel wrapper type.")
				debug raise(unhandled_type) end
			elseif an_argument.name.is_equal(once "Field") then -- recursively find
				Result:=eiffel_type_of(types.at(deconst(an_argument.attribute_at(once "type"))))
			elseif an_argument.name.is_equal(once "Function") then 
				std_error.put_line(once "C functions does not have a valid Eiffel wrapper type (a function pointer does have it).")
				debug raise(unhandled_type) end
			elseif an_argument.name.is_equal(once "Union") then
				std_error.put_line(once "C union does not have a valid Eiffel wrapper type.")
				debug raise(unhandled_type) end
			elseif an_argument.name.is_equal(once "ReferenceType") then
				std_error.put_line(once "C++ reference does not have a valid Eiffel wrapper type.")
				debug raise(unhandled_type) end
			end
		end

	types: HASHED_DICTIONARY [XML_NODE, STRING]
			-- Types by their name

	typedefs: LINKED_LIST[XML_NODE]

feature {} -- Implementation
	deconst (a_string: STRING): STRING is
			-- `a_string' if it does not end with 'c' or 'r'; otherwise it is a
			-- copy of `a_string' with the last character ('c' or 'r')
			-- removed. In gcc-xml output 'c' should mean that the referred id
			-- shall be constant, 'r' a reference type.
		require not_void: a_string/=Void
		do
			inspect a_string.last
			when 'c', 'r' then 
				Result := a_string.substring(a_string.lower, a_string.upper-1)
			else Result:=a_string
			end
		end

feature -- Constants
	unhandled_type: STRING is "Unhandled type: "
	void_type: STRING is "void"
			
	integer_size: INTEGER is do Result:=({INTEGER 1}.object_size//8) end
	real_size: INTEGER is do Result:=({REAL 1.0}.object_size//8) end

end
