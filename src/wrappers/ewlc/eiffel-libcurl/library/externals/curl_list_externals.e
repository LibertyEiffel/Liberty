note
	description: "External calls for curl lists"
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

deferred class CURL_LIST_EXTERNALS

		-- /* linked-list structure for the CURLOPT_QUOTE option (and other) */
		-- struct curl_slist {
		--   char *data;
		--   struct curl_slist *next;
		-- };

inherit ANY undefine is_equal, copy end

feature {} -- Externals

	curl_slist_free_all (list: POINTER)
			-- void curl_slist_free_all(struct curl_slist *);
		external "C use <curl/curl.h>"
		end

	curl_slist_append(list: POINTER; str: POINTER): POINTER
			-- struct curl_slist *curl_slist_append(struct curl_slist *,
			--                                      const char *);
		external "C use <curl/curl.h>"
		end

end -- class CURL_LIST_EXTERNALS
