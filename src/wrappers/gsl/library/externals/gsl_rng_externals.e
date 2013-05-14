-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_RNG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_rng_alloc (a_t: POINTER): POINTER is
 		-- gsl_rng_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_alloc"
		}"
		end

	gsl_rng_borosh13: POINTER is
 		-- gsl_rng_borosh13
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_borosh13"
		}"
		end

	address_of_gsl_rng_borosh13: POINTER is
 		-- Address of gsl_rng_borosh13
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_borosh13"
		}"
		end

	set_gsl_rng_borosh13 (a_value: POINTER) is
		-- Set variable gsl_rng_borosh13 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_borosh13"
		}"
		end

	gsl_rng_clone (a_r: POINTER): POINTER is
 		-- gsl_rng_clone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_clone"
		}"
		end

	gsl_rng_cmrg: POINTER is
 		-- gsl_rng_cmrg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_cmrg"
		}"
		end

	address_of_gsl_rng_cmrg: POINTER is
 		-- Address of gsl_rng_cmrg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_cmrg"
		}"
		end

	set_gsl_rng_cmrg (a_value: POINTER) is
		-- Set variable gsl_rng_cmrg value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_cmrg"
		}"
		end

	gsl_rng_coveyou: POINTER is
 		-- gsl_rng_coveyou
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_coveyou"
		}"
		end

	address_of_gsl_rng_coveyou: POINTER is
 		-- Address of gsl_rng_coveyou
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_coveyou"
		}"
		end

	set_gsl_rng_coveyou (a_value: POINTER) is
		-- Set variable gsl_rng_coveyou value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_coveyou"
		}"
		end

	gsl_rng_default: POINTER is
 		-- gsl_rng_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_default"
		}"
		end

	address_of_gsl_rng_default: POINTER is
 		-- Address of gsl_rng_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_default"
		}"
		end

	set_gsl_rng_default (a_value: POINTER) is
		-- Set variable gsl_rng_default value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_default"
		}"
		end

	gsl_rng_default_seed: like long_unsigned is
 		-- gsl_rng_default_seed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_default_seed"
		}"
		end

	address_of_gsl_rng_default_seed: POINTER is
 		-- Address of gsl_rng_default_seed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_default_seed"
		}"
		end

	set_gsl_rng_default_seed (a_value: like long_unsigned) is
		-- Set variable gsl_rng_default_seed value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_default_seed"
		}"
		end

	gsl_rng_env_setup: POINTER is
 		-- gsl_rng_env_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_env_setup()"
		}"
		end

	gsl_rng_fishman18: POINTER is
 		-- gsl_rng_fishman18
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_fishman18"
		}"
		end

	address_of_gsl_rng_fishman18: POINTER is
 		-- Address of gsl_rng_fishman18
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_fishman18"
		}"
		end

	set_gsl_rng_fishman18 (a_value: POINTER) is
		-- Set variable gsl_rng_fishman18 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_fishman18"
		}"
		end

	gsl_rng_fishman20: POINTER is
 		-- gsl_rng_fishman20
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_fishman20"
		}"
		end

	address_of_gsl_rng_fishman20: POINTER is
 		-- Address of gsl_rng_fishman20
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_fishman20"
		}"
		end

	set_gsl_rng_fishman20 (a_value: POINTER) is
		-- Set variable gsl_rng_fishman20 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_fishman20"
		}"
		end

	gsl_rng_fishman2x: POINTER is
 		-- gsl_rng_fishman2x
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_fishman2x"
		}"
		end

	address_of_gsl_rng_fishman2x: POINTER is
 		-- Address of gsl_rng_fishman2x
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_fishman2x"
		}"
		end

	set_gsl_rng_fishman2x (a_value: POINTER) is
		-- Set variable gsl_rng_fishman2x value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_fishman2x"
		}"
		end

	gsl_rng_fread (a_stream: POINTER; a_r: POINTER): INTEGER is
 		-- gsl_rng_fread
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_fread"
		}"
		end

	gsl_rng_free (a_r: POINTER) is
 		-- gsl_rng_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_free"
		}"
		end

	gsl_rng_fwrite (a_stream: POINTER; a_r: POINTER): INTEGER is
 		-- gsl_rng_fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_fwrite"
		}"
		end

	gsl_rng_get (a_r: POINTER): like long_unsigned is
 		-- gsl_rng_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_get"
		}"
		end

	gsl_rng_gfsr4: POINTER is
 		-- gsl_rng_gfsr4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_gfsr4"
		}"
		end

	address_of_gsl_rng_gfsr4: POINTER is
 		-- Address of gsl_rng_gfsr4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_gfsr4"
		}"
		end

	set_gsl_rng_gfsr4 (a_value: POINTER) is
		-- Set variable gsl_rng_gfsr4 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_gfsr4"
		}"
		end

	gsl_rng_knuthran: POINTER is
 		-- gsl_rng_knuthran
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_knuthran"
		}"
		end

	address_of_gsl_rng_knuthran: POINTER is
 		-- Address of gsl_rng_knuthran
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_knuthran"
		}"
		end

	set_gsl_rng_knuthran (a_value: POINTER) is
		-- Set variable gsl_rng_knuthran value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_knuthran"
		}"
		end

	gsl_rng_knuthran2: POINTER is
 		-- gsl_rng_knuthran2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_knuthran2"
		}"
		end

	address_of_gsl_rng_knuthran2: POINTER is
 		-- Address of gsl_rng_knuthran2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_knuthran2"
		}"
		end

	set_gsl_rng_knuthran2 (a_value: POINTER) is
		-- Set variable gsl_rng_knuthran2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_knuthran2"
		}"
		end

	gsl_rng_knuthran2002: POINTER is
 		-- gsl_rng_knuthran2002
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_knuthran2002"
		}"
		end

	address_of_gsl_rng_knuthran2002: POINTER is
 		-- Address of gsl_rng_knuthran2002
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_knuthran2002"
		}"
		end

	set_gsl_rng_knuthran2002 (a_value: POINTER) is
		-- Set variable gsl_rng_knuthran2002 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_knuthran2002"
		}"
		end

	gsl_rng_lecuyer21: POINTER is
 		-- gsl_rng_lecuyer21
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_lecuyer21"
		}"
		end

	address_of_gsl_rng_lecuyer21: POINTER is
 		-- Address of gsl_rng_lecuyer21
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_lecuyer21"
		}"
		end

	set_gsl_rng_lecuyer21 (a_value: POINTER) is
		-- Set variable gsl_rng_lecuyer21 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_lecuyer21"
		}"
		end

	gsl_rng_max (a_r: POINTER): like long_unsigned is
 		-- gsl_rng_max
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_max"
		}"
		end

	gsl_rng_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_rng_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_memcpy"
		}"
		end

	gsl_rng_min (a_r: POINTER): like long_unsigned is
 		-- gsl_rng_min
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_min"
		}"
		end

	gsl_rng_minstd: POINTER is
 		-- gsl_rng_minstd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_minstd"
		}"
		end

	address_of_gsl_rng_minstd: POINTER is
 		-- Address of gsl_rng_minstd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_minstd"
		}"
		end

	set_gsl_rng_minstd (a_value: POINTER) is
		-- Set variable gsl_rng_minstd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_minstd"
		}"
		end

	gsl_rng_mrg: POINTER is
 		-- gsl_rng_mrg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_mrg"
		}"
		end

	address_of_gsl_rng_mrg: POINTER is
 		-- Address of gsl_rng_mrg
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_mrg"
		}"
		end

	set_gsl_rng_mrg (a_value: POINTER) is
		-- Set variable gsl_rng_mrg value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_mrg"
		}"
		end

	gsl_rng_mt19937: POINTER is
 		-- gsl_rng_mt19937
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_mt19937"
		}"
		end

	address_of_gsl_rng_mt19937: POINTER is
 		-- Address of gsl_rng_mt19937
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_mt19937"
		}"
		end

	set_gsl_rng_mt19937 (a_value: POINTER) is
		-- Set variable gsl_rng_mt19937 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_mt19937"
		}"
		end

	gsl_rng_mt19937_1998: POINTER is
 		-- gsl_rng_mt19937_1998
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_mt19937_1998"
		}"
		end

	address_of_gsl_rng_mt19937_1998: POINTER is
 		-- Address of gsl_rng_mt19937_1998
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_mt19937_1998"
		}"
		end

	set_gsl_rng_mt19937_1998 (a_value: POINTER) is
		-- Set variable gsl_rng_mt19937_1998 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_mt19937_1998"
		}"
		end

	gsl_rng_mt19937_1999: POINTER is
 		-- gsl_rng_mt19937_1999
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_mt19937_1999"
		}"
		end

	address_of_gsl_rng_mt19937_1999: POINTER is
 		-- Address of gsl_rng_mt19937_1999
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_mt19937_1999"
		}"
		end

	set_gsl_rng_mt19937_1999 (a_value: POINTER) is
		-- Set variable gsl_rng_mt19937_1999 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_mt19937_1999"
		}"
		end

	gsl_rng_name (a_r: POINTER): POINTER is
 		-- gsl_rng_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_name"
		}"
		end

	gsl_rng_print_state (a_r: POINTER) is
 		-- gsl_rng_print_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_print_state"
		}"
		end

	gsl_rng_r250: POINTER is
 		-- gsl_rng_r250
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_r250"
		}"
		end

	address_of_gsl_rng_r250: POINTER is
 		-- Address of gsl_rng_r250
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_r250"
		}"
		end

	set_gsl_rng_r250 (a_value: POINTER) is
		-- Set variable gsl_rng_r250 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_r250"
		}"
		end

	gsl_rng_ran0: POINTER is
 		-- gsl_rng_ran0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ran0"
		}"
		end

	address_of_gsl_rng_ran0: POINTER is
 		-- Address of gsl_rng_ran0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ran0"
		}"
		end

	set_gsl_rng_ran0 (a_value: POINTER) is
		-- Set variable gsl_rng_ran0 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ran0"
		}"
		end

	gsl_rng_ran1: POINTER is
 		-- gsl_rng_ran1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ran1"
		}"
		end

	address_of_gsl_rng_ran1: POINTER is
 		-- Address of gsl_rng_ran1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ran1"
		}"
		end

	set_gsl_rng_ran1 (a_value: POINTER) is
		-- Set variable gsl_rng_ran1 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ran1"
		}"
		end

	gsl_rng_ran2: POINTER is
 		-- gsl_rng_ran2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ran2"
		}"
		end

	address_of_gsl_rng_ran2: POINTER is
 		-- Address of gsl_rng_ran2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ran2"
		}"
		end

	set_gsl_rng_ran2 (a_value: POINTER) is
		-- Set variable gsl_rng_ran2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ran2"
		}"
		end

	gsl_rng_ran3: POINTER is
 		-- gsl_rng_ran3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ran3"
		}"
		end

	address_of_gsl_rng_ran3: POINTER is
 		-- Address of gsl_rng_ran3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ran3"
		}"
		end

	set_gsl_rng_ran3 (a_value: POINTER) is
		-- Set variable gsl_rng_ran3 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ran3"
		}"
		end

	gsl_rng_rand: POINTER is
 		-- gsl_rng_rand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_rand"
		}"
		end

	address_of_gsl_rng_rand: POINTER is
 		-- Address of gsl_rng_rand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_rand"
		}"
		end

	set_gsl_rng_rand (a_value: POINTER) is
		-- Set variable gsl_rng_rand value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_rand"
		}"
		end

	gsl_rng_rand48: POINTER is
 		-- gsl_rng_rand48
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_rand48"
		}"
		end

	address_of_gsl_rng_rand48: POINTER is
 		-- Address of gsl_rng_rand48
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_rand48"
		}"
		end

	set_gsl_rng_rand48 (a_value: POINTER) is
		-- Set variable gsl_rng_rand48 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_rand48"
		}"
		end

	gsl_rng_random128_bsd: POINTER is
 		-- gsl_rng_random128_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random128_bsd"
		}"
		end

	address_of_gsl_rng_random128_bsd: POINTER is
 		-- Address of gsl_rng_random128_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random128_bsd"
		}"
		end

	set_gsl_rng_random128_bsd (a_value: POINTER) is
		-- Set variable gsl_rng_random128_bsd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random128_bsd"
		}"
		end

	gsl_rng_random128_glibc2: POINTER is
 		-- gsl_rng_random128_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random128_glibc2"
		}"
		end

	address_of_gsl_rng_random128_glibc2: POINTER is
 		-- Address of gsl_rng_random128_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random128_glibc2"
		}"
		end

	set_gsl_rng_random128_glibc2 (a_value: POINTER) is
		-- Set variable gsl_rng_random128_glibc2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random128_glibc2"
		}"
		end

	gsl_rng_random128_libc5: POINTER is
 		-- gsl_rng_random128_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random128_libc5"
		}"
		end

	address_of_gsl_rng_random128_libc5: POINTER is
 		-- Address of gsl_rng_random128_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random128_libc5"
		}"
		end

	set_gsl_rng_random128_libc5 (a_value: POINTER) is
		-- Set variable gsl_rng_random128_libc5 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random128_libc5"
		}"
		end

	gsl_rng_random256_bsd: POINTER is
 		-- gsl_rng_random256_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random256_bsd"
		}"
		end

	address_of_gsl_rng_random256_bsd: POINTER is
 		-- Address of gsl_rng_random256_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random256_bsd"
		}"
		end

	set_gsl_rng_random256_bsd (a_value: POINTER) is
		-- Set variable gsl_rng_random256_bsd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random256_bsd"
		}"
		end

	gsl_rng_random256_glibc2: POINTER is
 		-- gsl_rng_random256_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random256_glibc2"
		}"
		end

	address_of_gsl_rng_random256_glibc2: POINTER is
 		-- Address of gsl_rng_random256_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random256_glibc2"
		}"
		end

	set_gsl_rng_random256_glibc2 (a_value: POINTER) is
		-- Set variable gsl_rng_random256_glibc2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random256_glibc2"
		}"
		end

	gsl_rng_random256_libc5: POINTER is
 		-- gsl_rng_random256_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random256_libc5"
		}"
		end

	address_of_gsl_rng_random256_libc5: POINTER is
 		-- Address of gsl_rng_random256_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random256_libc5"
		}"
		end

	set_gsl_rng_random256_libc5 (a_value: POINTER) is
		-- Set variable gsl_rng_random256_libc5 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random256_libc5"
		}"
		end

	gsl_rng_random32_bsd: POINTER is
 		-- gsl_rng_random32_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random32_bsd"
		}"
		end

	address_of_gsl_rng_random32_bsd: POINTER is
 		-- Address of gsl_rng_random32_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random32_bsd"
		}"
		end

	set_gsl_rng_random32_bsd (a_value: POINTER) is
		-- Set variable gsl_rng_random32_bsd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random32_bsd"
		}"
		end

	gsl_rng_random32_glibc2: POINTER is
 		-- gsl_rng_random32_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random32_glibc2"
		}"
		end

	address_of_gsl_rng_random32_glibc2: POINTER is
 		-- Address of gsl_rng_random32_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random32_glibc2"
		}"
		end

	set_gsl_rng_random32_glibc2 (a_value: POINTER) is
		-- Set variable gsl_rng_random32_glibc2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random32_glibc2"
		}"
		end

	gsl_rng_random32_libc5: POINTER is
 		-- gsl_rng_random32_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random32_libc5"
		}"
		end

	address_of_gsl_rng_random32_libc5: POINTER is
 		-- Address of gsl_rng_random32_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random32_libc5"
		}"
		end

	set_gsl_rng_random32_libc5 (a_value: POINTER) is
		-- Set variable gsl_rng_random32_libc5 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random32_libc5"
		}"
		end

	gsl_rng_random64_bsd: POINTER is
 		-- gsl_rng_random64_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random64_bsd"
		}"
		end

	address_of_gsl_rng_random64_bsd: POINTER is
 		-- Address of gsl_rng_random64_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random64_bsd"
		}"
		end

	set_gsl_rng_random64_bsd (a_value: POINTER) is
		-- Set variable gsl_rng_random64_bsd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random64_bsd"
		}"
		end

	gsl_rng_random64_glibc2: POINTER is
 		-- gsl_rng_random64_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random64_glibc2"
		}"
		end

	address_of_gsl_rng_random64_glibc2: POINTER is
 		-- Address of gsl_rng_random64_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random64_glibc2"
		}"
		end

	set_gsl_rng_random64_glibc2 (a_value: POINTER) is
		-- Set variable gsl_rng_random64_glibc2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random64_glibc2"
		}"
		end

	gsl_rng_random64_libc5: POINTER is
 		-- gsl_rng_random64_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random64_libc5"
		}"
		end

	address_of_gsl_rng_random64_libc5: POINTER is
 		-- Address of gsl_rng_random64_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random64_libc5"
		}"
		end

	set_gsl_rng_random64_libc5 (a_value: POINTER) is
		-- Set variable gsl_rng_random64_libc5 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random64_libc5"
		}"
		end

	gsl_rng_random8_bsd: POINTER is
 		-- gsl_rng_random8_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random8_bsd"
		}"
		end

	address_of_gsl_rng_random8_bsd: POINTER is
 		-- Address of gsl_rng_random8_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random8_bsd"
		}"
		end

	set_gsl_rng_random8_bsd (a_value: POINTER) is
		-- Set variable gsl_rng_random8_bsd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random8_bsd"
		}"
		end

	gsl_rng_random8_glibc2: POINTER is
 		-- gsl_rng_random8_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random8_glibc2"
		}"
		end

	address_of_gsl_rng_random8_glibc2: POINTER is
 		-- Address of gsl_rng_random8_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random8_glibc2"
		}"
		end

	set_gsl_rng_random8_glibc2 (a_value: POINTER) is
		-- Set variable gsl_rng_random8_glibc2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random8_glibc2"
		}"
		end

	gsl_rng_random8_libc5: POINTER is
 		-- gsl_rng_random8_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random8_libc5"
		}"
		end

	address_of_gsl_rng_random8_libc5: POINTER is
 		-- Address of gsl_rng_random8_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random8_libc5"
		}"
		end

	set_gsl_rng_random8_libc5 (a_value: POINTER) is
		-- Set variable gsl_rng_random8_libc5 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random8_libc5"
		}"
		end

	gsl_rng_random_bsd: POINTER is
 		-- gsl_rng_random_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random_bsd"
		}"
		end

	address_of_gsl_rng_random_bsd: POINTER is
 		-- Address of gsl_rng_random_bsd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random_bsd"
		}"
		end

	set_gsl_rng_random_bsd (a_value: POINTER) is
		-- Set variable gsl_rng_random_bsd value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random_bsd"
		}"
		end

	gsl_rng_random_glibc2: POINTER is
 		-- gsl_rng_random_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random_glibc2"
		}"
		end

	address_of_gsl_rng_random_glibc2: POINTER is
 		-- Address of gsl_rng_random_glibc2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random_glibc2"
		}"
		end

	set_gsl_rng_random_glibc2 (a_value: POINTER) is
		-- Set variable gsl_rng_random_glibc2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random_glibc2"
		}"
		end

	gsl_rng_random_libc5: POINTER is
 		-- gsl_rng_random_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_random_libc5"
		}"
		end

	address_of_gsl_rng_random_libc5: POINTER is
 		-- Address of gsl_rng_random_libc5
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_random_libc5"
		}"
		end

	set_gsl_rng_random_libc5 (a_value: POINTER) is
		-- Set variable gsl_rng_random_libc5 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_random_libc5"
		}"
		end

	gsl_rng_randu: POINTER is
 		-- gsl_rng_randu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_randu"
		}"
		end

	address_of_gsl_rng_randu: POINTER is
 		-- Address of gsl_rng_randu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_randu"
		}"
		end

	set_gsl_rng_randu (a_value: POINTER) is
		-- Set variable gsl_rng_randu value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_randu"
		}"
		end

	gsl_rng_ranf: POINTER is
 		-- gsl_rng_ranf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranf"
		}"
		end

	address_of_gsl_rng_ranf: POINTER is
 		-- Address of gsl_rng_ranf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranf"
		}"
		end

	set_gsl_rng_ranf (a_value: POINTER) is
		-- Set variable gsl_rng_ranf value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranf"
		}"
		end

	gsl_rng_ranlux: POINTER is
 		-- gsl_rng_ranlux
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlux"
		}"
		end

	address_of_gsl_rng_ranlux: POINTER is
 		-- Address of gsl_rng_ranlux
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlux"
		}"
		end

	set_gsl_rng_ranlux (a_value: POINTER) is
		-- Set variable gsl_rng_ranlux value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlux"
		}"
		end

	gsl_rng_ranlux389: POINTER is
 		-- gsl_rng_ranlux389
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlux389"
		}"
		end

	address_of_gsl_rng_ranlux389: POINTER is
 		-- Address of gsl_rng_ranlux389
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlux389"
		}"
		end

	set_gsl_rng_ranlux389 (a_value: POINTER) is
		-- Set variable gsl_rng_ranlux389 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlux389"
		}"
		end

	gsl_rng_ranlxd1: POINTER is
 		-- gsl_rng_ranlxd1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlxd1"
		}"
		end

	address_of_gsl_rng_ranlxd1: POINTER is
 		-- Address of gsl_rng_ranlxd1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlxd1"
		}"
		end

	set_gsl_rng_ranlxd1 (a_value: POINTER) is
		-- Set variable gsl_rng_ranlxd1 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlxd1"
		}"
		end

	gsl_rng_ranlxd2: POINTER is
 		-- gsl_rng_ranlxd2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlxd2"
		}"
		end

	address_of_gsl_rng_ranlxd2: POINTER is
 		-- Address of gsl_rng_ranlxd2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlxd2"
		}"
		end

	set_gsl_rng_ranlxd2 (a_value: POINTER) is
		-- Set variable gsl_rng_ranlxd2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlxd2"
		}"
		end

	gsl_rng_ranlxs0: POINTER is
 		-- gsl_rng_ranlxs0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlxs0"
		}"
		end

	address_of_gsl_rng_ranlxs0: POINTER is
 		-- Address of gsl_rng_ranlxs0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlxs0"
		}"
		end

	set_gsl_rng_ranlxs0 (a_value: POINTER) is
		-- Set variable gsl_rng_ranlxs0 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlxs0"
		}"
		end

	gsl_rng_ranlxs1: POINTER is
 		-- gsl_rng_ranlxs1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlxs1"
		}"
		end

	address_of_gsl_rng_ranlxs1: POINTER is
 		-- Address of gsl_rng_ranlxs1
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlxs1"
		}"
		end

	set_gsl_rng_ranlxs1 (a_value: POINTER) is
		-- Set variable gsl_rng_ranlxs1 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlxs1"
		}"
		end

	gsl_rng_ranlxs2: POINTER is
 		-- gsl_rng_ranlxs2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranlxs2"
		}"
		end

	address_of_gsl_rng_ranlxs2: POINTER is
 		-- Address of gsl_rng_ranlxs2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranlxs2"
		}"
		end

	set_gsl_rng_ranlxs2 (a_value: POINTER) is
		-- Set variable gsl_rng_ranlxs2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranlxs2"
		}"
		end

	gsl_rng_ranmar: POINTER is
 		-- gsl_rng_ranmar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_ranmar"
		}"
		end

	address_of_gsl_rng_ranmar: POINTER is
 		-- Address of gsl_rng_ranmar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_ranmar"
		}"
		end

	set_gsl_rng_ranmar (a_value: POINTER) is
		-- Set variable gsl_rng_ranmar value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_ranmar"
		}"
		end

	gsl_rng_set (a_r: POINTER; a_seed: like long_unsigned) is
 		-- gsl_rng_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_set"
		}"
		end

	gsl_rng_size (a_r: POINTER): like size_t is
 		-- gsl_rng_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_size"
		}"
		end

	gsl_rng_slatec: POINTER is
 		-- gsl_rng_slatec
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_slatec"
		}"
		end

	address_of_gsl_rng_slatec: POINTER is
 		-- Address of gsl_rng_slatec
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_slatec"
		}"
		end

	set_gsl_rng_slatec (a_value: POINTER) is
		-- Set variable gsl_rng_slatec value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_slatec"
		}"
		end

	gsl_rng_state (a_r: POINTER): POINTER is
 		-- gsl_rng_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_state"
		}"
		end

	gsl_rng_taus: POINTER is
 		-- gsl_rng_taus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_taus"
		}"
		end

	address_of_gsl_rng_taus: POINTER is
 		-- Address of gsl_rng_taus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_taus"
		}"
		end

	set_gsl_rng_taus (a_value: POINTER) is
		-- Set variable gsl_rng_taus value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_taus"
		}"
		end

	gsl_rng_taus113: POINTER is
 		-- gsl_rng_taus113
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_taus113"
		}"
		end

	address_of_gsl_rng_taus113: POINTER is
 		-- Address of gsl_rng_taus113
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_taus113"
		}"
		end

	set_gsl_rng_taus113 (a_value: POINTER) is
		-- Set variable gsl_rng_taus113 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_taus113"
		}"
		end

	gsl_rng_taus2: POINTER is
 		-- gsl_rng_taus2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_taus2"
		}"
		end

	address_of_gsl_rng_taus2: POINTER is
 		-- Address of gsl_rng_taus2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_taus2"
		}"
		end

	set_gsl_rng_taus2 (a_value: POINTER) is
		-- Set variable gsl_rng_taus2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_taus2"
		}"
		end

	gsl_rng_transputer: POINTER is
 		-- gsl_rng_transputer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_transputer"
		}"
		end

	address_of_gsl_rng_transputer: POINTER is
 		-- Address of gsl_rng_transputer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_transputer"
		}"
		end

	set_gsl_rng_transputer (a_value: POINTER) is
		-- Set variable gsl_rng_transputer value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_transputer"
		}"
		end

	gsl_rng_tt800: POINTER is
 		-- gsl_rng_tt800
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_tt800"
		}"
		end

	address_of_gsl_rng_tt800: POINTER is
 		-- Address of gsl_rng_tt800
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_tt800"
		}"
		end

	set_gsl_rng_tt800 (a_value: POINTER) is
		-- Set variable gsl_rng_tt800 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_tt800"
		}"
		end

	gsl_rng_types_setup: POINTER is
 		-- gsl_rng_types_setup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_types_setup()"
		}"
		end

	gsl_rng_uni: POINTER is
 		-- gsl_rng_uni
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_uni"
		}"
		end

	address_of_gsl_rng_uni: POINTER is
 		-- Address of gsl_rng_uni
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_uni"
		}"
		end

	set_gsl_rng_uni (a_value: POINTER) is
		-- Set variable gsl_rng_uni value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_uni"
		}"
		end

	gsl_rng_uni32: POINTER is
 		-- gsl_rng_uni32
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_uni32"
		}"
		end

	address_of_gsl_rng_uni32: POINTER is
 		-- Address of gsl_rng_uni32
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_uni32"
		}"
		end

	set_gsl_rng_uni32 (a_value: POINTER) is
		-- Set variable gsl_rng_uni32 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_uni32"
		}"
		end

	gsl_rng_uniform (a_r: POINTER): REAL is
 		-- gsl_rng_uniform
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_uniform"
		}"
		end

	gsl_rng_uniform_int (a_r: POINTER; a_n: like long_unsigned): like long_unsigned is
 		-- gsl_rng_uniform_int
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_uniform_int"
		}"
		end

	gsl_rng_uniform_pos (a_r: POINTER): REAL is
 		-- gsl_rng_uniform_pos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_uniform_pos"
		}"
		end

	gsl_rng_vax: POINTER is
 		-- gsl_rng_vax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_vax"
		}"
		end

	address_of_gsl_rng_vax: POINTER is
 		-- Address of gsl_rng_vax
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_vax"
		}"
		end

	set_gsl_rng_vax (a_value: POINTER) is
		-- Set variable gsl_rng_vax value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_vax"
		}"
		end

	gsl_rng_waterman14: POINTER is
 		-- gsl_rng_waterman14
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_waterman14"
		}"
		end

	address_of_gsl_rng_waterman14: POINTER is
 		-- Address of gsl_rng_waterman14
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_waterman14"
		}"
		end

	set_gsl_rng_waterman14 (a_value: POINTER) is
		-- Set variable gsl_rng_waterman14 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_waterman14"
		}"
		end

	gsl_rng_zuf: POINTER is
 		-- gsl_rng_zuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_rng_zuf"
		}"
		end

	address_of_gsl_rng_zuf: POINTER is
 		-- Address of gsl_rng_zuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_rng_zuf"
		}"
		end

	set_gsl_rng_zuf (a_value: POINTER) is
		-- Set variable gsl_rng_zuf value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_rng_zuf"
		}"
		end


end -- class GSL_RNG_EXTERNALS
