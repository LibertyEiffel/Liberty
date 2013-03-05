-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_DHT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gsl_dht_alloc (a_size: NATURAL_32): POINTER is
 		-- gsl_dht_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_alloc"
		}"
		end

	gsl_dht_apply (a_t: POINTER; a_f_in: POINTER; a_f_out: POINTER): INTEGER_32 is
 		-- gsl_dht_apply
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_apply"
		}"
		end

	gsl_dht_free (a_t: POINTER) is
 		-- gsl_dht_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_free"
		}"
		end

	gsl_dht_init (a_t: POINTER; a_nu: REAL_64; a_xmax: REAL_64): INTEGER_32 is
 		-- gsl_dht_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_init"
		}"
		end

	gsl_dht_k_sample (a_t: POINTER; a_n: INTEGER_32): REAL_64 is
 		-- gsl_dht_k_sample
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_k_sample"
		}"
		end

	gsl_dht_new (a_size: NATURAL_32; a_nu: REAL_64; a_xmax: REAL_64): POINTER is
 		-- gsl_dht_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_new"
		}"
		end

	gsl_dht_x_sample (a_t: POINTER; a_n: INTEGER_32): REAL_64 is
 		-- gsl_dht_x_sample
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gsl_dht_x_sample"
		}"
		end


end -- class GSL_DHT_EXTERNALS
