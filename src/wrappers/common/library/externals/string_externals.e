-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STRING_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	rindex (a_s: POINTER; a_c: INTEGER_32): POINTER is
 		-- rindex (node at line 6)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rindex"
		}"
		end

	bzero (a_s: POINTER; a_n: NATURAL_64) is
 		-- bzero (node at line 111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bzero"
		}"
		end

	ffsl (a_l: INTEGER_64): INTEGER_32 is
 		-- ffsl (node at line 245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffsl"
		}"
		end

	strsep (a_stringp: POINTER; a_delim: POINTER): POINTER is
 		-- strsep (node at line 251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strsep"
		}"
		end

	strcasecmp (a_s1: POINTER; a_s2: POINTER): INTEGER_32 is
 		-- strcasecmp (node at line 347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcasecmp"
		}"
		end

	bcopy (a_src: POINTER; a_dest: POINTER; a_n: NATURAL_64) is
 		-- bcopy (node at line 550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bcopy"
		}"
		end

	memchr (a_s: POINTER; a_c: INTEGER_32; a_n: NATURAL_64): POINTER is
 		-- memchr (node at line 764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memchr"
		}"
		end

	memmove (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- memmove (node at line 850)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memmove"
		}"
		end

	memcpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- memcpy (node at line 880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memcpy"
		}"
		end

	strncat (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- strncat (node at line 893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strncat"
		}"
		end

	strcasecmp_l (a_s1: POINTER; a_s2: POINTER; a_loc: POINTER): INTEGER_32 is
 		-- strcasecmp_l (node at line 971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcasecmp_l"
		}"
		end

	strncmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- strncmp (node at line 1059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strncmp"
		}"
		end

	strchrnul (a_s: POINTER; a_c: INTEGER_32): POINTER is
 		-- strchrnul (node at line 1090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strchrnul"
		}"
		end

	strncpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- strncpy (node at line 1106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strncpy"
		}"
		end

	strfry (a_string: POINTER): POINTER is
 		-- strfry (node at line 1194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strfry"
		}"
		end

	memccpy (a_dest: POINTER; a_src: POINTER; a_c: INTEGER_32; a_n: NATURAL_64): POINTER is
 		-- memccpy (node at line 1223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memccpy"
		}"
		end

	ffsll (a_ll: INTEGER_64): INTEGER_32 is
 		-- ffsll (node at line 1444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffsll"
		}"
		end

	strerror_l (an_errnum: INTEGER_32; a_l: POINTER): POINTER is
 		-- strerror_l (node at line 1453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strerror_l"
		}"
		end

	strerror_r (an_errnum: INTEGER_32; a_buf: POINTER; a_buflen: NATURAL_64): POINTER is
 		-- strerror_r (node at line 1457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strerror_r"
		}"
		end

	strcat (a_dest: POINTER; a_src: POINTER): POINTER is
 		-- strcat (node at line 1515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcat"
		}"
		end

	stpncpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- stpncpy (node at line 1532)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stpncpy"
		}"
		end

	strchr (a_s: POINTER; a_c: INTEGER_32): POINTER is
 		-- strchr (node at line 1621)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strchr"
		}"
		end

	-- `hidden' function __bzero skipped.
	strcmp (a_s1: POINTER; a_s2: POINTER): INTEGER_32 is
 		-- strcmp (node at line 1707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcmp"
		}"
		end

	strcpy (a_dest: POINTER; a_src: POINTER): POINTER is
 		-- strcpy (node at line 1744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcpy"
		}"
		end

	strcasestr (a_haystack: POINTER; a_needle: POINTER): POINTER is
 		-- strcasestr (node at line 1776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcasestr"
		}"
		end

	basename (a_filename: POINTER): POINTER is
 		-- basename (node at line 1824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "basename"
		}"
		end

	memfrob (a_s: POINTER; a_n: NATURAL_64): POINTER is
 		-- memfrob (node at line 1828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memfrob"
		}"
		end

	strtok (a_s: POINTER; a_delim: POINTER): POINTER is
 		-- strtok (node at line 1993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtok"
		}"
		end

	strtok_r (a_s: POINTER; a_delim: POINTER; a_save_ptr: POINTER): POINTER is
 		-- strtok_r (node at line 2013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtok_r"
		}"
		end

	-- `hidden' function __stpncpy skipped.
	memset (a_s: POINTER; a_c: INTEGER_32; a_n: NATURAL_64): POINTER is
 		-- memset (node at line 2067)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memset"
		}"
		end

	strncasecmp_l (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_64; a_loc: POINTER): INTEGER_32 is
 		-- strncasecmp_l (node at line 2103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strncasecmp_l"
		}"
		end

	strndup (a_string: POINTER; a_n: NATURAL_64): POINTER is
 		-- strndup (node at line 2139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strndup"
		}"
		end

	strcoll (a_s1: POINTER; a_s2: POINTER): INTEGER_32 is
 		-- strcoll (node at line 2334)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcoll"
		}"
		end

	strncasecmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- strncasecmp (node at line 2338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strncasecmp"
		}"
		end

	-- `hidden' function __strtok_r skipped.
	strrchr (a_s: POINTER; a_c: INTEGER_32): POINTER is
 		-- strrchr (node at line 2539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strrchr"
		}"
		end

	strxfrm (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): NATURAL_64 is
 		-- strxfrm (node at line 2545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strxfrm"
		}"
		end

	-- `hidden' function __mempcpy skipped.
	strerror (an_errnum: INTEGER_32): POINTER is
 		-- strerror (node at line 2588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strerror"
		}"
		end

	strnlen (a_string: POINTER; a_maxlen: NATURAL_64): NATURAL_64 is
 		-- strnlen (node at line 2600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strnlen"
		}"
		end

	strpbrk (a_s: POINTER; an_accept: POINTER): POINTER is
 		-- strpbrk (node at line 2689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strpbrk"
		}"
		end

	strcspn (a_s: POINTER; a_reject: POINTER): NATURAL_64 is
 		-- strcspn (node at line 2716)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcspn"
		}"
		end

	strsignal (a_sig: INTEGER_32): POINTER is
 		-- strsignal (node at line 2733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strsignal"
		}"
		end

	stpcpy (a_dest: POINTER; a_src: POINTER): POINTER is
 		-- stpcpy (node at line 2831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stpcpy"
		}"
		end

	strdup (a_s: POINTER): POINTER is
 		-- strdup (node at line 2857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strdup"
		}"
		end

	memcmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- memcmp (node at line 2860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memcmp"
		}"
		end

	bcmp (a_s1: POINTER; a_s2: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- bcmp (node at line 2871)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bcmp"
		}"
		end

	rawmemchr (a_s: POINTER; a_c: INTEGER_32): POINTER is
 		-- rawmemchr (node at line 2907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rawmemchr"
		}"
		end

	strxfrm_l (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64; a_l: POINTER): NATURAL_64 is
 		-- strxfrm_l (node at line 2922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strxfrm_l"
		}"
		end

	strverscmp (a_s1: POINTER; a_s2: POINTER): INTEGER_32 is
 		-- strverscmp (node at line 3079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strverscmp"
		}"
		end

	strspn (a_s: POINTER; an_accept: POINTER): NATURAL_64 is
 		-- strspn (node at line 3174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strspn"
		}"
		end

	strstr (a_haystack: POINTER; a_needle: POINTER): POINTER is
 		-- strstr (node at line 3249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strstr"
		}"
		end

	-- `hidden' function __stpcpy skipped.
	index (a_s: POINTER; a_c: INTEGER_32): POINTER is
 		-- index (node at line 3294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "index"
		}"
		end

	strlen (a_s: POINTER): NATURAL_64 is
 		-- strlen (node at line 3346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strlen"
		}"
		end

	memmem (a_haystack: POINTER; a_haystacklen: NATURAL_64; a_needle: POINTER; a_needlelen: NATURAL_64): POINTER is
 		-- memmem (node at line 3367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memmem"
		}"
		end

	ffs (an_i: INTEGER_32): INTEGER_32 is
 		-- ffs (node at line 3428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffs"
		}"
		end

	memrchr (a_s: POINTER; a_c: INTEGER_32; a_n: NATURAL_64): POINTER is
 		-- memrchr (node at line 3519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memrchr"
		}"
		end

	mempcpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- mempcpy (node at line 3578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mempcpy"
		}"
		end

	strcoll_l (a_s1: POINTER; a_s2: POINTER; a_l: POINTER): INTEGER_32 is
 		-- strcoll_l (node at line 3642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strcoll_l"
		}"
		end


end -- class STRING_EXTERNALS
