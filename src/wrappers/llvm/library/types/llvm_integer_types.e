deferred class LLVM_INTEGER_TYPES
-- Commodity queries for commonly used integer types: boolean (1bit),
-- 8,16,32,64 bits and commodoty creation factory-like features
obsolete "use LLVM_C_TYPES"

insert ANY undefine copy, is_equal end

feature {ANY} -- Shared integer types
   bool: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
   int_8: LLVM_INTEGER_TYPE is once create Result.with_1_bit end
   int_16: LLVM_INTEGER_TYPE is once create Result.with_8_bits end
   int_32: LLVM_INTEGER_TYPE is once create Result.with_32_bits end
   int_64: LLVM_INTEGER_TYPE is once create Result.with_64_bits end

end -- class LLVM_INTEGER_TYPES

-- Copyright (C) 2009-2017: ,2010,2013 Paolo Redaelli - 2013 Cyril Adrian 

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
