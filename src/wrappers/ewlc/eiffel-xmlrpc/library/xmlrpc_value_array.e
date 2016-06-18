note
	description: "XMLRPC value array"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
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

class XMLRPC_VALUE_ARRAY

inherit
	XMLRPC_VALUE_ANY

create {ANY} make, from_value

feature {} -- Creation

	make
		do
			create env.make
			if is_valid then
				from_external_pointer (xmlrpc_array_new (env.handle))
			end
		end

feature {ANY} -- Operations

	add_last (val: XMLRPC_VALUE_ANY)
		do
			xmlrpc_array_append_item (env.handle, handle, val.handle)
		end

end -- class XMLRPC_VALUE_ARRAY
