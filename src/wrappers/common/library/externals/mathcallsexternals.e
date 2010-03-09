-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class MATHCALLSEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function __nan skipped.
	dremf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- dremf (node at line 16)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dremf"
		}"
		end

	dreml (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- dreml (node at line 20)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dreml"
		}"
		end

	-- `hidden' function __atanf skipped.
	-- `hidden' function __acos skipped.
	-- `hidden' function __fminf skipped.
	lgammal_r (an_argument_l59_c7: REAL_128; a_signgamp: POINTER): REAL_128 is
 		-- lgammal_r (node at line 58)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lgammal_r"
		}"
		end

	fmaxf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- fmaxf (node at line 68)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmaxf"
		}"
		end

	fmaxl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- fmaxl (node at line 77)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmaxl"
		}"
		end

	-- `hidden' function __fminl skipped.
	nan (a_tagb: POINTER): REAL_64 is
 		-- nan (node at line 98)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nan"
		}"
		end

	-- `hidden' function __log1pf skipped.
	-- `hidden' function __log1pl skipped.
	y0 (an_argument_l116_c7: REAL_64): REAL_64 is
 		-- y0 (node at line 115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "y0"
		}"
		end

	y1 (an_argument_l119_c7: REAL_64): REAL_64 is
 		-- y1 (node at line 118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "y1"
		}"
		end

	-- `hidden' function __nexttowardf skipped.
	-- `hidden' function __cosf skipped.
	-- `hidden' function __cosh skipped.
	-- `hidden' function __cosl skipped.
	llrint (a_x: REAL_64): INTEGER_64 is
 		-- llrint (node at line 134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llrint"
		}"
		end

	-- `hidden' function __remquo skipped.
	floorf (a_x: REAL_32): REAL_32 is
 		-- floorf (node at line 155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "floorf"
		}"
		end

	floorl (a_x: REAL_128): REAL_128 is
 		-- floorl (node at line 159)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "floorl"
		}"
		end

	atan (a_x: REAL_64): REAL_64 is
 		-- atan (node at line 162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atan"
		}"
		end

	-- `hidden' function __cos skipped.
	-- `hidden' function __fdim skipped.
	-- `hidden' function __lgammaf skipped.
	-- `hidden' function __lgammal skipped.
	-- `hidden' function __nexttoward skipped.
	-- `hidden' function __asinhf skipped.
	-- `hidden' function __asinhl skipped.
	-- `hidden' function __ynf skipped.
	-- `hidden' function __ynl skipped.
	jnf (an_argument_l269_c7: INTEGER_32; an_argument_l270_c7: REAL_32): REAL_32 is
 		-- jnf (node at line 268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jnf"
		}"
		end

	jnl (an_argument_l281_c7: INTEGER_32; an_argument_l282_c7: REAL_128): REAL_128 is
 		-- jnl (node at line 280)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jnl"
		}"
		end

	-- `hidden' function __sincosf skipped.
	-- `hidden' function __acosf skipped.
	-- `hidden' function __acosh skipped.
	-- `hidden' function __acosl skipped.
	scalbf (a_x: REAL_32; a_n: REAL_32): REAL_32 is
 		-- scalbf (node at line 301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalbf"
		}"
		end

	scalbl (a_x: REAL_128; a_n: REAL_128): REAL_128 is
 		-- scalbl (node at line 305)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalbl"
		}"
		end

	scalbn (a_x: REAL_64; a_n: INTEGER_32): REAL_64 is
 		-- scalbn (node at line 309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalbn"
		}"
		end

	ilogbf (a_x: REAL_32): INTEGER_32 is
 		-- ilogbf (node at line 322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ilogbf"
		}"
		end

	ilogbl (a_x: REAL_128): INTEGER_32 is
 		-- ilogbl (node at line 327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ilogbl"
		}"
		end

	-- `hidden' function __sincosl skipped.
	tgammaf (an_argument_l341_c7: REAL_32): REAL_32 is
 		-- tgammaf (node at line 340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tgammaf"
		}"
		end

	tgammal (an_argument_l345_c7: REAL_128): REAL_128 is
 		-- tgammal (node at line 344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tgammal"
		}"
		end

	-- `hidden' function __sinh skipped.
	-- `hidden' function __sinl skipped.
	expm1 (a_x: REAL_64): REAL_64 is
 		-- expm1 (node at line 357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "expm1"
		}"
		end

	-- `hidden' function __log10 skipped.
	-- `hidden' function __expm1l skipped.
	-- `hidden' function __isnanf skipped.
	-- `hidden' function __llround skipped.
	-- `hidden' function __gammaf skipped.
	-- `hidden' function __log1p skipped.
	-- `hidden' function __log2f skipped.
	ldexpf (a_x: REAL_32; an_exponent: INTEGER_32): REAL_32 is
 		-- ldexpf (node at line 401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldexpf"
		}"
		end

	ldexpl (a_x: REAL_128; an_exponent: INTEGER_32): REAL_128 is
 		-- ldexpl (node at line 405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldexpl"
		}"
		end

	-- `hidden' function __nanf skipped.
	-- `hidden' function __nanl skipped.
	-- `hidden' function __scalbnl skipped.
	powf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- powf (node at line 468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "powf"
		}"
		end

	powl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- powl (node at line 472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "powl"
		}"
		end

	-- `hidden' function __asinf skipped.
	-- `hidden' function __asinh skipped.
	-- `hidden' function __asinl skipped.
	-- `hidden' function __hypotf skipped.
	-- `hidden' function __hypotl skipped.
	-- `hidden' function __sincos skipped.
	-- `hidden' function __hypot skipped.
	-- `hidden' function __atanhf skipped.
	-- `hidden' function __atanhl skipped.
	-- `hidden' function __fmaxf skipped.
	sinhf (a_x: REAL_32): REAL_32 is
 		-- sinhf (node at line 544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sinhf"
		}"
		end

	sinhl (a_x: REAL_128): REAL_128 is
 		-- sinhl (node at line 547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sinhl"
		}"
		end

	sqrtf (a_x: REAL_32): REAL_32 is
 		-- sqrtf (node at line 555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sqrtf"
		}"
		end

	sqrtl (a_x: REAL_128): REAL_128 is
 		-- sqrtl (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sqrtl"
		}"
		end

	-- `hidden' function __lgamma skipped.
	rint (a_x: REAL_64): REAL_64 is
 		-- rint (node at line 635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rint"
		}"
		end

	-- `hidden' function __drem skipped.
	cos (a_x: REAL_64): REAL_64 is
 		-- cos (node at line 649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cos"
		}"
		end

	lgammaf (an_argument_l672_c7: REAL_32): REAL_32 is
 		-- lgammaf (node at line 671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lgammaf"
		}"
		end

	lgammal (an_argument_l675_c7: REAL_128): REAL_128 is
 		-- lgammal (node at line 674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lgammal"
		}"
		end

	erfcf (an_argument_l678_c7: REAL_32): REAL_32 is
 		-- erfcf (node at line 677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erfcf"
		}"
		end

	erfcl (an_argument_l681_c7: REAL_128): REAL_128 is
 		-- erfcl (node at line 680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erfcl"
		}"
		end

	exp10f (a_x: REAL_32): REAL_32 is
 		-- exp10f (node at line 689)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp10f"
		}"
		end

	exp10l (a_x: REAL_128): REAL_128 is
 		-- exp10l (node at line 692)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp10l"
		}"
		end

	fminf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- fminf (node at line 701)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fminf"
		}"
		end

	fminl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- fminl (node at line 705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fminl"
		}"
		end

	-- `hidden' function __pow10 skipped.
	ynf (an_argument_l723_c7: INTEGER_32; an_argument_l724_c7: REAL_32): REAL_32 is
 		-- ynf (node at line 722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ynf"
		}"
		end

	ynl (an_argument_l732_c7: INTEGER_32; an_argument_l733_c7: REAL_128): REAL_128 is
 		-- ynl (node at line 731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ynl"
		}"
		end

	-- `hidden' function __log skipped.
	-- `hidden' function __log2 skipped.
	nearbyintf (a_x: REAL_32): REAL_32 is
 		-- nearbyintf (node at line 795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nearbyintf"
		}"
		end

	nearbyintl (a_x: REAL_128): REAL_128 is
 		-- nearbyintl (node at line 798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nearbyintl"
		}"
		end

	-- `hidden' function __exp2 skipped.
	-- `hidden' function __logb skipped.
	-- `hidden' function __expf skipped.
	-- `hidden' function __expl skipped.
	tanhf (a_x: REAL_32): REAL_32 is
 		-- tanhf (node at line 827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tanhf"
		}"
		end

	tanhl (a_x: REAL_128): REAL_128 is
 		-- tanhl (node at line 831)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tanhl"
		}"
		end

	-- `hidden' function __nextafter skipped.
	ilogb (a_x: REAL_64): INTEGER_32 is
 		-- ilogb (node at line 842)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ilogb"
		}"
		end

	-- `hidden' function __fmodf skipped.
	-- `hidden' function __fmodl skipped.
	trunc (a_x: REAL_64): REAL_64 is
 		-- trunc (node at line 877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "trunc"
		}"
		end

	-- `hidden' function __llrintf skipped.
	-- `hidden' function __llrintl skipped.
	-- `hidden' function __logbl skipped.
	hypot (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- hypot (node at line 938)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hypot"
		}"
		end

	-- `hidden' function __truncf skipped.
	-- `hidden' function __truncl skipped.
	-- `hidden' function __lroundf skipped.
	-- `hidden' function __lroundl skipped.
	-- `hidden' function __round skipped.
	-- `hidden' function __tanf skipped.
	-- `hidden' function __tanh skipped.
	-- `hidden' function __tanl skipped.
	-- `hidden' function __lrintl skipped.
	-- `hidden' function __ceil skipped.
	logl (a_x: REAL_128): REAL_128 is
 		-- logl (node at line 1011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "logl"
		}"
		end

	rintf (a_x: REAL_32): REAL_32 is
 		-- rintf (node at line 1014)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rintf"
		}"
		end

	rintl (a_x: REAL_128): REAL_128 is
 		-- rintl (node at line 1017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rintl"
		}"
		end

	-- `hidden' function __coshf skipped.
	-- `hidden' function __jnl skipped.
	llroundf (a_x: REAL_32): INTEGER_64 is
 		-- llroundf (node at line 1027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llroundf"
		}"
		end

	-- `hidden' function __significandf skipped.
	llroundl (a_x: REAL_128): INTEGER_64 is
 		-- llroundl (node at line 1033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llroundl"
		}"
		end

	finite (a_value: REAL_64): INTEGER_32 is
 		-- finite (node at line 1041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "finite"
		}"
		end

	acoshf (a_x: REAL_32): REAL_32 is
 		-- acoshf (node at line 1050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acoshf"
		}"
		end

	acoshl (a_x: REAL_128): REAL_128 is
 		-- acoshl (node at line 1053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acoshl"
		}"
		end

	-- `hidden' function __roundl skipped.
	-- `hidden' function __exp10 skipped.
	-- `hidden' function __atan2 skipped.
	-- `hidden' function __atanh skipped.
	-- `hidden' function __exp2f skipped.
	-- `hidden' function __atanl skipped.
	-- `hidden' function __exp2l skipped.
	-- `hidden' function __lround skipped.
	log10f (a_x: REAL_32): REAL_32 is
 		-- log10f (node at line 1114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log10f"
		}"
		end

	log10l (a_x: REAL_128): REAL_128 is
 		-- log10l (node at line 1117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log10l"
		}"
		end

	-- `hidden' function __logbf skipped.
	-- `hidden' function __sqrt skipped.
	round (a_x: REAL_64): REAL_64 is
 		-- round (node at line 1142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "round"
		}"
		end

	-- `hidden' function __erfl skipped.
	llrintf (a_x: REAL_32): INTEGER_64 is
 		-- llrintf (node at line 1203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llrintf"
		}"
		end

	llrintl (a_x: REAL_128): INTEGER_64 is
 		-- llrintl (node at line 1206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llrintl"
		}"
		end

	remainder (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- remainder (node at line 1230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remainder"
		}"
		end

	-- `hidden' function __frexp skipped.
	remainderf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- remainderf (node at line 1255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remainderf"
		}"
		end

	remainderl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- remainderl (node at line 1263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remainderl"
		}"
		end

	-- `hidden' function __gamma skipped.
	lroundf (a_x: REAL_32): INTEGER_64 is
 		-- lroundf (node at line 1285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lroundf"
		}"
		end

	lroundl (a_x: REAL_128): INTEGER_64 is
 		-- lroundl (node at line 1288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lroundl"
		}"
		end

	isinff (a_value: REAL_32): INTEGER_32 is
 		-- isinff (node at line 1301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isinff"
		}"
		end

	isinfl (a_value: REAL_128): INTEGER_32 is
 		-- isinfl (node at line 1304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isinfl"
		}"
		end

	-- `hidden' function __llroundl skipped.
	llround (a_x: REAL_64): INTEGER_64 is
 		-- llround (node at line 1322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "llround"
		}"
		end

	-- `hidden' function __asin skipped.
	lgammaf_r (an_argument_l1350_c7: REAL_32; a_signgamp: POINTER): REAL_32 is
 		-- lgammaf_r (node at line 1349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lgammaf_r"
		}"
		end

	copysign (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- copysign (node at line 1356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "copysign"
		}"
		end

	-- `hidden' function __nearbyintf skipped.
	-- `hidden' function __nearbyintl skipped.
	pow10f (a_x: REAL_32): REAL_32 is
 		-- pow10f (node at line 1383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pow10f"
		}"
		end

	pow10l (a_x: REAL_128): REAL_128 is
 		-- pow10l (node at line 1386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pow10l"
		}"
		end

	-- `hidden' function __significand skipped.
	-- `hidden' function __cbrtf skipped.
	-- `hidden' function __fdimf skipped.
	-- `hidden' function __cbrtl skipped.
	-- `hidden' function __fdiml skipped.
	-- `hidden' function __sinhf skipped.
	-- `hidden' function __ceill skipped.
	-- `hidden' function __sin skipped.
	-- `hidden' function __modff skipped.
	-- `hidden' function __modfl skipped.
	lgamma (an_argument_l1486_c7: REAL_64): REAL_64 is
 		-- lgamma (node at line 1485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lgamma"
		}"
		end

	isnan (a_value: REAL_64): INTEGER_32 is
 		-- isnan (node at line 1489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isnan"
		}"
		end

	-- `hidden' function __fabsf skipped.
	-- `hidden' function __fabsl skipped.
	-- `hidden' function __atan2f skipped.
	atan2f (a_y: REAL_32; a_x: REAL_32): REAL_32 is
 		-- atan2f (node at line 1547)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atan2f"
		}"
		end

	atan2l (a_y: REAL_128; a_x: REAL_128): REAL_128 is
 		-- atan2l (node at line 1551)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atan2l"
		}"
		end

	acos (a_x: REAL_64): REAL_64 is
 		-- acos (node at line 1558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acos"
		}"
		end

	-- `hidden' function __dremf skipped.
	-- `hidden' function __dreml skipped.
	scalb (a_x: REAL_64; a_n: REAL_64): REAL_64 is
 		-- scalb (node at line 1588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalb"
		}"
		end

	cosf (a_x: REAL_32): REAL_32 is
 		-- cosf (node at line 1625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cosf"
		}"
		end

	cosh (a_x: REAL_64): REAL_64 is
 		-- cosh (node at line 1628)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cosh"
		}"
		end

	cosl (a_x: REAL_128): REAL_128 is
 		-- cosl (node at line 1631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cosl"
		}"
		end

	-- `hidden' function __fmaxl skipped.
	floor (a_x: REAL_64): REAL_64 is
 		-- floor (node at line 1641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "floor"
		}"
		end

	ldexp (a_x: REAL_64; an_exponent: INTEGER_32): REAL_64 is
 		-- ldexp (node at line 1648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ldexp"
		}"
		end

	-- `hidden' function __llroundf skipped.
	-- `hidden' function __cbrt skipped.
	copysignf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- copysignf (node at line 1684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "copysignf"
		}"
		end

	copysignl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- copysignl (node at line 1688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "copysignl"
		}"
		end

	fdim (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- fdim (node at line 1698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdim"
		}"
		end

	-- `hidden' function __copysign skipped.
	modff (a_x: REAL_32; an_iptr: POINTER): REAL_32 is
 		-- modff (node at line 1711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "modff"
		}"
		end

	-- `hidden' function __fmaf skipped.
	-- `hidden' function __nearbyint skipped.
	-- `hidden' function __fmal skipped.
	frexpf (a_x: REAL_32; an_exponent: POINTER): REAL_32 is
 		-- frexpf (node at line 1728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "frexpf"
		}"
		end

	frexpl (a_x: REAL_128; an_exponent: POINTER): REAL_128 is
 		-- frexpl (node at line 1733)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "frexpl"
		}"
		end

	-- `hidden' function __signbitl skipped.
	nexttowardf (a_x: REAL_32; a_y: REAL_128): REAL_32 is
 		-- nexttowardf (node at line 1794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nexttowardf"
		}"
		end

	nexttowardl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- nexttowardl (node at line 1798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nexttowardl"
		}"
		end

	-- `hidden' function __sinf skipped.
	sinf (a_x: REAL_32): REAL_32 is
 		-- sinf (node at line 1833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sinf"
		}"
		end

	sinh (a_x: REAL_64): REAL_64 is
 		-- sinh (node at line 1836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sinh"
		}"
		end

	sinl (a_x: REAL_128): REAL_128 is
 		-- sinl (node at line 1839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sinl"
		}"
		end

	-- `hidden' function __llrint skipped.
	sin (a_x: REAL_64): REAL_64 is
 		-- sin (node at line 1866)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sin"
		}"
		end

	-- `hidden' function __erfc skipped.
	-- `hidden' function __fmin skipped.
	-- `hidden' function __erff skipped.
	-- `hidden' function __floorf skipped.
	lrint (a_x: REAL_64): INTEGER_64 is
 		-- lrint (node at line 1907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrint"
		}"
		end

	tgamma (an_argument_l1916_c7: REAL_64): REAL_64 is
 		-- tgamma (node at line 1915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tgamma"
		}"
		end

	-- `hidden' function __expm1 skipped.
	ceilf (a_x: REAL_32): REAL_32 is
 		-- ceilf (node at line 1927)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ceilf"
		}"
		end

	ceill (a_x: REAL_128): REAL_128 is
 		-- ceill (node at line 1930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ceill"
		}"
		end

	-- `hidden' function __signbitf skipped.
	-- `hidden' function __lgammal_r skipped.
	-- `hidden' function __remainderl skipped.
	-- `hidden' function __lrintf skipped.
	nanf (a_tagb: POINTER): REAL_32 is
 		-- nanf (node at line 1963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nanf"
		}"
		end

	nanl (a_tagb: POINTER): REAL_128 is
 		-- nanl (node at line 1966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nanl"
		}"
		end

	-- `hidden' function __fmod skipped.
	-- `hidden' function __modf skipped.
	-- `hidden' function __scalbf skipped.
	-- `hidden' function __scalbl skipped.
	-- `hidden' function __scalbn skipped.
	log1pf (a_x: REAL_32): REAL_32 is
 		-- log1pf (node at line 2027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log1pf"
		}"
		end

	-- `hidden' function __ilogbf skipped.
	log1pl (a_x: REAL_128): REAL_128 is
 		-- log1pl (node at line 2033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log1pl"
		}"
		end

	-- `hidden' function __jnf skipped.
	-- `hidden' function __ilogbl skipped.
	-- `hidden' function __expm1f skipped.
	remquo (a_x: REAL_64; a_y: REAL_64; a_quo: POINTER): REAL_64 is
 		-- remquo (node at line 2074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remquo"
		}"
		end

	-- `hidden' function __remainderf skipped.
	-- `hidden' function __ldexpf skipped.
	-- `hidden' function __ldexpl skipped.
	-- `hidden' function __isnanl skipped.
	-- `hidden' function __sinhl skipped.
	-- `hidden' function __sqrtf skipped.
	-- `hidden' function __sqrtl skipped.
	drem (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- drem (node at line 2150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "drem"
		}"
		end

	-- `hidden' function __nexttowardl skipped.
	yn (an_argument_l2166_c7: INTEGER_32; an_argument_l2167_c7: REAL_64): REAL_64 is
 		-- yn (node at line 2165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "yn"
		}"
		end

	asinhf (a_x: REAL_32): REAL_32 is
 		-- asinhf (node at line 2169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asinhf"
		}"
		end

	asinhl (a_x: REAL_128): REAL_128 is
 		-- asinhl (node at line 2180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asinhl"
		}"
		end

	-- `hidden' function __gammal skipped.
	-- `hidden' function __fpclassifyf skipped.
	-- `hidden' function __fpclassifyl skipped.
	-- `hidden' function __erfcl skipped.
	-- `hidden' function __remquol skipped.
	-- `hidden' function __pow skipped.
	-- `hidden' function __j0 skipped.
	-- `hidden' function __j1 skipped.
	expm1f (a_x: REAL_32): REAL_32 is
 		-- expm1f (node at line 2251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "expm1f"
		}"
		end

	expm1l (a_x: REAL_128): REAL_128 is
 		-- expm1l (node at line 2254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "expm1l"
		}"
		end

	isnanf (a_value: REAL_32): INTEGER_32 is
 		-- isnanf (node at line 2257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isnanf"
		}"
		end

	isnanl (a_value: REAL_128): INTEGER_32 is
 		-- isnanl (node at line 2260)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isnanl"
		}"
		end

	-- `hidden' function __jn skipped.
	gammaf (an_argument_l2269_c7: REAL_32): REAL_32 is
 		-- gammaf (node at line 2268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gammaf"
		}"
		end

	gammal (an_argument_l2273_c7: REAL_128): REAL_128 is
 		-- gammal (node at line 2272)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gammal"
		}"
		end

	-- `hidden' function __fabs skipped.
	-- `hidden' function __atan skipped.
	-- `hidden' function __signbit skipped.
	log (a_x: REAL_64): REAL_64 is
 		-- log (node at line 2304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log"
		}"
		end

	log2 (a_x: REAL_64): REAL_64 is
 		-- log2 (node at line 2307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log2"
		}"
		end

	exp2 (a_x: REAL_64): REAL_64 is
 		-- exp2 (node at line 2310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp2"
		}"
		end

	logb (a_x: REAL_64): REAL_64 is
 		-- logb (node at line 2313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "logb"
		}"
		end

	logf (a_x: REAL_32): REAL_32 is
 		-- logf (node at line 2316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "logf"
		}"
		end

	fabs (a_x: REAL_64): REAL_64 is
 		-- fabs (node at line 2322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fabs"
		}"
		end

	expf (a_x: REAL_32): REAL_32 is
 		-- expf (node at line 2325)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "expf"
		}"
		end

	expl (a_x: REAL_128): REAL_128 is
 		-- expl (node at line 2328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "expl"
		}"
		end

	-- `hidden' function __exp skipped.
	acosf (a_x: REAL_32): REAL_32 is
 		-- acosf (node at line 2346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acosf"
		}"
		end

	acosh (a_x: REAL_64): REAL_64 is
 		-- acosh (node at line 2349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acosh"
		}"
		end

	acosl (a_x: REAL_128): REAL_128 is
 		-- acosl (node at line 2357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acosl"
		}"
		end

	-- `hidden' function __isinf skipped.
	-- `hidden' function __exp10f skipped.
	-- `hidden' function __exp10l skipped.
	-- `hidden' function __tan skipped.
	log10 (a_x: REAL_64): REAL_64 is
 		-- log10 (node at line 2389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log10"
		}"
		end

	-- `hidden' function __tanhf skipped.
	-- `hidden' function __tanhl skipped.
	hypotf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- hypotf (node at line 2408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hypotf"
		}"
		end

	hypotl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- hypotl (node at line 2412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "hypotl"
		}"
		end

	log1p (a_x: REAL_64): REAL_64 is
 		-- log1p (node at line 2416)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log1p"
		}"
		end

	-- `hidden' function __ilogb skipped.
	log2l (a_x: REAL_128): REAL_128 is
 		-- log2l (node at line 2436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log2l"
		}"
		end

	atanhf (a_x: REAL_32): REAL_32 is
 		-- atanhf (node at line 2448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atanhf"
		}"
		end

	atanhl (a_x: REAL_128): REAL_128 is
 		-- atanhl (node at line 2451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atanhl"
		}"
		end

	-- `hidden' function __finitel skipped.
	-- `hidden' function __trunc skipped.
	-- `hidden' function __y0 skipped.
	-- `hidden' function __y1 skipped.
	-- `hidden' function __tgamma skipped.
	-- `hidden' function __yn skipped.
	tanf (a_x: REAL_32): REAL_32 is
 		-- tanf (node at line 2491)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tanf"
		}"
		end

	tanh (a_x: REAL_64): REAL_64 is
 		-- tanh (node at line 2497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tanh"
		}"
		end

	tanl (a_x: REAL_128): REAL_128 is
 		-- tanl (node at line 2500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tanl"
		}"
		end

	ceil (a_x: REAL_64): REAL_64 is
 		-- ceil (node at line 2517)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ceil"
		}"
		end

	asinf (a_x: REAL_32): REAL_32 is
 		-- asinf (node at line 2526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asinf"
		}"
		end

	asinh (a_x: REAL_64): REAL_64 is
 		-- asinh (node at line 2530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asinh"
		}"
		end

	asinl (a_x: REAL_128): REAL_128 is
 		-- asinl (node at line 2533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asinl"
		}"
		end

	-- `hidden' function __powf skipped.
	-- `hidden' function __powl skipped.
	-- `hidden' function __log2l skipped.
	nextafter (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- nextafter (node at line 2567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nextafter"
		}"
		end

	-- `hidden' function __rintf skipped.
	-- `hidden' function __rintl skipped.
	-- `hidden' function __j0f skipped.
	-- `hidden' function __j0l skipped.
	-- `hidden' function __coshl skipped.
	remquof (a_x: REAL_32; a_y: REAL_32; a_quo: POINTER): REAL_32 is
 		-- remquof (node at line 2607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remquof"
		}"
		end

	remquol (a_x: REAL_128; a_y: REAL_128; a_quo: POINTER): REAL_128 is
 		-- remquol (node at line 2612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remquol"
		}"
		end

	-- `hidden' function __j1f skipped.
	-- `hidden' function __j1l skipped.
	isinf (a_value: REAL_64): INTEGER_32 is
 		-- isinf (node at line 2629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isinf"
		}"
		end

	erf (an_argument_l2638_c7: REAL_64): REAL_64 is
 		-- erf (node at line 2637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erf"
		}"
		end

	nextafterf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- nextafterf (node at line 2643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nextafterf"
		}"
		end

	nextafterl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- nextafterl (node at line 2647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nextafterl"
		}"
		end

	pow (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- pow (node at line 2651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pow"
		}"
		end

	sqrt (a_x: REAL_64): REAL_64 is
 		-- sqrt (node at line 2655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sqrt"
		}"
		end

	-- `hidden' function __significandl skipped.
	-- `hidden' function __rint skipped.
	-- `hidden' function __fmax skipped.
	lgamma_r (an_argument_l2694_c7: REAL_64; a_signgamp: POINTER): REAL_64 is
 		-- lgamma_r (node at line 2693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lgamma_r"
		}"
		end

	pow10 (a_x: REAL_64): REAL_64 is
 		-- pow10 (node at line 2705)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pow10"
		}"
		end

	exp (a_x: REAL_64): REAL_64 is
 		-- exp (node at line 2713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp"
		}"
		end

	-- `hidden' function __finite skipped.
	-- `hidden' function __acoshf skipped.
	-- `hidden' function __acoshl skipped.
	tan (a_x: REAL_64): REAL_64 is
 		-- tan (node at line 2748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tan"
		}"
		end

	-- `hidden' function __log10f skipped.
	-- `hidden' function __log10l skipped.
	significandf (a_x: REAL_32): REAL_32 is
 		-- significandf (node at line 2776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "significandf"
		}"
		end

	truncf (a_x: REAL_32): REAL_32 is
 		-- truncf (node at line 2779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "truncf"
		}"
		end

	significandl (a_x: REAL_128): REAL_128 is
 		-- significandl (node at line 2782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "significandl"
		}"
		end

	truncl (a_x: REAL_128): REAL_128 is
 		-- truncl (node at line 2785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "truncl"
		}"
		end

	log2f (a_x: REAL_32): REAL_32 is
 		-- log2f (node at line 2792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "log2f"
		}"
		end

	fmodf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- fmodf (node at line 2804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmodf"
		}"
		end

	fmodl (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- fmodl (node at line 2816)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmodl"
		}"
		end

	lrintf (a_x: REAL_32): INTEGER_64 is
 		-- lrintf (node at line 2820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrintf"
		}"
		end

	lrintl (a_x: REAL_128): INTEGER_64 is
 		-- lrintl (node at line 2823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lrintl"
		}"
		end

	-- `hidden' function __floorl skipped.
	-- `hidden' function __scalbnf skipped.
	roundf (a_x: REAL_32): REAL_32 is
 		-- roundf (node at line 2884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "roundf"
		}"
		end

	roundl (a_x: REAL_128): REAL_128 is
 		-- roundl (node at line 2887)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "roundl"
		}"
		end

	-- `hidden' function __frexpf skipped.
	asin (a_x: REAL_64): REAL_64 is
 		-- asin (node at line 2913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asin"
		}"
		end

	lround (a_x: REAL_64): INTEGER_64 is
 		-- lround (node at line 2947)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lround"
		}"
		end

	-- `hidden' function __y0f skipped.
	-- `hidden' function __y0l skipped.
	j0f (an_argument_l2966_c7: REAL_32): REAL_32 is
 		-- j0f (node at line 2965)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "j0f"
		}"
		end

	j0l (an_argument_l2969_c7: REAL_128): REAL_128 is
 		-- j0l (node at line 2968)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "j0l"
		}"
		end

	-- `hidden' function __y1f skipped.
	-- `hidden' function __y1l skipped.
	j1f (an_argument_l2992_c7: REAL_32): REAL_32 is
 		-- j1f (node at line 2991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "j1f"
		}"
		end

	j1l (an_argument_l2995_c7: REAL_128): REAL_128 is
 		-- j1l (node at line 2994)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "j1l"
		}"
		end

	coshf (a_x: REAL_32): REAL_32 is
 		-- coshf (node at line 2997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "coshf"
		}"
		end

	coshl (a_x: REAL_128): REAL_128 is
 		-- coshl (node at line 3000)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "coshl"
		}"
		end

	-- `hidden' function __isinff skipped.
	-- `hidden' function __isinfl skipped.
	exp10 (a_x: REAL_64): REAL_64 is
 		-- exp10 (node at line 3032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp10"
		}"
		end

	atan2 (a_y: REAL_64; a_x: REAL_64): REAL_64 is
 		-- atan2 (node at line 3045)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atan2"
		}"
		end

	-- `hidden' function __remainder skipped.
	atanf (a_x: REAL_32): REAL_32 is
 		-- atanf (node at line 3063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atanf"
		}"
		end

	atanh (a_x: REAL_64): REAL_64 is
 		-- atanh (node at line 3066)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atanh"
		}"
		end

	exp2f (a_x: REAL_32): REAL_32 is
 		-- exp2f (node at line 3069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp2f"
		}"
		end

	atanl (a_x: REAL_128): REAL_128 is
 		-- atanl (node at line 3072)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "atanl"
		}"
		end

	exp2l (a_x: REAL_128): REAL_128 is
 		-- exp2l (node at line 3075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "exp2l"
		}"
		end

	logbf (a_x: REAL_32): REAL_32 is
 		-- logbf (node at line 3083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "logbf"
		}"
		end

	logbl (a_x: REAL_128): REAL_128 is
 		-- logbl (node at line 3086)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "logbl"
		}"
		end

	-- `hidden' function __isnan skipped.
	scalblnf (a_x: REAL_32; a_n: INTEGER_64): REAL_32 is
 		-- scalblnf (node at line 3098)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalblnf"
		}"
		end

	scalblnl (a_x: REAL_128; a_n: INTEGER_64): REAL_128 is
 		-- scalblnl (node at line 3102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalblnl"
		}"
		end

	-- `hidden' function __fma skipped.
	-- `hidden' function __fpclassify skipped.
	significand (a_x: REAL_64): REAL_64 is
 		-- significand (node at line 3139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "significand"
		}"
		end

	sincos (a_x: REAL_64; a_sinx: POINTER; a_cosx: POINTER) is
 		-- sincos (node at line 3142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sincos"
		}"
		end

	-- `hidden' function __pow10f skipped.
	-- `hidden' function __pow10l skipped.
	-- `hidden' function __finitef skipped.
	-- `hidden' function __erfcf skipped.
	nexttoward (a_x: REAL_64; a_y: REAL_128): REAL_64 is
 		-- nexttoward (node at line 3170)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nexttoward"
		}"
		end

	scalbln (a_x: REAL_64; a_n: INTEGER_64): REAL_64 is
 		-- scalbln (node at line 3186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalbln"
		}"
		end

	sincosf (a_x: REAL_32; a_sinx: POINTER; a_cosx: POINTER) is
 		-- sincosf (node at line 3206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sincosf"
		}"
		end

	sincosl (a_x: REAL_128; a_sinx: POINTER; a_cosx: POINTER) is
 		-- sincosl (node at line 3211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sincosl"
		}"
		end

	-- `hidden' function __lgammaf_r skipped.
	-- `hidden' function __remquof skipped.
	scalbnf (a_x: REAL_32; a_n: INTEGER_32): REAL_32 is
 		-- scalbnf (node at line 3225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalbnf"
		}"
		end

	scalbnl (a_x: REAL_128; a_n: INTEGER_32): REAL_128 is
 		-- scalbnl (node at line 3229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scalbnl"
		}"
		end

	-- `hidden' function __scalb skipped.
	-- `hidden' function __erf skipped.
	cbrt (a_x: REAL_64): REAL_64 is
 		-- cbrt (node at line 3255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cbrt"
		}"
		end

	frexp (a_x: REAL_64; an_exponent: POINTER): REAL_64 is
 		-- frexp (node at line 3282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "frexp"
		}"
		end

	-- `hidden' function __floor skipped.
	-- `hidden' function __nextafterf skipped.
	-- `hidden' function __nextafterl skipped.
	-- `hidden' function __roundf skipped.
	-- `hidden' function __ldexp skipped.
	gamma (an_argument_l3310_c7: REAL_64): REAL_64 is
 		-- gamma (node at line 3309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gamma"
		}"
		end

	fmaf (a_x: REAL_32; a_y: REAL_32; a_z: REAL_32): REAL_32 is
 		-- fmaf (node at line 3322)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmaf"
		}"
		end

	fmal (a_x: REAL_128; a_y: REAL_128; a_z: REAL_128): REAL_128 is
 		-- fmal (node at line 3327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmal"
		}"
		end

	fmax (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- fmax (node at line 3332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmax"
		}"
		end

	-- `hidden' function __atan2l skipped.
	y0f (an_argument_l3391_c7: REAL_32): REAL_32 is
 		-- y0f (node at line 3390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "y0f"
		}"
		end

	y0l (an_argument_l3394_c7: REAL_128): REAL_128 is
 		-- y0l (node at line 3393)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "y0l"
		}"
		end

	y1f (an_argument_l3407_c7: REAL_32): REAL_32 is
 		-- y1f (node at line 3406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "y1f"
		}"
		end

	y1l (an_argument_l3410_c7: REAL_128): REAL_128 is
 		-- y1l (node at line 3409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "y1l"
		}"
		end

	erfc (an_argument_l3447_c7: REAL_64): REAL_64 is
 		-- erfc (node at line 3446)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erfc"
		}"
		end

	fmin (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- fmin (node at line 3449)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmin"
		}"
		end

	erff (an_argument_l3454_c7: REAL_32): REAL_32 is
 		-- erff (node at line 3453)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erff"
		}"
		end

	erfl (an_argument_l3457_c7: REAL_128): REAL_128 is
 		-- erfl (node at line 3456)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "erfl"
		}"
		end

	-- `hidden' function __scalblnf skipped.
	-- `hidden' function __scalblnl skipped.
	cbrtf (a_x: REAL_32): REAL_32 is
 		-- cbrtf (node at line 3468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cbrtf"
		}"
		end

	fdimf (a_x: REAL_32; a_y: REAL_32): REAL_32 is
 		-- fdimf (node at line 3471)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdimf"
		}"
		end

	cbrtl (a_x: REAL_128): REAL_128 is
 		-- cbrtl (node at line 3475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cbrtl"
		}"
		end

	fdiml (a_x: REAL_128; a_y: REAL_128): REAL_128 is
 		-- fdiml (node at line 3478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdiml"
		}"
		end

	-- `hidden' function __lrint skipped.
	-- `hidden' function __logf skipped.
	-- `hidden' function __frexpl skipped.
	-- `hidden' function __ceilf skipped.
	-- `hidden' function __scalbln skipped.
	fmod (a_x: REAL_64; a_y: REAL_64): REAL_64 is
 		-- fmod (node at line 3535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmod"
		}"
		end

	j0 (an_argument_l3540_c7: REAL_64): REAL_64 is
 		-- j0 (node at line 3539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "j0"
		}"
		end

	j1 (an_argument_l3543_c7: REAL_64): REAL_64 is
 		-- j1 (node at line 3542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "j1"
		}"
		end

	fma (a_x: REAL_64; a_y: REAL_64; a_z: REAL_64): REAL_64 is
 		-- fma (node at line 3545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fma"
		}"
		end

	modf (a_x: REAL_64; an_iptr: POINTER): REAL_64 is
 		-- modf (node at line 3550)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "modf"
		}"
		end

	jn (an_argument_l3555_c7: INTEGER_32; an_argument_l3556_c7: REAL_64): REAL_64 is
 		-- jn (node at line 3554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "jn"
		}"
		end

	-- `hidden' function __lgamma_r skipped.
	modfl (a_x: REAL_128; an_iptr: POINTER): REAL_128 is
 		-- modfl (node at line 3562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "modfl"
		}"
		end

	finitef (a_value: REAL_32): INTEGER_32 is
 		-- finitef (node at line 3569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "finitef"
		}"
		end

	finitel (a_value: REAL_128): INTEGER_32 is
 		-- finitel (node at line 3572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "finitel"
		}"
		end

	nearbyint (a_x: REAL_64): REAL_64 is
 		-- nearbyint (node at line 3575)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nearbyint"
		}"
		end

	-- `hidden' function __logl skipped.
	-- `hidden' function __tgammaf skipped.
	-- `hidden' function __tgammal skipped.
	-- `hidden' function __copysignf skipped.
	-- `hidden' function __copysignl skipped.
	fabsf (a_x: REAL_32): REAL_32 is
 		-- fabsf (node at line 3633)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fabsf"
		}"
		end

	fabsl (a_x: REAL_128): REAL_128 is
 		-- fabsl (node at line 3636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fabsl"
		}"
		end


end -- class MATHCALLSEXTERNALS
