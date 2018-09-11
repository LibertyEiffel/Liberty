-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STDLIB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	a64l (a_s: POINTER): like long 

		-- function a64l (in `/usr/include/stdlib.h')
               -- a64l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "a64l"
               }"
               end

	abort 

		-- function abort (in `/usr/include/stdlib.h')
               -- abort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "abort()"
               }"
               end

	abs (a_x: INTEGER): INTEGER 

		-- function abs (in `/usr/include/stdlib.h')
               -- abs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "abs"
               }"
               end

	aligned_alloc (an_alignment: like long_unsigned; a_size: like long_unsigned): POINTER 

		-- function aligned_alloc (in `/usr/include/stdlib.h')
               -- aligned_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "aligned_alloc"
               }"
               end

	at_quick_exit (a_func: POINTER): INTEGER 

		-- function at_quick_exit (in `/usr/include/stdlib.h')
               -- at_quick_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "at_quick_exit"
               }"
               end

	atexit (a_func: POINTER): INTEGER 

		-- function atexit (in `/usr/include/stdlib.h')
               -- atexit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atexit"
               }"
               end

	atof (a_nptr: POINTER): REAL 

		-- function atof (in `/usr/include/stdlib.h')
               -- atof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atof"
               }"
               end

	atoi (a_nptr: POINTER): INTEGER 

		-- function atoi (in `/usr/include/stdlib.h')
               -- atoi
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atoi"
               }"
               end

	atol (a_nptr: POINTER): like long 

		-- function atol (in `/usr/include/stdlib.h')
               -- atol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atol"
               }"
               end

	atoll (a_nptr: POINTER): INTEGER_64 

		-- function atoll (in `/usr/include/stdlib.h')
               -- atoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "atoll"
               }"
               end

	bsearch (a_key: POINTER; a_base: POINTER; a_nmemb: like long_unsigned; a_size: like long_unsigned; a_compar: POINTER): POINTER 

		-- function bsearch (in `/usr/include/stdlib.h')
               -- bsearch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "bsearch"
               }"
               end

	calloc (a_nmemb: like long_unsigned; a_size: like long_unsigned): POINTER 

		-- function calloc (in `/usr/include/stdlib.h')
               -- calloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "calloc"
               }"
               end

	canonicalize_file_name (a_name: POINTER): POINTER 

		-- function canonicalize_file_name (in `/usr/include/stdlib.h')
               -- canonicalize_file_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "canonicalize_file_name"
               }"
               end

	cfree (a_ptr: POINTER) 

		-- function cfree (in `/usr/include/stdlib.h')
               -- cfree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfree"
               }"
               end

	clearenv: INTEGER 

		-- function clearenv (in `/usr/include/stdlib.h')
               -- clearenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clearenv()"
               }"
               end

	-- `hidden' function __ctype_get_mb_cur_max skipped.
       -- unwrappable function div in file `/usr/include/stdlib.h'
	drand48: REAL 

		-- function drand48 (in `/usr/include/stdlib.h')
               -- drand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "drand48()"
               }"
               end

	drand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER 

		-- function drand48_r (in `/usr/include/stdlib.h')
               -- drand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "drand48_r"
               }"
               end

	ecvt (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 

		-- function ecvt (in `/usr/include/stdlib.h')
               -- ecvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ecvt"
               }"
               end

	ecvt_r (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 

		-- function ecvt_r (in `/usr/include/stdlib.h')
               -- ecvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ecvt_r"
               }"
               end

	erand48 (a_xsubi: POINTER): REAL 

		-- function erand48 (in `/usr/include/stdlib.h')
               -- erand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "erand48"
               }"
               end

	erand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER 

		-- function erand48_r (in `/usr/include/stdlib.h')
               -- erand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "erand48_r"
               }"
               end

	exit (a_status: INTEGER) 

		-- function exit (in `/usr/include/stdlib.h')
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

		-- function fcvt (in `/usr/include/stdlib.h')
               -- fcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcvt"
               }"
               end

	fcvt_r (a_value: REAL; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 

		-- function fcvt_r (in `/usr/include/stdlib.h')
               -- fcvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcvt_r"
               }"
               end

	free (a_ptr: POINTER) 

		-- function free (in `/usr/include/stdlib.h')
               -- free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "free"
               }"
               end

	gcvt (a_value: REAL; a_ndigit: INTEGER; a_buf: POINTER): POINTER 

		-- function gcvt (in `/usr/include/stdlib.h')
               -- gcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gcvt"
               }"
               end

	getenv (a_name: POINTER): POINTER 

		-- function getenv (in `/usr/include/stdlib.h')
               -- getenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getenv"
               }"
               end

	getloadavg (a_loadavg: POINTER; a_nelem: INTEGER): INTEGER 

		-- function getloadavg (in `/usr/include/stdlib.h')
               -- getloadavg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getloadavg"
               }"
               end

	getpt: INTEGER 

		-- function getpt (in `/usr/include/stdlib.h')
               -- getpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpt()"
               }"
               end

	getsubopt (an_optionp: POINTER; a_tokens: POINTER; a_valuep: POINTER): INTEGER 

		-- function getsubopt (in `/usr/include/stdlib.h')
               -- getsubopt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getsubopt"
               }"
               end

	grantpt (a_fd: INTEGER): INTEGER 

		-- function grantpt (in `/usr/include/stdlib.h')
               -- grantpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "grantpt"
               }"
               end

	initstate (a_seed: NATURAL; a_statebuf: POINTER; a_statelen: like long_unsigned): POINTER 

		-- function initstate (in `/usr/include/stdlib.h')
               -- initstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initstate"
               }"
               end

	initstate_r (a_seed: NATURAL; a_statebuf: POINTER; a_statelen: like long_unsigned; a_buf: POINTER): INTEGER 

		-- function initstate_r (in `/usr/include/stdlib.h')
               -- initstate_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initstate_r"
               }"
               end

	jrand48 (a_xsubi: POINTER): like long 

		-- function jrand48 (in `/usr/include/stdlib.h')
               -- jrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "jrand48"
               }"
               end

	jrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER 

		-- function jrand48_r (in `/usr/include/stdlib.h')
               -- jrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "jrand48_r"
               }"
               end

	l64a (a_n: like long): POINTER 

		-- function l64a (in `/usr/include/stdlib.h')
               -- l64a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "l64a"
               }"
               end

	labs (a_x: like long): like long 

		-- function labs (in `/usr/include/stdlib.h')
               -- labs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "labs"
               }"
               end

	lcong48 (a_param: POINTER) 

		-- function lcong48 (in `/usr/include/stdlib.h')
               -- lcong48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lcong48"
               }"
               end

	lcong48_r (a_param: POINTER; a_buffer: POINTER): INTEGER 

		-- function lcong48_r (in `/usr/include/stdlib.h')
               -- lcong48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lcong48_r"
               }"
               end

       -- unwrappable function ldiv in file `/usr/include/stdlib.h'
	llabs (a_x: INTEGER_64): INTEGER_64 

		-- function llabs (in `/usr/include/stdlib.h')
               -- llabs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "llabs"
               }"
               end

       -- unwrappable function lldiv in file `/usr/include/stdlib.h'
	lrand48: like long 

		-- function lrand48 (in `/usr/include/stdlib.h')
               -- lrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lrand48()"
               }"
               end

	lrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER 

		-- function lrand48_r (in `/usr/include/stdlib.h')
               -- lrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lrand48_r"
               }"
               end

	malloc (a_size: like long_unsigned): POINTER 

		-- function malloc (in `/usr/include/stdlib.h')
               -- malloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "malloc"
               }"
               end

	mblen (a_s: POINTER; a_n: like long_unsigned): INTEGER 

		-- function mblen (in `/usr/include/stdlib.h')
               -- mblen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mblen"
               }"
               end

	mbstowcs (a_pwcs: POINTER; a_s: POINTER; a_n: like long_unsigned): like long_unsigned 

		-- function mbstowcs (in `/usr/include/stdlib.h')
               -- mbstowcs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mbstowcs"
               }"
               end

	mbtowc (a_pwc: POINTER; a_s: POINTER; a_n: like long_unsigned): INTEGER 

		-- function mbtowc (in `/usr/include/stdlib.h')
               -- mbtowc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mbtowc"
               }"
               end

	memcpy (a_dest: POINTER; a_src: POINTER; a_n: like long_unsigned): POINTER 

		-- function memcpy (in `/usr/include/stdlib.h')
               -- memcpy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "memcpy"
               }"
               end

	mkdtemp (a_template: POINTER): POINTER 

		-- function mkdtemp (in `/usr/include/stdlib.h')
               -- mkdtemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkdtemp"
               }"
               end

	mkostemp (a_template: POINTER; a_flags: INTEGER): INTEGER 

		-- function mkostemp (in `/usr/include/stdlib.h')
               -- mkostemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemp"
               }"
               end

	mkostemp64 (a_template: POINTER; a_flags: INTEGER): INTEGER 

		-- function mkostemp64 (in `/usr/include/stdlib.h')
               -- mkostemp64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemp64"
               }"
               end

	mkostemps (a_template: POINTER; a_suffixlen: INTEGER; a_flags: INTEGER): INTEGER 

		-- function mkostemps (in `/usr/include/stdlib.h')
               -- mkostemps
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemps"
               }"
               end

	mkostemps64 (a_template: POINTER; a_suffixlen: INTEGER; a_flags: INTEGER): INTEGER 

		-- function mkostemps64 (in `/usr/include/stdlib.h')
               -- mkostemps64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkostemps64"
               }"
               end

	mkstemp (a_template: POINTER): INTEGER 

		-- function mkstemp (in `/usr/include/stdlib.h')
               -- mkstemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemp"
               }"
               end

	mkstemp64 (a_template: POINTER): INTEGER 

		-- function mkstemp64 (in `/usr/include/stdlib.h')
               -- mkstemp64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemp64"
               }"
               end

	mkstemps (a_template: POINTER; a_suffixlen: INTEGER): INTEGER 

		-- function mkstemps (in `/usr/include/stdlib.h')
               -- mkstemps
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemps"
               }"
               end

	mkstemps64 (a_template: POINTER; a_suffixlen: INTEGER): INTEGER 

		-- function mkstemps64 (in `/usr/include/stdlib.h')
               -- mkstemps64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkstemps64"
               }"
               end

	mktemp (a_template: POINTER): POINTER 

		-- function mktemp (in `/usr/include/stdlib.h')
               -- mktemp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mktemp"
               }"
               end

	mrand48: like long 

		-- function mrand48 (in `/usr/include/stdlib.h')
               -- mrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mrand48()"
               }"
               end

	mrand48_r (a_buffer: POINTER; a_result: POINTER): INTEGER 

		-- function mrand48_r (in `/usr/include/stdlib.h')
               -- mrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mrand48_r"
               }"
               end

	nrand48 (a_xsubi: POINTER): like long 

		-- function nrand48 (in `/usr/include/stdlib.h')
               -- nrand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nrand48"
               }"
               end

	nrand48_r (a_xsubi: POINTER; a_buffer: POINTER; a_result: POINTER): INTEGER 

		-- function nrand48_r (in `/usr/include/stdlib.h')
               -- nrand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nrand48_r"
               }"
               end

	on_exit (a_func: POINTER; an_arg: POINTER): INTEGER 

		-- function on_exit (in `/usr/include/stdlib.h')
               -- on_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "on_exit"
               }"
               end

	posix_memalign (a_memptr: POINTER; an_alignment: like long_unsigned; a_size: like long_unsigned): INTEGER 

		-- function posix_memalign (in `/usr/include/stdlib.h')
               -- posix_memalign
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_memalign"
               }"
               end

	posix_openpt (an_oflag: INTEGER): INTEGER 

		-- function posix_openpt (in `/usr/include/stdlib.h')
               -- posix_openpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "posix_openpt"
               }"
               end

	ptsname (a_fd: INTEGER): POINTER 

		-- function ptsname (in `/usr/include/stdlib.h')
               -- ptsname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ptsname"
               }"
               end

	ptsname_r (a_fd: INTEGER; a_buf: POINTER; a_buflen: like long_unsigned): INTEGER 

		-- function ptsname_r (in `/usr/include/stdlib.h')
               -- ptsname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ptsname_r"
               }"
               end

	putenv (a_string: POINTER): INTEGER 

		-- function putenv (in `/usr/include/stdlib.h')
               -- putenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putenv"
               }"
               end

	qecvt (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 

		-- function qecvt (in `/usr/include/stdlib.h')
               -- qecvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qecvt"
               }"
               end

	qecvt_r (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 

		-- function qecvt_r (in `/usr/include/stdlib.h')
               -- qecvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qecvt_r"
               }"
               end

	qfcvt (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER): POINTER 

		-- function qfcvt (in `/usr/include/stdlib.h')
               -- qfcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qfcvt"
               }"
               end

	qfcvt_r (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_decpt: POINTER; a_sign: POINTER; a_buf: POINTER; a_len: like long_unsigned): INTEGER 

		-- function qfcvt_r (in `/usr/include/stdlib.h')
               -- qfcvt_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qfcvt_r"
               }"
               end

	qgcvt (a_value: REAL_EXTENDED; a_ndigit: INTEGER; a_buf: POINTER): POINTER 

		-- function qgcvt (in `/usr/include/stdlib.h')
               -- qgcvt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qgcvt"
               }"
               end

	qsort (a_base: POINTER; a_nmemb: like long_unsigned; a_size: like long_unsigned; a_compar: POINTER) 

		-- function qsort (in `/usr/include/stdlib.h')
               -- qsort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qsort"
               }"
               end

	qsort_r (a_base: POINTER; a_nmemb: like long_unsigned; a_size: like long_unsigned; a_compar: POINTER; an_arg: POINTER) 

		-- function qsort_r (in `/usr/include/stdlib.h')
               -- qsort_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "qsort_r"
               }"
               end

	quick_exit (a_status: INTEGER) 

		-- function quick_exit (in `/usr/include/stdlib.h')
               -- quick_exit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "quick_exit"
               }"
               end

	rand: INTEGER 

		-- function rand (in `/usr/include/stdlib.h')
               -- rand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rand()"
               }"
               end

	rand_r (a_seed: POINTER): INTEGER 

		-- function rand_r (in `/usr/include/stdlib.h')
               -- rand_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rand_r"
               }"
               end

	random: like long 

		-- function random (in `/usr/include/stdlib.h')
               -- random
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "random()"
               }"
               end

	random_r (a_buf: POINTER; a_result: POINTER): INTEGER 

		-- function random_r (in `/usr/include/stdlib.h')
               -- random_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "random_r"
               }"
               end

	realloc (a_ptr: POINTER; a_size: like long_unsigned): POINTER 

		-- function realloc (in `/usr/include/stdlib.h')
               -- realloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "realloc"
               }"
               end

	realpath (a_name: POINTER; a_resolved: POINTER): POINTER 

		-- function realpath (in `/usr/include/stdlib.h')
               -- realpath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "realpath"
               }"
               end

	rpmatch (a_response: POINTER): INTEGER 

		-- function rpmatch (in `/usr/include/stdlib.h')
               -- rpmatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rpmatch"
               }"
               end

	secure_getenv (a_name: POINTER): POINTER 

		-- function secure_getenv (in `/usr/include/stdlib.h')
               -- secure_getenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "secure_getenv"
               }"
               end

	seed48 (a_seed16v: POINTER): POINTER 

		-- function seed48 (in `/usr/include/stdlib.h')
               -- seed48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seed48"
               }"
               end

	seed48_r (a_seed16v: POINTER; a_buffer: POINTER): INTEGER 

		-- function seed48_r (in `/usr/include/stdlib.h')
               -- seed48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seed48_r"
               }"
               end

	setenv (a_name: POINTER; a_value: POINTER; a_replace: INTEGER): INTEGER 

		-- function setenv (in `/usr/include/stdlib.h')
               -- setenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setenv"
               }"
               end

	setkey (a_key: POINTER) 

		-- function setkey (in `/usr/include/stdlib.h')
               -- setkey
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setkey"
               }"
               end

	setstate (a_statebuf: POINTER): POINTER 

		-- function setstate (in `/usr/include/stdlib.h')
               -- setstate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setstate"
               }"
               end

	setstate_r (a_statebuf: POINTER; a_buf: POINTER): INTEGER 

		-- function setstate_r (in `/usr/include/stdlib.h')
               -- setstate_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setstate_r"
               }"
               end

	srand (a_seed: NATURAL) 

		-- function srand (in `/usr/include/stdlib.h')
               -- srand
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srand"
               }"
               end

	srand48 (a_seedval: like long) 

		-- function srand48 (in `/usr/include/stdlib.h')
               -- srand48
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srand48"
               }"
               end

	srand48_r (a_seedval: like long; a_buffer: POINTER): INTEGER 

		-- function srand48_r (in `/usr/include/stdlib.h')
               -- srand48_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srand48_r"
               }"
               end

	srandom (a_seed: NATURAL) 

		-- function srandom (in `/usr/include/stdlib.h')
               -- srandom
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srandom"
               }"
               end

	srandom_r (a_seed: NATURAL; a_buf: POINTER): INTEGER 

		-- function srandom_r (in `/usr/include/stdlib.h')
               -- srandom_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "srandom_r"
               }"
               end

	strtod (a_nptr: POINTER; an_endptr: POINTER): REAL 

		-- function strtod (in `/usr/include/stdlib.h')
               -- strtod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtod"
               }"
               end

	strtod_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL 

		-- function strtod_l (in `/usr/include/stdlib.h')
               -- strtod_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtod_l"
               }"
               end

	strtof (a_nptr: POINTER; an_endptr: POINTER): REAL_32 

		-- function strtof (in `/usr/include/stdlib.h')
               -- strtof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtof"
               }"
               end

	strtof_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_32 

		-- function strtof_l (in `/usr/include/stdlib.h')
               -- strtof_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtof_l"
               }"
               end

	strtol (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like long 

		-- function strtol (in `/usr/include/stdlib.h')
               -- strtol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtol"
               }"
               end

	strtol_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): like long 

		-- function strtol_l (in `/usr/include/stdlib.h')
               -- strtol_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtol_l"
               }"
               end

	strtold (a_nptr: POINTER; an_endptr: POINTER): REAL_EXTENDED 

		-- function strtold (in `/usr/include/stdlib.h')
               -- strtold
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtold"
               }"
               end

	strtold_l (a_nptr: POINTER; an_endptr: POINTER; a_loc: POINTER): REAL_EXTENDED 

		-- function strtold_l (in `/usr/include/stdlib.h')
               -- strtold_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtold_l"
               }"
               end

	strtoll (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): INTEGER_64 

		-- function strtoll (in `/usr/include/stdlib.h')
               -- strtoll
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoll"
               }"
               end

	strtoll_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): INTEGER_64 

		-- function strtoll_l (in `/usr/include/stdlib.h')
               -- strtoll_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoll_l"
               }"
               end

	strtoq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): INTEGER_64 

		-- function strtoq (in `/usr/include/stdlib.h')
               -- strtoq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoq"
               }"
               end

	strtoul (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): like long_unsigned 

		-- function strtoul (in `/usr/include/stdlib.h')
               -- strtoul
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoul"
               }"
               end

	strtoul_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): like long_unsigned 

		-- function strtoul_l (in `/usr/include/stdlib.h')
               -- strtoul_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoul_l"
               }"
               end

	strtoull (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): NATURAL_64 

		-- function strtoull (in `/usr/include/stdlib.h')
               -- strtoull
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoull"
               }"
               end

	strtoull_l (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER; a_loc: POINTER): NATURAL_64 

		-- function strtoull_l (in `/usr/include/stdlib.h')
               -- strtoull_l
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtoull_l"
               }"
               end

	strtouq (a_nptr: POINTER; an_endptr: POINTER; a_base: INTEGER): NATURAL_64 

		-- function strtouq (in `/usr/include/stdlib.h')
               -- strtouq
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "strtouq"
               }"
               end

	system (a_command: POINTER): INTEGER 

		-- function system (in `/usr/include/stdlib.h')
               -- system
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "system"
               }"
               end

	unlockpt (a_fd: INTEGER): INTEGER 

		-- function unlockpt (in `/usr/include/stdlib.h')
               -- unlockpt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unlockpt"
               }"
               end

	unsetenv (a_name: POINTER): INTEGER 

		-- function unsetenv (in `/usr/include/stdlib.h')
               -- unsetenv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unsetenv"
               }"
               end

	valloc (a_size: like long_unsigned): POINTER 

		-- function valloc (in `/usr/include/stdlib.h')
               -- valloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "valloc"
               }"
               end

	wcstombs (a_s: POINTER; a_pwcs: POINTER; a_n: like long_unsigned): like long_unsigned 

		-- function wcstombs (in `/usr/include/stdlib.h')
               -- wcstombs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "wcstombs"
               }"
               end

       -- unwrappable function wctomb in file `/usr/include/stdlib.h'

end -- class STDLIB_EXTERNALS
