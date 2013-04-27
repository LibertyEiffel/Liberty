-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSHOW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_show_uri (a_screen: POINTER; an_uri: POINTER; a_timestamp: NATURAL; an_error: POINTER): INTEGER is
 		-- gtk_show_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_show_uri"
		}"
		end


end -- class GTKSHOW_EXTERNALS
