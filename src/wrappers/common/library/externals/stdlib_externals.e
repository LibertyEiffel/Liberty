-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STDLIB_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	drand48: REAL_64 is
 		-- drand48 (node at line 33)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "drand48()"
		}"
		end

	wctomb (a_s: POINTER; a_wchar: CHARACTER): INTEGER_32 is
 		-- wctomb (node at line 49)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "wctomb"
		}"
		end

	strtold_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_128 is
 		-- strtold_l (node at line 61)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtold_l"
		}"
		end

	realpath (a_name: POINTER; a_resolved: POINTER): POINTER is
 		-- realpath (node at line 74)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "realpath"
		}"
		end

	realloc (a_ptr: POINTER; a_size: NATURAL_64): POINTER is
 		-- realloc (node at line 195)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "realloc"
		}"
		end

	mkstemp (a_template: POINTER): INTEGER_32 is
 		-- mkstemp (node at line 282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkstemp"
		}"
		end

	strtoq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): INTEGER_64 is
 		-- strtoq (node at line 325)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoq"
		}"
		end

	mblen (a_s: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- mblen (node at line 344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mblen"
		}"
		end

	atof (a_nptr: POINTER): REAL_64 is
 		-- atof (node at line 348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atof"
		}"
		end

	atoi (a_nptr: POINTER): INTEGER_32 is
 		-- atoi (node at line 351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atoi"
		}"
		end

	atol (a_nptr: POINTER): INTEGER_64 is
 		-- atol (node at line 354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atol"
		}"
		end

	grantpt (a_fd: INTEGER_32): INTEGER_32 is
 		-- grantpt (node at line 388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "grantpt"
		}"
		end

	at_quick_exit (a_func: POINTER): INTEGER_32 is
 		-- at_quick_exit (node at line 417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "at_quick_exit"
		}"
		end

	llabs (a_x: INTEGER_64): INTEGER_64 is
 		-- llabs (node at line 455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llabs"
		}"
		end

	-- `hidden' function _Exit skipped.
	strtod (a_nptr: POINTER; an_endptr: POINTER): REAL_64 is
 		-- strtod (node at line 491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtod"
		}"
		end

	strtof (a_nptr: POINTER; an_endptr: POINTER): REAL_32 is
 		-- strtof (node at line 495)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtof"
		}"
		end

	strtol (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): INTEGER_64 is
 		-- strtol (node at line 499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtol"
		}"
		end

	wcstombs (a_s: POINTER; a_pwcs: POINTER; a_n: NATURAL_64): NATURAL_64 is
 		-- wcstombs (node at line 512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "wcstombs"
		}"
		end

	jrand48 (a_xsubi: POINTER): INTEGER_64 is
 		-- jrand48 (node at line 563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jrand48"
		}"
		end

	qsort (a_base: POINTER; a_nmemb: NATURAL_64; a_size: NATURAL_64; a_compar: POINTER) is
 		-- qsort (node at line 594)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qsort"
		}"
		end

	mkdtemp (a_template: POINTER): POINTER is
 		-- mkdtemp (node at line 615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkdtemp"
		}"
		end

	strtof_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_32 is
 		-- strtof_l (node at line 622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtof_l"
		}"
		end

	ptsname (a_fd: INTEGER_32): POINTER is
 		-- ptsname (node at line 645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ptsname"
		}"
		end

	clearenv: INTEGER_32 is
 		-- clearenv (node at line 722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearenv()"
		}"
		end

	srandom (a_seed: NATURAL_32) is
 		-- srandom (node at line 752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srandom"
		}"
		end

	memcpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_64): POINTER is
 		-- memcpy (node at line 758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "memcpy"
		}"
		end

	bsearch (a_key: POINTER; a_base: POINTER; a_nmemb: NATURAL_64; a_size: NATURAL_64; a_compar: POINTER): POINTER is
 		-- bsearch (node at line 781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bsearch"
		}"
		end

	mbstowcs (a_pwcs: POINTER; a_s: POINTER; a_n: NATURAL_64): NATURAL_64 is
 		-- mbstowcs (node at line 806)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mbstowcs"
		}"
		end

	erand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- erand48_r (node at line 815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erand48_r"
		}"
		end

	fcvt (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- fcvt (node at line 867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcvt"
		}"
		end

	qfcvt (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- qfcvt (node at line 873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qfcvt"
		}"
		end

	mbtowc (a_pwc: POINTER; a_s: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- mbtowc (node at line 879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mbtowc"
		}"
		end

	getpt: INTEGER_32 is
 		-- getpt (node at line 913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpt()"
		}"
		end

	mkstemps64 (a_template: POINTER; a_suffixlen: INTEGER_32): INTEGER_32 is
 		-- mkstemps64 (node at line 917)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkstemps64"
		}"
		end

	abort is
 		-- abort (node at line 923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "abort()"
		}"
		end

	random: INTEGER_64 is
 		-- random (node at line 939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "random()"
		}"
		end

	lcong48 (a_param: POINTER) is
 		-- lcong48 (node at line 940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lcong48"
		}"
		end

	-- `hidden' function __ctype_get_mb_cur_max skipped.
	free (a_ptr: POINTER) is
 		-- free (node at line 1019)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "free"
		}"
		end

	initstate_r (a_seed: NATURAL_32; a_statebuf: POINTER; a_statelen: NATURAL_64; a_buf: POINTER): INTEGER_32 is
 		-- initstate_r (node at line 1037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initstate_r"
		}"
		end

	canonicalize_file_name (a_name: POINTER): POINTER is
 		-- canonicalize_file_name (node at line 1133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "canonicalize_file_name"
		}"
		end

	srand48 (a_seedval: INTEGER_64) is
 		-- srand48 (node at line 1154)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srand48"
		}"
		end

	mkstemps (a_template: POINTER; a_suffixlen: INTEGER_32): INTEGER_32 is
 		-- mkstemps (node at line 1190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkstemps"
		}"
		end

	putenv (a_string: POINTER): INTEGER_32 is
 		-- putenv (node at line 1194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putenv"
		}"
		end

	ecvt_r (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- ecvt_r (node at line 1248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ecvt_r"
		}"
		end

	qecvt_r (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- qecvt_r (node at line 1256)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qecvt_r"
		}"
		end

	-- function div (at line 786 in file /usr/include/stdlib.h is not wrappable
	mrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- mrand48_r (node at line 1308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mrand48_r"
		}"
		end

	mrand48: INTEGER_64 is
 		-- mrand48 (node at line 1320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mrand48()"
		}"
		end

	getloadavg (a_loadavg: POINTER; a_nelem: INTEGER_32): INTEGER_32 is
 		-- getloadavg (node at line 1333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getloadavg"
		}"
		end

	srandom_r (a_seed: NATURAL_32; a_buf: POINTER): INTEGER_32 is
 		-- srandom_r (node at line 1348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srandom_r"
		}"
		end

	lrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- lrand48_r (node at line 1403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrand48_r"
		}"
		end

	qsort_r (a_base: POINTER; a_nmemb: NATURAL_64; a_size: NATURAL_64; a_compar: POINTER; an_arg: POINTER) is
 		-- qsort_r (node at line 1407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qsort_r"
		}"
		end

	setkey (a_key: POINTER) is
 		-- setkey (node at line 1422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setkey"
		}"
		end

	valloc (a_size: NATURAL_64): POINTER is
 		-- valloc (node at line 1559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "valloc"
		}"
		end

	drand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- drand48_r (node at line 1562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "drand48_r"
		}"
		end

	fcvt_r (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- fcvt_r (node at line 1575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcvt_r"
		}"
		end

	qfcvt_r (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- qfcvt_r (node at line 1583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qfcvt_r"
		}"
		end

	erand48 (a_xsubi: POINTER): REAL_64 is
 		-- erand48 (node at line 1629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erand48"
		}"
		end

	random_r (a_buf: POINTER; a_result: POINTER): INTEGER_32 is
 		-- random_r (node at line 1695)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "random_r"
		}"
		end

	initstate (a_seed: NATURAL_32; a_statebuf: POINTER; a_statelen: NATURAL_64): POINTER is
 		-- initstate (node at line 1702)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initstate"
		}"
		end

	strtoull_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): NATURAL_64 is
 		-- strtoull_l (node at line 1725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoull_l"
		}"
		end

	getsubopt (an_optionp: POINTER; a_tokens: POINTER; a_valuep: POINTER): INTEGER_32 is
 		-- getsubopt (node at line 1765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getsubopt"
		}"
		end

	rand_r (a_seed: POINTER): INTEGER_32 is
 		-- rand_r (node at line 1856)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rand_r"
		}"
		end

	strtold (a_nptr: POINTER; an_endptr: POINTER): REAL_128 is
 		-- strtold (node at line 1956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtold"
		}"
		end

	exit (a_status: INTEGER_32) is
 		-- exit (node at line 1972)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exit"
		}"
		end

	setstate (a_statebuf: POINTER): POINTER is
 		-- setstate (node at line 1975)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setstate"
		}"
		end

	gcvt (a_value: REAL_64; a_ndigit: INTEGER_32; a_buf: POINTER): POINTER is
 		-- gcvt (node at line 2036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcvt"
		}"
		end

	qgcvt (a_value: REAL_128; a_ndigit: INTEGER_32; a_buf: POINTER): POINTER is
 		-- qgcvt (node at line 2041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qgcvt"
		}"
		end

	rand: INTEGER_32 is
 		-- rand (node at line 2053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rand()"
		}"
		end

	malloc (a_size: NATURAL_64): POINTER is
 		-- malloc (node at line 2055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "malloc"
		}"
		end

	-- function ldiv (at line 788 in file /usr/include/stdlib.h is not wrappable
	strtod_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_64 is
 		-- strtod_l (node at line 2110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtod_l"
		}"
		end

	strtoll_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): INTEGER_64 is
 		-- strtoll_l (node at line 2129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoll_l"
		}"
		end

	mkostemps64 (a_template: POINTER; a_suffixlen: INTEGER_32; a_flags: INTEGER_32): INTEGER_32 is
 		-- mkostemps64 (node at line 2135)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkostemps64"
		}"
		end

	unsetenv (a_name: POINTER): INTEGER_32 is
 		-- unsetenv (node at line 2143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unsetenv"
		}"
		end

	on_exit (a_func: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- on_exit (node at line 2164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "on_exit"
		}"
		end

	calloc (a_nmemb: NATURAL_64; a_size: NATURAL_64): POINTER is
 		-- calloc (node at line 2189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "calloc"
		}"
		end

	srand48_r (a_seedval: INTEGER_64; a_buffer: POINTER): INTEGER_32 is
 		-- srand48_r (node at line 2201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srand48_r"
		}"
		end

	mkostemp64 (a_template: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- mkostemp64 (node at line 2206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkostemp64"
		}"
		end

	atoll (a_nptr: POINTER): INTEGER_64 is
 		-- atoll (node at line 2247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atoll"
		}"
		end

	posix_openpt (an_oflag: INTEGER_32): INTEGER_32 is
 		-- posix_openpt (node at line 2253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_openpt"
		}"
		end

	posix_memalign (a_memptr: POINTER; an_alignment: NATURAL_64; a_size: NATURAL_64): INTEGER_32 is
 		-- posix_memalign (node at line 2280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_memalign"
		}"
		end

	getenv (a_name: POINTER): POINTER is
 		-- getenv (node at line 2295)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getenv"
		}"
		end

	strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): INTEGER_64 is
 		-- strtoll (node at line 2342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoll"
		}"
		end

	mkostemp (a_template: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- mkostemp (node at line 2387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkostemp"
		}"
		end

	system (a_command: POINTER): INTEGER_32 is
 		-- system (node at line 2421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "system"
		}"
		end

	mkostemps (a_template: POINTER; a_suffixlen: INTEGER_32; a_flags: INTEGER_32): INTEGER_32 is
 		-- mkostemps (node at line 2445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkostemps"
		}"
		end

	rpmatch (a_response: POINTER): INTEGER_32 is
 		-- rpmatch (node at line 2469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpmatch"
		}"
		end

	strtoul (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): NATURAL_64 is
 		-- strtoul (node at line 2472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoul"
		}"
		end

	labs (a_x: INTEGER_64): INTEGER_64 is
 		-- labs (node at line 2563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "labs"
		}"
		end

	cfree (a_ptr: POINTER) is
 		-- cfree (node at line 2568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cfree"
		}"
		end

	ptsname_r (a_fd: INTEGER_32; a_buf: POINTER; a_buflen: NATURAL_64): INTEGER_32 is
 		-- ptsname_r (node at line 2597)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ptsname_r"
		}"
		end

	qecvt (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- qecvt (node at line 2616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qecvt"
		}"
		end

	l64a (a_n: INTEGER_64): POINTER is
 		-- l64a (node at line 2665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "l64a"
		}"
		end

	mkstemp64 (a_template: POINTER): INTEGER_32 is
 		-- mkstemp64 (node at line 2668)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkstemp64"
		}"
		end

	strtouq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): NATURAL_64 is
 		-- strtouq (node at line 2686)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtouq"
		}"
		end

	unlockpt (a_fd: INTEGER_32): INTEGER_32 is
 		-- unlockpt (node at line 2708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unlockpt"
		}"
		end

	srand (a_seed: NATURAL_32) is
 		-- srand (node at line 2711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srand"
		}"
		end

	mktemp (a_template: POINTER): POINTER is
 		-- mktemp (node at line 2737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mktemp"
		}"
		end

	strtol_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): INTEGER_64 is
 		-- strtol_l (node at line 2743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtol_l"
		}"
		end

	lcong48_r (a_param: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- lcong48_r (node at line 2763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lcong48_r"
		}"
		end

	atexit (a_func: POINTER): INTEGER_32 is
 		-- atexit (node at line 2771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atexit"
		}"
		end

	setstate_r (a_statebuf: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- setstate_r (node at line 2800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setstate_r"
		}"
		end

	setenv (a_name: POINTER; a_value: POINTER; a_replace: INTEGER_32): INTEGER_32 is
 		-- setenv (node at line 2805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setenv"
		}"
		end

	strtoul_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): NATURAL_64 is
 		-- strtoul_l (node at line 2840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoul_l"
		}"
		end

	a64l (a_s: POINTER): INTEGER_64 is
 		-- a64l (node at line 2908)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "a64l"
		}"
		end

	-- `hidden' function __secure_getenv skipped.
	ecvt (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- ecvt (node at line 3004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ecvt"
		}"
		end

	seed48_r (a_seed16v: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- seed48_r (node at line 3011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "seed48_r"
		}"
		end

	nrand48 (a_xsubi: POINTER): INTEGER_64 is
 		-- nrand48 (node at line 3071)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nrand48"
		}"
		end

	quick_exit (a_status: INTEGER_32) is
 		-- quick_exit (node at line 3093)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "quick_exit"
		}"
		end

	lrand48: INTEGER_64 is
 		-- lrand48 (node at line 3126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrand48()"
		}"
		end

	nrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- nrand48_r (node at line 3127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nrand48_r"
		}"
		end

	jrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- jrand48_r (node at line 3197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jrand48_r"
		}"
		end

	seed48 (a_seed16v: POINTER): POINTER is
 		-- seed48 (node at line 3276)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "seed48"
		}"
		end

	strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): NATURAL_64 is
 		-- strtoull (node at line 3307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoull"
		}"
		end

	-- function lldiv (at line 795 in file /usr/include/stdlib.h is not wrappable
	abs (a_x: INTEGER_32): INTEGER_32 is
 		-- abs (node at line 3346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "abs"
		}"
		end


end -- class STDLIB_EXTERNALS
