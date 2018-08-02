-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class ECURL_PLUGIN
   --
   -- Low-level cUrl plugin functions -- meant to be inserted by ECURL classes.
   --

feature {} -- "easy" API
   curl_easy_init: POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_init"
         }"
      end

   curl_easy_setopt_string (handle: POINTER; option: INTEGER; parameter: STRING)
      do
         curl_easy_setopt_pointer(handle, option, parameter.to_external)
      end

   curl_easy_setopt_boolean (handle: POINTER; option: INTEGER; parameter: BOOLEAN)
      do
         curl_easy_setopt_integer(handle, option, if parameter then {INTEGER_64 1} else {INTEGER_64 0} end)
      end

   curl_easy_setopt_pointer (handle: POINTER; option: INTEGER; parameter: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_setopt"
         }"
      end

   curl_easy_setopt_integer (handle: POINTER; option: INTEGER; parameter: INTEGER_64)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_setopt"
         }"
      end

   curl_easy_reset (handle: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_reset"
         }"
      end

   curl_easy_duphandle (handle: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_duphandle"
         }"
      end

   curl_easy_perform (handle: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_perform"
         }"
      end

   curl_easy_cleanup (handle: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_cleanup"
         }"
      end

   curl_easy_strerror (errornum: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_easy_strerror"
         }"
      end

feature {} -- "multi" API
   curl_multi_init: POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_multi_init"
         }"
      end

   curl_multi_cleanup (handle: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_multi_cleanup"
         }"
      end

   curl_multi_perform (handle, running_handles: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_multi_perform"
         }"
      end

   curl_multi_fdset (handle, rset, wset, eset, fdmax: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_multi_fdset"
         }"
      end

   curl_multi_info_read (handle, nbmsg: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "curl_multi_info_read"
         }"
      end

feature {} -- EcUrl specific functions
   ecurl_init_write_function (handle, object: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ecurl_init_write_function"
         }"
      end

   ecurl_init_read_function (handle, object: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ecurl_init_read_function"
         }"
      end

   ecurl_multi_info_easy_handle (info: POINTER): POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ecurl_multi_info_easy_handle"
         }"
      end

   ecurl_multi_info_easy_code (info: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ecurl_multi_info_easy_code"
         }"
      end

   ecurl_multi_info_easy_done (info: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "ecurl_multi_info_easy_done"
         }"
      end

