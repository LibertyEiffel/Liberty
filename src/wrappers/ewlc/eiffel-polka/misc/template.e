note
	description: ""
	copyright: "[
					Copyright (C) 2001-2017: Natalia B. Bidart
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

class 

inherit
	C_STRUCT

insert
	_EXTERNALS

create {ANY} dummy,

feature {} -- Creation

	

feature {} -- size

	struct_size: INTEGER
		external "C inline use <polka/.h>"
		alias "sizeof ()"
		end

end -- class 
