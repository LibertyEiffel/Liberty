-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_MONITOR_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = watch_mounts_low_level)  or else
				(a_value = send_moved_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_watch_mounts is
		do
			value := watch_mounts_low_level
		end

	set_send_moved is
		do
			value := send_moved_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_watch_mounts: BOOLEAN is
		do
			Result := (value=watch_mounts_low_level)
		end

	is_send_moved: BOOLEAN is
		do
			Result := (value=send_moved_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_NONE"
 			}"
 		end

	watch_mounts_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_WATCH_MOUNTS"
 			}"
 		end

	send_moved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_SEND_MOVED"
 			}"
 		end


end -- class GFILE_MONITOR_FLAGS_ENUM
