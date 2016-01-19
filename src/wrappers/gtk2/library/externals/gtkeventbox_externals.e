-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKEVENTBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_event_box_get_above_child (an_event_box: POINTER): INTEGER is
 		-- gtk_event_box_get_above_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_event_box_get_above_child"
		}"
		end

	gtk_event_box_get_type: like long_unsigned is
 		-- gtk_event_box_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_event_box_get_type()"
		}"
		end

	gtk_event_box_get_visible_window (an_event_box: POINTER): INTEGER is
 		-- gtk_event_box_get_visible_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_event_box_get_visible_window"
		}"
		end

	gtk_event_box_new: POINTER is
 		-- gtk_event_box_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_event_box_new()"
		}"
		end

	gtk_event_box_set_above_child (an_event_box: POINTER; an_above_child: INTEGER) is
 		-- gtk_event_box_set_above_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_event_box_set_above_child"
		}"
		end

	gtk_event_box_set_visible_window (an_event_box: POINTER; a_visible_window: INTEGER) is
 		-- gtk_event_box_set_visible_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_event_box_set_visible_window"
		}"
		end


end -- class GTKEVENTBOX_EXTERNALS
