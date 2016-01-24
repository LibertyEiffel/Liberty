-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class STDLIB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	a64l (a_s: POINTER): like long 
               -- a64l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "a64l"
               }"
               end

	abort 
               -- abort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "abort"
               }"
               end

	abs (a_x: INTEGER): INTEGER 
               -- abs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "abs"
               }"
               end

	aligned_alloc (an_alignment: like long_unsigned; a_size: like long_unsigned): POINTER 
               -- aligned_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aligned_alloc"
               }"
               end

	at_quick_exit (a_func: POINTER): INTEGER 
               -- at_quick_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "at_quick_exit"
               }"
               end

	atexit (a_func: POINTER): INTEGER 
               -- atexit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atexit"
               }"
               end

	atof (a_nptr: POINTER): REAL 
               -- atof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atof"
               }"
               end

	atoi (a_nptr: POINTER): INTEGER 
               -- atoi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atoi"
               }"
               end

	atol (a_nptr: POINTER): like long 
               -- atol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atol"
               }"
               end

	atoll (a_nptr: POINTER): INTEGER_64 
               -- atoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atoll"
               }"
               end

	bsearch (a_key: POINTER; a_base: POINTER; a_nmemb: like long_unsigned; a_size: like long_unsigned; a_compar: POINTER): POINTER 
               -- bsearch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bsearch"
               }"
               end

	calloc (a_nmemb: like long_unsigned; a_size: like long_unsigned): POINTER 
               -- calloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "calloc"
               }"
               end

	canonicalize_file_name (a_name: POINTER): POINTER 
               -- canonicalize_file_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "canonicalize_file_name"
               }"
               end

	cfree (a_ptr: POINTER) 
               -- cfree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfree"
               }"
               end

	clearenv: INTEGER 
               -- clearenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clearenv"
               }"
               end

	-- `hidden' function __ctype_get_mb_cur_max skipped.
       -- function div (at line 789 in file /usr/include/stdlib.h is not wrappable
	drand48: REAL 
               -- drand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "drand48"
               }"
               end

	drand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER 
               -- drand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "drand48_r"
               }"
               end

	ecvt (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 
               -- ecvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ecvt"
               }"
               end

	ecvt_r (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 
               -- ecvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ecvt_r"
               }"
               end

	erand48 (a_xsubi: POINTER): REAL 
               -- erand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "erand48"
               }"
               end

	erand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER 
               -- erand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "erand48_r"
               }"
               end

	exit (a_status: INTEGER) 
               -- exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "exit"
               }"
               end

	-- `hidden' function _Exit skipped.
	fcvt (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 
               -- fcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcvt"
               }"
               end

	fcvt_r (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 
               -- fcvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcvt_r"
               }"
               end

	free (a_ptr: POINTER) 
               -- free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "free"
               }"
               end

	gcvt (a_value: REAL; a_ndigit: INTEGER; a_buf: POINTER): POINTER 
               -- gcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gcvt"
               }"
               end

	getenv (a_name: POINTER): POINTER 
               -- getenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getenv"
               }"
               end

	getloadavg (a_loadavg: POINTER; a_nelem: INTEGER): INTEGER 
               -- getloadavg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getloadavg"
               }"
               end

	getpt: INTEGER 
               -- getpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpt"
               }"
               end

	getsubopt (an_optionp: POINTER; a_tokens: POINTER; a_valuep: POINTER): INTEGER 
               -- getsubopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getsubopt"
               }"
               end

	grantpt (a_fd: INTEGER): INTEGER 
               -- grantpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "grantpt"
               }"
               end

	initstate (a_seed: NATURAL; a_statebuf: POINTER; a_statelen: like long_unsigned): POINTER 
               -- initstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initstate"
               }"
               end

	initstate_r (a_seed: NATURAL; a_statebuf: POINTER; a_statelen: like long_unsigned; a_buf: POINTER): INTEGER 
               -- initstate_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initstate_r"
               }"
               end

	jrand48 (a_xsubi: POINTER): like long 
               -- jrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "jrand48"
               }"
               end

	jrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER 
               -- jrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "jrand48_r"
               }"
               end

	l64a (a_n: like long): POINTER 
               -- l64a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "l64a"
               }"
               end

	labs (a_x: like long): like long 
               -- labs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "labs"
               }"
               end

	lcong48 (a_param: POINTER) 
               -- lcong48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lcong48"
               }"
               end

	lcong48_r (a_param: POINTER; a_buffer: POINTER): INTEGER 
               -- lcong48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lcong48_r"
               }"
               end

       -- function ldiv (at line 791 in file /usr/include/stdlib.h is not wrappable
	llabs (a_x: INTEGER_64): INTEGER_64 
               -- llabs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "llabs"
               }"
               end

       -- function lldiv (at line 797 in file /usr/include/stdlib.h is not wrappable
	lrand48: like long 
               -- lrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lrand48"
               }"
               end

	lrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER 
               -- lrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lrand48_r"
               }"
               end

	malloc (a_size: like long_unsigned): POINTER 
               -- malloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "malloc"
               }"
               end

	mblen (a_s: POINTER; a_n: like long_unsigned): INTEGER 
               -- mblen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mblen"
               }"
               end

	mbstowcs (a_pwcs: POINTER; a_s: POINTER; a_n: like long_unsigned): like long_unsigned 
               -- mbstowcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mbstowcs"
               }"
               end

	mbtowc (a_pwc: POINTER; a_s: POINTER; a_n: like long_unsigned): INTEGER 
               -- mbtowc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mbtowc"
               }"
               end

	memcpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 
               -- memcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memcpy"
               }"
               end

	mkdtemp (a_template: POINTER): POINTER 
               -- mkdtemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkdtemp"
               }"
               end

	mkostemp (a_template: POINTER; a_flags: INTEGER): INTEGER 
               -- mkostemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemp"
               }"
               end

	mkostemp64 (a_template: POINTER; a_flags: INTEGER): INTEGER 
               -- mkostemp64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemp64"
               }"
               end

	mkostemps (a_template: POINTER; a_suffixlen: INTEGER; a_flags: INTEGER): INTEGER 
               -- mkostemps
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemps"
               }"
               end

	mkostemps64 (a_template: POINTER; a_suffixlen: INTEGER; a_flags: INTEGER): INTEGER 
               -- mkostemps64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemps64"
               }"
               end

	mkstemp (a_template: POINTER): INTEGER 
               -- mkstemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemp"
               }"
               end

	mkstemp64 (a_template: POINTER): INTEGER 
               -- mkstemp64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemp64"
               }"
               end

	mkstemps (a_template: POINTER; a_suffixlen: INTEGER): INTEGER 
               -- mkstemps
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemps"
               }"
               end

	mkstemps64 (a_template: POINTER; a_suffixlen: INTEGER): INTEGER 
               -- mkstemps64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemps64"
               }"
               end

	mktemp (a_template: POINTER): POINTER 
               -- mktemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mktemp"
               }"
               end

	mrand48: like long 
               -- mrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mrand48"
               }"
               end

	mrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER 
               -- mrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mrand48_r"
               }"
               end

	nrand48 (a_xsubi: POINTER): like long 
               -- nrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nrand48"
               }"
               end

	nrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER 
               -- nrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nrand48_r"
               }"
               end

	on_exit (a_func: POINTER; an_arg: POINTER): INTEGER 
               -- on_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "on_exit"
               }"
               end

	posix_memalign (a_memptr: POINTER; an_alignment: like long_unsigned; a_size: like long_unsigned): INTEGER 
               -- posix_memalign
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_memalign"
               }"
               end

	posix_openpt (an_oflag: INTEGER): INTEGER 
               -- posix_openpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_openpt"
               }"
               end

	ptsname (a_fd: INTEGER): POINTER 
               -- ptsname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ptsname"
               }"
               end

	ptsname_r (a_fd: INTEGER; a_buf: POINTER; a_buflen: like long_unsigned): INTEGER 
               -- ptsname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ptsname_r"
               }"
               end

	putenv (a_string: POINTER): INTEGER 
               -- putenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putenv"
               }"
               end

	qecvt (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 
               -- qecvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qecvt"
               }"
               end

	qecvt_r (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 
               -- qecvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qecvt_r"
               }"
               end

	qfcvt (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 
               -- qfcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qfcvt"
               }"
               end

	qfcvt_r (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 
               -- qfcvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qfcvt_r"
               }"
               end

	qgcvt (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_buf: POINTER): POINTER 
               -- qgcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qgcvt"
               }"
               end

	qsort (a_base: POINTER; a_nmemb: like long_unsigned; a_size: like long_unsigned; a_compar: POINTER) 
               -- qsort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qsort"
               }"
               end

	qsort_r (a_base: POINTER; a_nmemb: like long_unsigned; a_size: like long_unsigned; a_compar: POINTER; an_arg: POINTER) 
               -- qsort_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qsort_r"
               }"
               end

	quick_exit (a_status: INTEGER) 
               -- quick_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "quick_exit"
               }"
               end

	rand: INTEGER 
               -- rand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rand"
               }"
               end

	rand_r (a_seed: POINTER): INTEGER 
               -- rand_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rand_r"
               }"
               end

	random: like long 
               -- random
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "random"
               }"
               end

	random_r (a_buf: POINTER; a_result: POINTER): INTEGER 
               -- random_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "random_r"
               }"
               end

	realloc (a_ptr: POINTER; a_size: like long_unsigned): POINTER 
               -- realloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "realloc"
               }"
               end

	realpath (a_name: POINTER; a_resolved: POINTER): POINTER 
               -- realpath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "realpath"
               }"
               end

	rpmatch (a_response: POINTER): INTEGER 
               -- rpmatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rpmatch"
               }"
               end

	secure_getenv (a_name: POINTER): POINTER 
               -- secure_getenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "secure_getenv"
               }"
               end

	seed48 (a_seed16v: POINTER): POINTER 
               -- seed48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seed48"
               }"
               end

	seed48_r (a_seed16v: POINTER; a_buffer: POINTER): INTEGER 
               -- seed48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seed48_r"
               }"
               end

	setenv (a_name: POINTER; a_value: POINTER; a_replace: INTEGER): INTEGER 
               -- setenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setenv"
               }"
               end

	setkey (a_key: POINTER) 
               -- setkey
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setkey"
               }"
               end

	setstate (a_statebuf: POINTER): POINTER 
               -- setstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setstate"
               }"
               end

	setstate_r (a_statebuf: POINTER; a_buf: POINTER): INTEGER 
               -- setstate_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setstate_r"
               }"
               end

	srand (a_seed: NATURAL) 
               -- srand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srand"
               }"
               end

	srand48 (a_seedval: like long) 
               -- srand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srand48"
               }"
               end

	srand48_r (a_seedval: like long; a_buffer: POINTER): INTEGER 
               -- srand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srand48_r"
               }"
               end

	srandom (a_seed: NATURAL) 
               -- srandom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srandom"
               }"
               end

	srandom_r (a_seed: NATURAL; a_buf: POINTER): INTEGER 
               -- srandom_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srandom_r"
               }"
               end

	strtod (a_nptr: POINTER; an_endptr: POINTER): REAL 
               -- strtod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtod"
               }"
               end

	strtod_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL 
               -- strtod_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtod_l"
               }"
               end

	strtof (a_nptr: POINTER; an_endptr: POINTER): REAL_32 
               -- strtof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtof"
               }"
               end

	strtof_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_32 
               -- strtof_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtof_l"
               }"
               end

	strtol (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like long 
               -- strtol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtol"
               }"
               end

	strtol_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): like long 
               -- strtol_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtol_l"
               }"
               end

	strtold (a_nptr: POINTER; an_endptr: POINTER): REAL_EXTENDED 
               -- strtold
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtold"
               }"
               end

	strtold_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_EXTENDED 
               -- strtold_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtold_l"
               }"
               end

	strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): INTEGER_64 
               -- strtoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoll"
               }"
               end

	strtoll_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): INTEGER_64 
               -- strtoll_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoll_l"
               }"
               end

	strtoq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): INTEGER_64 
               -- strtoq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoq"
               }"
               end

	strtoul (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like long_unsigned 
               -- strtoul
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoul"
               }"
               end

	strtoul_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): like long_unsigned 
               -- strtoul_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoul_l"
               }"
               end

	strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): NATURAL_64 
               -- strtoull
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoull"
               }"
               end

	strtoull_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): NATURAL_64 
               -- strtoull_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoull_l"
               }"
               end

	strtouq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): NATURAL_64 
               -- strtouq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtouq"
               }"
               end

	system (a_command: POINTER): INTEGER 
               -- system
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "system"
               }"
               end

	unlockpt (a_fd: INTEGER): INTEGER 
               -- unlockpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unlockpt"
               }"
               end

	unsetenv (a_name: POINTER): INTEGER 
               -- unsetenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unsetenv"
               }"
               end

	valloc (a_size: like long_unsigned): POINTER 
               -- valloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "valloc"
               }"
               end

	wcstombs (a_s: POINTER; a_pwcs: POINTER; a_n: like long_unsigned): like long_unsigned 
               -- wcstombs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wcstombs"
               }"
               end

       -- function wctomb (at line 870 in file /usr/include/stdlib.h is not wrappable

end -- class STDLIB_EXTERNALS
