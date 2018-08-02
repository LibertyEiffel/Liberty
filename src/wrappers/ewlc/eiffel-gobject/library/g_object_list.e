note
	description: "."
	copyright: "[
					Copyright (C) 2008-2018: Paolo Redaelli
					
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

class G_OBJECT_LIST [ITEM->G_OBJECT]
	-- A G_LIST variant, specific for G_OBJECT with proper memory
	-- handling.

inherit 
	G_LIST[ITEM]
	G_OBJECT_FACTORY[ITEM] undefine fill_tagged_out_memory end

create {ANY} make, from_external_pointer

end -- class G_OBJECT_LIST
