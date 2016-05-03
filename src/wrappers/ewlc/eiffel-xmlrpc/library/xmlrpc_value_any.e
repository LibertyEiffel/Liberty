note
	description: "XMLRPC value any"
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

class XMLRPC_VALUE_ANY

inherit
	C_STRUCT
	MIXED_MEMORY_HANDLING 

insert
	XMLRPC_VALUE_EXTERNALS

feature {ANY} -- size

	struct_size: INTEGER is
		external "C inline use <xmlrpc-c/base.h>"
		alias "sizeof (xmlrpc_value)"
		end

feature {} -- Creation

	from_value (a_value: XMLRPC_VALUE) is
		require
			a_value /= Void
		do
			create env.make
			if is_valid then
				value := a_value
				from_external_pointer (value.handle)
				is_shared := True
			end
		end

feature {} -- Representation

	env: XMLRPC_ENV

	value: XMLRPC_VALUE
		-- This feature is needed to ensure correct garbage collection.
		-- As this class (and all XMLRPC_VALUE_* classes) are C_STRUCTs,
		-- we shouldn't release the XMLRPC_VALUE until all XMLRPC_VALUE_*s are
		-- disposed.

feature {ANY} -- Representation

	is_valid: BOOLEAN is
		require
			env /= Void
			env.handle.is_not_null
		do
			Result := not env.fault_occurred
		end

feature {} -- Destruction

	dispose is
		do
			unref
			Precursor
		end

	unref is
		require
			handle.is_not_null
		do
			xmlrpc_decref (handle)
		end

invariant

	--value /= Void
	env /= Void

end -- class XMLRPC_VALUE_ANY
