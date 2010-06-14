-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTTAG_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_attributes_get_type: NATURAL_32 is
 		-- gtk_text_attributes_get_type (node at line 99)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_get_type()"
		}"
		end

	gtk_text_attributes_ref (a_values: POINTER): POINTER is
 		-- gtk_text_attributes_ref (node at line 4754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_ref"
		}"
		end

	gtk_text_attributes_unref (a_values: POINTER) is
 		-- gtk_text_attributes_unref (node at line 6110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_unref"
		}"
		end

	gtk_text_tag_event (a_tag: POINTER; an_event_object: POINTER; an_event: POINTER; an_iter: POINTER): INTEGER_32 is
 		-- gtk_text_tag_event (node at line 9629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_event"
		}"
		end

	gtk_text_attributes_copy (a_src: POINTER): POINTER is
 		-- gtk_text_attributes_copy (node at line 12282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_copy"
		}"
		end

	gtk_text_tag_new (a_name: POINTER): POINTER is
 		-- gtk_text_tag_new (node at line 16863)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_new"
		}"
		end

	gtk_text_tag_get_type: NATURAL_32 is
 		-- gtk_text_tag_get_type (node at line 21899)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_get_type()"
		}"
		end

	gtk_text_tag_set_priority (a_tag: POINTER; a_priority: INTEGER_32) is
 		-- gtk_text_tag_set_priority (node at line 22435)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_set_priority"
		}"
		end

	gtk_text_attributes_new: POINTER is
 		-- gtk_text_attributes_new (node at line 32146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_new()"
		}"
		end

	gtk_text_tag_get_priority (a_tag: POINTER): INTEGER_32 is
 		-- gtk_text_tag_get_priority (node at line 32173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_get_priority"
		}"
		end

	gtk_text_attributes_copy_values (a_src: POINTER; a_dest: POINTER) is
 		-- gtk_text_attributes_copy_values (node at line 36998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_attributes_copy_values"
		}"
		end


end -- class GTKTEXTTAG_EXTERNALS
