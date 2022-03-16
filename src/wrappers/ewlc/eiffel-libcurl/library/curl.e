note
	description: "Curl main class"
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

class CURL

inherit
	C_STRUCT 
	STREAM_HANDLER
		undefine copy, is_equal end

insert
	CURL_EXTERNALS
		
create {ANY}
	make

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <curl/curl.h>"
		alias "sizeof (CURL)"
		end

feature {} -- Creation

	make
		local
			c_ptr: POINTER
		do
			c_ptr := curl_easy_init
			if c_ptr.is_not_null then
				from_external_pointer (c_ptr)
				error_code := curl_ok
			else
				error_code := curl_failed_init
			end
			
			if is_valid then
				write_callback_closure := new_curl_closure (to_pointer, $write_callback)
				if write_callback_closure.is_not_null then
					error_code := curl_ok
				else
					error_code := curl_failed_init
				end
			end
			
			if is_valid then
				read_callback_closure := new_curl_closure (to_pointer, $read_callback)
				if read_callback_closure.is_not_null then
					error_code := curl_ok
				else
					error_code := curl_failed_init
				end
			end
			
			if is_valid then
				progress_callback_closure := new_curl_progress_closure (to_pointer, $progress_callback)
				if progress_callback_closure.is_not_null then
					error_code := curl_ok
				else
					error_code := curl_failed_init
				end
			end
			
			if is_valid then
				error_code := curl_easy_setopt_pointer (handle, curl_option_write_function, c_write_callback)
			end
			if is_valid then
				error_code := curl_easy_setopt_pointer (handle, curl_option_write_data, write_callback_closure)
			end
			if is_valid then
				error_code := curl_easy_setopt_pointer (handle, curl_option_read_function, c_read_callback)
			end
			if is_valid then
				error_code := curl_easy_setopt_pointer (handle, curl_option_read_data, read_callback_closure)
			end
			if is_valid then
				error_code := curl_easy_setopt_pointer (handle, curl_option_progress_function, $progress_callback)
			end
			if is_valid then
				error_code := curl_easy_setopt_pointer (handle, curl_option_progress_data, to_pointer)
			end
		ensure
			memory_allocated: handle.is_not_null
		end

feature {} -- Destruction

	dispose
		do
			write_callback_closure := free_curl_closure (write_callback_closure)
			read_callback_closure := free_curl_closure (read_callback_closure)
			progress_callback_closure := free_curl_progress_closure (progress_callback_closure)
			
			curl_easy_cleanup (handle)
			handle := default_pointer
		end

feature {ANY} -- Representation

	is_valid: BOOLEAN
		do
			Result := error_code = curl_ok
		end

	error_code: INTEGER

	last_integer: INTEGER
	last_real64: REAL_64
	last_string: STRING
	last_curl_list: CURL_LIST

	version: STRING
		do
			create Result.from_external_copy (curl_version)
		end

feature {} -- Representation

	write_callback_closure: POINTER

	--typedef size_t (*curl_write_callback)(char *buffer,
	--                                      size_t size,
	--                                      size_t nitems,
	--                                      void *outstream);
	write_function: FUNCTION [ANY, TUPLE [NATIVE_ARRAY [CHARACTER], INTEGER, INTEGER], INTEGER]

	write_callback (ptr: POINTER; size, nmemb: INTEGER): INTEGER
		require
			ptr_not_null: ptr.is_not_null
			size >= 0 and nmemb >= 0
			write_function /= Void
		local
			array: NATIVE_ARRAY [CHARACTER]
		do
			array := array.from_pointer (ptr)
			Result := write_function.item ([array, size, nmemb])
		end

	read_callback_closure: POINTER

	--typedef size_t (*curl_read_callback)(char *buffer,
	--                                      size_t size,
	--                                      size_t nitems,
	--                                      void *instream);
	read_function:  FUNCTION [ANY, TUPLE [NATIVE_ARRAY [CHARACTER], INTEGER, INTEGER], INTEGER]

	read_callback (ptr: POINTER; size, nmemb: INTEGER): INTEGER
		require
			ptr_not_null: ptr.is_not_null
			size >= 0 and nmemb >= 0
			read_function /= Void
		local
			array: NATIVE_ARRAY [CHARACTER]
		do
			array := array.from_pointer (ptr)
			Result := read_function.item ([array, size, nmemb])
		end

	progress_callback_closure: POINTER

	--typedef int (*curl_progress_callback)(void *clientp,
	--                                      double dltotal,
	--                                      double dlnow,
	--                                      double ultotal,
	--                                      double ulnow);
	progress_function: FUNCTION [ANY, TUPLE [REAL, REAL, REAL, REAL], INTEGER]

	progress_callback (dltotal, dlnow, ultotal, ulnow: REAL): INTEGER
		do
			if progress_function /= Void then
				Result := progress_function.item ([dltotal, dlnow, ultotal, ulnow])
			end
		end

