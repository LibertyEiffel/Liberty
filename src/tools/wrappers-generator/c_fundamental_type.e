class  C_FUNDAMENTAL_TYPE
	-- A node of an XML file made by gccxml representing a fundamental type of the C language.

inherit 
	GCCXML_NODE
	IDENTIFIED_NODE
	NAMED_NODE
	TYPED_NODE
	STORABLE_NODE

insert WRAPPER_GENERATOR_EXCEPTIONS

create {ANY} make

feature 
	store is
		do
			types.fast_put(Current,id)
		end

	is_void: BOOLEAN is do Result := c_name.is_equal(U"void") end

	is_fundamental: BOOLEAN is True

	has_wrapper: BOOLEAN is
		do
			if not is_wrapper_computed then compute_wrapper end
			Result:=stored_wrapper_type/=Void
		end

	size: INTEGER is 
		require not is_void
		do
			Result := attribute_at(once U"size").to_utf8.to_integer
		ensure Result>0
		end

	last_error: STRING
	
	wrapper_type: STRING is
		-- The name of the class of Liberty that wraps Current fundamental type
	do
		if not is_wrapper_computed then compute_wrapper end
		Result:=stored_wrapper_type
	ensure 
	end
feature {} -- Implementation
	is_wrapper_computed: BOOLEAN 
	stored_wrapper_type: STRING
	compute_wrapper is
	local c_type: STRING
	do
		c_type := c_name.to_utf8
		if c_type.is_equal(once "void") then stored_wrapper_type := Void
			elseif c_type.has_substring(once "char") then stored_wrapper_type := once "CHARACTER"
				elseif c_type.has_substring(once "int") then
					if c_type.has_substring(once "unsigned") then
						inspect size
						when 16 then stored_wrapper_type := once "NATURAL_16"
						when 32 then stored_wrapper_type := once "NATURAL_32"
						when 64 then stored_wrapper_type := once "NATURAL_64"
					else last_error := unhandled_unsigned_integer_type
					end
				else
					inspect size
					when 16 then stored_wrapper_type := once "INTEGER_16"
					when 32 then stored_wrapper_type := once "INTEGER_32"
					when 64 then stored_wrapper_type := once "INTEGER_64"
				else last_error := unhandled_integer_type
				end
			end
			elseif c_type.has_substring(once "float") or else 
				c_type.has_substring(once "double") then
				inspect size
				when 32 then stored_wrapper_type := once "REAL_32"
				when 64 then stored_wrapper_type := once "REAL_64"
				when 80 then stored_wrapper_type := once "REAL_80"
				when 128 then stored_wrapper_type := once "REAL_128"
			else last_error := unhandled_double_type
			end
			elseif c_type.has_substring(once "complex") then
				-- could be "complex double" "complex float",
				-- "complex long double"
				last_error := unhandled_complex_type
			else last_error := unhandled_type
			end		
			is_wrapper_computed:=True
		ensure is_wrapper_computed=True
		end
-- invariant name.is_equal(once U"FundamentalType")
end -- class C_FUNDAMENTAL_TYPE

-- Copyright 2008,2009,2010 Paolo Redaelli

-- wrappers-generator  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- wrappers-generator is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
