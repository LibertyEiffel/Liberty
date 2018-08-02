note
	description: "Curl form add codes"
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

deferred class CURL_FORM_ADD

		-- typedef enum {
		--   CURL_FORMADD_OK, /* first, no error */
		-- 
		--   CURL_FORMADD_MEMORY,
		--   CURL_FORMADD_OPTION_TWICE,
		--   CURL_FORMADD_NULL,
		--   CURL_FORMADD_UNKNOWN_OPTION,
		--   CURL_FORMADD_INCOMPLETE,
		--   CURL_FORMADD_ILLEGAL_ARRAY,
		--   CURL_FORMADD_DISABLED, /* libcurl was built with this disabled */
		-- 
		--   CURL_FORMADD_LAST /* last */
		-- } CURLFORMcode;

inherit ANY undefine is_equal, copy end

feature {}

	is_valid_curl_form_add (a_form_add_code: INTEGER) : BOOLEAN
		do
			Result := a_form_add_code.in_range (curl_form_add_ok, curl_form_add_last)
		end

	curl_form_add_ok: INTEGER
			-- on success
		external "C macro use <curl/curl.h>"
		alias "CURL_FORMADD_OK"
		end

	curl_form_add_last: INTEGER
			-- last
		external "C macro use <curl/curl.h>"
		alias "CURL_FORMADD_LAST"
		end

			-- CURL_FORMADD_MEMORY         if the FormInfo allocation fails
			-- CURL_FORMADD_OPTION_TWICE   if one option is given twice for one Form
			-- CURL_FORMADD_NULL           if a null pointer was given for a char
			-- CURL_FORMADD_MEMORY         if the allocation of a FormInfo struct failed
			-- CURL_FORMADD_UNKNOWN_OPTION if an unknown option was used
			-- CURL_FORMADD_INCOMPLETE     if the some FormInfo is not complete (or error)
			-- CURL_FORMADD_MEMORY         if a HttpPost struct cannot be allocated
			-- CURL_FORMADD_MEMORY         if some allocation for string copying failed.
			-- CURL_FORMADD_ILLEGAL_ARRAY  if an illegal option is used in an array

end -- class CURL_FORM_ADD
