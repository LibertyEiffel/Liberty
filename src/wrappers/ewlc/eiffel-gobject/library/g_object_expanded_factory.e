note
	description: "An expanded G_OBJECT factory, useful as a local feature in classes that generates many kind of wrapper objects."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli
					
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

expanded class G_OBJECT_EXPANDED_FACTORY[ITEM -> G_OBJECT]
	-- An expanded G_OBJECT factory, useful as a local feature in classes
	-- that generates many kind of wrapper objects.

insert 
	G_OBJECT_FACTORY[ITEM]
	ANY

create {ANY} default_create

end -- class G_OBJECT_EXPANDED_FACTORY
