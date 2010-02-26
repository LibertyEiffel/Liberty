-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STDLIBEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	drand48: REAL_64 is
 		-- drand48 (node at line 24)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "drand48()"
		}"
		end

	wctomb (a_s: POINTER; a_wchar: CHARACTER): INTEGER_32 is
 		-- wctomb (node at line 33)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "wctomb"
		}"
		end

	strtold_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_128 is
 		-- strtold_l (node at line 43)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtold_l"
		}"
		end

	realpath (a_name: POINTER; a_resolved: POINTER): POINTER is
 		-- realpath (node at line 57)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "realpath"
		}"
		end

	mbstowcs (a_pwcs: POINTER; a_s: POINTER; a_n: NATURAL_64): NATURAL_64 is
 		-- mbstowcs (node at line 98)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mbstowcs"
		}"
		end

	realloc (a_ptr: POINTER; a_size: NATURAL_64): POINTER is
 		-- realloc (node at line 130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "realloc"
		}"
		end

	mkstemp (a_template: POINTER): INTEGER_32 is
 		-- mkstemp (node at line 174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkstemp"
		}"
		end

	strtoq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): INTEGER_64 is
 		-- strtoq (node at line 189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoq"
		}"
		end

	mblen (a_s: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- mblen (node at line 226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mblen"
		}"
		end

	atof (a_nptr: POINTER): REAL_64 is
 		-- atof (node at line 230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atof"
		}"
		end

	atoi (a_nptr: POINTER): INTEGER_32 is
 		-- atoi (node at line 233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atoi"
		}"
		end

	atol (a_nptr: POINTER): INTEGER_64 is
 		-- atol (node at line 236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atol"
		}"
		end

	grantpt (a_fd: INTEGER_32): INTEGER_32 is
 		-- grantpt (node at line 253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "grantpt"
		}"
		end

	at_quick_exit (a_func: POINTER): INTEGER_32 is
 		-- at_quick_exit (node at line 288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "at_quick_exit"
		}"
		end

	llabs (a_x: INTEGER_64): INTEGER_64 is
 		-- llabs (node at line 298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llabs"
		}"
		end

	-- `hidden' function _Exit skipped.
	strtod (a_nptr: POINTER; an_endptr: POINTER): REAL_64 is
 		-- strtod (node at line 331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtod"
		}"
		end

	strtof (a_nptr: POINTER; an_endptr: POINTER): REAL_32 is
 		-- strtof (node at line 335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtof"
		}"
		end

	strtol (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): INTEGER_64 is
 		-- strtol (node at line 339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtol"
		}"
		end

	wcstombs (a_s: POINTER; a_pwcs: POINTER; a_n: NATURAL_64): NATURAL_64 is
 		-- wcstombs (node at line 347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "wcstombs"
		}"
		end

	jrand48 (a_xsubi: POINTER): INTEGER_64 is
 		-- jrand48 (node at line 387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jrand48"
		}"
		end

	qsort (a_base: POINTER; a_nmemb: NATURAL_64; a_size: NATURAL_64; a_compar: POINTER) is
 		-- qsort (node at line 405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qsort"
		}"
		end

	mkdtemp (a_template: POINTER): POINTER is
 		-- mkdtemp (node at line 418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkdtemp"
		}"
		end

	strtof_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_32 is
 		-- strtof_l (node at line 421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtof_l"
		}"
		end

	ptsname (a_fd: INTEGER_32): POINTER is
 		-- ptsname (node at line 434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ptsname"
		}"
		end

	qecvt (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- qecvt (node at line 456)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qecvt"
		}"
		end

	clearenv: INTEGER_32 is
 		-- clearenv (node at line 481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearenv()"
		}"
		end

	bsearch (a_key: POINTER; a_base: POINTER; a_nmemb: NATURAL_64; a_size: NATURAL_64; a_compar: POINTER): POINTER is
 		-- bsearch (node at line 515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bsearch"
		}"
		end

	erand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- erand48_r (node at line 548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erand48_r"
		}"
		end

	fcvt (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- fcvt (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcvt"
		}"
		end

	qfcvt (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- qfcvt (node at line 568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qfcvt"
		}"
		end

	mbtowc (a_pwc: POINTER; a_s: POINTER; a_n: NATURAL_64): INTEGER_32 is
 		-- mbtowc (node at line 578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mbtowc"
		}"
		end

	getpt: INTEGER_32 is
 		-- getpt (node at line 587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpt()"
		}"
		end

	strtouq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): NATURAL_64 is
 		-- strtouq (node at line 588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtouq"
		}"
		end

	abort is
 		-- abort (node at line 596)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "abort()"
		}"
		end

	random: INTEGER_64 is
 		-- random (node at line 606)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "random()"
		}"
		end

	lcong48 (a_param: POINTER) is
 		-- lcong48 (node at line 607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lcong48"
		}"
		end

	-- `hidden' function __ctype_get_mb_cur_max skipped.
	free (a_ptr: POINTER) is
 		-- free (node at line 630)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "free"
		}"
		end

	initstate_r (a_seed: NATURAL_32; a_statebuf: POINTER; a_statelen: NATURAL_64; a_buf: POINTER): INTEGER_32 is
 		-- initstate_r (node at line 641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initstate_r"
		}"
		end

	cfree (a_ptr: POINTER) is
 		-- cfree (node at line 673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cfree"
		}"
		end

	canonicalize_file_name (a_name: POINTER): POINTER is
 		-- canonicalize_file_name (node at line 741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "canonicalize_file_name"
		}"
		end

	srand48 (a_seedval: INTEGER_64) is
 		-- srand48 (node at line 763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srand48"
		}"
		end

	strtod_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_64 is
 		-- strtod_l (node at line 772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtod_l"
		}"
		end

	putenv (a_string: POINTER): INTEGER_32 is
 		-- putenv (node at line 796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putenv"
		}"
		end

	ecvt_r (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- ecvt_r (node at line 813)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ecvt_r"
		}"
		end

	qecvt_r (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- qecvt_r (node at line 821)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qecvt_r"
		}"
		end

	div (a_numer: INTEGER_32; a_denom: INTEGER_32): DIV_T_STRUCT is
 		-- div (node at line 841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "div"
		}"
		end

	mrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- mrand48_r (node at line 860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mrand48_r"
		}"
		end

	mrand48: INTEGER_64 is
 		-- mrand48 (node at line 866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mrand48()"
		}"
		end

	getloadavg (a_loadavg: POINTER; a_nelem: INTEGER_32): INTEGER_32 is
 		-- getloadavg (node at line 879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getloadavg"
		}"
		end

	srandom_r (a_seed: NATURAL_32; a_buf: POINTER): INTEGER_32 is
 		-- srandom_r (node at line 884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srandom_r"
		}"
		end

	lrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- lrand48_r (node at line 911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrand48_r"
		}"
		end

	qsort_r (a_base: POINTER; a_nmemb: NATURAL_64; a_size: NATURAL_64; a_compar: POINTER; an_arg: POINTER) is
 		-- qsort_r (node at line 915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qsort_r"
		}"
		end

	setkey (a_key: POINTER) is
 		-- setkey (node at line 934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setkey"
		}"
		end

	valloc (a_size: NATURAL_64): POINTER is
 		-- valloc (node at line 984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "valloc"
		}"
		end

	drand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- drand48_r (node at line 987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "drand48_r"
		}"
		end

	fcvt_r (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- fcvt_r (node at line 1002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcvt_r"
		}"
		end

	erand48 (a_xsubi: POINTER): REAL_64 is
 		-- erand48 (node at line 1019)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erand48"
		}"
		end

	random_r (a_buf: POINTER; a_result: POINTER): INTEGER_32 is
 		-- random_r (node at line 1071)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "random_r"
		}"
		end

	initstate (a_seed: NATURAL_32; a_statebuf: POINTER; a_statelen: NATURAL_64): POINTER is
 		-- initstate (node at line 1079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "initstate"
		}"
		end

	strtoull_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): NATURAL_64 is
 		-- strtoull_l (node at line 1094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoull_l"
		}"
		end

	getsubopt (an_optionp: POINTER; a_tokens: POINTER; a_valuep: POINTER): INTEGER_32 is
 		-- getsubopt (node at line 1115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getsubopt"
		}"
		end

	rand_r (a_seed: POINTER): INTEGER_32 is
 		-- rand_r (node at line 1147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rand_r"
		}"
		end

	strtold (a_nptr: POINTER; an_endptr: POINTER): REAL_128 is
 		-- strtold (node at line 1202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtold"
		}"
		end

	exit (a_status: INTEGER_32) is
 		-- exit (node at line 1210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exit"
		}"
		end

	setstate (a_statebuf: POINTER): POINTER is
 		-- setstate (node at line 1213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setstate"
		}"
		end

	gcvt (a_value: REAL_64; a_ndigit: INTEGER_32; a_buf: POINTER): POINTER is
 		-- gcvt (node at line 1236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gcvt"
		}"
		end

	qgcvt (a_value: REAL_128; a_ndigit: INTEGER_32; a_buf: POINTER): POINTER is
 		-- qgcvt (node at line 1241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qgcvt"
		}"
		end

	malloc (a_size: NATURAL_64): POINTER is
 		-- malloc (node at line 1249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "malloc"
		}"
		end

	ldiv (a_numer: INTEGER_64; a_denom: INTEGER_64): LDIV_T_STRUCT is
 		-- ldiv (node at line 1252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldiv"
		}"
		end

	strtoll_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): INTEGER_64 is
 		-- strtoll_l (node at line 1278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoll_l"
		}"
		end

	unsetenv (a_name: POINTER): INTEGER_32 is
 		-- unsetenv (node at line 1288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unsetenv"
		}"
		end

	on_exit (a_func: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- on_exit (node at line 1292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "on_exit"
		}"
		end

	calloc (a_nmemb: NATURAL_64; a_size: NATURAL_64): POINTER is
 		-- calloc (node at line 1297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "calloc"
		}"
		end

	srand48_r (a_seedval: INTEGER_64; a_buffer: POINTER): INTEGER_32 is
 		-- srand48_r (node at line 1310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srand48_r"
		}"
		end

	mkostemp64 (a_template: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- mkostemp64 (node at line 1315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkostemp64"
		}"
		end

	atoll (a_nptr: POINTER): INTEGER_64 is
 		-- atoll (node at line 1348)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atoll"
		}"
		end

	posix_openpt (an_oflag: INTEGER_32): INTEGER_32 is
 		-- posix_openpt (node at line 1351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_openpt"
		}"
		end

	posix_memalign (a_memptr: POINTER; an_alignment: NATURAL_64; a_size: NATURAL_64): INTEGER_32 is
 		-- posix_memalign (node at line 1365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "posix_memalign"
		}"
		end

	getenv (a_name: POINTER): POINTER is
 		-- getenv (node at line 1370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getenv"
		}"
		end

	seed48_r (a_seed16v: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- seed48_r (node at line 1379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "seed48_r"
		}"
		end

	strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): INTEGER_64 is
 		-- strtoll (node at line 1383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoll"
		}"
		end

	mkostemp (a_template: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- mkostemp (node at line 1394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkostemp"
		}"
		end

	system (a_command: POINTER): INTEGER_32 is
 		-- system (node at line 1400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "system"
		}"
		end

	rpmatch (a_response: POINTER): INTEGER_32 is
 		-- rpmatch (node at line 1426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rpmatch"
		}"
		end

	strtoul (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): NATURAL_64 is
 		-- strtoul (node at line 1429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoul"
		}"
		end

	labs (a_x: INTEGER_64): INTEGER_64 is
 		-- labs (node at line 1477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "labs"
		}"
		end

	ptsname_r (a_fd: INTEGER_32; a_buf: POINTER; a_buflen: NATURAL_64): INTEGER_32 is
 		-- ptsname_r (node at line 1497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ptsname_r"
		}"
		end

	l64a (a_n: INTEGER_64): POINTER is
 		-- l64a (node at line 1531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "l64a"
		}"
		end

	mkstemp64 (a_template: POINTER): INTEGER_32 is
 		-- mkstemp64 (node at line 1534)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkstemp64"
		}"
		end

	unlockpt (a_fd: INTEGER_32): INTEGER_32 is
 		-- unlockpt (node at line 1561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unlockpt"
		}"
		end

	srand (a_seed: NATURAL_32) is
 		-- srand (node at line 1564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srand"
		}"
		end

	mktemp (a_template: POINTER): POINTER is
 		-- mktemp (node at line 1572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mktemp"
		}"
		end

	strtol_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): INTEGER_64 is
 		-- strtol_l (node at line 1575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtol_l"
		}"
		end

	lcong48_r (a_param: POINTER; a_buffer: POINTER): INTEGER_32 is
 		-- lcong48_r (node at line 1587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lcong48_r"
		}"
		end

	atexit (a_func: POINTER): INTEGER_32 is
 		-- atexit (node at line 1592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atexit"
		}"
		end

	setstate_r (a_statebuf: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- setstate_r (node at line 1626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setstate_r"
		}"
		end

	setenv (a_name: POINTER; a_value: POINTER; a_replace: INTEGER_32): INTEGER_32 is
 		-- setenv (node at line 1631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setenv"
		}"
		end

	strtoul_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32; a_loc: POINTER): NATURAL_64 is
 		-- strtoul_l (node at line 1643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoul_l"
		}"
		end

	a64l (a_s: POINTER): INTEGER_64 is
 		-- a64l (node at line 1667)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "a64l"
		}"
		end

	-- `hidden' function __secure_getenv skipped.
	qfcvt_r (a_value: REAL_128; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- qfcvt_r (node at line 1691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "qfcvt_r"
		}"
		end

	ecvt (a_value: REAL_64; a_ndigit: INTEGER_32; a_decpt: POINTER; a_sign: POINTER): POINTER is
 		-- ecvt (node at line 1710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ecvt"
		}"
		end

	srandom (a_seed: NATURAL_32) is
 		-- srandom (node at line 1742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "srandom"
		}"
		end

	nrand48 (a_xsubi: POINTER): INTEGER_64 is
 		-- nrand48 (node at line 1745)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nrand48"
		}"
		end

	quick_exit (a_status: INTEGER_32) is
 		-- quick_exit (node at line 1763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "quick_exit"
		}"
		end

	lrand48: INTEGER_64 is
 		-- lrand48 (node at line 1792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrand48()"
		}"
		end

	nrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- nrand48_r (node at line 1793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nrand48_r"
		}"
		end

	jrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER_32 is
 		-- jrand48_r (node at line 1825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jrand48_r"
		}"
		end

	rand: INTEGER_32 is
 		-- rand (node at line 1838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rand()"
		}"
		end

	seed48 (a_seed16v: POINTER): POINTER is
 		-- seed48 (node at line 1840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "seed48"
		}"
		end

	strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER_32): NATURAL_64 is
 		-- strtoull (node at line 1863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "strtoull"
		}"
		end

	lldiv (a_numer: INTEGER_64; a_denom: INTEGER_64): LLDIV_T_STRUCT is
 		-- lldiv (node at line 1872)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lldiv"
		}"
		end

	abs (a_x: INTEGER_32): INTEGER_32 is
 		-- abs (node at line 1886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "abs"
		}"
		end


end -- class STDLIBEXTERNALS
