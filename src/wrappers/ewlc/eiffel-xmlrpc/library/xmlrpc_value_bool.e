note
	description: "XMLRPC value bool"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006-2017: Soluciones Informaticas Libres S.A. (Except)
					
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

class XMLRPC_VALUE_BOOL

inherit
	XMLRPC_VALUE_ANY

create {ANY} make, from_value

feature {} -- Creation

	make (a_bool: BOOLEAN)
		local
			res_ptr: POINTER
		do
			create env.make
			res_ptr := xmlrpc_int_new (env.handle, a_bool.to_integer)
			if is_valid then
				check res_ptr.is_not_null end
				from_external_pointer (res_ptr)
			end
		end

feature {ANY} -- Operations

	read: BOOLEAN
		do
			xmlrpc_read_bool (env.handle, handle, $Result)
		end

end -- class XMLRPC_VALUE_BOOL
