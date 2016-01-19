-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PROPERTY_STATE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_property_delete_low_level)  or else
				(a_value = gdk_property_new_value_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_property_delete is
		do
			value := gdk_property_delete_low_level
		end

	set_gdk_property_new_value is
		do
			value := gdk_property_new_value_low_level
		end

feature -- Queries
	is_gdk_property_delete: BOOLEAN is
		do
			Result := (value=gdk_property_delete_low_level)
		end

	is_gdk_property_new_value: BOOLEAN is
		do
			Result := (value=gdk_property_new_value_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_property_delete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_DELETE"
 			}"
 		end

	gdk_property_new_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_NEW_VALUE"
 			}"
 		end


end -- class GDK_PROPERTY_STATE_ENUM
