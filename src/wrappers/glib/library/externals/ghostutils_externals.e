-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GHOSTUTILS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_hostname_is_ascii_encoded (a_hostname: POINTER): INTEGER 
               -- g_hostname_is_ascii_encoded
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hostname_is_ascii_encoded"
               }"
               end

	g_hostname_is_ip_address (a_hostname: POINTER): INTEGER 
               -- g_hostname_is_ip_address
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hostname_is_ip_address"
               }"
               end

	g_hostname_is_non_ascii (a_hostname: POINTER): INTEGER 
               -- g_hostname_is_non_ascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hostname_is_non_ascii"
               }"
               end

	g_hostname_to_ascii (a_hostname: POINTER): POINTER 
               -- g_hostname_to_ascii
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hostname_to_ascii"
               }"
               end

	g_hostname_to_unicode (a_hostname: POINTER): POINTER 
               -- g_hostname_to_unicode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_hostname_to_unicode"
               }"
               end


end -- class GHOSTUTILS_EXTERNALS
