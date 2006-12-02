indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class GDA_TIME

inherit C_STRUCT

insert GDA_TIME_STRUCT

creation make, from_external_pointer

feature 
	hour: INTEGER_16 is
			-- TODO: should be NATURAL_16 
		do
			Result := get_hour(handle)
		ensure positive: Result>=0
		end


	minute: INTEGER_16 is
			-- TODO: should be NATURAL_16 
		do
			Result := get_minute(handle)
		ensure positive: Result>=0
		end

	second: INTEGER_16 is
			-- TODO: should be NATURAL_16 
		do
			Result := get_second(handle)
		ensure positive: Result>=0
		end

	timezone: INTEGER is
		do
			Result := get_timezone(handle)
		end

feature -- TODO: setters

end -- class GDA_TIME
