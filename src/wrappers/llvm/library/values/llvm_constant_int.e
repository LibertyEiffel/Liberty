class LLVM_CONSTANT_INT
	-- An integer constant

inherit LLVM_CONSTANT
create {ANY} integer_32, from_integer, from_string
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature {ANY} -- Creation
	integer_32 (a_value: INTEGER_32)
		-- Creates a 32-bit integer constant with `a_value'. 

		-- Note: sign-extend is assumed to be 1. See `from_integer'
	require non_negative: a_value>=0
	do
		handle:=llvmconst_int(llvmint32type,a_value.to_natural_64,1)
	end

	from_integer (a_type: LLVM_INTEGER_TYPE; a_value: NATURAL_64; a_sign_extend: INTEGER_32)
		-- Create an integer constant of `a_type' with `a_value'; TODO: what's `a_sign_extend'?
	require a_type/=Void
	do
		handle:=llvmconst_int(a_type.handle,a_value,a_sign_extend)
	end

	from_string (a_type: LLVM_INTEGER_TYPE; a_text: ABSTRACT_STRING; a_radix: CHARACTER)
		-- Create an integer constant of `a_type' from `a_text' with `a_radix'.

		-- TODO: C API also offers "llvmconst_int_of_string_and_size" that could be better suited to Eiffel STRINGs.
	require 
		a_type/=Void; 
		a_text/=Void
		-- Note: an eventual "a_text.is_integer" or "a_text.is_number" does NOT hold because those are limited to 32-64 bits while LLVM integers may be far greater.
	do
		handle := llvmconst_int_of_string(a_type.handle,a_text.to_external,a_radix)
	end

end -- class LLVM_CONSTANT_INT
-- Copyright 2009 Paolo Redaelli

-- This file is part of LLVM wrappers for Liberty Eiffel.
--
-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--

