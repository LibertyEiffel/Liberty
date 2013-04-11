-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_BUTTON_BOX_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_style_low_level)  or else
				(a_value = spread_low_level)  or else
				(a_value = edge_low_level)  or else
				(a_value = start_low_level)  or else
				(a_value = end_external_low_level)  or else
				(a_value = center_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_style is
		do
			value := default_style_low_level
		end

	set_spread is
		do
			value := spread_low_level
		end

	set_edge is
		do
			value := edge_low_level
		end

	set_start is
		do
			value := start_low_level
		end

	set_end_external is
		do
			value := end_external_low_level
		end

	set_center is
		do
			value := center_low_level
		end

feature {ANY} -- Queries
	default_style: BOOLEAN is
		do
			Result := (value=default_style_low_level)
		end

	spread: BOOLEAN is
		do
			Result := (value=spread_low_level)
		end

	edge: BOOLEAN is
		do
			Result := (value=edge_low_level)
		end

	start: BOOLEAN is
		do
			Result := (value=start_low_level)
		end

	end_external: BOOLEAN is
		do
			Result := (value=end_external_low_level)
		end

	center: BOOLEAN is
		do
			Result := (value=center_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_DEFAULT_STYLE"
 			}"
 		end

	spread_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_SPREAD"
 			}"
 		end

	edge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_EDGE"
 			}"
 		end

	start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_START"
 			}"
 		end

	end_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_END"
 			}"
 		end

	center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTONBOX_CENTER"
 			}"
 		end


end -- class GTK_BUTTON_BOX_STYLE_ENUM
