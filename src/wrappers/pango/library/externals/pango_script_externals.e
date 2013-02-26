-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_SCRIPT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_script_iter_new (a_text: POINTER; a_length: INTEGER_32): POINTER is
 		-- pango_script_iter_new (node at line 1300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_script_iter_new"
		}"
		end

	pango_script_get_sample_language (a_script: INTEGER): POINTER is
 		-- pango_script_get_sample_language (node at line 2377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_script_get_sample_language"
		}"
		end

	pango_script_iter_get_range (an_iter: POINTER; a_start: POINTER; an_end_external: POINTER; a_script: POINTER) is
 		-- pango_script_iter_get_range (node at line 4465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_script_iter_get_range"
		}"
		end

	pango_script_iter_free (an_iter: POINTER) is
 		-- pango_script_iter_free (node at line 5595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_script_iter_free"
		}"
		end

	pango_script_iter_next (an_iter: POINTER): INTEGER_32 is
 		-- pango_script_iter_next (node at line 9660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_script_iter_next"
		}"
		end

	pango_script_for_unichar (a_ch: NATURAL_32): INTEGER is
 		-- pango_script_for_unichar (node at line 10619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_script_for_unichar"
		}"
		end


end -- class PANGO_SCRIPT_EXTERNALS
