-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKGRABSTATUS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_grab_already_grabbed_low_level)  or else
				(a_value = gdk_grab_frozen_low_level)  or else
				(a_value = gdk_grab_invalid_time_low_level)  or else
				(a_value = gdk_grab_not_viewable_low_level)  or else
				(a_value = gdk_grab_success_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_grab_already_grabbed is
		do
			value := gdk_grab_already_grabbed_low_level
		end

	set_gdk_grab_frozen is
		do
			value := gdk_grab_frozen_low_level
		end

	set_gdk_grab_invalid_time is
		do
			value := gdk_grab_invalid_time_low_level
		end

	set_gdk_grab_not_viewable is
		do
			value := gdk_grab_not_viewable_low_level
		end

	set_gdk_grab_success is
		do
			value := gdk_grab_success_low_level
		end

feature {ANY} -- Queries
	is_gdk_grab_already_grabbed: BOOLEAN is
		do
			Result := (value=gdk_grab_already_grabbed_low_level)
		end

	is_gdk_grab_frozen: BOOLEAN is
		do
			Result := (value=gdk_grab_frozen_low_level)
		end

	is_gdk_grab_invalid_time: BOOLEAN is
		do
			Result := (value=gdk_grab_invalid_time_low_level)
		end

	is_gdk_grab_not_viewable: BOOLEAN is
		do
			Result := (value=gdk_grab_not_viewable_low_level)
		end

	is_gdk_grab_success: BOOLEAN is
		do
			Result := (value=gdk_grab_success_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_grab_already_grabbed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_ALREADY_GRABBED"
 			}"
 		end

	gdk_grab_frozen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_FROZEN"
 			}"
 		end

	gdk_grab_invalid_time_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_INVALID_TIME"
 			}"
 		end

	gdk_grab_not_viewable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_NOT_VIEWABLE"
 			}"
 		end

	gdk_grab_success_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_SUCCESS"
 			}"
 		end


end -- class GDKGRABSTATUS_ENUM
