class LLVM_CONSTANT_FP
	-- A constant floating point.

inherit LLVM_CONSTANT

insert CORE_EXTERNALS

create {ANY} from_real, from_string
create {WRAPPER, WRAPPER_HANDLER} from_external_pointer

feature {ANY} -- Creation 
	from_real (a_type: LLVM_REAL_TYPE; a_value: REAL_64)
		-- Create a floating point constant of `a_type' with `a_value'
	require a_type/=Void
	do
		handle := llvmconst_real(a_type.handle,a_value)
	end

	from_string (a_type: LLVM_REAL_TYPE; a_text: ABSTRACT_STRING)
		-- Create a floating point constant of `a_type' parsing `a_text'

		-- TODO: "llvmconst_real_of_string_and_size" may be better suited to Eiffel
	require 
		a_type/=Void
		a_text/=Void
	do
		handle := llvmconst_real_of_string(a_type.handle, a_text.to_external)
	end
end -- class LLVM_CONSTANT_FP
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

