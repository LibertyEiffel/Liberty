deferred class LLVM_VALUES_FACTORY
	-- Commodity features to get new LLVM_VALUE objects
insert 
	LLVM_C_TYPES
feature {ANY} -- Commodity features
	new_bool (a_boolean: BOOLEAN): LLVM_CONSTANT_INT
		do
			create Result.from_integer(bool,a_boolean.to_integer.to_natural_64, 0)
		ensure Result/=Void -- Result.type.is_equal(bool)
		end
end -- class LLVM_VALUES_FACTORY

-- Copyright (C) 2009-2018: ,2010,2013 Paolo Redaelli - 2013 Cyril Adrian 

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
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.-- This file is part of LLVM wrappers for Liberty Eiffel.
--

