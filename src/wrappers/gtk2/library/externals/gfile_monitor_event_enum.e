-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_MONITOR_EVENT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = changed_low_level)  or else
				(a_value = changes_done_hint_low_level)  or else
				(a_value = deleted_low_level)  or else
				(a_value = created_low_level)  or else
				(a_value = attribute_changed_low_level)  or else
				(a_value = pre_unmount_low_level)  or else
				(a_value = unmounted_low_level)  or else
				(a_value = moved_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_changed is
		do
			value := changed_low_level
		end

	set_changes_done_hint is
		do
			value := changes_done_hint_low_level
		end

	set_deleted is
		do
			value := deleted_low_level
		end

	set_created is
		do
			value := created_low_level
		end

	set_attribute_changed is
		do
			value := attribute_changed_low_level
		end

	set_pre_unmount is
		do
			value := pre_unmount_low_level
		end

	set_unmounted is
		do
			value := unmounted_low_level
		end

	set_moved is
		do
			value := moved_low_level
		end

feature {ANY} -- Queries
	changed: BOOLEAN is
		do
			Result := (value=changed_low_level)
		end

	changes_done_hint: BOOLEAN is
		do
			Result := (value=changes_done_hint_low_level)
		end

	deleted: BOOLEAN is
		do
			Result := (value=deleted_low_level)
		end

	created: BOOLEAN is
		do
			Result := (value=created_low_level)
		end

	attribute_changed: BOOLEAN is
		do
			Result := (value=attribute_changed_low_level)
		end

	pre_unmount: BOOLEAN is
		do
			Result := (value=pre_unmount_low_level)
		end

	unmounted: BOOLEAN is
		do
			Result := (value=unmounted_low_level)
		end

	moved: BOOLEAN is
		do
			Result := (value=moved_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	changed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_CHANGED"
 			}"
 		end

	changes_done_hint_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT"
 			}"
 		end

	deleted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_DELETED"
 			}"
 		end

	created_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_CREATED"
 			}"
 		end

	attribute_changed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED"
 			}"
 		end

	pre_unmount_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_PRE_UNMOUNT"
 			}"
 		end

	unmounted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_UNMOUNTED"
 			}"
 		end

	moved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_EVENT_MOVED"
 			}"
 		end


end -- class GFILE_MONITOR_EVENT_ENUM
