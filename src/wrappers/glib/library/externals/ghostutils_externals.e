-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GHOSTUTILS_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_hostname_is_ascii_encoded (a_hostname: POINTER): INTEGER_32 is
 		-- g_hostname_is_ascii_encoded
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_hostname_is_ascii_encoded"
		}"
		end

	g_hostname_to_ascii (a_hostname: POINTER): POINTER is
 		-- g_hostname_to_ascii
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_hostname_to_ascii"
		}"
		end

	g_hostname_is_ip_address (a_hostname: POINTER): INTEGER_32 is
 		-- g_hostname_is_ip_address
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_hostname_is_ip_address"
		}"
		end

	g_hostname_to_unicode (a_hostname: POINTER): POINTER is
 		-- g_hostname_to_unicode
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_hostname_to_unicode"
		}"
		end

	g_hostname_is_non_ascii (a_hostname: POINTER): INTEGER_32 is
 		-- g_hostname_is_non_ascii
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_hostname_is_non_ascii"
		}"
		end

end
