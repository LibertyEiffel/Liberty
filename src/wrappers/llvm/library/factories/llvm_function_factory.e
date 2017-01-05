deferred class LLVM_FUNCTION_FACTORY
	-- A factory of LLVM_FUNCTIONs

inherit 
	WRAPPER_FACTORY[LLVM_FUNCTION] 
		rename 
			wrapper as function_wrapper,
			wrapper_or_void as function_wrapper_or_void
		end
insert 
	CORE_EXTERNALS 
	EXCEPTIONS undefine copy, is_equal end 

feature {WRAPPER, WRAPPER_HANDLER}
	function_wrapper (a_pointer: POINTER): LLVM_FUNCTION
		-- The LLVM_FUNCTION for `a_pointer' of the fittest type.
	do
		create Result.from_external_pointer(a_pointer)
	end
end -- class LLVM_FUNCTION_FACTORY

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

