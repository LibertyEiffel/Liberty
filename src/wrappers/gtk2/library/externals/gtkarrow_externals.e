-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKARROW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_arrow_get_type: like long_unsigned is
 		-- gtk_arrow_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_get_type()"
		}"
		end

	gtk_arrow_new (an_arrow_type: INTEGER; a_shadow_type: INTEGER): POINTER is
 		-- gtk_arrow_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_new"
		}"
		end

	gtk_arrow_set (an_arrow: POINTER; an_arrow_type: INTEGER; a_shadow_type: INTEGER) is
 		-- gtk_arrow_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_set"
		}"
		end


end -- class GTKARROW_EXTERNALS
