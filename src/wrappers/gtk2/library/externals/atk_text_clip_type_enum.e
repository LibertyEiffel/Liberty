-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_TEXT_CLIP_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = min_low_level)  or else
				(a_value = max_low_level)  or else
				(a_value = both_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_min is
		do
			value := min_low_level
		end

	set_max is
		do
			value := max_low_level
		end

	set_both is
		do
			value := both_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	min: BOOLEAN is
		do
			Result := (value=min_low_level)
		end

	max: BOOLEAN is
		do
			Result := (value=max_low_level)
		end

	both: BOOLEAN is
		do
			Result := (value=both_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_NONE"
 			}"
 		end

	min_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_MIN"
 			}"
 		end

	max_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_MAX"
 			}"
 		end

	both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_BOTH"
 			}"
 		end


end -- class ATK_TEXT_CLIP_TYPE_ENUM
