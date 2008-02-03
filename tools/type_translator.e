
class TYPE_TRANSLATOR
	-- 

insert EXCEPTIONS

creation make

feature -- Creation
	make is
		do
			create types.make
			create typedefs.make
			create pointer_types.make
		end

feature -- Type-system translations
	is_void (an_argument: XML_NODE): BOOLEAN is
		do
			not_yet_implemented
		end
				
	eiffel_type_of (an_argument: XML_NODE): STRING is
		require 
			argument_not_void: an_argument /= Void
		local 
			id,name: STRING; size: INTEGER
			type_node: XML_NODE
		do
			-- Known nodes: FundamentalType Constructor Ellipsis Typedef
			-- ArrayType Argument Enumeration PointerType EnumValue
			-- Struct GCC_XML CvQualifiedType Namespace FunctionType
			-- Variable File Field Function Union ReferenceType


			if an_argument.name.is_equal(once "FundamentalType") then
				name := an_argument.attribute_at(once "name")
				size := an_argument.attribute_at(once "size").to_integer
				if name.has_substring(once "char") then
					check size=8 end
					Result:=once "CHARACTER"
				elseif name.has_substring(once "complex") then 
					-- could be "complex double" "complex float",
					-- "complex long double" 
					std_error.put_line("Unhandled complex type found: "+name)
					raise(unhandled_type)
				elseif name.has_substring(once "unsigned") then
					check name.has_substring(once "int") end
					inspect size
					when 16 then Result:=once "NATURAL_16"
					when 32 then Result:=once "NATURAL_32"
					when 64 then Result:=once "NATURAL_64"
					else 
						std_error.put_line("Unknown unsigned int of size"+size.out)
						raise(unhandled_type)
					end
				elseif name.has_substring(once "int") then
					inspect size
					when 16 then Result:=once "INTEGER_16"
					when 32 then Result:=once "INTEGER_32"
					when 64 then Result:=once "INTEGER_64"
					else 
						std_error.put_line("Unknown int of size"+size.out)
						raise(unhandled_type)
					end
				elseif name.has_substring(once "float") then
					check size=32 end
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
				elseif name.is_equal("void") then Result := once ""
				else 
					debug 
						print(unhandled_type) print(name) 
					end
					raise(unhandled_type) -- Result := once "unknown" 
				end
			elseif an_argument.name.is_equal(once "Typedef") then
				-- Recursively discover the correct type: the actual type
				-- of a typedef is the type it is referring to.
				Result:=eiffel_type_of(types.at(an_argument.attribute_at(once "type")))
			elseif an_argument.name.is_equal(once "ArrayType") then

			elseif an_argument.name.is_equal(once "Enumeration") then
				Result:=once "INTEGER_32"
			elseif an_argument.name.is_equal(once "PointerType") then
				Result:=once "POINTER"
			elseif an_argument.name.is_equal(once "Struct") then
				std_error.put_line(once "C structures does not have a valid Eiffel wrapper type.")
				raise(unhandled_type) 
			elseif an_argument.name.is_equal(once "FunctionType") then
				std_error.put_line(once "FunctionType wrapped as a POINTER.")
				Result:=once "POINTER"
			elseif an_argument.name.is_equal(once "Variable") then
				-- Recursively discover the correct type: the actual type
				-- of a typedef is the type it is referring to.
				not_yet_implemented
				-- Result:=types.at(an_argument.attribute_at(once "type"))
			elseif an_argument.name.is_equal(once "Field") then Result:=once "Field"
			elseif an_argument.name.is_equal(once "Function") then Result:=once "Function"
			elseif an_argument.name.is_equal(once "Union") then
				std_error.put_line(once "C union does not have a valid Eiffel wrapper type.")
				raise(unhandled_type) 
			elseif an_argument.name.is_equal(once "ReferenceType") then
				std_error.put_line(once "C++ reference does not have a valid Eiffel wrapper type.")
				raise(unhandled_type) 
			end
		ensure not_void: Result/=Void
		end

	types: HASHED_DICTIONARY [XML_NODE, STRING]
			-- Types by their name

	typedefs: LINKED_LIST[XML_NODE]

	pointer_types: HASHED_SET[STRING]
			-- Ids of pointer types

feature {} -- Constants
	unhandled_type: STRING is "Unhandled type"
			
	integer_size: INTEGER is do Result:=({INTEGER 1}.object_size//8) end
	real_size: INTEGER is do Result:=({REAL 1.0}.object_size//8) end

end
