note
	description: "Curl http version constants"
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

deferred class CURL_HTTP_VERSION

inherit ANY undefine is_equal, copy end

feature {} -- Validator

	is_valid_curl_http_version (a_http_version: INTEGER) : BOOLEAN
		do
			Result := (a_http_version = curl_http_version_none or else
			           a_http_version = curl_http_version_1_0 or else
			           a_http_version = curl_http_version_1_1)
		end

feature {}

	curl_http_version_none: INTEGER
			-- We don't care about what version the library uses. libcurl will use
			-- whatever it thinks fit.
		external "C macro use <curl/curl.h>"
		alias "CURL_HTTP_VERSION_NONE"
		end

	curl_http_version_1_0: INTEGER
			-- Enforce HTTP 1.0 requests.
		external "C macro use <curl/curl.h>"
		alias "CURL_HTTP_VERSION_1_0"
		end

	curl_http_version_1_1: INTEGER
			-- Enforce HTTP 1.1 requests.
		external "C macro use <curl/curl.h>"
		alias "CURL_HTTP_VERSION_1_1"
		end

end -- class CURL_HTTP_VERSION