feature {ANY} -- Operations

	set_write_callback (a_function: FUNCTION [ANY, TUPLE [NATIVE_ARRAY [CHARACTER], INTEGER, INTEGER], INTEGER])
		require
			a_function /= Void
		do
			write_function := a_function
			error_code := curl_ok
		ensure
			write_function /= Void
			is_valid
		end

	set_read_callback (a_function: FUNCTION [ANY, TUPLE [NATIVE_ARRAY [CHARACTER], INTEGER, INTEGER], INTEGER])
		require
			a_function /= Void
		do
			read_function := a_function
			error_code := curl_ok
		ensure
			read_function /= Void
			is_valid
		end

	set_progress_callback (a_function: FUNCTION [ANY, TUPLE [REAL, REAL, REAL, REAL], INTEGER])
		require
			a_function /= Void
		do
			progress_function := a_function
			error_code := curl_ok
		ensure
			progress_function /= Void
			is_valid
		end

	perform
		do
			error_code := curl_easy_perform (handle)
		end

feature {ANY} -- set_option_xxx (option: INTEGER; x: XXX)

		-- curl_easy_setopt() is used to tell libcurl how to behave. By using the
		-- appropriate options to curl_easy_setopt, you can change libcurl's
		-- behavior. All options are set with the option followed by a parameter.
		-- That parameter can be a long, a function pointer, an object pointer or a
		-- curl_off_t, depending on what the specific option expects. Read this
		-- manual carefully as bad input values may cause libcurl to behave badly!
		-- You can only set one option in each function call. A typical application
		-- uses many curl_easy_setopt() calls in the setup phase.
		-- 
		-- Options set with this function call are valid for all forthcoming
		-- transfers performed using this handle. The options are not in any way
		-- reset between transfers, so if you want subsequent transfers with
		-- different options, you must change them between the transfers. You can
		-- optionally reset all options back to internal default with
		-- curl_easy_reset(3).
		-- 
		-- Strings passed to libcurl as 'char *' arguments, will not be copied by
		-- the library. Instead you should keep them available until libcurl no
		-- longer needs them. Failing to do so will cause very odd behavior or even
		-- crashes. libcurl will need them until you call curl_easy_cleanup(3) or
		-- you set the same option again to use a different pointer.
		-- 
		-- The handle is the return code from a curl_easy_init(3) or
		-- curl_easy_duphandle(3) call.
		-- 
		-- RETURN VALUE: CURLE_OK (zero) means that the option was set properly,
		-- non-zero means an error occurred as <curl/curl.h> defines. See the
		-- libcurl-errors(3) man page for the full list with descriptions.
		-- 
		-- If you try to set an option that libcurl doesn't know about, perhaps
		-- because the library is too old to support it or the option was removed
		-- in a recent version, this function will return CURLE_FAILED_INIT.

	set_option_verbose (i: INTEGER)
		do
			error_code := curl_easy_setopt_integer (handle, curl_option_verbose, i)
		ensure
			is_valid
		end

	set_option_post (i: INTEGER)
		do
			error_code := curl_easy_setopt_integer (handle, curl_option_post, i)
		ensure
			is_valid
		end

	set_option_url (url: STRING)
		require
			url /= Void
		do
			error_code := curl_easy_setopt_pointer (handle, curl_option_url, url.to_external)
		ensure
			is_valid
		end

	set_option_integer (option: INTEGER; i: INTEGER)
		require
			is_valid_curl_option (option)
		do
			error_code := curl_easy_setopt_integer (handle, option, i)
		ensure
			is_valid
		end

	set_option_string (option: INTEGER; str: STRING)
		require
			is_valid_curl_option (option)
			str /= Void
		do
			error_code := curl_easy_setopt_pointer (handle, option, str.to_external)
		ensure
			is_valid
		end

	set_option_input_stream (option: INTEGER; stream: INPUT_STREAM)
		require
			is_valid_curl_option (option)
			stream /= Void
			stream.is_connected
			stream.has_stream_pointer
		do
			error_code := curl_easy_setopt_pointer (handle, option, stream.stream_pointer)
		ensure
			is_valid
		end

	set_option_output_stream (option: INTEGER; stream: OUTPUT_STREAM)
		require
			is_valid_curl_option (option)
			stream /= Void
			stream.is_connected
			stream.has_stream_pointer
		do
			error_code := curl_easy_setopt_pointer (handle, option, stream.stream_pointer)
		ensure
			is_valid
		end

	set_option_curl_list (option: INTEGER; list: CURL_LIST)
		require
			is_valid_curl_option (option)
			list /= Void
		do
			error_code := curl_easy_setopt_pointer (handle, option, list.handle)
		ensure
			is_valid
		end

	set_option_null (option: INTEGER)
		require
			is_valid_curl_option (option)
		do
			error_code := curl_easy_setopt_pointer (handle, option, default_pointer)
		ensure
			is_valid
		end

	set_option_cookies (cookies: DICTIONARY[STRING, STRING])
			-- The cookies passed in will be used to set a cookie in the http request.
			-- Using this option multiple times will only make the latest cookies override the
			-- previous ones.
		require
			cookies /= Void
		local
			cookie_str: STRING
			cookie_iter: ITERATOR[STRING]
			separator: STRING
		do
			from
				cookie_iter := cookies.get_new_iterator_on_keys
			until
				cookie_iter.is_off
			loop
				cookie_iter.next
			end
			set_option_string (curl_option_cookie, cookie_str)
		ensure
			is_valid
		end

