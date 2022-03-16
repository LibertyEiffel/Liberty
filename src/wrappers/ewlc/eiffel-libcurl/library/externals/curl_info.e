note
	description: "Curl info constants"
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

deferred class CURL_INFO

		-- #define CURLINFO_STRING   0x100000
		-- #define CURLINFO_LONG     0x200000
		-- #define CURLINFO_DOUBLE   0x300000
		-- #define CURLINFO_SLIST    0x400000
		-- #define CURLINFO_MASK     0x0fffff
		-- #define CURLINFO_TYPEMASK 0xf00000
		-- 
		-- typedef enum {
		--   CURLINFO_NONE, /* first, never use this */
		--   CURLINFO_EFFECTIVE_URL    = CURLINFO_STRING + 1,
		--   CURLINFO_RESPONSE_CODE    = CURLINFO_LONG   + 2,
		--   CURLINFO_TOTAL_TIME       = CURLINFO_DOUBLE + 3,
		--   CURLINFO_NAMELOOKUP_TIME  = CURLINFO_DOUBLE + 4,
		--   CURLINFO_CONNECT_TIME     = CURLINFO_DOUBLE + 5,
		--   CURLINFO_PRETRANSFER_TIME = CURLINFO_DOUBLE + 6,
		--   CURLINFO_SIZE_UPLOAD      = CURLINFO_DOUBLE + 7,
		--   CURLINFO_SIZE_DOWNLOAD    = CURLINFO_DOUBLE + 8,
		--   CURLINFO_SPEED_DOWNLOAD   = CURLINFO_DOUBLE + 9,
		--   CURLINFO_SPEED_UPLOAD     = CURLINFO_DOUBLE + 10,
		--   CURLINFO_HEADER_SIZE      = CURLINFO_LONG   + 11,
		--   CURLINFO_REQUEST_SIZE     = CURLINFO_LONG   + 12,
		--   CURLINFO_SSL_VERIFYRESULT = CURLINFO_LONG   + 13,
		--   CURLINFO_FILETIME         = CURLINFO_LONG   + 14,
		--   CURLINFO_CONTENT_LENGTH_DOWNLOAD   = CURLINFO_DOUBLE + 15,
		--   CURLINFO_CONTENT_LENGTH_UPLOAD     = CURLINFO_DOUBLE + 16,
		--   CURLINFO_STARTTRANSFER_TIME = CURLINFO_DOUBLE + 17,
		--   CURLINFO_CONTENT_TYPE     = CURLINFO_STRING + 18,
		--   CURLINFO_REDIRECT_TIME    = CURLINFO_DOUBLE + 19,
		--   CURLINFO_REDIRECT_COUNT   = CURLINFO_LONG   + 20,
		--   CURLINFO_PRIVATE          = CURLINFO_STRING + 21,
		--   CURLINFO_HTTP_CONNECTCODE = CURLINFO_LONG   + 22,
		--   CURLINFO_HTTPAUTH_AVAIL   = CURLINFO_LONG   + 23,
		--   CURLINFO_PROXYAUTH_AVAIL  = CURLINFO_LONG   + 24,
		--   CURLINFO_OS_ERRNO         = CURLINFO_LONG   + 25,
		--   CURLINFO_NUM_CONNECTS     = CURLINFO_LONG   + 26,
		--   CURLINFO_SSL_ENGINES      = CURLINFO_SLIST  + 27,
		--   CURLINFO_COOKIELIST       = CURLINFO_SLIST  + 28,
		--   CURLINFO_LASTSOCKET       = CURLINFO_LONG   + 29,
		--   CURLINFO_FTP_ENTRY_PATH   = CURLINFO_STRING + 30,
		--   /* Fill in new entries below here! */
		-- 
		--   CURLINFO_LASTONE          = 30
		-- } CURLINFO;

inherit ANY undefine is_equal, copy end

feature {} -- Validator

	is_valid_curl_info (an_info: INTEGER) : BOOLEAN
		do
			Result := True -- FIXME!!!
		end

