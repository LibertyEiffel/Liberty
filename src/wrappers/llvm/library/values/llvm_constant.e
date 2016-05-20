deferred class LLVM_CONSTANT
	-- LLVM Constant Representation.

	-- This is an important base class in LLVM. It provides the common
	-- facilities of all constant values in an LLVM program. A constant is a
	-- value that is immutable at runtime. Functions are constants because
	-- their address is immutable. Same with global variables.

	-- All constants share the capabilities provided in this class. All
	-- constants can have a null value. They can have an operand list.
	-- Constants can be simple (integer and floating point values), complex
	-- (arrays and structures), or expression based (computations yielding a
	-- constant value composed of only certain operators and other constant
	-- values).

	-- Note that Constants are immutable (once created they never change) and
	-- are fully shared by structural equivalence. This means that two
	-- structurally equivalent constants will always have the same address.
	-- Constants are created on demand as needed and never deleted: thus
	-- clients don't have to worry about the lifetime of the objects.
inherit LLVM_USER
insert CORE_EXTERNALS
feature {ANY} 
	null_from (a_type: LLVM_TYPE) is
	-- Create a null constant of `a_type'
	require a_type/=Void
	do
		handle:=llvmconst_null(a_type.handle)
	end

	undef_from (a_type: LLVM_TYPE) is
	-- Create an undefined constant of `a_type'
	require a_type/=Void
	do
		handle:=llvmget_undef(a_type.handle)
	end

feature {ANY} -- Queries
	is_constant: BOOLEAN is 
		-- TODO: as far as I understand this feature shall belong to LLVM_VALUE. 
	do
		Result := llvmis_constant(handle).to_boolean
	end

	is_null: BOOLEAN is
		-- Is Current constant null?
	do
		Result := llvmis_null(handle).to_boolean
	end

	is_undefined: BOOLEAN is
		-- Is Current constant not defined?
	do
		Result := llvmis_undef(handle).to_boolean
	end

end -- class LLVM_CONSTANT

-- Copyright 2009,2010,2013 Paolo Redaelli - 2013 Cyril Adrian 

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

