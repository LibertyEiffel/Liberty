note
	description: "XMLRPC values"
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

class XMLRPC_VALUE

inherit
	C_STRUCT redefine from_external_pointer end
	MIXED_MEMORY_HANDLING undefine from_external_pointer end

insert
	XMLRPC_VALUE_EXTERNALS

create {ANY} from_external_pointer

feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <xmlrpc-c/base.h>"
		alias "sizeof (xmlrpc_value)"
		end

feature {ANY} -- Creation

	from_external_pointer (a_pointer: POINTER)
		do
			set_shared
			{C_STRUCT} Precursor (a_pointer)
		end

feature {ANY}

	type: INTEGER
		require
			handle.is_not_null
		do
			Result := xmlrpc_value_type (handle)
		ensure
			is_valid_xmlrpc_value_type (Result)
		end

	is_value_int: BOOLEAN
		do
			Result := type = xmlrpc_value_int
		end

	is_value_bool: BOOLEAN
		do
			Result := type = xmlrpc_value_bool
		end

	is_value_double: BOOLEAN
		do
			Result := type = xmlrpc_value_double
		end

	is_value_datetime: BOOLEAN
		do
			Result := type = xmlrpc_value_datetime
		end

	is_value_string: BOOLEAN
		do
			Result := type = xmlrpc_value_string
		end

	is_value_base64: BOOLEAN
		do
			Result := type = xmlrpc_value_base64
		end

	is_value_array: BOOLEAN
		do
			Result := type = xmlrpc_value_array
		end

	is_value_struct: BOOLEAN
		do
			Result := type = xmlrpc_value_struct
		end

	is_value_c_ptr: BOOLEAN
		do
			Result := type = xmlrpc_value_c_ptr
		end

	is_value_nil: BOOLEAN
		do
			Result := type = xmlrpc_value_nil
		end

	is_value_dead: BOOLEAN
		do
			Result := type = xmlrpc_value_dead
		end

feature {ANY} -- Convertion to different value types

	value_int: XMLRPC_VALUE_INT
		require
			is_value_int
		do
			create Result.from_value (Current)
		end

	value_bool: XMLRPC_VALUE_BOOL
		require
			is_value_bool
		do
			create Result.from_value (Current)
		end

--	value_double: XMLRPC_VALUE_DOUBLE is
--		require
--			is_value_double
--		do
--			create Result.from_value (Current)
--		end
--
--	value_datetime: XMLRPC_VALUE_DATETIME is
--		require
--			is_value_datetime
--		do
--			create Result.from_value (Current)
--		end
--
--	value_string: XMLRPC_VALUE_STRING is
--		require
--			is_value_string
--		do
--			create Result.from_value (Current)
--		end
--
--	value_base64: XMLRPC_VALUE_BASE64 is
--		require
--			is_value_base64
--		do
--			create Result.from_value (Current)
--		end

	value_array: XMLRPC_VALUE_ARRAY
		require
			is_value_array
		do
			create Result.from_value (Current)
		end

--	value_struct: XMLRPC_VALUE_STRUCT is
--		require
--			is_value_struct
--		do
--			create Result.from_value (Current)
--		end
--
--	value_c_ptr: XMLRPC_VALUE_C_PTR is
--		require
--			is_value_c_ptr
--		do
--			create Result.from_value (Current)
--		end
--
--	value_nil: XMLRPC_VALUE_NIL is
--		require
--			is_value_nil
--		do
--			create Result.from_value (Current)
--		end
--
--	value_dead: XMLRPC_VALUE_DEAD is
--		require
--			is_value_dead
--		do
--			create Result.from_value (Current)
--		end

end -- class XMLRPC_VALUE