feature {} -- AVAILABLE INFORMATION

	curl_info_effective_url: INTEGER
			-- Pass a pointer to a 'char *' to receive the last used effective URL.
		external "C macro use <curl/curl.h>"
		alias "CURLINFO_EFFECTIVE_URL"
		end

			-- CURLINFO_RESPONSE_CODE
			-- 
			-- Pass a pointer to a long to receive the last received HTTP or FTP code.
			-- This option was known as CURLINFO_HTTP_CODE in libcurl 7.10.7 and
			-- earlier. This will be zero if no server response code has been received.
			-- Note that a proxy's CONNECT response should be read with
			-- CURLINFO_HTTP_CONNECTCODE and not this.
			-- 
			-- CURLINFO_HTTP_CONNECTCODE
			-- 
			-- Pass a pointer to a long to receive the last received proxy response
			-- code to a CONNECT request.
			-- 
			-- CURLINFO_FILETIME
			-- 
			-- Pass a pointer to a long to receive the remote time of the retrieved
			-- document (in number of seconds since 1 jan 1970 in the GMT/UTC time
			-- zone). If you get -1, it can be because of many reasons (unknown, the
			-- server hides it or the server doesn't support the command that tells
			-- document time etc) and the time of the document is unknown. Note that
			-- you must tell the server to collect this information before the transfer
			-- is made, by using the CURLOPT_FILETIME option to curl_easy_setopt(3) or
			-- you will unconditionally get a -1 back. (Added in 7.5)
			-- 
			-- CURLINFO_TOTAL_TIME
			-- 
			-- Pass a pointer to a double to receive the total time in seconds for the
			-- previous transfer, including name resolving, TCP connect etc.
			-- 
			-- CURLINFO_NAMELOOKUP_TIME
			-- 
			-- Pass a pointer to a double to receive the time, in seconds, it took from
			-- the start until the name resolving was completed.
			-- 
			-- CURLINFO_CONNECT_TIME
			-- 
			-- Pass a pointer to a double to receive the time, in seconds, it took from
			-- the start until the connect to the remote host (or proxy) was completed.
			-- 
			-- CURLINFO_PRETRANSFER_TIME
			-- 
			-- Pass a pointer to a double to receive the time, in seconds, it took from
			-- the start until the file transfer is just about to begin. This includes
			-- all pre-transfer commands and negotiations that are specific to the
			-- particular protocol(s) involved.
			-- 
			-- CURLINFO_STARTTRANSFER_TIME
			-- 
			-- Pass a pointer to a double to receive the time, in seconds, it took from
			-- the start until the first byte is just about to be transferred. This
			-- includes CURLINFO_PRETRANSFER_TIME and also the time the server needs to
			-- calculate the result.
			-- 
			-- CURLINFO_REDIRECT_TIME
			-- 
			-- Pass a pointer to a double to receive the total time, in seconds, it
			-- took for all redirection steps include name lookup, connect, pretransfer
			-- and transfer before final transaction was started.
			-- CURLINFO_REDIRECT_TIME contains the complete execution time for multiple
			-- redirections. (Added in 7.9.7)
			-- 
			-- CURLINFO_REDIRECT_COUNT
			-- 
			-- Pass a pointer to a long to receive the total number of redirections
			-- that were actually followed. (Added in 7.9.7)
			-- 
			-- CURLINFO_SIZE_UPLOAD
			-- 
			-- Pass a pointer to a double to receive the total amount of bytes that
			-- were uploaded.
			-- 
			-- CURLINFO_SIZE_DOWNLOAD
			-- 
			-- Pass a pointer to a double to receive the total amount of bytes that
			-- were downloaded. The amount is only for the latest transfer and will be
			-- reset again for each new transfer.
			-- 
			-- CURLINFO_SPEED_DOWNLOAD
			-- 
			-- Pass a pointer to a double to receive the average download speed that
			-- curl measured for the complete download.
			-- 
			-- CURLINFO_SPEED_UPLOAD
			-- 
			-- Pass a pointer to a double to receive the average upload speed that curl
			-- measured for the complete upload.
			-- 
			-- CURLINFO_HEADER_SIZE
			-- 
			-- Pass a pointer to a long to receive the total size of all the headers
			-- received.
			-- 
			-- CURLINFO_REQUEST_SIZE
			-- 
			-- Pass a pointer to a long to receive the total size of the issued
			-- requests. This is so far only for HTTP requests. Note that this may be
			-- more than one request if FOLLOWLOCATION is true.
			-- 
			-- CURLINFO_SSL_VERIFYRESULT
			-- 
			-- Pass a pointer to a long to receive the result of the certification
			-- verification that was requested (using the CURLOPT_SSL_VERIFYPEER option
			-- to curl_easy_setopt(3)).
			-- 
			-- CURLINFO_SSL_ENGINES
			-- 
			-- Pass the address of a 'struct curl_slist *' to receive a linked-list of
			-- OpenSSL crypto-engines supported. Note that engines are normally
			-- implemented in separate dynamic libraries. Hence not all the returned
			-- engines may be available at run-time. NOTE: you must call
			-- curl_slist_free_all(3) on the list pointer once you're done with it, as
			-- libcurl will not free the data for you. (Added in 7.12.3)
			-- 
			-- CURLINFO_CONTENT_LENGTH_DOWNLOAD
			-- 
			-- Pass a pointer to a double to receive the content-length of the
			-- download. This is the value read from the Content-Length: field.
			-- 
			-- CURLINFO_CONTENT_LENGTH_UPLOAD
			-- 
			-- Pass a pointer to a double to receive the specified size of the upload.
			-- 
			-- CURLINFO_CONTENT_TYPE
			-- 
			-- Pass a pointer to a 'char *' to receive the content-type of the
			-- downloaded object. This is the value read from the Content-Type: field.
			-- If you get NULL, it means that the server didn't send a valid
			-- Content-Type header or that the protocol used doesn't support this.
			-- 
			-- CURLINFO_PRIVATE
			-- 
			-- Pass a pointer to a 'char *' to receive the pointer to the private data
			-- associated with the curl handle (set with the CURLOPT_PRIVATE option to
			-- curl_easy_setopt(3)). (Added in 7.10.3)
			-- 
			-- CURLINFO_HTTPAUTH_AVAIL
			-- 
			-- Pass a pointer to a long to receive a bitmask indicating the
			-- authentication method(s) available. The meaning of the bits is explained
			-- in the CURLOPT_HTTPAUTH option for curl_easy_setopt(3). (Added in
			-- 7.10.8)
			-- 
			-- CURLINFO_PROXYAUTH_AVAIL
			-- 
			-- Pass a pointer to a long to receive a bitmask indicating the
			-- authentication method(s) available for your proxy authentication. (Added
			-- in 7.10.8)
			-- 
			-- CURLINFO_OS_ERRNO
			-- 
			-- Pass a pointer to a long to receive the errno variable from a connect
			-- failure. (Added in 7.12.2)
			-- 
			-- CURLINFO_NUM_CONNECTS
			-- 
			-- Pass a pointer to a long to receive how many new connections libcurl had
			-- to create to achieve the previous transfer (only the successful connects
			-- are counted). Combined with CURLINFO_REDIRECT_COUNT you are able to know
			-- how many times libcurl successfully reused existing connection(s) or
			-- not. See the Connection Options of curl_easy_setopt(3) to see how
			-- libcurl tries to make persistent connections to save time. (Added in
			-- 7.12.3)
			-- 
			-- CURLINFO_COOKIELIST
			-- 
			-- Pass a pointer to a 'struct curl_slist *' to receive a linked-list of
			-- all cookies cURL knows (expired ones, too). Don't forget to
			-- curl_slist_free_all(3) the list after it has been used. If there are no
			-- cookies (cookies for the handle have not been enabled or simply none
			-- have been received) 'struct curl_slist *' will be set to point to NULL.
			-- (Added in 7.14.1)
			-- 
			-- CURLINFO_LASTSOCKET
			-- 
			-- Pass a pointer to a long to receive the last socket used by this curl
			-- session. If the socket is no longer valid, -1 is returned. When you
			-- finish working with the socket, you must call curl_easy_cleanup() as
			-- usual and let libcurl close the socket and cleanup other resources
			-- associated with the handle. This is typically used in combination with
			-- CURLOPT_CONNECT_ONLY. (Added in 7.15.2)
			-- 
			-- CURLINFO_FTP_ENTRY_PATH
			-- 
			-- Pass a pointer to a 'char *' to receive a pointer to a string holding
			-- the path of the entry path. That is the initial path libcurl ended up in
			-- when logging on to the remote FTP server. This stores a NULL as pointer
			-- if something is wrong. (Added in 7.15.4)

