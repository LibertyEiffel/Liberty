-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- function basename skipped as requested.
	-- function basename skipped as requested.
	bcmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 

		-- function bcmp (in `/usr/include/string.h')
               -- bcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bcmp"
               }"
               end

	bcopy (a_src: POINTER; a_dest: POINTER; a_n: like long_unsigned) 

		-- function bcopy (in `/usr/include/string.h')
               -- bcopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bcopy"
               }"
               end

	bzero (a_s: POINTER; a_n: like long_unsigned) 

		-- function bzero (in `/usr/include/string.h')
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

		-- function ffs (in `/usr/include/string.h')
               -- ffs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ffs"
               }"
               end

	ffsl (a_l: like long): INTEGER 

		-- function ffsl (in `/usr/include/string.h')
               -- ffsl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ffsl"
               }"
               end

	ffsll (a_ll: INTEGER_64): INTEGER 

		-- function ffsll (in `/usr/include/string.h')
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

		-- function memccpy (in `/usr/include/string.h')
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

		-- function memcmp (in `/usr/include/string.h')
               -- memcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memcmp"
               }"
               end

	memfrob (a_s: POINTER; a_n: like long_unsigned): POINTER 

		-- function memfrob (in `/usr/include/string.h')
               -- memfrob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memfrob"
               }"
               end

	memmem (a_haystack: POINTER; a_haystacklen: like long_unsigned; a_needle: POINTER; a_needlelen: like long_unsigned): POINTER 

		-- function memmem (in `/usr/include/string.h')
               -- memmem
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memmem"
               }"
               end

	memmove (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 

		-- function memmove (in `/usr/include/string.h')
               -- memmove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memmove"
               }"
               end

	mempcpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 

		-- function mempcpy (in `/usr/include/string.h')
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

		-- function memset (in `/usr/include/string.h')
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

		-- function stpcpy (in `/usr/include/string.h')
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

		-- function stpncpy (in `/usr/include/string.h')
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

		-- function strcasecmp (in `/usr/include/string.h')
               -- strcasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcasecmp"
               }"
               end

	strcasecmp_l (a_s1: POINTER; a_s2: POINTER; a_loc: POINTER): INTEGER 

		-- function strcasecmp_l (in `/usr/include/string.h')
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

		-- function strcat (in `/usr/include/string.h')
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

		-- function strcmp (in `/usr/include/string.h')
               -- strcmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcmp"
               }"
               end

	strcoll (a_s1: POINTER; a_s2: POINTER): INTEGER 

		-- function strcoll (in `/usr/include/string.h')
               -- strcoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcoll"
               }"
               end

	strcoll_l (a_s1: POINTER; a_s2: POINTER; a_l: POINTER): INTEGER 

		-- function strcoll_l (in `/usr/include/string.h')
               -- strcoll_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcoll_l"
               }"
               end

	strcpy (a_dest: POINTER; a_src: POINTER): POINTER 

		-- function strcpy (in `/usr/include/string.h')
               -- strcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcpy"
               }"
               end

	strcspn (a_s: POINTER; a_reject: POINTER): like long_unsigned 

		-- function strcspn (in `/usr/include/string.h')
               -- strcspn
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strcspn"
               }"
               end

	strdup (a_s: POINTER): POINTER 

		-- function strdup (in `/usr/include/string.h')
               -- strdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strdup"
               }"
               end

	strerror (an_errnum: INTEGER): POINTER 

		-- function strerror (in `/usr/include/string.h')
               -- strerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strerror"
               }"
               end

	strerror_l (an_errnum: INTEGER; a_l: POINTER): POINTER 

		-- function strerror_l (in `/usr/include/string.h')
               -- strerror_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strerror_l"
               }"
               end

	strerror_r (an_errnum: INTEGER; a_buf: POINTER; a_buflen: like long_unsigned): POINTER 

		-- function strerror_r (in `/usr/include/string.h')
               -- strerror_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strerror_r"
               }"
               end

	strfry (a_string: POINTER): POINTER 

		-- function strfry (in `/usr/include/string.h')
               -- strfry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strfry"
               }"
               end

	strlen (a_s: POINTER): like long_unsigned 

		-- function strlen (in `/usr/include/string.h')
               -- strlen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strlen"
               }"
               end

	strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 

		-- function strncasecmp (in `/usr/include/string.h')
               -- strncasecmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncasecmp"
               }"
               end

	strncasecmp_l (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned; a_loc: POINTER): INTEGER 

		-- function strncasecmp_l (in `/usr/include/string.h')
               -- strncasecmp_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncasecmp_l"
               }"
               end

	strncat (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 

		-- function strncat (in `/usr/include/string.h')
               -- strncat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncat"
               }"
               end

	strncmp (a_s1: POINTER; a_s2: POINTER; a_n: like long_unsigned): INTEGER 

		-- function strncmp (in `/usr/include/string.h')
               -- strncmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncmp"
               }"
               end

	strncpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 

		-- function strncpy (in `/usr/include/string.h')
               -- strncpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strncpy"
               }"
               end

	strndup (a_string: POINTER; a_n: like long_unsigned): POINTER 

		-- function strndup (in `/usr/include/string.h')
               -- strndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strndup"
               }"
               end

	strnlen (a_string: POINTER; a_maxlen: like long_unsigned): like long_unsigned 

		-- function strnlen (in `/usr/include/string.h')
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

		-- function strsep (in `/usr/include/string.h')
               -- strsep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strsep"
               }"
               end

	strsignal (a_sig: INTEGER): POINTER 

		-- function strsignal (in `/usr/include/string.h')
               -- strsignal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strsignal"
               }"
               end

	strspn (a_s: POINTER; an_accept: POINTER): like long_unsigned 

		-- function strspn (in `/usr/include/string.h')
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

		-- function strtok (in `/usr/include/string.h')
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

		-- function strtok_r (in `/usr/include/string.h')
               -- strtok_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtok_r"
               }"
               end

	strverscmp (a_s1: POINTER; a_s2: POINTER): INTEGER 

		-- function strverscmp (in `/usr/include/string.h')
               -- strverscmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strverscmp"
               }"
               end

	strxfrm (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): like long_unsigned 

		-- function strxfrm (in `/usr/include/string.h')
               -- strxfrm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strxfrm"
               }"
               end

	strxfrm_l (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned; a_l: POINTER): like long_unsigned 

		-- function strxfrm_l (in `/usr/include/string.h')
               -- strxfrm_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strxfrm_l"
               }"
               end


end -- class STRING_EXTERNALS
