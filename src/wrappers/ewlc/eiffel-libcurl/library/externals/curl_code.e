note
	description: "Curl codes"
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

deferred class CURL_CODE
		-- CURLcode
		-- 
		-- Almost all "easy" interface functions return a CURLcode error code. No
		-- matter what, using the curl_easy_setopt(3) option CURLOPT_ERRORBUFFER is
		-- a good idea as it will give you a human readable error string that may
		-- offer more details about the error cause than just the error code does.
		-- curl_easy_strerror(3) can be called to get an error string from a given
		-- CURLcode number.
		-- 

		-- typedef enum {
		--   CURLE_OK = 0,
		--   CURLE_UNSUPPORTED_PROTOCOL,    /* 1 */
		--   CURLE_FAILED_INIT,             /* 2 */
		--   CURLE_URL_MALFORMAT,           /* 3 */
		--   CURLE_URL_MALFORMAT_USER,      /* 4 - NOT USED */
		--   CURLE_COULDNT_RESOLVE_PROXY,   /* 5 */
		--   CURLE_COULDNT_RESOLVE_HOST,    /* 6 */
		--   CURLE_COULDNT_CONNECT,         /* 7 */
		--   CURLE_FTP_WEIRD_SERVER_REPLY,  /* 8 */
		--   CURLE_FTP_ACCESS_DENIED,       /* 9 a service was denied by the FTP server
		--                                     due to lack of access - when login fails
		--                                     this is not returned. */
		--   CURLE_FTP_USER_PASSWORD_INCORRECT, /* 10 - NOT USED */
		--   CURLE_FTP_WEIRD_PASS_REPLY,    /* 11 */
		--   CURLE_FTP_WEIRD_USER_REPLY,    /* 12 */
		--   CURLE_FTP_WEIRD_PASV_REPLY,    /* 13 */
		--   CURLE_FTP_WEIRD_227_FORMAT,    /* 14 */
		--   CURLE_FTP_CANT_GET_HOST,       /* 15 */
		--   CURLE_FTP_CANT_RECONNECT,      /* 16 */
		--   CURLE_FTP_COULDNT_SET_BINARY,  /* 17 */
		--   CURLE_PARTIAL_FILE,            /* 18 */
		--   CURLE_FTP_COULDNT_RETR_FILE,   /* 19 */
		--   CURLE_FTP_WRITE_ERROR,         /* 20 */
		--   CURLE_FTP_QUOTE_ERROR,         /* 21 */
		--   CURLE_HTTP_RETURNED_ERROR,     /* 22 */
		--   CURLE_WRITE_ERROR,             /* 23 */
		--   CURLE_MALFORMAT_USER,          /* 24 - NOT USED */
		--   CURLE_FTP_COULDNT_STOR_FILE,   /* 25 - failed FTP upload */
		--   CURLE_READ_ERROR,              /* 26 - could open/read from file */
		--   CURLE_OUT_OF_MEMORY,           /* 27 */
		--   /* Note: CURLE_OUT_OF_MEMORY may sometimes indicate a conversion error
		--            instead of a memory allocation error if CURL_DOES_CONVERSIONS
		--            is defined
		--   */
		--   CURLE_OPERATION_TIMEOUTED,     /* 28 - the timeout time was reached */
		--   CURLE_FTP_COULDNT_SET_ASCII,   /* 29 - TYPE A failed */
		--   CURLE_FTP_PORT_FAILED,         /* 30 - FTP PORT operation failed */
		--   CURLE_FTP_COULDNT_USE_REST,    /* 31 - the REST command failed */
		--   CURLE_FTP_COULDNT_GET_SIZE,    /* 32 - the SIZE command failed */
		--   CURLE_HTTP_RANGE_ERROR,        /* 33 - RANGE "command" didn't work */
		--   CURLE_HTTP_POST_ERROR,         /* 34 */
		--   CURLE_SSL_CONNECT_ERROR,       /* 35 - wrong when connecting with SSL */
		--   CURLE_BAD_DOWNLOAD_RESUME,     /* 36 - couldn't resume download */
		--   CURLE_FILE_COULDNT_READ_FILE,  /* 37 */
		--   CURLE_LDAP_CANNOT_BIND,        /* 38 */
		--   CURLE_LDAP_SEARCH_FAILED,      /* 39 */
		--   CURLE_LIBRARY_NOT_FOUND,       /* 40 */
		--   CURLE_FUNCTION_NOT_FOUND,      /* 41 */
		--   CURLE_ABORTED_BY_CALLBACK,     /* 42 */
		--   CURLE_BAD_FUNCTION_ARGUMENT,   /* 43 */
		--   CURLE_BAD_CALLING_ORDER,       /* 44 - NOT USED */
		--   CURLE_INTERFACE_FAILED,        /* 45 - CURLOPT_INTERFACE failed */
		--   CURLE_BAD_PASSWORD_ENTERED,    /* 46 - NOT USED */
		--   CURLE_TOO_MANY_REDIRECTS ,     /* 47 - catch endless re-direct loops */
		--   CURLE_UNKNOWN_TELNET_OPTION,   /* 48 - User specified an unknown option */
		--   CURLE_TELNET_OPTION_SYNTAX ,   /* 49 - Malformed telnet option */
		--   CURLE_OBSOLETE,                /* 50 - NOT USED */
		--   CURLE_SSL_PEER_CERTIFICATE,    /* 51 - peer's certificate wasn't ok */
		--   CURLE_GOT_NOTHING,             /* 52 - when this is a specific error */
		--   CURLE_SSL_ENGINE_NOTFOUND,     /* 53 - SSL crypto engine not found */
		--   CURLE_SSL_ENGINE_SETFAILED,    /* 54 - can not set SSL crypto engine as
		--                                     default */
		--   CURLE_SEND_ERROR,              /* 55 - failed sending network data */
		--   CURLE_RECV_ERROR,              /* 56 - failure in receiving network data */
		--   CURLE_SHARE_IN_USE,            /* 57 - share is in use */
		--   CURLE_SSL_CERTPROBLEM,         /* 58 - problem with the local certificate */
		--   CURLE_SSL_CIPHER,              /* 59 - couldn't use specified cipher */
		--   CURLE_SSL_CACERT,              /* 60 - problem with the CA cert (path?) */
		--   CURLE_BAD_CONTENT_ENCODING,    /* 61 - Unrecognized transfer encoding */
		--   CURLE_LDAP_INVALID_URL,        /* 62 - Invalid LDAP URL */
		--   CURLE_FILESIZE_EXCEEDED,       /* 63 - Maximum file size exceeded */
		--   CURLE_FTP_SSL_FAILED,          /* 64 - Requested FTP SSL level failed */
		--   CURLE_SEND_FAIL_REWIND,        /* 65 - Sending the data requires a rewind
		--                                     that failed */
		--   CURLE_SSL_ENGINE_INITFAILED,   /* 66 - failed to initialise ENGINE */
		--   CURLE_LOGIN_DENIED,            /* 67 - user, password or similar was not
		--                                     accepted and we failed to login */
		--   CURLE_TFTP_NOTFOUND,           /* 68 - file not found on server */
		--   CURLE_TFTP_PERM,               /* 69 - permission problem on server */
		--   CURLE_TFTP_DISKFULL,           /* 70 - out of disk space on server */
		--   CURLE_TFTP_ILLEGAL,            /* 71 - Illegal TFTP operation */
		--   CURLE_TFTP_UNKNOWNID,          /* 72 - Unknown transfer ID */
		--   CURLE_TFTP_EXISTS,             /* 73 - File already exists */
		--   CURLE_TFTP_NOSUCHUSER,         /* 74 - No such user */
		--   CURLE_CONV_FAILED,             /* 75 - conversion failed */
		--   CURLE_CONV_REQD,               /* 76 - caller must register conversion
		--                                     callbacks using curl_easy_setopt options
		--                                     CURLOPT_CONV_FROM_NETWORK_FUNCTION,
		--                                     CURLOPT_CONV_TO_NETWORK_FUNCTION, and
		--                                     CURLOPT_CONV_FROM_UTF8_FUNCTION */
		--   CURL_LAST /* never use! */
		-- } CURLcode;