feature {} -- TIMES

			-- An overview of the six time values available from curl_easy_getinfo()
			-- 
			-- curl_easy_perform()
			--    |
			--    |--NT
			--    |--|--CT
			--    |--|--|--PT
			--    |--|--|--|--ST
			--    |--|--|--|--|--TT
			--    |--|--|--|--|--RT
			-- 
			-- NT
			-- 
			-- CURLINFO_NAMELOOKUP_TIME. The time it took from the start until the name
			-- resolving was completed.
			-- 
			-- CT
			-- 
			-- CURLINFO_CONNECT_TIME. The time it took from the start until the connect
			-- to the remote host (or proxy) was completed.
			-- 
			-- PT
			-- 
			-- CURLINFO_PRETRANSFER_TIME. The time it took from the start until the
			-- file transfer is just about to begin. This includes all pre-transfer
			-- commands and negotiations that are specific to the particular
			-- protocol(s) involved.
			-- 
			-- ST
			-- 
			-- CURLINFO_STARTTRANSFER_TIME. The time it took from the start until the
			-- first byte is just about to be transferred.
			-- 
			-- TT
			-- 
			-- CURLINFO_TOTAL_TIME. Total time of the previous request.
			-- 
			-- RT
			-- 
			-- CURLINFO_REDIRECT_TIME. The time it took for all redirection steps
			-- include name lookup, connect, pretransfer and transfer before final
			-- transaction was started. So, this is zero if no redirection took place.

end -- class CURL_INFO
