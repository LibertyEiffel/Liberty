-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_PROPERTY_INFO_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = readable_low_level)  or else
				(a_value = writable_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_readable is
		do
			value := readable_low_level
		end

	set_writable is
		do
			value := writable_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	readable: BOOLEAN is
		do
			Result := (value=readable_low_level)
		end

	writable: BOOLEAN is
		do
			Result := (value=writable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_PROPERTY_INFO_FLAGS_NONE"
 			}"
 		end

	readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_PROPERTY_INFO_FLAGS_READABLE"
 			}"
 		end

	writable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_PROPERTY_INFO_FLAGS_WRITABLE"
 			}"
 		end


end -- class GDBUS_PROPERTY_INFO_FLAGS_ENUM