feature {} -- Constants (extracted from curl.h, version 7.39.0; removed deprecated and synonyms
   Curlopt_writedata: INTEGER
         --  /* This is the FILE * or void * the regular output should be written to. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_WRITEDATA"
         }"
      end

   Curlopt_url: INTEGER
         --  /* The full URL to get/put */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_URL"
         }"
      end

   Curlopt_port: INTEGER
         --  /* Port number to connect to, if other than default. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PORT"
         }"
      end

   Curlopt_proxy: INTEGER
         --  /* Name of proxy to use. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXY"
         }"
      end

   Curlopt_userpwd: INTEGER
         --  /* "user:password;options" to use when fetching. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_USERPWD"
         }"
      end

   Curlopt_proxyuserpwd: INTEGER
         --  /* "user:password" to use with proxy. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYUSERPWD"
         }"
      end

   Curlopt_range: INTEGER
         --  /* Range to get, specified as an ASCII string. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RANGE"
         }"
      end

   Curlopt_readdata: INTEGER
         --  /* Specified file stream to upload from (use as input): */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_READDATA"
         }"
      end

   Curlopt_errorbuffer: INTEGER
         --  /* Buffer to receive error messages in, must be at least ECURL_ERROR_SIZE
         --   * bytes big. If this is not used, error messages go to stderr instead: */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_ERRORBUFFER"
         }"
      end

   Curlopt_writefunction: INTEGER
         --  /* Function that will be called to store the output (instead of fwrite). The
         --   * parameters will use fwrite() syntax, make sure to follow them. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_WRITEFUNCTION"
         }"
      end

   Curlopt_readfunction: INTEGER
         --  /* Function that will be called to read the input (instead of fread). The
         --   * parameters will use fread() syntax, make sure to follow them. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_READFUNCTION"
         }"
      end

   Curlopt_timeout: INTEGER
         --  /* Time-out the read operation after this amount of seconds */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TIMEOUT"
         }"
      end

   Curlopt_infilesize: INTEGER
         --  /* If the curlopt_infile is used, this can be used to inform libcurl about
         --   * how large the file being sent really is. that allows better error
         --   * checking and better verifies that the upload was successful. -1 means
         --   * unknown size.
         --   *
         --   * for large file support, there is also a _large version of the key
         --   * which takes an off_t type, allowing platforms with larger off_t
         --   * sizes to handle larger files.  see below for infilesize_large.
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_INFILESIZE"
         }"
      end

   Curlopt_postfields: INTEGER
         --  /* POST static input fields. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_POSTFIELDS"
         }"
      end

   Curlopt_referer: INTEGER
         --  /* Set the referrer page (needed by some CGIs) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_REFERER"
         }"
      end

   Curlopt_ftpport: INTEGER
         --  /* Set the FTP PORT string (interface name, named or numerical IP address)
         --     Use i.e '-' to use default address. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTPPORT"
         }"
      end

   Curlopt_useragent: INTEGER
         --  /* Set the User-Agent string (examined by some CGIs) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_USERAGENT"
         }"
      end

   Curlopt_low_speed_limit: INTEGER
         --  /* If the download receives less than "low speed limit" bytes/second
         --   * during "low speed time" seconds, the operations is aborted.
         --   * You could i.e if you have a pretty high speed connection, abort if
         --   * it is less than 2000 bytes/sec during 20 seconds.
         --   */
         --  /* Set the "low speed limit" */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_LOW_SPEED_LIMIT"
         }"
      end

   Curlopt_low_speed_time: INTEGER
         --  /* Set the "low speed time" */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_LOW_SPEED_TIME"
         }"
      end

   Curlopt_resume_from: INTEGER
         --  /* Set the continuation offset.
         --   *
         --   * Note there is also a _LARGE version of this key which uses
         --   * off_t types, allowing for large file offsets on platforms which
         --   * use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RESUME_FROM"
         }"
      end

   Curlopt_cookie: INTEGER
         --  /* Set cookie in request: */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_COOKIE"
         }"
      end

   Curlopt_httpheader: INTEGER
         --  /* This points to a linked list of headers, struct curl_slist kind. This
         --     list is also used for RTSP (in spite of its name) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTPHEADER"
         }"
      end

   Curlopt_httppost: INTEGER
         --  /* This points to a linked list of post entries, struct curl_httppost */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTPPOST"
         }"
      end

   Curlopt_sslcert: INTEGER
         --  /* name of the file keeping your private SSL-certificate */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLCERT"
         }"
      end

   Curlopt_keypasswd: INTEGER
         --  /* password for the SSL or SSH private key */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_KEYPASSWD"
         }"
      end

   Curlopt_crlf: INTEGER
         --  /* send TYPE parameter? */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CRLF"
         }"
      end

   Curlopt_quote: INTEGER
         --  /* send linked-list of QUOTE commands */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_QUOTE"
         }"
      end

   Curlopt_headerdata: INTEGER
         --  /* send FILE * or void * to store headers to, if you use a callback it
         --     is simply passed to the callback unmodified */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HEADERDATA"
         }"
      end

   Curlopt_cookiefile: INTEGER
         --  /* point to a file to read the initial cookies from, also enables
         --     "cookie awareness" */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_COOKIEFILE"
         }"
      end

   Curlopt_sslversion: INTEGER
         --  /* What version to specifically try to use.
         --     See ECURL_SSLVERSION defines below. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLVERSION"
         }"
      end

   Curlopt_timecondition: INTEGER
         --  /* What kind of HTTP time condition to use, see defines */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TIMECONDITION"
         }"
      end

   Curlopt_timevalue: INTEGER
         --  /* Time to use with the above condition. Specified in number of seconds
         --     since 1 Jan 1970 */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TIMEVALUE"
         }"
      end

   Curlopt_customrequest: INTEGER
         --  /* Custom request, for customizing the get command like
         --     HTTP: DELETE, TRACE and others
         --     FTP: to use a different list command
         --     */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CUSTOMREQUEST"
         }"
      end

   Curlopt_stderr: INTEGER
         --  /* HTTP request, for odd commands like DELETE, TRACE and others */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_STDERR"
         }"
      end

   Curlopt_postquote: INTEGER
         --  /* send linked-list of post-transfer QUOTE commands */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_POSTQUOTE"
         }"
      end

   Curlopt_obsolete40: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_OBSOLETE40"
         }"
      end

   Curlopt_verbose: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_VERBOSE"
         }"
      end

   Curlopt_header: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HEADER"
         }"
      end

   Curlopt_noprogress: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NOPROGRESS"
         }"
      end

   Curlopt_nobody: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NOBODY"
         }"
      end

   Curlopt_failonerror: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FAILONERROR"
         }"
      end

   Curlopt_upload: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_UPLOAD"
         }"
      end

   Curlopt_post: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_POST"
         }"
      end

   Curlopt_dirlistonly: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DIRLISTONLY"
         }"
      end

   Curlopt_append: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_APPEND"
         }"
      end

   Curlopt_netrc: INTEGER
         --  /* Specify whether to read the user+password from the .netrc or the URL.
         --   * This must be one of the ECURL_NETRC_* enums below. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NETRC"
         }"
      end

   Curlopt_followlocation: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FOLLOWLOCATION"
         }"
      end

   Curlopt_transfertext: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TRANSFERTEXT"
         }"
      end

   Curlopt_put: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PUT"
         }"
      end

   Curlopt_progressfunction: INTEGER
         --  /* DEPRECATED
         --   * Function that will be called instead of the internal progress display
         --   * function. This function should be defined as the curl_progress_callback
         --   * prototype defines. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROGRESSFUNCTION"
         }"
      end

   Curlopt_progressdata: INTEGER
         --  /* Data passed to the curlopt_progressfunction and curlopt_xferinfofunction
         --     callbacks */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROGRESSDATA"
         }"
      end

   Curlopt_autoreferer: INTEGER
         --  /* We want the referrer field set automatically when following locations */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_AUTOREFERER"
         }"
      end

   Curlopt_proxyport: INTEGER
         --  /* Port of the proxy, can be set in the proxy string as well with:
         --     "[host]:[port]" */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYPORT"
         }"
      end

   Curlopt_postfieldsize: INTEGER
         --  /* size of the POST input data, if strlen() is not good to use */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_POSTFIELDSIZE"
         }"
      end

   Curlopt_httpproxytunnel: INTEGER
         --  /* tunnel non-http operations through a HTTP proxy */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTPPROXYTUNNEL"
         }"
      end

   Curlopt_interface: INTEGER
         --  /* Set the interface string to use as outgoing network interface */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_INTERFACE"
         }"
      end

   Curlopt_krblevel: INTEGER
         --  /* Set the krb4/5 security level, this also enables krb4/5 awareness.  This
         --   * is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string
         --   * is set but doesn't match one of these, 'private' will be used.  */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_KRBLEVEL"
         }"
      end

   Curlopt_ssl_verifypeer: INTEGER
         --  /* Set if we should verify the peer in ssl handshake, set 1 to verify. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_VERIFYPEER"
         }"
      end

   Curlopt_cainfo: INTEGER
         --  /* The CApath or CAfile used to validate the peer certificate
         --     this option is used only if SSL_VERIFYPEER is true */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CAINFO"
         }"
      end

   Curlopt_maxredirs: INTEGER
         --  /* Maximum number of http redirects to follow */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAXREDIRS"
         }"
      end

   Curlopt_filetime: INTEGER
         --  /* Pass a long set to 1 to get the date of the requested document (if
         --     possible)! Pass a zero to shut it off. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FILETIME"
         }"
      end

   Curlopt_telnetoptions: INTEGER
         --  /* This points to a linked list of telnet options */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TELNETOPTIONS"
         }"
      end

   Curlopt_maxconnects: INTEGER
         --  /* Max amount of cached alive connections */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAXCONNECTS"
         }"
      end

   Curlopt_fresh_connect: INTEGER
         --  /* Set to explicitly use a new connection for the upcoming transfer.
         --     Do not use this unless you're absolutely sure of this, as it makes the
         --     operation slower and is less friendly for the network. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FRESH_CONNECT"
         }"
      end

   Curlopt_forbid_reuse: INTEGER
         --  /* Set to explicitly forbid the upcoming transfer's connection to be re-used
         --     when done. Do not use this unless you're absolutely sure of this, as it
         --     makes the operation slower and is less friendly for the network. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FORBID_REUSE"
         }"
      end

   Curlopt_random_file: INTEGER
         --  /* Set to a file name that contains random data for libcurl to use to
         --     seed the random engine when doing SSL connects. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RANDOM_FILE"
         }"
      end

   Curlopt_egdsocket: INTEGER
         --  /* Set to the Entropy Gathering Daemon socket pathname */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_EGDSOCKET"
         }"
      end

   Curlopt_connecttimeout: INTEGER
         --  /* Time-out connect operations after this amount of seconds, if connects are
         --     OK within this time, then fine... This only aborts the connect phase. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CONNECTTIMEOUT"
         }"
      end

   Curlopt_headerfunction: INTEGER
         --  /* Function that will be called to store headers (instead of fwrite). The
         --   * parameters will use fwrite() syntax, make sure to follow them. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HEADERFUNCTION"
         }"
      end

   Curlopt_httpget: INTEGER
         --  /* Set this to force the HTTP request to get back to GET. Only really usable
         --     if POST, PUT or a custom request have been used first.
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTPGET"
         }"
      end

   Curlopt_ssl_verifyhost: INTEGER
         --  /* Set if we should verify the Common name from the peer certificate in ssl
         --   * handshake, set 1 to check existence, 2 to ensure that it matches the
         --   * provided hostname. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_VERIFYHOST"
         }"
      end

   Curlopt_cookiejar: INTEGER
         --  /* Specify which file name to write all known cookies in after completed
         --     operation. Set file name to "-" (dash) to make it go to stdout. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_COOKIEJAR"
         }"
      end

   Curlopt_ssl_cipher_list: INTEGER
         --  /* Specify which SSL ciphers to use */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_CIPHER_LIST"
         }"
      end

   Curlopt_http_version: INTEGER
         --  /* Specify which HTTP version to use! This must be set to one of the
         --     ECURL_HTTP_VERSION* enums set below. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTP_VERSION"
         }"
      end

   Curlopt_ftp_use_epsv: INTEGER
         --  /* Specifically switch on or off the FTP engine's use of the EPSV command. By
         --     default, that one will always be attempted before the more traditional
         --     PASV command. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_USE_EPSV"
         }"
      end

   Curlopt_sslcerttype: INTEGER
         --  /* type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLCERTTYPE"
         }"
      end

   Curlopt_sslkey: INTEGER
         --  /* name of the file keeping your private SSL-key */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLKEY"
         }"
      end

   Curlopt_sslkeytype: INTEGER
         --  /* type of the file keeping your private SSL-key ("DER", "PEM", "ENG") */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLKEYTYPE"
         }"
      end

   Curlopt_sslengine: INTEGER
         --  /* crypto engine for the SSL-sub system */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLENGINE"
         }"
      end

   Curlopt_sslengine_default: INTEGER
         --  /* set the crypto engine for the SSL-sub system as default
         --     the param has no meaning...
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSLENGINE_DEFAULT"
         }"
      end

   Curlopt_dns_use_global_cache: INTEGER
         --  /* Non-zero value means to use the global dns cache */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DNS_USE_GLOBAL_CACHE"
         }"
      end

   Curlopt_dns_cache_timeout: INTEGER
         --  /* DNS cache timeout */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DNS_CACHE_TIMEOUT"
         }"
      end

   Curlopt_prequote: INTEGER
         --  /* send linked-list of pre-transfer QUOTE commands */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PREQUOTE"
         }"
      end

   Curlopt_debugfunction: INTEGER
         --  /* set the debug function */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DEBUGFUNCTION"
         }"
      end

   Curlopt_debugdata: INTEGER
         --  /* set the data for the debug function */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DEBUGDATA"
         }"
      end

   Curlopt_cookiesession: INTEGER
         --  /* mark this as start of a cookie session */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_COOKIESESSION"
         }"
      end

   Curlopt_capath: INTEGER
         --  /* The CApath directory used to validate the peer certificate
         --     this option is used only if SSL_VERIFYPEER is true */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CAPATH"
         }"
      end

   Curlopt_buffersize: INTEGER
         --  /* Instruct libcurl to use a smaller receive buffer */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_BUFFERSIZE"
         }"
      end

   Curlopt_nosignal: INTEGER
         --  /* Instruct libcurl to not use any signal/alarm handlers, even when using
         --     timeouts. This option is useful for multi-threaded applications.
         --     See libcurl-the-guide for more background information. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NOSIGNAL"
         }"
      end

   Curlopt_share: INTEGER
         --  /* Provide a ECURLShare for mutexing non-ts data */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SHARE"
         }"
      end

   Curlopt_proxytype: INTEGER
         --  /* indicates type of proxy. accepted values are ECURLPROXY_HTTP (default),
         --     ECURLPROXY_SOCKS4, ECURLPROXY_SOCKS4A and ECURLPROXY_SOCKS5. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYTYPE"
         }"
      end

   Curlopt_accept_encoding: INTEGER
         --  /* Set the Accept-Encoding string. Use this to tell a server you would like
         --     the response to be compressed. Before 7.21.6, this was known as
         --     curlopt_encoding */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_ACCEPT_ENCODING"
         }"
      end

   Curlopt_private: INTEGER
         --  /* Set pointer to private data */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PRIVATE"
         }"
      end

   Curlopt_http200aliases: INTEGER
         --  /* Set aliases for HTTP 200 in the HTTP Response header */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTP200ALIASES"
         }"
      end

   Curlopt_unrestricted_auth: INTEGER
         --  /* Continue to send authentication (user+password) when following locations,
         --     even when hostname changed. This can potentially send off the name
         --     and password to whatever host the server decides. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_UNRESTRICTED_AUTH"
         }"
      end

   Curlopt_ftp_use_eprt: INTEGER
         --  /* Specifically switch on or off the FTP engine's use of the EPRT command (
         --     it also disables the LPRT attempt). By default, those ones will always be
         --     attempted before the good old traditional PORT command. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_USE_EPRT"
         }"
      end

   Curlopt_httpauth: INTEGER
         --  /* Set this to a bitmask value to enable the particular authentications
         --     methods you like. Use this in combination with curlopt_userpwd.
         --     note that setting multiple bits may cause extra network round-trips. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTPAUTH"
         }"
      end

   Curlopt_ssl_ctx_function: INTEGER
         --  /* Set the ssl context callback function, currently only for OpenSSL ssl_ctx
         --     in second argument. The function must be matching the
         --     curl_ssl_ctx_callback proto. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_CTX_FUNCTION"
         }"
      end

   Curlopt_ssl_ctx_data: INTEGER
         --  /* Set the userdata for the ssl context callback function's third
         --     argument */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_CTX_DATA"
         }"
      end

   Curlopt_ftp_create_missing_dirs: INTEGER
         --  /* FTP Option that causes missing dirs to be created on the remote server.
         --     In 7.19.4 we introduced the convenience enums for this option using the
         --     ECURLFTP_CREATE_DIR prefix.
         --  */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_CREATE_MISSING_DIRS"
         }"
      end

   Curlopt_proxyauth: INTEGER
         --  /* Set this to a bitmask value to enable the particular authentications
         --     methods you like. Use this in combination with curlopt_proxyuserpwd.
         --     note that setting multiple bits may cause extra network round-trips. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYAUTH"
         }"
      end

   Curlopt_ftp_response_timeout: INTEGER
         --  /* FTP option that changes the timeout, in seconds, associated with
         --     getting a response.  This is different from transfer timeout time and
         --     essentially places a demand on the FTP server to acknowledge commands
         --     in a timely manner. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_RESPONSE_TIMEOUT"
         }"
      end

   Curlopt_ipresolve: INTEGER
         --  /* Set this option to one of the ECURL_IPRESOLVE_* defines (see below) to
         --     tell libcurl to resolve names to those IP versions only. This only has
         --     affect on systems with support for more than one, i.e IPv4 _and_ IPv6. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_IPRESOLVE"
         }"
      end

   Curlopt_maxfilesize: INTEGER
         --   /* Set this option to limit the size of a file that will be downloaded from
         --         an HTTP or FTP server.
         --
         --     Note there is also _LARGE version which adds large file support for
         --     platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAXFILESIZE"
         }"
      end

   Curlopt_infilesize_large: INTEGER
         --  /* See the comment for INFILESIZE above, but in short, specifies
         --   * the size of the file being uploaded.  -1 means unknown.
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_INFILESIZE_LARGE"
         }"
      end

   Curlopt_resume_from_large: INTEGER
         --  /* Sets the continuation offset.  There is also a LONG version of this;
         --   * look above for RESUME_FROM.
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RESUME_FROM_LARGE"
         }"
      end

   Curlopt_maxfilesize_large: INTEGER
         --  /* Sets the maximum size of data that will be downloaded from
         --   * an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.
         --   */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAXFILESIZE_LARGE"
         }"
      end

   Curlopt_netrc_file: INTEGER
         --  /* Set this option to the file name of your .netrc file you want libcurl
         --     to parse (using the curlopt_netrc option). if not set, libcurl will do
         --     a poor attempt to find the user's home directory and check for a .netrc
         --     file in there. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NETRC_FILE"
         }"
      end

   Curlopt_use_ssl: INTEGER
         --  /* Enable SSL/TLS for FTP, pick one of:
         --     ECURLUSESSL_TRY     - try using SSL, proceed anyway otherwise
         --     ECURLUSESSL_CONTROL - SSL for the control connection or fail
         --     ECURLUSESSL_ALL     - SSL for all communication or fail
         --  */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_USE_SSL"
         }"
      end

   Curlopt_postfieldsize_large: INTEGER
         --  /* The _LARGE version of the standard POSTFIELDSIZE option */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_POSTFIELDSIZE_LARGE"
         }"
      end

   Curlopt_tcp_nodelay: INTEGER
         --  /* Enable/disable the TCP Nagle algorithm */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TCP_NODELAY"
         }"
      end

   Curlopt_ftpsslauth: INTEGER
         --  /* When FTP over SSL/TLS is selected (with curlopt_use_ssl), this option
         --     can be used to change libcurl's default action which is to first try
         --     "auth ssl" and then "auth tls" in this order, and proceed when a ok
         --     response has been received.
         --
         --     available parameters are:
         --     ECURLFTPAUTH_DEFAULT - let libcurl decide
         --     ECURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
         --     ECURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL
         --  */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTPSSLAUTH"
         }"
      end

   Curlopt_ioctlfunction: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_IOCTLFUNCTION"
         }"
      end

   Curlopt_ioctldata: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_IOCTLDATA"
         }"
      end

   Curlopt_ftp_account: INTEGER
         --  /* zero terminated string for pass on to the FTP server when asked for
         --     "account" info */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_ACCOUNT"
         }"
      end

   Curlopt_cookielist: INTEGER
         --  /* feed cookies into cookie engine */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_COOKIELIST"
         }"
      end

   Curlopt_ignore_content_length: INTEGER
         --  /* ignore Content-Length */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_IGNORE_CONTENT_LENGTH"
         }"
      end

   Curlopt_ftp_skip_pasv_ip: INTEGER
         --  /* Set to non-zero to skip the IP address received in a 227 PASV FTP server
         --     response. Typically used for FTP-SSL purposes but is not restricted to
         --     that. libcurl will then instead use the same IP address it used for the
         --     control connection. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_SKIP_PASV_IP"
         }"
      end

   Curlopt_ftp_filemethod: INTEGER
         --  /* Select "file method" to use when doing FTP, see the curl_ftpmethod
         --     above. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_FILEMETHOD"
         }"
      end

   Curlopt_localport: INTEGER
         --  /* Local port number to bind the socket to */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_LOCALPORT"
         }"
      end

   Curlopt_localportrange: INTEGER
         --  /* Number of ports to try, including the first one set with LOCALPORT.
         --     Thus, setting it to 1 will make no additional attempts but the first.
         --  */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_LOCALPORTRANGE"
         }"
      end

   Curlopt_connect_only: INTEGER
         --  /* no transfer, set up connection and let application use the socket by
         --     extracting it with ECURLINFO_LASTSOCKET */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CONNECT_ONLY"
         }"
      end

   Curlopt_conv_from_network_function: INTEGER
         --  /* Function that will be called to convert from the
         --     network encoding (instead of using the iconv calls in libcurl) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CONV_FROM_NETWORK_FUNCTION"
         }"
      end

   Curlopt_conv_to_network_function: INTEGER
         --  /* Function that will be called to convert to the
         --     network encoding (instead of using the iconv calls in libcurl) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CONV_TO_NETWORK_FUNCTION"
         }"
      end

   Curlopt_conv_from_utf8_function: INTEGER
         --  /* Function that will be called to convert from UTF8
         --     (instead of using the iconv calls in libcurl)
         --     Note that this is used only for SSL certificate processing */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CONV_FROM_UTF8_FUNCTION"
         }"
      end

   Curlopt_max_send_speed_large: INTEGER
         --  /* if the connection proceeds too quickly then need to slow it down */
         --  /* limit-rate: maximum number of bytes per second to send or receive */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAX_SEND_SPEED_LARGE"
         }"
      end

   Curlopt_max_recv_speed_large: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAX_RECV_SPEED_LARGE"
         }"
      end

   Curlopt_ftp_alternative_to_user: INTEGER
         --  /* Pointer to command string to send if USER/PASS fails. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_ALTERNATIVE_TO_USER"
         }"
      end

   Curlopt_sockoptfunction: INTEGER
         --  /* callback function for setting socket options */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SOCKOPTFUNCTION"
         }"
      end

   Curlopt_sockoptdata: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SOCKOPTDATA"
         }"
      end

   Curlopt_ssl_sessionid_cache: INTEGER
         --  /* set to 0 to disable session ID re-use for this transfer, default is
         --     enabled (== 1) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_SESSIONID_CACHE"
         }"
      end

   Curlopt_ssh_auth_types: INTEGER
         --  /* allowed SSH authentication methods */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_AUTH_TYPES"
         }"
      end

   Curlopt_ssh_public_keyfile: INTEGER
         --  /* Used by scp/sftp to do public/private key authentication */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_PUBLIC_KEYFILE"
         }"
      end

   Curlopt_ssh_private_keyfile: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_PRIVATE_KEYFILE"
         }"
      end

   Curlopt_ftp_ssl_ccc: INTEGER
         --  /* Send CCC (Clear Command Channel) after authentication */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_SSL_CCC"
         }"
      end

   Curlopt_timeout_ms: INTEGER
         --  /* Same as TIMEOUT and CONNECTTIMEOUT, but with ms resolution */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TIMEOUT_MS"
         }"
      end

   Curlopt_connecttimeout_ms: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CONNECTTIMEOUT_MS"
         }"
      end

   Curlopt_http_transfer_decoding: INTEGER
         --  /* set to zero to disable the libcurl's decoding and thus pass the raw body
         --     data to the application even when it is encoded/compressed */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTP_TRANSFER_DECODING"
         }"
      end

   Curlopt_http_content_decoding: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HTTP_CONTENT_DECODING"
         }"
      end

   Curlopt_new_file_perms: INTEGER
         --  /* Permission used when creating new files and directories on the remote
         --     server for protocols that support it, SFTP/SCP/FILE */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NEW_FILE_PERMS"
         }"
      end

   Curlopt_new_directory_perms: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NEW_DIRECTORY_PERMS"
         }"
      end

   Curlopt_postredir: INTEGER
         --  /* Set the behaviour of POST when redirecting. Values must be set to one
         --     of ECURL_REDIR* defines below. This used to be called curlopt_post301 */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_POSTREDIR"
         }"
      end

   Curlopt_ssh_host_public_key_md5: INTEGER
         --  /* used by scp/sftp to verify the host's public key */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_HOST_PUBLIC_KEY_MD5"
         }"
      end

   Curlopt_opensocketfunction: INTEGER
         --  /* Callback function for opening socket (instead of socket(2)). Optionally,
         --     callback is able change the address or refuse to connect returning
         --     ECURL_SOCKET_BAD.  The callback should have type
         --     curl_opensocket_callback */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_OPENSOCKETFUNCTION"
         }"
      end

   Curlopt_opensocketdata: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_OPENSOCKETDATA"
         }"
      end

   Curlopt_copypostfields: INTEGER
         --  /* POST volatile input fields. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_COPYPOSTFIELDS"
         }"
      end

   Curlopt_proxy_transfer_mode: INTEGER
         --  /* set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXY_TRANSFER_MODE"
         }"
      end

   Curlopt_seekfunction: INTEGER
         --  /* Callback function for seeking in the input stream */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SEEKFUNCTION"
         }"
      end

   Curlopt_seekdata: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SEEKDATA"
         }"
      end

   Curlopt_crlfile: INTEGER
         --  /* CRL file */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CRLFILE"
         }"
      end

   Curlopt_issuercert: INTEGER
         --  /* Issuer certificate */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_ISSUERCERT"
         }"
      end

   Curlopt_address_scope: INTEGER
         --  /* (IPv6) Address scope */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_ADDRESS_SCOPE"
         }"
      end

   Curlopt_certinfo: INTEGER
         --  /* Collect certificate chain info and allow it to get retrievable with
         --     ECURLINFO_CERTINFO after the transfer is complete. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CERTINFO"
         }"
      end

   Curlopt_username: INTEGER
         --  /* "name" and "pwd" to use when fetching. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_USERNAME"
         }"
      end

   Curlopt_password: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PASSWORD"
         }"
      end

   Curlopt_proxyusername: INTEGER
         --    /* "name" and "pwd" to use with Proxy when fetching. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYUSERNAME"
         }"
      end

   Curlopt_proxypassword: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYPASSWORD"
         }"
      end

   Curlopt_noproxy: INTEGER
         --  /* Comma separated list of hostnames defining no-proxy zones. These should
         --     match both hostnames directly, and hostnames within a domain. For
         --     example, local.com will match local.com and www.local.com, but NOT
         --     notlocal.com or www.notlocal.com. For compatibility with other
         --     implementations of this, .local.com will be considered to be the same as
         --     local.com. A single * is the only valid wildcard, and effectively
         --     disables the use of proxy. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_NOPROXY"
         }"
      end

   Curlopt_tftp_blksize: INTEGER
         --  /* block size for TFTP transfers */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TFTP_BLKSIZE"
         }"
      end

   Curlopt_socks5_gssapi_service: INTEGER
         --  /* Socks Service */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SOCKS5_GSSAPI_SERVICE"
         }"
      end

   Curlopt_socks5_gssapi_nec: INTEGER
         --  /* Socks Service */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SOCKS5_GSSAPI_NEC"
         }"
      end

   Curlopt_protocols: INTEGER
         --  /* set the bitmask for the protocols that are allowed to be used for the
         --     transfer, which thus helps the app which takes URLs from users or other
         --     external inputs and want to restrict what protocol(s) to deal
         --     with. Defaults to ECURLPROTO_ALL. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROTOCOLS"
         }"
      end

   Curlopt_redir_protocols: INTEGER
         --  /* set the bitmask for the protocols that libcurl is allowed to follow to,
         --     as a subset of the curlopt_protocols ones. that means the protocol needs
         --     to be set in both bitmasks to be allowed to get redirected to. defaults
         --     to all protocols except file and scp. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_REDIR_PROTOCOLS"
         }"
      end

   Curlopt_ssh_knownhosts: INTEGER
         --  /* set the SSH knownhost file name to use */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_KNOWNHOSTS"
         }"
      end

   Curlopt_ssh_keyfunction: INTEGER
         --  /* set the SSH host key callback, must point to a curl_sshkeycallback
         --     function */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_KEYFUNCTION"
         }"
      end

   Curlopt_ssh_keydata: INTEGER
         --  /* set the SSH host key callback custom pointer */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSH_KEYDATA"
         }"
      end

   Curlopt_mail_from: INTEGER
         --  /* set the SMTP mail originator */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAIL_FROM"
         }"
      end

   Curlopt_mail_rcpt: INTEGER
         --  /* set the SMTP mail receiver(s) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAIL_RCPT"
         }"
      end

   Curlopt_ftp_use_pret: INTEGER
         --  /* FTP: send PRET before PASV */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FTP_USE_PRET"
         }"
      end

   Curlopt_rtsp_request: INTEGER
         --  /* RTSP request method (OPTIONS, SETUP, PLAY, etc...) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RTSP_REQUEST"
         }"
      end

   Curlopt_rtsp_session_id: INTEGER
         --  /* The RTSP session identifier */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RTSP_SESSION_ID"
         }"
      end

   Curlopt_rtsp_stream_uri: INTEGER
         --  /* The RTSP stream URI */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RTSP_STREAM_URI"
         }"
      end

   Curlopt_rtsp_transport: INTEGER
         --  /* The Transport: header to use in RTSP requests */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RTSP_TRANSPORT"
         }"
      end

   Curlopt_rtsp_client_cseq: INTEGER
         --  /* Manually initialize the client RTSP CSeq for this handle */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RTSP_CLIENT_CSEQ"
         }"
      end

   Curlopt_rtsp_server_cseq: INTEGER
         --  /* Manually initialize the server RTSP CSeq for this handle */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RTSP_SERVER_CSEQ"
         }"
      end

   Curlopt_interleavedata: INTEGER
         --  /* The stream to pass to INTERLEAVEFUNCTION. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_INTERLEAVEDATA"
         }"
      end

   Curlopt_interleavefunction: INTEGER
         --  /* Let the application define a custom write method for RTP data */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_INTERLEAVEFUNCTION"
         }"
      end

   Curlopt_wildcardmatch: INTEGER
         --  /* Turn on wildcard matching */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_WILDCARDMATCH"
         }"
      end

   Curlopt_chunk_bgn_function: INTEGER
         --  /* Directory matching callback called before downloading of an
         --     individual file (chunk) started */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CHUNK_BGN_FUNCTION"
         }"
      end

   Curlopt_chunk_end_function: INTEGER
         --  /* Directory matching callback called after the file (chunk)
         --     was downloaded, or skipped */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CHUNK_END_FUNCTION"
         }"
      end

   Curlopt_fnmatch_function: INTEGER
         --  /* Change match (fnmatch-like) callback for wildcard matching */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FNMATCH_FUNCTION"
         }"
      end

   Curlopt_chunk_data: INTEGER
         --  /* Let the application define custom chunk data pointer */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CHUNK_DATA"
         }"
      end

   Curlopt_fnmatch_data: INTEGER
         --  /* FNMATCH_FUNCTION user pointer */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_FNMATCH_DATA"
         }"
      end

   Curlopt_resolve: INTEGER
         --  /* send linked-list of name:port:address sets */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_RESOLVE"
         }"
      end

   Curlopt_tlsauth_username: INTEGER
         --  /* Set a username for authenticated TLS */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TLSAUTH_USERNAME"
         }"
      end

   Curlopt_tlsauth_password: INTEGER
         --  /* Set a password for authenticated TLS */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TLSAUTH_PASSWORD"
         }"
      end

   Curlopt_tlsauth_type: INTEGER
         --  /* Set authentication type for authenticated TLS */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TLSAUTH_TYPE"
         }"
      end

   Curlopt_transfer_encoding: INTEGER
         --  /* Set to 1 to enable the "TE:" header in HTTP requests to ask for
         --     compressed transfer-encoded responses. Set to 0 to disable the use of TE:
         --     in outgoing requests. The current default is 0, but it might change in a
         --     future libcurl release.
         --
         --     libcurl will ask for the compressed methods it knows of, and if that
         --     isn't any, it will not ask for transfer-encoding at all even if this
         --     option is set to 1.
         --
         --  */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TRANSFER_ENCODING"
         }"
      end

   Curlopt_closesocketfunction: INTEGER
         --  /* Callback function for closing socket (instead of close(2)). The callback
         --     should have type curl_closesocket_callback */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CLOSESOCKETFUNCTION"
         }"
      end

   Curlopt_closesocketdata: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_CLOSESOCKETDATA"
         }"
      end

   Curlopt_gssapi_delegation: INTEGER
         --  /* allow GSSAPI credential delegation */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_GSSAPI_DELEGATION"
         }"
      end

   Curlopt_dns_servers: INTEGER
         --  /* Set the name servers to use for DNS resolution */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DNS_SERVERS"
         }"
      end

   Curlopt_accepttimeout_ms: INTEGER
         --  /* Time-out accept operations (currently for FTP only) after this amount
         --     of miliseconds. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_ACCEPTTIMEOUT_MS"
         }"
      end

   Curlopt_tcp_keepalive: INTEGER
         --  /* Set TCP keepalive */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TCP_KEEPALIVE"
         }"
      end

   Curlopt_tcp_keepidle: INTEGER
         --  /* non-universal keepalive knobs (Linux, AIX, HP-UX, more) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TCP_KEEPIDLE"
         }"
      end

   Curlopt_tcp_keepintvl: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_TCP_KEEPINTVL"
         }"
      end

   Curlopt_ssl_options: INTEGER
         --  /* Enable/disable specific SSL features with a bitmask, see ECURLSSLOPT_* */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_OPTIONS"
         }"
      end

   Curlopt_mail_auth: INTEGER
         --  /* Set the SMTP auth originator */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_MAIL_AUTH"
         }"
      end

   Curlopt_sasl_ir: INTEGER
         --  /* Enable/disable SASL initial response */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SASL_IR"
         }"
      end

   Curlopt_xferinfofunction: INTEGER
         --  /* Function that will be called instead of the internal progress display
         --   * function. This function should be defined as the curl_xferinfo_callback
         --   * prototype defines. (Deprecates curlopt_progressfunction) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_XFERINFOFUNCTION"
         }"
      end

   Curlopt_xoauth2_bearer: INTEGER
         --  /* The XOAUTH2 bearer token */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_XOAUTH2_BEARER"
         }"
      end

   Curlopt_dns_interface: INTEGER
         --  /* Set the interface string to use as outgoing network
         --   * interface for DNS requests.
         --   * Only supported by the c-ares DNS backend */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DNS_INTERFACE"
         }"
      end

   Curlopt_dns_local_ip4: INTEGER
         --  /* Set the local IPv4 address to use for outgoing DNS requests.
         --   * Only supported by the c-ares DNS backend */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DNS_LOCAL_IP4"
         }"
      end

   Curlopt_dns_local_ip6: INTEGER
         --  /* Set the local IPv4 address to use for outgoing DNS requests.
         --   * Only supported by the c-ares DNS backend */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_DNS_LOCAL_IP6"
         }"
      end

   Curlopt_login_options: INTEGER
         --  /* Set authentication options directly */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_LOGIN_OPTIONS"
         }"
      end

   Curlopt_ssl_enable_npn: INTEGER
         --  /* Enable/disable TLS NPN extension (http2 over ssl might fail without) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_ENABLE_NPN"
         }"
      end

   Curlopt_ssl_enable_alpn: INTEGER
         --  /* Enable/disable TLS ALPN extension (http2 over ssl might fail without) */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_SSL_ENABLE_ALPN"
         }"
      end

   Curlopt_expect_100_timeout_ms: INTEGER
         --  /* Time to wait for a response to a HTTP request containing an
         --   * Expect: 100-continue header before sending the data anyway. */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_EXPECT_100_TIMEOUT_MS"
         }"
      end

   Curlopt_proxyheader: INTEGER
         --  /* This points to a linked list of headers used for proxy requests only,
         --     struct curl_slist kind */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PROXYHEADER"
         }"
      end

   Curlopt_headeropt: INTEGER
         --  /* Pass in a bitmask of "header options" */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_HEADEROPT"
         }"
      end

   Curlopt_pinnedpublickey: INTEGER
         --  /* The public key in DER form used to validate the peer public key
         --     this option is used only if SSL_VERIFYPEER is true */
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLOPT_PINNEDPUBLICKEY"
         }"
      end

