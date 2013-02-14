-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TILDE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	tilde_additional_prefixes: POINTER is
 		-- tilde_additional_prefixes (node at line 59)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_additional_prefixes"
		}"
		end

	address_of_tilde_additional_prefixes: POINTER is
 		-- Address of tilde_additional_prefixes (node at line 59)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&tilde_additional_prefixes"
		}"
		end

	set_tilde_additional_prefixes (a_value: POINTER) is
		-- Set variable tilde_additional_prefixes value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_tilde_additional_prefixes"
		}"
		end

	tilde_additional_suffixes: POINTER is
 		-- tilde_additional_suffixes (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_additional_suffixes"
		}"
		end

	address_of_tilde_additional_suffixes: POINTER is
 		-- Address of tilde_additional_suffixes (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&tilde_additional_suffixes"
		}"
		end

	set_tilde_additional_suffixes (a_value: POINTER) is
		-- Set variable tilde_additional_suffixes value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_tilde_additional_suffixes"
		}"
		end

	tilde_expansion_preexpansion_hook: POINTER is
 		-- tilde_expansion_preexpansion_hook (node at line 48)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_expansion_preexpansion_hook"
		}"
		end

	address_of_tilde_expansion_preexpansion_hook: POINTER is
 		-- Address of tilde_expansion_preexpansion_hook (node at line 48)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&tilde_expansion_preexpansion_hook"
		}"
		end

	set_tilde_expansion_preexpansion_hook (a_value: POINTER) is
		-- Set variable tilde_expansion_preexpansion_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_tilde_expansion_preexpansion_hook"
		}"
		end

	tilde_expansion_failure_hook: POINTER is
 		-- tilde_expansion_failure_hook (node at line 54)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_expansion_failure_hook"
		}"
		end

	address_of_tilde_expansion_failure_hook: POINTER is
 		-- Address of tilde_expansion_failure_hook (node at line 54)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&tilde_expansion_failure_hook"
		}"
		end

	set_tilde_expansion_failure_hook (a_value: POINTER) is
		-- Set variable tilde_expansion_failure_hook value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_tilde_expansion_failure_hook"
		}"
		end

	tilde_expand (an_argument_l173_c7: POINTER): POINTER is
 		-- tilde_expand (node at line 172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_expand"
		}"
		end

<<<<<<< HEAD
	tilde_find_word (an_argument_l2544_c7: POINTER; an_argument_l2545_c7: INTEGER_32; an_argument_l2546_c7: POINTER): POINTER is
 		-- tilde_find_word (node at line 2543)
=======
	tilde_find_word (an_argument_l2554_c7: POINTER; an_argument_l2555_c7: INTEGER_32; an_argument_l2556_c7: POINTER): POINTER is
 		-- tilde_find_word (node at line 2553)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_find_word"
		}"
		end

<<<<<<< HEAD
	tilde_expand_word (an_argument_l2711_c7: POINTER): POINTER is
 		-- tilde_expand_word (node at line 2710)
=======
	tilde_expand_word (an_argument_l2728_c7: POINTER): POINTER is
 		-- tilde_expand_word (node at line 2727)
>>>>>>> 7dfc6f1443b037e466b58ada036d17d0ad8e19c4
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_expand_word"
		}"
		end


end -- class TILDE_EXTERNALS
