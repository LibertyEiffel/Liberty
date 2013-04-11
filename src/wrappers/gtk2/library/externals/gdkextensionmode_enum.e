-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKEXTENSIONMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_extension_events_all_low_level)  or else
				(a_value = gdk_extension_events_cursor_low_level)  or else
				(a_value = gdk_extension_events_none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_extension_events_all is
		do
			value := gdk_extension_events_all_low_level
		end

	set_gdk_extension_events_cursor is
		do
			value := gdk_extension_events_cursor_low_level
		end

	set_gdk_extension_events_none is
		do
			value := gdk_extension_events_none_low_level
		end

feature {ANY} -- Queries
	is_gdk_extension_events_all: BOOLEAN is
		do
			Result := (value=gdk_extension_events_all_low_level)
		end

	is_gdk_extension_events_cursor: BOOLEAN is
		do
			Result := (value=gdk_extension_events_cursor_low_level)
		end

	is_gdk_extension_events_none: BOOLEAN is
		do
			Result := (value=gdk_extension_events_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_extension_events_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXTENSION_EVENTS_ALL"
 			}"
 		end

	gdk_extension_events_cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXTENSION_EVENTS_CURSOR"
 			}"
 		end

	gdk_extension_events_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXTENSION_EVENTS_NONE"
 			}"
 		end


end -- class GDKEXTENSIONMODE_ENUM
