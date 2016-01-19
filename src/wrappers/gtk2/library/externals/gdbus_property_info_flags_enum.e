-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_PROPERTY_INFO_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_property_info_flags_none_low_level)  or else
				(a_value = g_dbus_property_info_flags_readable_low_level)  or else
				(a_value = g_dbus_property_info_flags_writable_low_level) )
		end

feature -- Setters
	default_create,
	set_g_dbus_property_info_flags_none is
		do
			value := g_dbus_property_info_flags_none_low_level
		end

	set_g_dbus_property_info_flags_readable is
		do
			value := g_dbus_property_info_flags_readable_low_level
		end

	set_g_dbus_property_info_flags_writable is
		do
			value := g_dbus_property_info_flags_writable_low_level
		end

feature -- Queries
	is_g_dbus_property_info_flags_none: BOOLEAN is
		do
			Result := (value=g_dbus_property_info_flags_none_low_level)
		end

	is_g_dbus_property_info_flags_readable: BOOLEAN is
		do
			Result := (value=g_dbus_property_info_flags_readable_low_level)
		end

	is_g_dbus_property_info_flags_writable: BOOLEAN is
		do
			Result := (value=g_dbus_property_info_flags_writable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_property_info_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_PROPERTY_INFO_FLAGS_NONE"
 			}"
 		end

	g_dbus_property_info_flags_readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_PROPERTY_INFO_FLAGS_READABLE"
 			}"
 		end

	g_dbus_property_info_flags_writable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_PROPERTY_INFO_FLAGS_WRITABLE"
 			}"
 		end


end -- class GDBUS_PROPERTY_INFO_FLAGS_ENUM
