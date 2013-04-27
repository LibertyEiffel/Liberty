-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_MONITOR_EVENT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_monitor_event_attribute_changed_low_level)  or else
				(a_value = g_file_monitor_event_changed_low_level)  or else
				(a_value = g_file_monitor_event_changes_done_hint_low_level)  or else
				(a_value = g_file_monitor_event_created_low_level)  or else
				(a_value = g_file_monitor_event_deleted_low_level)  or else
				(a_value = g_file_monitor_event_moved_low_level)  or else
				(a_value = g_file_monitor_event_pre_unmount_low_level)  or else
				(a_value = g_file_monitor_event_unmounted_low_level) )
		end

feature -- Setters
	default_create,
	set_g_file_monitor_event_attribute_changed is
		do
			value := g_file_monitor_event_attribute_changed_low_level
		end

	set_g_file_monitor_event_changed is
		do
			value := g_file_monitor_event_changed_low_level
		end

	set_g_file_monitor_event_changes_done_hint is
		do
			value := g_file_monitor_event_changes_done_hint_low_level
		end

	set_g_file_monitor_event_created is
		do
			value := g_file_monitor_event_created_low_level
		end

	set_g_file_monitor_event_deleted is
		do
			value := g_file_monitor_event_deleted_low_level
		end

	set_g_file_monitor_event_moved is
		do
			value := g_file_monitor_event_moved_low_level
		end

	set_g_file_monitor_event_pre_unmount is
		do
			value := g_file_monitor_event_pre_unmount_low_level
		end

	set_g_file_monitor_event_unmounted is
		do
			value := g_file_monitor_event_unmounted_low_level
		end

feature -- Queries
	is_g_file_monitor_event_attribute_changed: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_attribute_changed_low_level)
		end

	is_g_file_monitor_event_changed: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_changed_low_level)
		end

	is_g_file_monitor_event_changes_done_hint: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_changes_done_hint_low_level)
		end

	is_g_file_monitor_event_created: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_created_low_level)
		end

	is_g_file_monitor_event_deleted: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_deleted_low_level)
		end

	is_g_file_monitor_event_moved: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_moved_low_level)
		end

	is_g_file_monitor_event_pre_unmount: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_pre_unmount_low_level)
		end

	is_g_file_monitor_event_unmounted: BOOLEAN is
		do
			Result := (value=g_file_monitor_event_unmounted_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_monitor_event_attribute_changed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED"
 			}"
 		end

	g_file_monitor_event_changed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_CHANGED"
 			}"
 		end

	g_file_monitor_event_changes_done_hint_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT"
 			}"
 		end

	g_file_monitor_event_created_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_CREATED"
 			}"
 		end

	g_file_monitor_event_deleted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_DELETED"
 			}"
 		end

	g_file_monitor_event_moved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_MOVED"
 			}"
 		end

	g_file_monitor_event_pre_unmount_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_PRE_UNMOUNT"
 			}"
 		end

	g_file_monitor_event_unmounted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_UNMOUNTED"
 			}"
 		end


end -- class GFILE_MONITOR_EVENT_ENUM
