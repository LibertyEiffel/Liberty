-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TILDE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	tilde_expand (an_argument_l173_c7: POINTER): POINTER is
 		-- tilde_expand (node at line 172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_expand"
		}"
		end

	tilde_find_word (an_argument_l2544_c7: POINTER; an_argument_l2545_c7: INTEGER_32; an_argument_l2546_c7: POINTER): POINTER is
 		-- tilde_find_word (node at line 2543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_find_word"
		}"
		end

	tilde_expand_word (an_argument_l2711_c7: POINTER): POINTER is
 		-- tilde_expand_word (node at line 2710)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tilde_expand_word"
		}"
		end


end -- class TILDE_EXTERNALS
