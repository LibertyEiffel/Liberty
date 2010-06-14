-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSHOW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_show_uri (a_screen: POINTER; an_uri: POINTER; a_timestamp: NATURAL_32; an_error: POINTER): INTEGER_32 is
 		-- gtk_show_uri (node at line 34443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_show_uri"
		}"
		end


end -- class GTKSHOW_EXTERNALS