feature {}
   Curle_ok: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OK"
         }"
      end

   Curle_unsupported_protocol: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_UNSUPPORTED_PROTOCOL"
         }"
      end

   Curle_failed_init: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FAILED_INIT"
         }"
      end

   Curle_url_malformat: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_URL_MALFORMAT"
         }"
      end

   Curle_not_built_in: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_NOT_BUILT_IN"
         }"
      end

   Curle_couldnt_resolve_proxy: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_COULDNT_RESOLVE_PROXY"
         }"
      end

   Curle_couldnt_resolve_host: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_COULDNT_RESOLVE_HOST"
         }"
      end

   Curle_couldnt_connect: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_COULDNT_CONNECT"
         }"
      end

   Curle_ftp_weird_server_reply: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_WEIRD_SERVER_REPLY"
         }"
      end

   Curle_remote_access_denied: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_REMOTE_ACCESS_DENIED"
         }"
      end

   Curle_ftp_accept_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_ACCEPT_FAILED"
         }"
      end

   Curle_ftp_weird_pass_reply: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_WEIRD_PASS_REPLY"
         }"
      end

   Curle_ftp_accept_timeout: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_ACCEPT_TIMEOUT"
         }"
      end

   Curle_ftp_weird_pasv_reply: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_WEIRD_PASV_REPLY"
         }"
      end

   Curle_ftp_weird_227_format: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_WEIRD_227_FORMAT"
         }"
      end

   Curle_ftp_cant_get_host: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_CANT_GET_HOST"
         }"
      end

   Curle_http2: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_HTTP2"
         }"
      end

   Curle_ftp_couldnt_set_type: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_COULDNT_SET_TYPE"
         }"
      end

   Curle_partial_file: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_PARTIAL_FILE"
         }"
      end

   Curle_ftp_couldnt_retr_file: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_COULDNT_RETR_FILE"
         }"
      end

   Curle_obsolete20: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE20"
         }"
      end

   Curle_quote_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_QUOTE_ERROR"
         }"
      end

   Curle_http_returned_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_HTTP_RETURNED_ERROR"
         }"
      end

   Curle_write_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_WRITE_ERROR"
         }"
      end

   Curle_obsolete24: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE24"
         }"
      end

   Curle_upload_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_UPLOAD_FAILED"
         }"
      end

   Curle_read_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_READ_ERROR"
         }"
      end

   Curle_out_of_memory: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OUT_OF_MEMORY"
         }"
      end

   Curle_operation_timedout: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OPERATION_TIMEDOUT"
         }"
      end

   Curle_obsolete29: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE29"
         }"
      end

   Curle_ftp_port_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_PORT_FAILED"
         }"
      end

   Curle_ftp_couldnt_use_rest: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_COULDNT_USE_REST"
         }"
      end

   Curle_obsolete32: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE32"
         }"
      end

   Curle_range_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_RANGE_ERROR"
         }"
      end

   Curle_http_post_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_HTTP_POST_ERROR"
         }"
      end

   Curle_ssl_connect_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_CONNECT_ERROR"
         }"
      end

   Curle_bad_download_resume: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_BAD_DOWNLOAD_RESUME"
         }"
      end

   Curle_file_couldnt_read_file: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FILE_COULDNT_READ_FILE"
         }"
      end

   Curle_ldap_cannot_bind: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_LDAP_CANNOT_BIND"
         }"
      end

   Curle_ldap_search_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_LDAP_SEARCH_FAILED"
         }"
      end

   Curle_obsolete40: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE40"
         }"
      end

   Curle_function_not_found: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FUNCTION_NOT_FOUND"
         }"
      end

   Curle_aborted_by_callback: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_ABORTED_BY_CALLBACK"
         }"
      end

   Curle_bad_function_argument: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_BAD_FUNCTION_ARGUMENT"
         }"
      end

   Curle_obsolete44: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE44"
         }"
      end

   Curle_interface_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_INTERFACE_FAILED"
         }"
      end

   Curle_obsolete46: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE46"
         }"
      end

   Curle_too_many_redirects: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TOO_MANY_REDIRECTS,"
         }"
      end

   Curle_unknown_option: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_UNKNOWN_OPTION"
         }"
      end

   Curle_telnet_option_syntax: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TELNET_OPTION_SYNTAX,"
         }"
      end

   Curle_obsolete50: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE50"
         }"
      end

   Curle_peer_failed_verification: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_PEER_FAILED_VERIFICATION"
         }"
      end

   Curle_got_nothing: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_GOT_NOTHING"
         }"
      end

   Curle_ssl_engine_notfound: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_ENGINE_NOTFOUND"
         }"
      end

   Curle_ssl_engine_setfailed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_ENGINE_SETFAILED"
         }"
      end

   Curle_send_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SEND_ERROR"
         }"
      end

   Curle_recv_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_RECV_ERROR"
         }"
      end

   Curle_obsolete57: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_OBSOLETE57"
         }"
      end

   Curle_ssl_certproblem: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_CERTPROBLEM"
         }"
      end

   Curle_ssl_cipher: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_CIPHER"
         }"
      end

   Curle_ssl_cacert: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_CACERT"
         }"
      end

   Curle_bad_content_encoding: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_BAD_CONTENT_ENCODING"
         }"
      end

   Curle_ldap_invalid_url: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_LDAP_INVALID_URL"
         }"
      end

   Curle_filesize_exceeded: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FILESIZE_EXCEEDED"
         }"
      end

   Curle_use_ssl_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_USE_SSL_FAILED"
         }"
      end

   Curle_send_fail_rewind: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SEND_FAIL_REWIND"
         }"
      end

   Curle_ssl_engine_initfailed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_ENGINE_INITFAILED"
         }"
      end

   Curle_login_denied: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_LOGIN_DENIED"
         }"
      end

   Curle_tftp_notfound: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TFTP_NOTFOUND"
         }"
      end

   Curle_tftp_perm: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TFTP_PERM"
         }"
      end

   Curle_remote_disk_full: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_REMOTE_DISK_FULL"
         }"
      end

   Curle_tftp_illegal: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TFTP_ILLEGAL"
         }"
      end

   Curle_tftp_unknownid: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TFTP_UNKNOWNID"
         }"
      end

   Curle_remote_file_exists: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_REMOTE_FILE_EXISTS"
         }"
      end

   Curle_tftp_nosuchuser: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_TFTP_NOSUCHUSER"
         }"
      end

   Curle_conv_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_CONV_FAILED"
         }"
      end

   Curle_conv_reqd: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_CONV_REQD"
         }"
      end

   Curle_ssl_cacert_badfile: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_CACERT_BADFILE"
         }"
      end

   Curle_remote_file_not_found: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_REMOTE_FILE_NOT_FOUND"
         }"
      end

   Curle_ssh: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSH"
         }"
      end

   Curle_ssl_shutdown_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_SHUTDOWN_FAILED"
         }"
      end

   Curle_again: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_AGAIN"
         }"
      end

   Curle_ssl_crl_badfile: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_CRL_BADFILE"
         }"
      end

   Curle_ssl_issuer_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_ISSUER_ERROR"
         }"
      end

   Curle_ftp_pret_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_PRET_FAILED"
         }"
      end

   Curle_rtsp_cseq_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_RTSP_CSEQ_ERROR"
         }"
      end

   Curle_rtsp_session_error: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_RTSP_SESSION_ERROR"
         }"
      end

   Curle_ftp_bad_file_list: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_FTP_BAD_FILE_LIST"
         }"
      end

   Curle_chunk_failed: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_CHUNK_FAILED"
         }"
      end

   Curle_no_connection_available: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_NO_CONNECTION_AVAILABLE"
         }"
      end

   Curle_ssl_pinnedpubkeynotmatch: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "CURLE_SSL_PINNEDPUBKEYNOTMATCH"
         }"
      end

end -- class ECURL_PLUGIN
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
