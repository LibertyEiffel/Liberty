-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATKCOORDTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_xy_screen_low_level)  or else
				(a_value = atk_xy_window_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_atk_xy_screen is
		do
			value := atk_xy_screen_low_level
		end

	set_atk_xy_window is
		do
			value := atk_xy_window_low_level
		end

feature {ANY} -- Queries
	is_atk_xy_screen: BOOLEAN is
		do
			Result := (value=atk_xy_screen_low_level)
		end

	is_atk_xy_window: BOOLEAN is
		do
			Result := (value=atk_xy_window_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_xy_screen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_XY_SCREEN"
 			}"
 		end

	atk_xy_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_XY_WINDOW"
 			}"
 		end


end -- class ATKCOORDTYPE_ENUM
