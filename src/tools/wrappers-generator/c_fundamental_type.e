class  C_FUNDAMENTAL_TYPE

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	LIBERTY_TYPED
	STORABLE_NODE

insert WRAPPER_GENERATOR_EXCEPTIONS

creation make

feature 
	store is
		do
			types.fast_put(Current,id)
		end

	is_void: BOOLEAN is do Result := c_name.is_equal(U"void") end

	size: INTEGER is 
		require not is_void
		do
			Result := attribute_at(once U"size").to_utf8.to_integer
		ensure Result>0
		end

	last_error: STRING
	
	wrapper_type: STRING is
		-- The name of the class of Liberty that wraps Current fundamental type
	local c_type: STRING
	do
		c_type := c_name.to_utf8
		if c_type.is_equal(once "void") then Result := once ""
		elseif c_type.has_substring(once "char") then Result := once "CHARACTER"
		elseif c_type.has_substring(once "int") then
			if c_type.has_substring(once "unsigned") then
				inspect size
				when 16 then Result := once "NATURAL_16"
				when 32 then Result := once "NATURAL_32"
				when 64 then Result := once "NATURAL_64"
				else last_error := unhandled_unsigned_integer_type
				end
			else
				inspect size
				when 16 then Result := once "INTEGER_16"
				when 32 then Result := once "INTEGER_32"
				when 64 then Result := once "INTEGER_64"
				else last_error := unhandled_integer_type
				end
			end
		elseif c_type.has_substring(once "float") or else 
			c_type.has_substring(once "double") then
			inspect size
				when 32 then Result := once "REAL_32"
				when 64 then Result := once "REAL_64"
				when 80 then Result := once "REAL_80"
				when 128 then Result := once "REAL_128"
				else last_error := unhandled_double_type
				end
		elseif c_type.has_substring(once "complex") then
			-- could be "complex double" "complex float",
			-- "complex long double"
			last_error := unhandled_complex_type
		else last_error := unhandled_type
		end
	ensure is_void implies Result.is_equal("")
	end

-- invariant name.is_equal(once U"FundamentalType")
end

