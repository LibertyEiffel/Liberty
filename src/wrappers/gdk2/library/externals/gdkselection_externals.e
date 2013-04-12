-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKSELECTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_selection_convert (a_requestor: POINTER; a_selection: POINTER; a_target: POINTER; a_time: NATURAL_32) is
 		-- gdk_selection_convert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_convert"
		}"
		end

	gdk_selection_owner_get (a_selection: POINTER): POINTER is
 		-- gdk_selection_owner_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_owner_get"
		}"
		end

	gdk_selection_owner_get_for_display (a_display: POINTER; a_selection: POINTER): POINTER is
 		-- gdk_selection_owner_get_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_owner_get_for_display"
		}"
		end

	gdk_selection_owner_set (an_owner: POINTER; a_selection: POINTER; a_time: NATURAL_32; a_send_event: INTEGER_32): INTEGER_32 is
 		-- gdk_selection_owner_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_owner_set"
		}"
		end

	gdk_selection_owner_set_for_display (a_display: POINTER; an_owner: POINTER; a_selection: POINTER; a_time: NATURAL_32; a_send_event: INTEGER_32): INTEGER_32 is
 		-- gdk_selection_owner_set_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_owner_set_for_display"
		}"
		end

	gdk_selection_property_get (a_requestor: POINTER; a_data: POINTER; a_prop_type: POINTER; a_prop_format: POINTER): INTEGER_32 is
 		-- gdk_selection_property_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_property_get"
		}"
		end

	gdk_selection_send_notify (a_requestor: NATURAL_32; a_selection: POINTER; a_target: POINTER; a_property: POINTER; a_time: NATURAL_32) is
 		-- gdk_selection_send_notify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_send_notify"
		}"
		end

	gdk_selection_send_notify_for_display (a_display: POINTER; a_requestor: NATURAL_32; a_selection: POINTER; a_target: POINTER; a_property: POINTER; a_time: NATURAL_32) is
 		-- gdk_selection_send_notify_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_selection_send_notify_for_display"
		}"
		end


end -- class GDKSELECTION_EXTERNALS
