note
	description: "XMLRPC environment"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006-2018: Soluciones Informaticas Libres S.A. (Except)
					
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

class XMLRPC_ENV

inherit
	C_STRUCT
	EIFFEL_OWNED redefine dispose end

insert
	XMLRPC_ENV_EXTERNALS

create {ANY}
	make

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <xmlrpc-c/base.h>"
		alias "sizeof (xmlrpc_env)"
		end

feature {} -- Creation

	make
		do
			allocate
			xmlrpc_env_init (handle)
		end

feature {ANY} -- Destruction

	dispose
		do
			xmlrpc_env_clean (handle)
			Precursor
		end

feature {ANY}

	fault_occurred: BOOLEAN
		do
			Result := xmlrpc_env_fault_occurred (handle).to_boolean
		end

	fault_code: INTEGER
		do
			Result := xmlrpc_env_fault_code (handle)
		ensure
			is_valid_xmlrpc_error_type (Result)
		end

	fault_string: STRING
		local
			res_ptr: POINTER
		do
			res_ptr := xmlrpc_env_fault_string (handle)
			if res_ptr.is_not_null then
				create Result.from_external (res_ptr)
			end
		end

end -- class XMLRPC_ENV
