-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ICON_VIEW_DROP_POSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = no_drop_low_level)  or else
				(a_value = drop_into_low_level)  or else
				(a_value = drop_left_low_level)  or else
				(a_value = drop_right_low_level)  or else
				(a_value = drop_above_low_level)  or else
				(a_value = drop_below_low_level) )
		end

feature -- Setters
	default_create,
	set_no_drop is
		do
			value := no_drop_low_level
		end

	set_drop_into is
		do
			value := drop_into_low_level
		end

	set_drop_left is
		do
			value := drop_left_low_level
		end

	set_drop_right is
		do
			value := drop_right_low_level
		end

	set_drop_above is
		do
			value := drop_above_low_level
		end

	set_drop_below is
		do
			value := drop_below_low_level
		end

feature -- Queries
	is_no_drop: BOOLEAN is
		do
			Result := (value=no_drop_low_level)
		end

	is_drop_into: BOOLEAN is
		do
			Result := (value=drop_into_low_level)
		end

	is_drop_left: BOOLEAN is
		do
			Result := (value=drop_left_low_level)
		end

	is_drop_right: BOOLEAN is
		do
			Result := (value=drop_right_low_level)
		end

	is_drop_above: BOOLEAN is
		do
			Result := (value=drop_above_low_level)
		end

	is_drop_below: BOOLEAN is
		do
			Result := (value=drop_below_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	no_drop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_NO_DROP"
 			}"
 		end

	drop_into_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_INTO"
 			}"
 		end

	drop_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_LEFT"
 			}"
 		end

	drop_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_RIGHT"
 			}"
 		end

	drop_above_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_ABOVE"
 			}"
 		end

	drop_below_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_VIEW_DROP_BELOW"
 			}"
 		end


end -- class GTK_ICON_VIEW_DROP_POSITION_ENUM
