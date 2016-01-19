-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOBJECT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_object_destroy (an_object: POINTER) is
 		-- gtk_object_destroy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_destroy"
		}"
		end

	gtk_object_get_type: like long_unsigned is
 		-- gtk_object_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_object_get_type()"
		}"
		end


end -- class GTKOBJECT_EXTERNALS
