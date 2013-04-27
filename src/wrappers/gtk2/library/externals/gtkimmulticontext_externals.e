-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMMULTICONTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_im_multicontext_append_menuitems (a_context: POINTER; a_menushell: POINTER) is
 		-- gtk_im_multicontext_append_menuitems
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_multicontext_append_menuitems"
		}"
		end

	gtk_im_multicontext_get_context_id (a_context: POINTER): POINTER is
 		-- gtk_im_multicontext_get_context_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_multicontext_get_context_id"
		}"
		end

	gtk_im_multicontext_get_type: like long_unsigned is
 		-- gtk_im_multicontext_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_multicontext_get_type()"
		}"
		end

	gtk_im_multicontext_new: POINTER is
 		-- gtk_im_multicontext_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_multicontext_new()"
		}"
		end

	gtk_im_multicontext_set_context_id (a_context: POINTER; a_context_id: POINTER) is
 		-- gtk_im_multicontext_set_context_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_im_multicontext_set_context_id"
		}"
		end


end -- class GTKIMMULTICONTEXT_EXTERNALS
