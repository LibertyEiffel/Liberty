deferred class LLVM_C_TYPES
	-- Access to the LLVM_TYPEs representing basic C types.

insert ANY undefine copy, is_equal end

feature {ANY}
	-- Commodity queries for commonly used integer types: boolean (1bit),
	-- 8,16,32,64 bits and commodoty creation factory-like features

	bool: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
	int_8: LLVM_INTEGER_TYPE is once create Result.with_8_bits end
	int_16: LLVM_INTEGER_TYPE is once create Result.with_16_bits end
	int_32: LLVM_INTEGER_TYPE is once create Result.with_32_bits end
	int_64: LLVM_INTEGER_TYPE is once create Result.with_64_bits end 

feature {ANY} -- Common real types
	real_32: LLVM_REAL_TYPE is once create Result.as_float end 
	real_64: LLVM_REAL_TYPE is once create Result.as_double end 
	real_80: LLVM_REAL_TYPE is once create Result.as_x86 end 
	real_128: LLVM_REAL_TYPE is once create Result.with_128bits end

feature {ANY} -- 8-bit character
	-- TODO: use a portable way to discover whenever "char" is signed or not. If it will be useful.
	char: LLVM_INTEGER_TYPE is once create Result.with_8_bits end 
	string, string_type: LLVM_POINTER_TYPE is once create Result.make(char) end 

feature {ANY} -- Pointers
	pointer(a_type: LLVM_TYPE): LLVM_POINTER_TYPE
		-- The type of a pointer to `a_type'; i.e. pointer(int_32) represents "int*".
	require a_type/=Void
	do
		create Result.make(a_type)
	ensure Result/=Void
	end
end -- class LLVM_C_TYPES

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

