-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GHOSTUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_hostname_is_ascii_encoded (a_hostname: POINTER): INTEGER_32 is
 		-- g_hostname_is_ascii_encoded (node at line 2545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hostname_is_ascii_encoded"
		}"
		end

	g_hostname_to_ascii (a_hostname: POINTER): POINTER is
 		-- g_hostname_to_ascii (node at line 2906)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hostname_to_ascii"
		}"
		end

	g_hostname_is_ip_address (a_hostname: POINTER): INTEGER_32 is
 		-- g_hostname_is_ip_address (node at line 4009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hostname_is_ip_address"
		}"
		end

	g_hostname_to_unicode (a_hostname: POINTER): POINTER is
 		-- g_hostname_to_unicode (node at line 4740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hostname_to_unicode"
		}"
		end

	g_hostname_is_non_ascii (a_hostname: POINTER): INTEGER_32 is
 		-- g_hostname_is_non_ascii (node at line 5260)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hostname_is_non_ascii"
		}"
		end


end -- class GHOSTUTILS_EXTERNALS
