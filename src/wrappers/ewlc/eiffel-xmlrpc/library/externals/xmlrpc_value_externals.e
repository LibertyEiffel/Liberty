note
	description: "External calls for XMLRPC value"
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

deferred class XMLRPC_VALUE_EXTERNALS

inherit ANY undefine is_equal, copy end



insert
	XMLRPC_VALUE_TYPE

feature {}

	xmlrpc_value_type (val: POINTER): INTEGER
		external "C use <xmlrpc-c/base.h>"
		ensure
			is_valid_xmlrpc_value_type (Result)
		end

	xmlrpc_decref (val: POINTER)
		external "C use <xmlrpc-c/base.h>"
		alias "xmlrpc_DECREF"
		end

feature {} -- Booleans

	xmlrpc_bool_new (an_env_ptr: POINTER; a_bool: INTEGER): POINTER
			--  xmlrpc_value *
			--  xmlrpc_bool_new(xmlrpc_env * const envP,
			--	                xmlrpc_bool  const boolValue);
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

	xmlrpc_read_bool (an_env_ptr, val, res_ptr: POINTER)
			-- void
			-- xmlrpc_read_bool(xmlrpc_env *         const envP,
			--                  const xmlrpc_value * const valueP,
			--                  xmlrpc_bool *        const boolValueP);
		require
			an_env_ptr.is_not_null
			val.is_not_null
			res_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

feature {} -- Integers

	xmlrpc_int_new (an_env_ptr: POINTER; an_int: INTEGER): POINTER
			-- xmlrpc_value *
			-- xmlrpc_int_new(xmlrpc_env * const envP,
			--                int          const intValue);
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

	xmlrpc_read_int (an_env_ptr, val, res_ptr: POINTER)
			-- void
			-- xmlrpc_read_int(xmlrpc_env *         const envP,
			--                 const xmlrpc_value * const valueP,
			--                 int *                const intValueP);
		require
			an_env_ptr.is_not_null
			val.is_not_null
			res_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

feature {} -- Arrays

		-- Creating An Array
		-- xmlrpc_array_new() creates an empty array xmlrpc_value.
		
		-- xmlrpc_array_append_item() adds an item to the end of an
		-- array.
		
		-- xmlrpc_array_set_item() changes the value of an existing
		-- element of an array, which you identify by index.
		
		-- These functions create references to the xmlrpc_value you
		-- supply (as opposed to copying their contents), but they add to
		-- the xmlrpc_value's reference count to account for it. I.e. they
		-- do not "borrow" your reference -- you may terminate your
		-- reference as soon as the function returns.
		
		-- xmlrpc_array_new() was new in Xmlrpc-c 1.2 (April 2005).
		-- Before that, use xmlrpc_build_value() to create an array.

	xmlrpc_array_new (env_ptr: POINTER): POINTER
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_array_append_item (an_env_ptr, array, res_ptr: POINTER)
			-- extern void
			-- xmlrpc_array_append_item (xmlrpc_env   * envP,
			--                           xmlrpc_value * arrayP,
			--                           xmlrpc_value * valueP);
		require
			an_env_ptr.is_not_null
			array.is_not_null
			res_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

		-- Interpreting An Array
		
		-- You can access an element of an array directly (by index)
		-- with xmlrpc_array_read_item(). This is what you need if you
		-- don't know until run time how many elements the array has. This
		-- fails with a XMLRPC_INDEX_ERROR fault code if the array isn't
		-- large enough to contain an element with that index. Use
		-- xmlrpc_array_size(), described above, to determine how many
		-- elements the array has.
		
		-- There is also xmlrpc_array_get_item(), but it deprecated. It
		-- was replaced by xmlrpc_array_read_item(). The main difference is
		-- that xmlrpc_array_get_item() does not acquire a reference to the
		-- value it returns.
		
		-- xmlrpc_array_read_item() was new in Xmlrpc-c 1.01 (January
		-- 2005).

end -- XMLRPC_VALUE_EXTERNALS
