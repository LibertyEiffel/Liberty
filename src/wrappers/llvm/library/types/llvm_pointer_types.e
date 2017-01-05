deferred class LLVM_POINTER_TYPES
-- Commodity queries for commonly used integer types: boolean (1bit),
-- 8,16,32,64 bits and commodoty creation factory-like features
obsolete "use LLVM_C_TYPES"

insert ANY undefine copy, is_equal end
feature {ANY} --
   pointer(a_type: LLVM_TYPE): LLVM_POINTER_TYPE
         -- The type of a pointer to `a_type'; i.e. pointer(int_32) represents "int*".
      require a_type/=Void
      do
         create Result.make(a_type)
      ensure Result/=Void
      end
end -- class LLVM_POINTER_TYPES

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
