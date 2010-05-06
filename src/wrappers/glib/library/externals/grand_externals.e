-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GRAND_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_rand_new_with_seed (a_seed: NATURAL_32): POINTER is
 		-- g_rand_new_with_seed (node at line 805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_new_with_seed"
		}"
		end

	g_rand_set_seed (a_rand: POINTER; a_seed: NATURAL_32) is
 		-- g_rand_set_seed (node at line 1208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_set_seed"
		}"
		end

	g_rand_new: POINTER is
 		-- g_rand_new (node at line 2268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_new()"
		}"
		end

	g_random_double_range (a_begin: REAL_64; an_end_external: REAL_64): REAL_64 is
 		-- g_random_double_range (node at line 2788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_random_double_range"
		}"
		end

	g_rand_int_range (a_rand: POINTER; a_begin: INTEGER_32; an_end_external: INTEGER_32): INTEGER_32 is
 		-- g_rand_int_range (node at line 2876)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_int_range"
		}"
		end

	g_rand_free (a_rand: POINTER) is
 		-- g_rand_free (node at line 3383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_free"
		}"
		end

	g_rand_new_with_seed_array (a_seed: POINTER; a_seed_length: NATURAL_32): POINTER is
 		-- g_rand_new_with_seed_array (node at line 3674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_new_with_seed_array"
		}"
		end

	g_rand_double (a_rand: POINTER): REAL_64 is
 		-- g_rand_double (node at line 4188)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_double"
		}"
		end

	g_random_double: REAL_64 is
 		-- g_random_double (node at line 4921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_random_double()"
		}"
		end

	g_rand_double_range (a_rand: POINTER; a_begin: REAL_64; an_end_external: REAL_64): REAL_64 is
 		-- g_rand_double_range (node at line 5010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_double_range"
		}"
		end

	g_rand_set_seed_array (a_rand: POINTER; a_seed: POINTER; a_seed_length: NATURAL_32) is
 		-- g_rand_set_seed_array (node at line 5129)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_set_seed_array"
		}"
		end

	g_random_set_seed (a_seed: NATURAL_32) is
 		-- g_random_set_seed (node at line 5361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_random_set_seed"
		}"
		end

	g_random_int: NATURAL_32 is
 		-- g_random_int (node at line 5963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_random_int()"
		}"
		end

	g_random_int_range (a_begin: INTEGER_32; an_end_external: INTEGER_32): INTEGER_32 is
 		-- g_random_int_range (node at line 6781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_random_int_range"
		}"
		end

	g_rand_copy (a_rand: POINTER): POINTER is
 		-- g_rand_copy (node at line 6904)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_copy"
		}"
		end

	g_rand_int (a_rand: POINTER): NATURAL_32 is
 		-- g_rand_int (node at line 6964)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_rand_int"
		}"
		end


end -- class GRAND_EXTERNALS
