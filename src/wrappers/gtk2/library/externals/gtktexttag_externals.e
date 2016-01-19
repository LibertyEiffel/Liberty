-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTTAG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_attributes_copy (a_src: POINTER): POINTER is
 		-- gtk_text_attributes_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_copy"
		}"
		end

	gtk_text_attributes_copy_values (a_src: POINTER; a_dest: POINTER) is
 		-- gtk_text_attributes_copy_values
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_copy_values"
		}"
		end

	gtk_text_attributes_get_type: like long_unsigned is
 		-- gtk_text_attributes_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_get_type()"
		}"
		end

	gtk_text_attributes_new: POINTER is
 		-- gtk_text_attributes_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_new()"
		}"
		end

	gtk_text_attributes_ref (a_values: POINTER): POINTER is
 		-- gtk_text_attributes_ref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_ref"
		}"
		end

	gtk_text_attributes_unref (a_values: POINTER) is
 		-- gtk_text_attributes_unref
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_unref"
		}"
		end

	gtk_text_tag_event (a_tag: POINTER; an_event_object: POINTER; an_event: POINTER; an_iter: POINTER): INTEGER is
 		-- gtk_text_tag_event
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_event"
		}"
		end

	gtk_text_tag_get_priority (a_tag: POINTER): INTEGER is
 		-- gtk_text_tag_get_priority
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_get_priority"
		}"
		end

	gtk_text_tag_get_type: like long_unsigned is
 		-- gtk_text_tag_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_get_type()"
		}"
		end

	gtk_text_tag_new (a_name: POINTER): POINTER is
 		-- gtk_text_tag_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_new"
		}"
		end

	gtk_text_tag_set_priority (a_tag: POINTER; a_priority: INTEGER) is
 		-- gtk_text_tag_set_priority
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_set_priority"
		}"
		end


end -- class GTKTEXTTAG_EXTERNALS