inherit ANY undefine is_equal, copy end

feature {}

	is_valid_curl_code (a_code: INTEGER) : BOOLEAN is
		do
			Result := a_code.in_range (0, 76)
		end

	curl_ok: INTEGER is
			-- All fine. Proceed as usual.
		external "C macro use <curl/curl.h>"
		alias "CURLE_OK"
		end

	curl_unsupported_protocol: INTEGER is
			-- The URL you passed to libcurl used a protocol that this libcurl does
			-- not support. The support might be a compile-time option that you didn't
			-- use, it can be a misspelled protocol string or just a protocol libcurl
			-- has no code for.
		external "C macro use <curl/curl.h>"
		alias "CURLE_UNSUPPORTED_PROTOCOL"
		end

	curl_failed_init: INTEGER is
			-- Very early initialization code failed. This is likely to be an internal
			-- error or problem.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FAILED_INIT"
		end

	curl_url_malformat: INTEGER is
			-- The URL was not properly formatted.
		external "C macro use <curl/curl.h>"
		alias "CURLE_URL_MALFORMAT"
		end

	curl_url_malformat_user: INTEGER is
			-- This is never returned by current libcurl.
		external "C macro use <curl/curl.h>"
		alias "CURLE_URL_MALFORMAT_USER"
		end

	curl_couldnt_resolve_proxy: INTEGER is
			-- Couldn't resolve proxy. The given proxy host could not be resolved.
		external "C macro use <curl/curl.h>"
		alias "CURLE_COULDNT_RESOLVE_PROXY"
		end

	curl_couldnt_resolve_host: INTEGER is
			-- Couldn't resolve host. The given remote host was not resolved.
		external "C macro use <curl/curl.h>"
		alias "CURLE_COULDNT_RESOLVE_HOST"
		end

	curl_couldnt_connnect: INTEGER is
			-- Failed to connect() to host or proxy.
		external "C macro use <curl/curl.h>"
		alias "CURLE_COULDNT_CONNECT"
		end

	curl_ftp_weird_server_reply: INTEGER is
			-- After connecting to an FTP server, libcurl expects to get a certain
			-- reply back. This error code implies that it got a strange or bad reply.
			-- The given remote server is probably not an OK FTP server.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_WEIRD_SERVER_REPLY"
		end

	curl_ftp_access_denied: INTEGER is
			-- We were denied access when trying to login to an FTP server or when
			-- trying to change working directory to the one given in the URL.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_ACCESS_DENIED"
		end

	curl_ftp_user_password_incorrect: INTEGER is
			-- This is never returned by current libcurl.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_USER_PASSWORD_INCORRECT"
		end

	curl_ftp_weird_pass_reply: INTEGER is
			-- After having sent the FTP password to the server, libcurl expects a
			-- proper reply. This error code indicates that an unexpected code was
			-- returned.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_WEIRD_PASS_REPLY"
		end

	curl_ftp_weird_user_reply: INTEGER is
			-- After having sent user name to the FTP server, libcurl expects a proper
			-- reply. This error code indicates that an unexpected code was returned.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_WEIRD_USER_REPLY"
		end

	curl_ftp_weird_pasv_reply: INTEGER is
			-- libcurl failed to get a sensible result back from the server as a
			-- response to either a PASV or a EPSV command. The server is flawed.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_WEIRD_PASV_REPLY"
		end

	curl_ftp_weird_227_format: INTEGER is
			-- FTP servers return a 227-line as a response to a PASV command. If
			-- libcurl fails to parse that line, this return code is passed back.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_WEIRD_227_FORMAT"
		end

	curl_ftp_cant_get_host: INTEGER is
			-- An internal failure to lookup the host used for the new connection.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_CANT_GET_HOST"
		end

	curl_ftp_cant_reconnect: INTEGER is
			-- A bad return code on either PASV or EPSV was sent by the FTP server,
			-- preventing libcurl from being able to continue.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_CANT_RECONNECT"
		end

	curl_ftp_couldnt_set_binary: INTEGER is
			-- Received an error when trying to set the transfer mode to binary.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_COULDNT_SET_BINARY"
		end

	curl_partial_file: INTEGER is
			-- A file transfer was shorter or larger than expected. This happens when
			-- the server first reports an expected transfer size, and then delivers
			-- data that doesn't match the previously given size.
		external "C macro use <curl/curl.h>"
		alias "CURLE_PARTIAL_FILE"
		end

	curl_ftp_couldnt_retr_file: INTEGER is
			-- This was either a weird reply to a 'RETR' command or a zero byte
			-- transfer complete.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_COULDNT_RETR_FILE"
		end

	curl_ftp_write_error: INTEGER is
			-- After a completed file transfer, the FTP server did not respond a proper
			-- "transfer successful" code.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_WRITE_ERROR"
		end

	curl_ftp_quote_error: INTEGER is
			-- When sending custom "QUOTE" commands to the remote server, one of the
			-- commands returned an error code that was 400 or higher.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_QUOTE_ERROR"
		end

	curl_http_returned_error: INTEGER is
			-- This is returned if CURLOPT_FAILONERROR is set TRUE and the HTTP server
			-- returns an error code that is >= 400.
		external "C macro use <curl/curl.h>"
		alias "CURLE_HTTP_RETURNED_ERROR"
		end

	curl_write_error: INTEGER is
			-- An error occurred when writing received data to a local file, or an
			-- error was returned to libcurl from a write callback.
		external "C macro use <curl/curl.h>"
		alias "CURLE_WRITE_ERROR"
		end

	curl_malformat_user: INTEGER is
			-- This is never returned by current libcurl.
		external "C macro use <curl/curl.h>"
		alias "CURLE_MALFORMAT_USER"
		end

	curl_ftp_couldnt_store_file: INTEGER is
			-- FTP couldn't STOR file. The server denied the STOR operation. The error
			-- buffer usually contains the server's explanation to this.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_COULDNT_STOR_FILE"
		end

	curl_read_error: INTEGER is
			-- There was a problem reading a local file or an error returned by the
			-- read callback.
		external "C macro use <curl/curl.h>"
		alias "CURLE_READ_ERROR"
		end

	curl_out_of_memory: INTEGER is
			-- Out of memory. A memory allocation request failed. This is serious
			-- badness and things are severely screwed up if this ever occur.
		external "C macro use <curl/curl.h>"
		alias "CURLE_OUT_OF_MEMORY"
		end

	curl_operation_timeout: INTEGER is
			-- Operation timeout. The specified time-out period was reached according
			-- to the conditions.
		external "C macro use <curl/curl.h>"
		alias "CURLE_OPERATION_TIMEOUTED"
		end

	curl_ftp_couldnt_set_ascii: INTEGER is
			-- libcurl failed to set ASCII transfer type (TYPE A).
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_COULDNT_SET_ASCII"
		end

	curl_ftp_port_failed: INTEGER is
			-- The FTP PORT command returned error. This mostly happen when you haven't
			-- specified a good enough address for libcurl to use. See CURLOPT_FTPPORT.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_PORT_FAILED"
		end

	curl_ftp_couldnt_use_rest: INTEGER is
			-- The FTP REST command returned error. This should never happen if the
			-- server is sane.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_COULDNT_USE_REST"
		end

	curl_ftp_couldnt_get_size: INTEGER is
			-- The FTP SIZE command returned error. SIZE is not a kosher FTP command,
			-- it is an extension and not all servers support it. This is not a
			-- surprising error.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_COULDNT_GET_SIZE"
		end

	curl_http_range_error: INTEGER is
			-- The HTTP server does not support or accept range requests.
		external "C macro use <curl/curl.h>"
		alias "CURLE_HTTP_RANGE_ERROR"
		end

	curl_http_post_error: INTEGER is
			-- This is an odd error that mainly occurs due to internal confusion.
		external "C macro use <curl/curl.h>"
		alias "CURLE_HTTP_POST_ERROR"
		end

	curl_ssl_connect_error: INTEGER is
			-- A problem occurred somewhere in the SSL/TLS handshake. You really want
			-- the error buffer and read the message there as it pinpoints the problem
			-- slightly more. Could be certificates (file formats, paths, permissions),
			-- passwords, and others.
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_CONNECT_ERROR"
		end

	curl_ftp_bad_download_resume: INTEGER is
			-- Attempting FTP resume beyond file size.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_BAD_DOWNLOAD_RESUME"
		end

	curl_file_couldnt_read_file: INTEGER is
			-- A file given with FILE:// couldn't be opened. Most likely because the
			-- file path doesn't identify an existing file. Did you check file
			-- permissions?
		external "C macro use <curl/curl.h>"
		alias "CURLE_FILE_COULDNT_READ_FILE"
		end

	curl_ldap_cannot_bind: INTEGER is
			-- LDAP cannot bind. LDAP bind operation failed.
		external "C macro use <curl/curl.h>"
		alias "CURLE_LDAP_CANNOT_BIND"
		end

	curl_ldap_search_failed: INTEGER is
			-- LDAP search failed.
		external "C macro use <curl/curl.h>"
		alias "CURLE_LDAP_SEARCH_FAILED"
		end

	curl_library_not_found: INTEGER is
			-- Library not found. The LDAP library was not found.
		external "C macro use <curl/curl.h>"
		alias "CURLE_LIBRARY_NOT_FOUND"
		end

	curl_function_not_found: INTEGER is
			-- Function not found. A required LDAP function was not found.
		external "C macro use <curl/curl.h>"
		alias "CURLE_FUNCTION_NOT_FOUND"
		end

	curl_aborted_by_callback: INTEGER is
			-- Aborted by callback. A callback returned "abort" to libcurl.
		external "C macro use <curl/curl.h>"
		alias "CURLE_ABORTED_BY_CALLBACK"
		end

	curl_bad_function_argument: INTEGER is
			-- Internal error. A function was called with a bad parameter.
		external "C macro use <curl/curl.h>"
		alias "CURLE_BAD_FUNCTION_ARGUMENT"
		end

	curl_bad_calling_order: INTEGER is
			-- This is never returned by current libcurl.
		external "C macro use <curl/curl.h>"
		alias "CURLE_BAD_CALLING_ORDER"
		end

	curl_http_port_failed: INTEGER is
			-- Interface error. A specified outgoing interface could not be used. Set
			-- which interface to use for outgoing connections' source IP address with
			-- CURLOPT_INTERFACE.
		external "C macro use <curl/curl.h>"
		alias "CURLE_HTTP_PORT_FAILED"
		end

	curl_bad_password_entered: INTEGER is
			-- This is never returned by current libcurl.
		external "C macro use <curl/curl.h>"
		alias "CURLE_BAD_PASSWORD_ENTERED"
		end

	curl_too_many_redirects: INTEGER is
			-- Too many redirects. When following redirects, libcurl hit the maximum
			-- amount. Set your limit with CURLOPT_MAXREDIRS.
		external "C macro use <curl/curl.h>"
		alias "CURLE_TOO_MANY_REDIRECTS"
		end

	curl_unknown_telnet_option: INTEGER is
			-- An option set with CURLOPT_TELNETOPTIONS was not recognized/known. Refer
			-- to the appropriate documentation.
		external "C macro use <curl/curl.h>"
		alias "CURLE_UNKNOWN_TELNET_OPTION"
		end

	curl_telnet_option_syntax: INTEGER is
			-- A telnet option string was Illegally formatted.
		external "C macro use <curl/curl.h>"
		alias "CURLE_TELNET_OPTION_SYNTAX"
		end

	curl_obsolete: INTEGER is
			-- This is not an error. This used to be another error code in an old
			-- libcurl version and is currently unused.
		external "C macro use <curl/curl.h>"
		alias "CURLE_OBSOLETE"
		end

	curl_ssl_peer_certificate: INTEGER is
			-- The remote server's SSL certificate was deemed not OK.
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_PEER_CERTIFICATE"
		end

	curl_got_nothing: INTEGER is
			-- Nothing was returned from the server, and under the circumstances,
			-- getting nothing is considered an error.
		external "C macro use <curl/curl.h>"
		alias "CURLE_GOT_NOTHING"
		end

	curl_ssl_engine_not_found: INTEGER is
			-- The specified crypto engine wasn't found.
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_ENGINE_NOTFOUND"
		end

	curl_ssl_engine_set_failed: INTEGER is
			-- Failed setting the selected SSL crypto engine as default!
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_ENGINE_SETFAILED"
		end

	curl_send_error: INTEGER is
			-- Failed sending network data.
		external "C macro use <curl/curl.h>"
		alias "CURLE_SEND_ERROR"
		end

	curl_recv_error: INTEGER is
			-- Failure with receiving network data.
		external "C macro use <curl/curl.h>"
		alias "CURLE_RECV_ERROR"
		end

	curl_share_in_use: INTEGER is
			-- Share is in use
		external "C macro use <curl/curl.h>"
		alias "CURLE_SHARE_IN_USE"
		end

	curl_ssl_cert_problem: INTEGER is
			-- problem with the local client certificate
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_CERTPROBLEM"
		end

	curl_ssl_chiper: INTEGER is
			-- couldn't use specified cipher
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_CHIPER"
		end

	curl_ssl_cacert: INTEGER is
			-- problem with the CA cert (path? access rights?)
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_CACERT"
		end

	curl_bad_content_encoding: INTEGER is
			-- Unrecognized transfer encoding
		external "C macro use <curl/curl.h>"
		alias "CURLE_BAD_CONTENT_ENCODING"
		end

	curl_ldap_invalid_url: INTEGER is
			-- Invalid LDAP URL
		external "C macro use <curl/curl.h>"
		alias "CURLE_LDAP_INVALID_URL"
		end

	curl_file_size_exceeded: INTEGER is
			-- Maximum file size exceeded
		external "C macro use <curl/curl.h>"
		alias "CURLE_FILESIZE_EXCEEDED"
		end

	curl_ftp_ssl_failed: INTEGER is
			-- Requested FTP SSL level failed
		external "C macro use <curl/curl.h>"
		alias "CURLE_FTP_SSL_FAILED"
		end

	curl_send_fail_rewind: INTEGER is
			-- When doing a send operation curl had to rewind the data to retransmit,
			-- but the rewinding operation failed
		external "C macro use <curl/curl.h>"
		alias "CURLE_SEND_FAIL_REWIND"
		end

	curl_ssl_engine_init_failed: INTEGER is
			-- Initiating the SSL Engine failed
		external "C macro use <curl/curl.h>"
		alias "CURLE_SSL_ENGINE_INITFAILED"
		end

	curl_login_denied: INTEGER is
			-- The remote server denied curl to login (Added in 7.13.1)
		external "C macro use <curl/curl.h>"
		alias "CURLE_LOGIN_DENIED"
		end

	curl_tftp_not_found: INTEGER is
			-- File not found on TFTP server
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_NOTFOUND"
		end

	curl_tftp_perm: INTEGER is
			-- Permission problem on TFTP server
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_PERM"
		end

	curl_tftp_disk_full: INTEGER is
			-- Out of disk space on TFTP server
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_DISKFULL"
		end

	curl_tftp_illegal: INTEGER is
			-- Illegal TFTP operation
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_ILLEGAL"
		end

	curl_tftp_unknown_id: INTEGER is
			-- Unknown TFTP transfer ID
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_UNKNOWNID"
		end

	curl_tftp_exists: INTEGER is
			-- TFTP File already exists
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_EXISTS"
		end

	curl_tftp_no_such_user: INTEGER is
			-- No such TFTP user
		external "C macro use <curl/curl.h>"
		alias "CURLE_TFTP_NOSUCHUSER"
		end

	curl_conv_failed: INTEGER is
			-- Character conversion failed
		external "C macro use <curl/curl.h>"
		alias "CURLE_CONV_FAILED"
		end

	curl_conv_reqd: INTEGER is
			-- Caller must register conversion callbacks
		external "C macro use <curl/curl.h>"
		alias "CURLE_CONV_REQD"
		end

end -- class CURL_CODE
