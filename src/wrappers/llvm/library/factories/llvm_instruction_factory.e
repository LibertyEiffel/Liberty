deferred class LLVM_INSTRUCTION_FACTORY
	-- A factory of values

inherit WRAPPER_FACTORY[LLVM_INSTRUCTION]
insert	
	CORE_EXTERNALS 
	EXCEPTIONS undefine copy, is_equal end
feature {ANY} 
	wrapper (p: POINTER): LLVM_INSTRUCTION is
		do
			not_yet_implemented -- The implementation will follow LLVM_VALUE_FACTORY style
		end
end -- class LLVM_INSTRUCTION_FACTORY

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

