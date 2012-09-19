deferred class WRAPPER_GENERATOR_EXCEPTIONS
	-- The exceptions used in eiffel-gcc-xml

insert
	ANY
		undefine default_create
		end
	EXCEPTIONS
		undefine default_create
		end

feature {ANY}
	variadic_function: STRING is "Variadic functions cannot be automatically wrapped"

	unhandled_type: STRING is "Unhandled type "

	unhandled_complex_type: STRING is "Unhandled complex type"

	unhandled_unsigned_integer_type: STRING is "Unhandled_unsigned integer type"

	unhandled_integer_type: STRING is "Unhandled integer type"

	unhandled_double_type: STRING is "Unhandled double type"

	unhandled_structure_type: STRING is "C structure passed by value and not by reference (using a pointer) should be wrapped with an expanded external type. Eiffel-gcc-xml currently don't support it."

	unhandled_union_type: STRING is "Unhnalded union type"

	unhandled_reference_type: STRING is "Unhnalded reference type: C++ reference does not have a valid Eiffel wrapper type."
end -- class WRAPPER_GENERATOR_EXCEPTIONS

-- Copyright 2008,2009 Paolo Redaelli

-- eiffel-gcc-xml  is free software: you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation, either version 2 of the License, or (at your option)
-- any later version.

-- eiffel-gcc-xml is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-- more details.

-- You should have received a copy of the GNU General Public License along with
-- this program.  If not, see <http://www.gnu.org/licenses/>.
