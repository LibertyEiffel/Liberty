class LLVM_CONST_STRING 
	-- An LLVM constant string value.

	-- LLVM allows strings to be null-terminated and not-null-terminated. 
	
	-- Currently only null-terminated strings are supported.
	
	-- TODO: Provide access to non-null-terminated strings.
inherit LLVM_VALUE

create {ANY} from_string, from_string_non_null_terminated, in_context

feature {} -- Creation
	from_string (a_text: ABSTRACT_STRING)
		-- A new NULL-terminated constant string containing `a_text'. 
	require text_non_void: a_text /= Void
	do
		from_external_pointer(llvmconst_string(a_text.to_external, (a_text.count+1).to_natural_32, 1))
		-- Note: the meaning of the underlying argument dontnullterminate - here set to 1 - seems to be the opposite of what I understood.	
	end


	from_string_non_null_terminated (a_text: ABSTRACT_STRING)
		-- A new non NULL-terminated constant string containing `a_text'.  
	require text_non_void: a_text /= Void
	do
		from_external_pointer(llvmconst_string(a_text.to_external, (a_text.count+1).to_natural_32, 0))
		-- Note: the meaning of the underlying argument dontnullterminate - here set to 0 - seems to be the opposite of what I understood.	
	end

	in_context (a_context: LLVM_CONTEXT; a_text: ABSTRACT_STRING; do_not_null_terminate: BOOLEAN)
		-- Create a new constant string containing `a_text'.

		-- TODO: Clarify the meaning of `do_not_null_terminate'
	require 
		context_non_void: a_context/=Void
		text_non_void: a_text/=Void
	do
		from_external_pointer(llvmconst_string_in_context
		(a_context.handle, a_text.to_external, (a_text.count+1).to_natural_32, do_not_null_terminate.to_integer))
	end
end -- class LLVM_CONST_STRING

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
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--

