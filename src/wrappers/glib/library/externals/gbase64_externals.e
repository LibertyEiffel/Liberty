-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBASE64_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_base64_encode (a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_base64_encode (node at line 1631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_base64_encode"
		}"
		end

	g_base64_encode_step (an_in: POINTER; a_len: NATURAL_32; a_break_lines: INTEGER_32; an_out_external: POINTER; a_state: POINTER; a_save: POINTER): NATURAL_32 is
 		-- g_base64_encode_step (node at line 1841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_base64_encode_step"
		}"
		end

	g_base64_decode_step (an_in: POINTER; a_len: NATURAL_32; an_out_external: POINTER; a_state: POINTER; a_save: POINTER): NATURAL_32 is
 		-- g_base64_decode_step (node at line 2027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_base64_decode_step"
		}"
		end

	g_base64_decode_inplace (a_text: POINTER; an_out_len: POINTER): POINTER is
 		-- g_base64_decode_inplace (node at line 2977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_base64_decode_inplace"
		}"
		end

	g_base64_decode (a_text: POINTER; an_out_len: POINTER): POINTER is
 		-- g_base64_decode (node at line 5417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_base64_decode"
		}"
		end

	g_base64_encode_close (a_break_lines: INTEGER_32; an_out_external: POINTER; a_state: POINTER; a_save: POINTER): NATURAL_32 is
 		-- g_base64_encode_close (node at line 6958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_base64_encode_close"
		}"
		end


end -- class GBASE64_EXTERNALS
