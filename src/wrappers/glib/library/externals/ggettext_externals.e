-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GGETTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_dcgettext (a_domain: POINTER; a_msgid: POINTER; a_category: INTEGER): POINTER 
               -- g_dcgettext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dcgettext"
               }"
               end

	g_dgettext (a_domain: POINTER; a_msgid: POINTER): POINTER 
               -- g_dgettext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dgettext"
               }"
               end

	g_dngettext (a_domain: POINTER; a_msgid: POINTER; a_msgid_plural: POINTER; a_n: like long_unsigned): POINTER 
               -- g_dngettext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dngettext"
               }"
               end

	g_dpgettext (a_domain: POINTER; a_msgctxtid: POINTER; a_msgidoffset: like long_unsigned): POINTER 
               -- g_dpgettext
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dpgettext"
               }"
               end

	g_dpgettext2 (a_domain: POINTER; a_context: POINTER; a_msgid: POINTER): POINTER 
               -- g_dpgettext2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dpgettext2"
               }"
               end

	g_strip_context (a_msgid: POINTER; a_msgval: POINTER): POINTER 
               -- g_strip_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strip_context"
               }"
               end


end -- class GGETTEXT_EXTERNALS
