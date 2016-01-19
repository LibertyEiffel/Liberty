class LLVM_ARGUMENT
	-- An incoming formal argument to a LLVM_FUNCTION. An argument is a very
	-- simple LLVM_VALUE. It is essentially a named (optional) type. When used
	-- in the body of a function, it represents the value of the actual
	-- argument the function was called with.

inherit LLVM_VALUE

feature {ANY} 
	add_attribute (an_attribute: LLVMATTRIBUTE_ENUM) is
		-- Add `an_attribute' to Current
	do
		llvmadd_attribute(handle,an_attribute.value)
	end

	remove_attribute (an_attribute: LLVMATTRIBUTE_ENUM) is
	do
		llvmremove_attribute(handle,an_attribute.value)
	end

	set_alinment (an_alignment: NATURAL_32) is
	do
		llvmset_param_alignment(handle,an_alignment)
	end

end -- class LLVM_ARGUMENT

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

