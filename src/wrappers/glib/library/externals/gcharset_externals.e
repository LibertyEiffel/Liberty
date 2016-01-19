-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCHARSET_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_get_charset (a_charset: POINTER): INTEGER 
               -- g_get_charset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_charset"
               }"
               end

	g_get_codeset: POINTER 
               -- g_get_codeset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_codeset"
               }"
               end

	g_get_language_names: POINTER 
               -- g_get_language_names
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_language_names"
               }"
               end

	g_get_locale_variants (a_locale: POINTER): POINTER 
               -- g_get_locale_variants
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_locale_variants"
               }"
               end


end -- class GCHARSET_EXTERNALS
