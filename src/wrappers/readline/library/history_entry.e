class HISTORY_ENTRY
	-- An entry of the history of read line library.

inherit 
	C_STRUCT
	C_OWNED

insert
	HIST_ENTRY_STRUCT

create {READ_LINE_HISTORY} from_external_pointer
feature {ANY} 
	line: FIXED_STRING
		do
			create Result.from_external(hist_entry_struct_get_line(handle))
		ensure not_void: Result/=Void
		end

	timestamp: STRING
		local p: POINTER
		do
			p := hist_entry_struct_get_timestamp(handle)
			if p.is_not_null then
				create Result.from_external(p)
			end
		end

	--  -- Function: time_t history_get_time (HIST_ENTRY *entry)
--      Return the time stamp associated with the history entry ENTRY.
	
end

-- Liberty Eiffel wrappers for GNU readline library Copyright (C) 2010-2017: Paolo Redaelli, Cyril Adrian 
-- 
-- The GNU C Library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
-- 
-- The GNU C Library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with the GNU C Library; if not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
-- 02110-1301 USA

