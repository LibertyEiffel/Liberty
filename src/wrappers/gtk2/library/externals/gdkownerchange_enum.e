-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKOWNERCHANGE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_owner_change_close_low_level)  or else
				(a_value = gdk_owner_change_destroy_low_level)  or else
				(a_value = gdk_owner_change_new_owner_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_owner_change_close is
		do
			value := gdk_owner_change_close_low_level
		end

	set_gdk_owner_change_destroy is
		do
			value := gdk_owner_change_destroy_low_level
		end

	set_gdk_owner_change_new_owner is
		do
			value := gdk_owner_change_new_owner_low_level
		end

feature {ANY} -- Queries
	is_gdk_owner_change_close: BOOLEAN is
		do
			Result := (value=gdk_owner_change_close_low_level)
		end

	is_gdk_owner_change_destroy: BOOLEAN is
		do
			Result := (value=gdk_owner_change_destroy_low_level)
		end

	is_gdk_owner_change_new_owner: BOOLEAN is
		do
			Result := (value=gdk_owner_change_new_owner_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_owner_change_close_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE_CLOSE"
 			}"
 		end

	gdk_owner_change_destroy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE_DESTROY"
 			}"
 		end

	gdk_owner_change_new_owner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE_NEW_OWNER"
 			}"
 		end


end -- class GDKOWNERCHANGE_ENUM
