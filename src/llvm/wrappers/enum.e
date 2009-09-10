indexing
	description: "A generic C enumeration"
	copyright: "[
			]"



deferred class ENUM
	-- A wrapper for an enumeration

inherit
   ANY
      undefine
         default_create
      end

feature 
	is_valid: BOOLEAN is 
			-- Is the value of the enumeration valid?
		do
			Result := is_valid_value(value)
		end

		
feature {WRAPPER_HANDLER}
	value: INTEGER
			-- The current value of the enumeration.

	set_value (a_value: INTEGER) is
		require
         is_valid_value(a_value)
		do
			value:=a_value
		end

	is_valid_value (a_value: INTEGER): BOOLEAN is
			-- Can `a_value' be used in a `set_value' feature call?
		deferred
		end

invariant is_valid
end -- class ENUM

-- Copyright (C) 2009 Paolo Redaelli
-- 
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 3 of
-- the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA

