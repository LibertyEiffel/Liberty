note
	description: "Curl form codes"
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

deferred class CURL_FORM
		-- These are the options to be used to set these properties in
		-- the parts that are wanted to add to the post.

inherit ANY undefine is_equal, copy end

feature {}

	is_valid_curl_form (a_form_code: INTEGER) : BOOLEAN
		do
			Result := (a_form_code = curl_form_copy_name or else
			           a_form_code = curl_form_ptr_name or else
			           a_form_code = curl_form_copy_contents or else
			           a_form_code = curl_form_end)
		end

	curl_form_copy_name: INTEGER
			-- followed by a string which provides the name of this part. libcurl
			-- copies the string so your application doesn't need to keep it around
			-- after this function call. If the name isn't null terminated, or if you'd
			-- like it to contain zero bytes, you must set its length with
			-- CURLFORM_NAMELENGTH. The copied data will be freed by curl_formfree(3).
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_COPYNAME"
		end

	curl_form_ptr_name: INTEGER
			-- followed by a string which provides the name of this part. libcurl will
			-- use the pointer and refer to the data in your application, so you must
			-- make sure it remains until curl no longer needs it. If the name isn't
			-- null terminated, or if you'd like it to contain zero bytes, you must set
			-- its length with CURLFORM_NAMELENGTH.
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_PTRNAME"
		end

	curl_form_copy_contents: INTEGER
			-- followed by a pointer to the contents of this part, the actual data to
			-- send away. libcurl copies the provided data, so your application doesn't
			-- need to keep it around after this function call. If the data isn't null
			-- terminated, or if you'd like it to contain zero bytes, you must set the
			-- length of the name with CURLFORM_CONTENTSLENGTH. The copied data will be
			-- freed by curl_formfree(3).
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_COPYCONTENTS"
		end

	curl_form_ptr_contents: INTEGER
			-- followed by a pointer to the contents of this part, the actual data to
			-- send away. libcurl will use the pointer and refer to the data in your
			-- application, so you must make sure it remains until curl no longer needs
			-- it. If the data isn't null terminated, or if you'd like it to contain
			-- zero bytes, you must set its length with CURLFORM_CONTENTSLENGTH.
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_PTRCONTENTS"
		end

	curl_form_contents_length: INTEGER
			-- followed by a long giving the length of the contents.
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_CONTENTSLENGTH"
		end

	curl_form_file_content: INTEGER
			-- followed by a filename, causes that file to be read and its contents
			-- used as data in this part. This part does not automatically become a
			-- file upload part simply because its data was read from a file.
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_FILECONTENT"
		end

	curl_form_file: INTEGER
			-- followed by a filename, makes this part a file upload part. It sets the
			-- filename field to the basename of the provided filename, it reads the
			-- contents of the file and passes them as data and sets the content-type
			-- if the given file match one of the internally known file extensions. For
			-- CURLFORM_FILE the user may send one or more files in one part by
			-- providing multiple CURLFORM_FILE arguments each followed by the filename
			-- (and each CURLFORM_FILE is allowed to have a CURLFORM_CONTENTTYPE).
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_FILE"
		end

	curl_form_content_type: INTEGER
			-- is used in combination with CURLFORM_FILE. Followed by a pointer to a
			-- string which provides the content-type for this part, possibly instead
			-- of an internally chosen one.
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_CONTENTTYPE"
		end

	curl_form_file_name: INTEGER
			-- is used in combination with CURLFORM_FILE. Followed by a pointer to a
			-- string, it tells libcurl to use the given string as the filename in the
			-- file upload part instead of the actual file name.
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_FILENAME"
		end

			-- CURLFORM_BUFFER
			-- 
			-- is used for custom file upload parts without use of CURLFORM_FILE. It
			-- tells libcurl that the file contents are already present in a buffer.
			-- The parameter is a string which provides the filename field in the
			-- content header.
			-- 
			-- CURLFORM_BUFFERPTR
			-- 
			-- is used in combination with CURLFORM_BUFFER. The parameter is a pointer
			-- to the buffer to be uploaded. This buffer must not be freed until after
			-- curl_easy_cleanup(3) is called. You must also use CURLFORM_BUFFERLENGTH
			-- to set the number of bytes in the buffer.
			-- 
			-- CURLFORM_BUFFERLENGTH
			-- 
			-- is used in combination with CURLFORM_BUFFER. The parameter is a long
			-- which gives the length of the buffer.
			-- 
			-- CURLFORM_ARRAY
			-- 
			-- Another possibility to send options to curl_formadd() is the
			-- CURLFORM_ARRAY option, that passes a struct curl_forms array pointer as
			-- its value. Each curl_forms structure element has a CURLformoption and a
			-- char pointer. The final element in the array must be a CURLFORM_END. All
			-- available options can be used in an array, except the CURLFORM_ARRAY
			-- option itself! The last argument in such an array must always be
			-- CURLFORM_END.
			-- 
			-- CURLFORM_CONTENTHEADER
			-- 
			-- specifies extra headers for the form POST section. This takes a
			-- curl_slist prepared in the usual way using curl_slist_append and appends
			-- the list of headers to those libcurl automatically generates. The list
			-- must exist while the POST occurs, if you free it before the post
			-- completes you may experience problems.
			-- 
			-- When you've passed the HttpPost pointer to curl_easy_setopt(3) (using
			-- the CURLOPT_HTTPPOST option), you must not free the list until after
			-- you've called curl_easy_cleanup(3) for the curl handle.

	curl_form_end: INTEGER
		external "C macro use <curl/curl.h>"
		alias "CURLFORM_END"
		end

end -- class CURL_FORM
