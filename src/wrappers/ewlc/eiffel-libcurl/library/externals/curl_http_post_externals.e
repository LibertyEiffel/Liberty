note
	description: "External calls for curl http structure"
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

deferred class CURL_HTTP_POST_EXTERNALS

		-- struct curl_httppost {
		--   struct curl_httppost *next;       /* next entry in the list */
		--   char *name;                       /* pointer to allocated name */
		--   long namelength;                  /* length of name length */
		--   char *contents;                   /* pointer to allocated data contents */
		--   long contentslength;              /* length of contents field */
		--   char *buffer;                     /* pointer to allocated buffer contents */
		--   long bufferlength;                /* length of buffer field */
		--   char *contenttype;                /* Content-Type */
		--   struct curl_slist* contentheader; /* list of extra headers for this form */
		--   struct curl_httppost *more;       /* if one field name has more than one
		--                                        file, this link should link to following
		--                                        files */
		--   long flags;                       /* as defined below */
		-- #define HTTPPOST_FILENAME (1< <0)    /* specified content is a file name */
		-- #define HTTPPOST_READFILE (1< <1)    /* specified content is a file name */
		-- #define HTTPPOST_PTRNAME (1< <2)     /* name is only stored pointer
		--                                        do not free in formfree */
		-- #define HTTPPOST_PTRCONTENTS (1< <3) /* contents is only stored pointer
		--                                        do not free in formfree */
		-- #define HTTPPOST_BUFFER (1< <4)      /* upload file from buffer */
		-- #define HTTPPOST_PTRBUFFER (1< <5)   /* upload file from pointer contents */
		-- 
		--   char *showfilename;               /* The file name to show. If not set, the
		--                                        actual file name will be used (if this
		--                                        is a file part) */
		-- };

inherit ANY undefine is_equal, copy end

insert
	CURL_FORM
	CURL_FORM_ADD

feature {} -- Externals

	curl_formfree (a_ptr: POINTER) is
			-- void curl_formfree(struct curl_httppost * form);
		external "C use <curl/curl.h>"
		end

	curl_formadd (post, last: POINTER; name_code: INTEGER; name: POINTER;
			      content_code: INTEGER; content: POINTER; end_code: INTEGER): INTEGER is
			-- CURLFORMcode curl_formadd(struct curl_httppost ** firstitem,
			--                           struct curl_httppost ** lastitem, ...);
		require
			is_valid_curl_form (name_code)
			is_valid_curl_form (content_code)
			end_code = curl_form_end
		external "C use <curl/curl.h>"
		ensure
			is_valid_curl_form_add (Result)
		end

end -- class CURL_HTTP_POST_EXTERNALS
