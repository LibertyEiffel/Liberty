-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_QRNG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gsl_qrng_alloc (a_t: POINTER; a_dimension: NATURAL): POINTER is
 		-- gsl_qrng_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_alloc"
		}"
		end

	gsl_qrng_clone (a_q: POINTER): POINTER is
 		-- gsl_qrng_clone
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_clone"
		}"
		end

	gsl_qrng_free (a_q: POINTER) is
 		-- gsl_qrng_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_free"
		}"
		end

	gsl_qrng_get (a_q: POINTER; a_x: POINTER): INTEGER is
 		-- gsl_qrng_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_get"
		}"
		end

	gsl_qrng_halton: POINTER is
 		-- gsl_qrng_halton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_halton"
		}"
		end

	address_of_gsl_qrng_halton: POINTER is
 		-- Address of gsl_qrng_halton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_qrng_halton"
		}"
		end

	set_gsl_qrng_halton (a_value: POINTER) is
		-- Set variable gsl_qrng_halton value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_qrng_halton"
		}"
		end

	gsl_qrng_init (a_q: POINTER) is
 		-- gsl_qrng_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_init"
		}"
		end

	gsl_qrng_memcpy (a_dest: POINTER; a_src: POINTER): INTEGER is
 		-- gsl_qrng_memcpy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_memcpy"
		}"
		end

	gsl_qrng_name (a_q: POINTER): POINTER is
 		-- gsl_qrng_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_name"
		}"
		end

	gsl_qrng_niederreiter_2: POINTER is
 		-- gsl_qrng_niederreiter_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_niederreiter_2"
		}"
		end

	address_of_gsl_qrng_niederreiter_2: POINTER is
 		-- Address of gsl_qrng_niederreiter_2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_qrng_niederreiter_2"
		}"
		end

	set_gsl_qrng_niederreiter_2 (a_value: POINTER) is
		-- Set variable gsl_qrng_niederreiter_2 value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_qrng_niederreiter_2"
		}"
		end

	gsl_qrng_reversehalton: POINTER is
 		-- gsl_qrng_reversehalton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_reversehalton"
		}"
		end

	address_of_gsl_qrng_reversehalton: POINTER is
 		-- Address of gsl_qrng_reversehalton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_qrng_reversehalton"
		}"
		end

	set_gsl_qrng_reversehalton (a_value: POINTER) is
		-- Set variable gsl_qrng_reversehalton value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_qrng_reversehalton"
		}"
		end

	gsl_qrng_size (a_q: POINTER): like size_t is
 		-- gsl_qrng_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_size"
		}"
		end

	gsl_qrng_sobol: POINTER is
 		-- gsl_qrng_sobol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_sobol"
		}"
		end

	address_of_gsl_qrng_sobol: POINTER is
 		-- Address of gsl_qrng_sobol
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&gsl_qrng_sobol"
		}"
		end

	set_gsl_qrng_sobol (a_value: POINTER) is
		-- Set variable gsl_qrng_sobol value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_gsl_qrng_sobol"
		}"
		end

	gsl_qrng_state (a_q: POINTER): POINTER is
 		-- gsl_qrng_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_qrng_state"
		}"
		end


end -- class GSL_QRNG_EXTERNALS
