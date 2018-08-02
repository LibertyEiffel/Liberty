note
	description: "External calls for curl operations"
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

deferred class CURL_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	CURL_CODE
	CURL_OPTION
	CURL_INFO

feature {} -- Externals

	curl_easy_init: POINTER
			-- This function must be the first function to call, and it returns a CURL
			-- easy handle that you must use as input to other easy-functions.
			-- curl_easy_init initializes curl and this call MUST have a corresponding
			-- call to curl_easy_cleanup(3) when the operation is complete.
			-- 
			-- If you did not already call curl_global_init(3), curl_easy_init(3) does
			-- it automatically. This may be lethal in multi-threaded cases, since
			-- curl_global_init(3) is not thread-safe, and it may result in resource
			-- problems because there is no corresponding cleanup.
			-- 
			-- You are strongly advised to not allow this automatic behaviour, by
			-- calling curl_global_init(3) yourself properly. See the description in
			-- libcurl(3) of global environment requirements for details of how to use
			-- this function.
			-- 
			-- RETURN VALUE: If this function returns NULL, something went wrong and
			-- you cannot use the other curl functions.
			--
			-- CURL *curl_easy_init(void);
		external "C use <curl/curl.h>"
		end

	curl_easy_cleanup (curl: POINTER)
			-- This function must be the last function to call for an easy session.
			-- It is the opposite of the curl_easy_init(3) function and must be called
			-- with the same handle as input that the curl_easy_init call returned.
			-- 
			-- This will effectively close all connections this handle has used and
			-- possibly has kept open until now. Don't call this function if you intend
			-- to transfer more files.
			-- 
			-- When you've called this, you can safely remove all the strings you've
			-- previously told libcurl to use, as it won't use them anymore now.
			--
			-- void curl_easy_cleanup(CURL * handle);
		external "C use <curl/curl.h>"
		end

	new_curl_closure (c, f: POINTER): POINTER
		external "C use <curl_callback.h>"
		end

	free_curl_closure (ptr: POINTER): POINTER
		external "C use <curl_callback.h>"
		end

	c_write_callback: POINTER is -- (prt: POINTER; size, nmemb: INTEGER; data: POINTER): INTEGER is
		external "C macro use <curl_callback.h>"
		alias "WriteCallback"
		end

	c_read_callback: POINTER is -- (prt: POINTER; size, nmemb: INTEGER; data: POINTER): INTEGER is
		external "C macro use <curl_callback.h>"
		alias "ReadCallback"
		end

	new_curl_progress_closure (c, f: POINTER): POINTER
		external "C use <curl_callback.h>"
		end

	free_curl_progress_closure (ptr: POINTER): POINTER
		external "C use <curl_callback.h>"
		end

	c_progress_callback: POINTER
		external "C macro use <curl_callback.h>"
		alias "ProgressCallback"
		end

	curl_easy_setopt_pointer (curl: POINTER; opt: INTEGER; ptr: POINTER): INTEGER
			-- To set `char *', `void *', `FILE *', `struct curl_httppost *',
			-- `struct curl_slist *', `struct Curl_share *'
			--
			-- CURLcode curl_easy_setopt(CURL *handle, CURLoption option, parameter);
		require is_valid_curl_option (opt)
		external "C use <curl/curl.h>"
		alias "curl_easy_setopt"
		ensure is_valid_curl_code (Result)
		end

	curl_easy_setopt_boolean (curl: POINTER; opt: INTEGER; b: BOOLEAN): INTEGER
			-- To set `BOOL'. BOOL implementation in libcurl is a CHAR.
			-- from curl/lib/mprintf.c:77
			-- # define TRUE  ((char)(1 == 1))
			-- # define FALSE ((char)(0 == 1))
			-- # define BOOL char
			--
			-- CURLcode curl_easy_setopt(CURL *handle, CURLoption option, parameter);
		require is_valid_curl_option (opt)
		external "C use <curl/curl.h>"
		alias "curl_easy_setopt"
		ensure is_valid_curl_code (Result)
		end

	curl_easy_setopt_integer (curl: POINTER; opt: INTEGER; i: INTEGER): INTEGER
			-- To set `int', `long', `curl_off_t'
			--
			-- CURLcode curl_easy_setopt(CURL *handle, CURLoption option, parameter);
		require is_valid_curl_option (opt)
		external "C use <curl/curl.h>"
		alias "curl_easy_setopt"
		ensure is_valid_curl_code (Result)
		end

	curl_easy_getinfo_pointer (curl: POINTER; info: INTEGER; ptr: POINTER): INTEGER
			-- CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ... );
		require is_valid_curl_info (info)
		external "C use <curl/curl.h>"
		alias "curl_easy_getinfo"
		ensure is_valid_curl_code (Result)
		end

	curl_easy_perform (curl: POINTER): INTEGER
			-- This function is called after the init and all the curl_easy_setopt(3)
			-- calls are made, and will perform the transfer as described in the
			-- options. It must be called with the same handle as input as the
			-- curl_easy_init call returned.
			-- 
			-- You can do any amount of calls to curl_easy_perform(3) while using the
			-- same handle. If you intend to transfer more than one file, you are even
			-- encouraged to do so. libcurl will then attempt to re-use the same
			-- connection for the following transfers, thus making the operations
			-- faster, less CPU intense and using less network resources. Just note
			-- that you will have to use curl_easy_setopt(3) between the invokes to set
			-- options for the following curl_easy_perform.
			-- 
			-- You must never call this function simultaneously from two places using
			-- the same handle. Let the function return first before invoking it
			-- another time. If you want parallel transfers, you must use several curl
			-- handles.
			-- 
			-- RETURN VALUE: 0 means everything was ok, non-zero means an error
			-- occurred as <curl/curl.h> defines. If the CURLOPT_ERRORBUFFER was set
			-- with curl_easy_setopt there will be a readable error message in the
			-- error buffer when non-zero is returned.
			-- 
			-- CURLcode curl_easy_perform(CURL * handle);
		external "C use <curl/curl.h>"
		ensure is_valid_curl_code (Result)
		end

	-- XXX: what about `curl_off_t'?
	-- include/curl/curl.h states:
	-- /*
	--  * We want the typedef curl_off_t setup for large file support on all
	--  * platforms. We also provide a CURL_FORMAT_OFF_T define to use in *printf
	--  * format strings when outputting a variable of type curl_off_t.
	--  *
	--  * Note: "pocc -Ze" is MSVC compatibily mode and this sets _MSC_VER!
	--  */
	-- 
	-- #if (defined(_MSC_VER) && !defined(__POCC__)) || (defined(__LCC__) && defined(WIN32))
	-- /* MSVC */
	-- #ifdef _WIN32_WCE
	--   typedef long curl_off_t;
	-- #define CURL_FORMAT_OFF_T "%ld"
	-- #else
	--   typedef signed __int64 curl_off_t;
	-- #define CURL_FORMAT_OFF_T "%I64d"
	-- #endif
	-- #else /* (_MSC_VER && !__POCC__) || (__LCC__ && WIN32) */
	-- #if (defined(__GNUC__) && defined(WIN32)) || defined(__WATCOMC__)
	-- /* gcc on windows or Watcom */
	--   typedef long long curl_off_t;
	-- #define CURL_FORMAT_OFF_T "%I64d"
	-- #else /* GCC or Watcom on Windows  */
	-- 
	-- /* "normal" POSIX approach, do note that this does not necessarily mean that
	--    the type is >32 bits, see the SIZEOF_CURL_OFF_T define for that! */
	--   typedef off_t curl_off_t;
	-- 
	-- /* Check a range of defines to detect large file support. On Linux it seems
	--    none of these are set by default, so if you don't explicitly switches on
	--    large file support, this define will be made for "small file" support. */
	-- #ifndef _FILE_OFFSET_BITS
	-- #define _FILE_OFFSET_BITS 0 /* to prevent warnings in the check below */
	-- #define UNDEF_FILE_OFFSET_BITS
	-- #endif
	-- #ifndef FILESIZEBITS
	-- #define FILESIZEBITS 0 /* to prevent warnings in the check below */
	-- #define UNDEF_FILESIZEBITS
	-- #endif
	-- 
	-- #if defined(_LARGE_FILES) || (_FILE_OFFSET_BITS > 32) || (FILESIZEBITS > 32) \
	--    || defined(_LARGEFILE_SOURCE) || defined(_LARGEFILE64_SOURCE)
	--   /* For now, we assume at least one of these to be set for large files to
	--      work! */
	-- #define CURL_FORMAT_OFF_T "%lld"
	-- #else /* LARGE_FILE support */
	-- #define CURL_FORMAT_OFF_T "%ld"
	-- #endif
	-- #endif /* GCC or Watcom on Windows */
	-- #endif /* (_MSC_VER && !__POCC__) || (__LCC__ && WIN32) */
	-- 
	-- #ifdef UNDEF_FILE_OFFSET_BITS
	-- /* this was defined above for our checks, undefine it again */
	-- #undef _FILE_OFFSET_BITS
	-- #endif
	-- 
	-- #ifdef UNDEF_FILESIZEBITS
	-- /* this was defined above for our checks, undefine it again */
	-- #undef FILESIZEBITS
	-- #endif

	-- XXX: what about `curl_progress_callback', `curl_write_callback', etc?
	-- include/curl/curl.h states:
	-- typedef int (*curl_progress_callback)(void *clientp,
	--                                       double dltotal,
	--                                       double dlnow,
	--                                       double ultotal,
	--                                       double ulnow);
	-- 
	--   /* Tests have proven that 20K is a very bad buffer size for uploads on
	--      Windows, while 16K for some odd reason performed a lot better. */
	-- #define CURL_MAX_WRITE_SIZE 16384
	-- 
	-- typedef size_t (*curl_write_callback)(char *buffer,
	--                                       size_t size,
	--                                       size_t nitems,
	--                                       void *outstream);
	-- 
	-- /* This is a return code for the read callback that, when returned, will
	--    signal libcurl to immediately abort the current transfer. */
	-- #define CURL_READFUNC_ABORT 0x10000000
	-- typedef size_t (*curl_read_callback)(char *buffer,
	--                                       size_t size,
	--                                       size_t nitems,
	--                                       void *instream);
	-- 
	-- 
	-- #ifndef CURL_NO_OLDIES
	--   /* not used since 7.10.8, will be removed in a future release */
	-- typedef int (*curl_passwd_callback)(void *clientp,
	--                                     const char *prompt,
	--                                     char *buffer,
	--                                     int buflen);
	-- #endif
	-- 
	-- typedef int (*curl_debug_callback)
	--        (CURL *handle,      /* the handle/transfer this concerns */
	--         curl_infotype type, /* what kind of data */
	--         char *data,        /* points to the data */
	--         size_t size,       /* size of the data pointed to */
	--         void *userptr);    /* whatever the user please */
	--
	-- THERE IS MORE!!!

	curl_version: POINTER
		external "C macro use <curl/curlver.h>"
		alias "LIBCURL_VERSION"
		end

end -- class CURL_EXTERNALS
