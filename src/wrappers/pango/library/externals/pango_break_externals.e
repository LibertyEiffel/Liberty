-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_BREAK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_find_paragraph_boundary (a_text: POINTER; a_length: INTEGER_32; a_paragraph_delimiter_index: POINTER; a_next_paragraph_start: POINTER) is
 		-- pango_find_paragraph_boundary (node at line 3490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_find_paragraph_boundary"
		}"
		end

	pango_break (a_text: POINTER; a_length: INTEGER_32; an_analysis: POINTER; an_attrs: POINTER; an_attrs_len: INTEGER_32) is
 		-- pango_break (node at line 5216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_break"
		}"
		end

	pango_get_log_attrs (a_text: POINTER; a_length: INTEGER_32; a_level: INTEGER_32; a_language: POINTER; a_log_attrs: POINTER; an_attrs_len: INTEGER_32) is
 		-- pango_get_log_attrs (node at line 5370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_get_log_attrs"
		}"
		end


end -- class PANGO_BREAK_EXTERNALS
