class LLVM_SWITCH_INST
	-- A multiway switch instruction.

inherit LLVM_TERMINATOR_INST
insert CORE_EXTERNALS
create {LLVM_BUILDER} from_external_pointer
feature {ANY} 
	add_case (a_value: LLVM_VALUE; a_destionation: LLVM_BASIC_BLOCK)
		-- Add to Current the case for `a_value' that will execute `a_destionation'
	require 
		a_value/=Void
		a_destionation/=Void
	do
		llvmadd_case(handle,a_value.handle,a_destionation.handle)
	end
end -- class LLVM_SWITCH_INST

-- Copyright (C) 2009-2022: Paolo Redaelli
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

