-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_FONTSET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_fontset_get_font (a_fontset: POINTER; a_wc: NATURAL_32): POINTER is
 		-- pango_fontset_get_font (node at line 946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_fontset_get_font"
		}"
		end

	pango_fontset_get_metrics (a_fontset: POINTER): POINTER is
 		-- pango_fontset_get_metrics (node at line 8309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_fontset_get_metrics"
		}"
		end

	pango_fontset_get_type: NATURAL_64 is
 		-- pango_fontset_get_type (node at line 9215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_fontset_get_type()"
		}"
		end

	pango_fontset_foreach (a_fontset: POINTER; a_func: POINTER; a_data: POINTER) is
 		-- pango_fontset_foreach (node at line 9428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_fontset_foreach"
		}"
		end


end -- class PANGO_FONTSET_EXTERNALS
