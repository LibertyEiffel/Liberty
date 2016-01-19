-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBASE64_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_base64_decode (a_text: POINTER; an_out_len: POINTER): POINTER 
               -- g_base64_decode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base64_decode"
               }"
               end

	g_base64_decode_inplace (a_text: POINTER; an_out_len: POINTER): POINTER 
               -- g_base64_decode_inplace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base64_decode_inplace"
               }"
               end

	g_base64_decode_step (an_in: POINTER; a_len: like long_unsigned; an_out_external: POINTER; a_state: POINTER; a_save: POINTER): like long_unsigned 
               -- g_base64_decode_step
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base64_decode_step"
               }"
               end

	g_base64_encode (a_data: POINTER; a_len: like long_unsigned): POINTER 
               -- g_base64_encode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base64_encode"
               }"
               end

	g_base64_encode_close (a_break_lines: INTEGER; an_out_external: POINTER; a_state: POINTER; a_save: POINTER): like long_unsigned 
               -- g_base64_encode_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base64_encode_close"
               }"
               end

	g_base64_encode_step (an_in: POINTER; a_len: like long_unsigned; a_break_lines: INTEGER; an_out_external: POINTER; a_state: POINTER; a_save: POINTER): like long_unsigned 
               -- g_base64_encode_step
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base64_encode_step"
               }"
               end


end -- class GBASE64_EXTERNALS
