indexing
	description: "Gnome Data Access geometric point."
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

class GDA_GEOMETRIC_POINT

inherit C_STRUCT

insert GDA_GEOMETRIC_POINT_STRUCT

creation dummy, make, from_external_pointer

feature 
	x: REAL is
		do 
			Result := get_x(handle)
		end
	y: REAL is
		do 
			Result := get_y(handle)
		end
feature -- TODO: setters

end -- class FOO
