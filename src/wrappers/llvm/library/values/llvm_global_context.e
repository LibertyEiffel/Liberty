class LLVM_GLOBAL_CONTEXT
	-- The global context of LowLevelVirtualMachine singleton.
inherit LLVM_CONTEXT undefine copy, is_equal redefine default_create end 
insert SINGLETON redefine default_create end 

create {ANY}  default_create
feature {ANY}
	default_create is
		do
			handle:=llvmget_global_context
		end
end -- class LLVM_GLOBAL_CONTEXT

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

