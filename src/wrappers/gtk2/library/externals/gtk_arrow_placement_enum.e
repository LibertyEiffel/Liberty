-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ARROW_PLACEMENT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = both_low_level)  or else
				(a_value = start_low_level)  or else
				(a_value = end_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_both is
		do
			value := both_low_level
		end

	set_start is
		do
			value := start_low_level
		end

	set_end_external is
		do
			value := end_external_low_level
		end

feature {ANY} -- Queries
	both: BOOLEAN is
		do
			Result := (value=both_low_level)
		end

	start: BOOLEAN is
		do
			Result := (value=start_low_level)
		end

	end_external: BOOLEAN is
		do
			Result := (value=end_external_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROWS_BOTH"
 			}"
 		end

	start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROWS_START"
 			}"
 		end

	end_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ARROWS_END"
 			}"
 		end


end -- class GTK_ARROW_PLACEMENT_ENUM
