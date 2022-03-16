note
	description: "Curl list"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006-2022: Soluciones Informaticas Libres S.A. (Except)
					
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

class CURL_LIST

inherit
	C_STRUCT undefine free redefine from_external_pointer end
	EIFFEL_OWNED undefine free redefine from_external_pointer end

insert CURL_LIST_EXTERNALS rename curl_slist_free_all as free end

create {ANY}
	null, from_external_pointer

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <curl/curl.h>"
		alias "sizeof (struct curl_slist)"
		end

feature {} -- Creation

	null
		do
			is_valid := True
		end

feature {WRAPPER, WRAPPER_HANDLER}

	from_external_pointer (a_ptr: POINTER)
		do
			if a_ptr.is_not_null then
				handle := a_ptr
				is_valid := True
			end
		end

	-- feature {} -- Destruction

	--	free (a_ptr: POINTER) is
	--			-- `free' removes all traces of a previously
	--			-- built curl_slist linked list.
	--		do
	--			curl_slist_free_all (a_ptr)
	--		end

feature {ANY}  -- Representation

	is_valid: BOOLEAN

feature {ANY}  -- Operations

	append (str: STRING)
			-- `append' appends a specified string to a linked list of
			-- strings. The specified string has been appended when
			-- this function returns. `str' is copied.
		require
			str /= Void
		local
			c_ptr: POINTER
		do
			c_ptr := curl_slist_append (handle, str.to_external)
			if c_ptr.is_not_null then
				handle := c_ptr
			else
				is_valid := False
			end
		end

end -- class CURL_LIST
