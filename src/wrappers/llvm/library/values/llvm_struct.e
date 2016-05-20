class LLVM_STRUCT
	-- A stucture

inherit LLVM_VALUE

insert CORE_EXTERNALS

create {WRAPPER, WRAPPER_HANDLER} from_external_pointer

create {ANY} named

feature {} -- Creatuon
	named (a_context: LLVM_CONTEXT; a_name: ABSTRACT_STRING) is
		-- Create a structure with `a_name' in `a_context'
	require a_name /= Void
	do
		from_external_pointer(llvmstruct_create_named
		(a_context.handle, a_name.to_external))
	end
end -- class LLVM_LABEL

-- Copyright 2013 Paolo Redaelli

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

