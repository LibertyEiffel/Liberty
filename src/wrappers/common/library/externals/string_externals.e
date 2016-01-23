-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- function basename skipped as requested.
	-- function basename skipped as requested.
	bcmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 
               -- bcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bcmp"
               }"
               end

	bcopy (a_src: POINTER; a_dest: POINTER; a_n: like long_unsigned) 
               -- bcopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bcopy"
               }"
               end

	bzero (a_s: POINTER; a_n: like long_unsigned) 
               -- bzero
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bzero"
               }"
               end

	-- `hidden' function __bzero skipped.
	ffs (an_i: INTEGER): INTEGER 
               -- ffs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ffs"
               }"
               end

	ffsl (a_l: like long): INTEGER 
               -- ffsl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ffsl"
               }"
               end

	ffsll (a_ll: INTEGER_64): INTEGER 
               -- ffsll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ffsll"
               }"
               end

	-- function index skipped as requested.
	-- function index skipped as requested.
	memccpy (a_dest: POINTER; a_src: POINTER; a_c: INTEGER; a_n: like long_unsigned): POINTER 
               -- memccpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memccpy"
               }"
               end

	-- function memchr skipped as requested.
	-- function memchr skipped as requested.
	memcmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 
               -- memcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memcmp"
               }"
               end

	memfrob (a_s: POINTER; a_n: like long_unsigned): POINTER 
               -- memfrob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memfrob"
               }"
               end

	memmem (a_haystack: POINTER; a_haystacklen: like long_unsigned; a_needle: POINTER; a_needlelen: like long_unsigned): POINTER 
               -- memmem
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memmem"
               }"
               end

	memmove (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- memmove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memmove"
               }"
               end

	mempcpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- mempcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mempcpy"
               }"
               end

	-- `hidden' function __mempcpy skipped.
	-- function memrchr skipped as requested.
	-- function memrchr skipped as requested.
	memset (a_s: POINTER; a_c: INTEGER; a_n: like long_unsigned): POINTER 
               -- memset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memset"
               }"
               end

	-- function rawmemchr skipped as requested.
	-- function rawmemchr skipped as requested.
	-- function rindex skipped as requested.
	-- function rindex skipped as requested.
	stpcpy (a_dest: POINTER; a_src: POINTER): POINTER 
               -- stpcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stpcpy"
               }"
               end

	-- `hidden' function __stpcpy skipped.
	stpncpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- stpncpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stpncpy"
               }"
               end

	-- `hidden' function __stpncpy skipped.
	strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- strcasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcasecmp"
               }"
               end

	strcasecmp_l (a_s1: POINTER; a_s2: POINTER; a_loc: POINTER): INTEGER 
               -- strcasecmp_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcasecmp_l"
               }"
               end

	-- function strcasestr skipped as requested.
	-- function strcasestr skipped as requested.
	strcat (a_dest: POINTER; a_src: POINTER): POINTER 
               -- strcat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcat"
               }"
               end

	-- function strchr skipped as requested.
	-- function strchr skipped as requested.
	-- function strchrnul skipped as requested.
	-- function strchrnul skipped as requested.
	strcmp (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- strcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcmp"
               }"
               end

	strcoll (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- strcoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcoll"
               }"
               end

	strcoll_l (a_s1: POINTER; a_s2: POINTER; a_l: POINTER): INTEGER 
               -- strcoll_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcoll_l"
               }"
               end

	strcpy (a_dest: POINTER; a_src: POINTER): POINTER 
               -- strcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcpy"
               }"
               end

	strcspn (a_s: POINTER; a_reject: POINTER): like long_unsigned 
               -- strcspn
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcspn"
               }"
               end

	strdup (a_s: POINTER): POINTER 
               -- strdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strdup"
               }"
               end

	strerror (an_errnum: INTEGER): POINTER 
               -- strerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strerror"
               }"
               end

	strerror_l (an_errnum: INTEGER; a_l: POINTER): POINTER 
               -- strerror_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strerror_l"
               }"
               end

	strerror_r (an_errnum: INTEGER; a_buf: POINTER; a_buflen: like long_unsigned): POINTER 
               -- strerror_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strerror_r"
               }"
               end

	strfry (a_string: POINTER): POINTER 
               -- strfry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strfry"
               }"
               end

	strlen (a_s: POINTER): like long_unsigned 
               -- strlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strlen"
               }"
               end

	strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 
               -- strncasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncasecmp"
               }"
               end

	strncasecmp_l (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned; a_loc: POINTER): INTEGER 
               -- strncasecmp_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncasecmp_l"
               }"
               end

	strncat (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- strncat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncat"
               }"
               end

	strncmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 
               -- strncmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncmp"
               }"
               end

	strncpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- strncpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncpy"
               }"
               end

	strndup (a_string: POINTER; a_n: like long_unsigned): POINTER 
               -- strndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strndup"
               }"
               end

	strnlen (a_string: POINTER; a_maxlen: like long_unsigned): like long_unsigned 
               -- strnlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strnlen"
               }"
               end

	-- function strpbrk skipped as requested.
	-- function strpbrk skipped as requested.
	-- function strrchr skipped as requested.
	-- function strrchr skipped as requested.
	strsep (a_stringp: POINTER; a_delim: POINTER): POINTER 
               -- strsep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strsep"
               }"
               end

	strsignal (a_sig: INTEGER): POINTER 
               -- strsignal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strsignal"
               }"
               end

	strspn (a_s: POINTER; an_accept: POINTER): like long_unsigned 
               -- strspn
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strspn"
               }"
               end

	-- function strstr skipped as requested.
	-- function strstr skipped as requested.
	strtok (a_s: POINTER; a_delim: POINTER): POINTER 
               -- strtok
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtok"
               }"
               end

	-- `hidden' function __strtok_r skipped.
	strtok_r (a_s: POINTER; a_delim: POINTER; a_save_ptr: POINTER): POINTER 
               -- strtok_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtok_r"
               }"
               end

	strverscmp (a_s1: POINTER; a_s2: POINTER): INTEGER 
               -- strverscmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strverscmp"
               }"
               end

	strxfrm (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): like long_unsigned 
               -- strxfrm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strxfrm"
               }"
               end

	strxfrm_l (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned; a_l: POINTER): like long_unsigned 
               -- strxfrm_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strxfrm_l"
               }"
               end


end -- class STRING_EXTERNALS