feature {ANY} -- get_info_XXX (info: INTEGER): XXX

		-- Request internal information from the curl session with this function.
		-- The third argument MUST be a pointer to a long, a pointer to a char *, a
		-- pointer to a struct curl_slist * or a pointer to a double (as this
		-- documentation describes further down). The data pointed-to will be
		-- filled in accordingly and can be relied upon only if the function
		-- returns CURLE_OK. Use this function AFTER a performed transfer if you
		-- want to get transfer-oriented data.
		-- 
		-- You should not free the memory returned by this function unless it is
		-- explictly mentioned below.
		-- 
		-- RETURN VALUE: If the operation was successful, CURLE_OK is returned.
		-- Otherwise an appropriate error code will be returned.

	get_info_integer (info: INTEGER)
		require
			is_valid_curl_info (info)
		do
			error_code := curl_easy_getinfo_pointer (handle, info, $last_integer)
		end

	get_info_real64 (info: INTEGER)
		require
			is_valid_curl_info (info)
		do
			error_code := curl_easy_getinfo_pointer (handle, info, $last_real64)
		end

	get_info_string (info: INTEGER)
		require
			is_valid_curl_info (info)
		local
			c_ptr: POINTER
		do
			error_code := curl_easy_getinfo_pointer (handle, info, $c_ptr)
			if is_valid and c_ptr.is_not_null then
				create last_string.from_external_copy (c_ptr)
			end
		end

	get_info_curl_list (info: INTEGER)
		require
			is_valid_curl_info (info)
		local
			c_ptr: POINTER
		do
			error_code := curl_easy_getinfo_pointer (handle, info, $c_ptr)
			if is_valid and c_ptr.is_not_null then
				create last_curl_list.from_external_pointer (c_ptr)
			end
		end

invariant
	is_valid_curl_code (error_code)

end -- class CURL
