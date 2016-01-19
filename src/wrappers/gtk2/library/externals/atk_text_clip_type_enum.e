-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_TEXT_CLIP_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_text_clip_both_low_level)  or else
				(a_value = atk_text_clip_max_low_level)  or else
				(a_value = atk_text_clip_min_low_level)  or else
				(a_value = atk_text_clip_none_low_level) )
		end

feature -- Setters
	default_create,
	set_atk_text_clip_both is
		do
			value := atk_text_clip_both_low_level
		end

	set_atk_text_clip_max is
		do
			value := atk_text_clip_max_low_level
		end

	set_atk_text_clip_min is
		do
			value := atk_text_clip_min_low_level
		end

	set_atk_text_clip_none is
		do
			value := atk_text_clip_none_low_level
		end

feature -- Queries
	is_atk_text_clip_both: BOOLEAN is
		do
			Result := (value=atk_text_clip_both_low_level)
		end

	is_atk_text_clip_max: BOOLEAN is
		do
			Result := (value=atk_text_clip_max_low_level)
		end

	is_atk_text_clip_min: BOOLEAN is
		do
			Result := (value=atk_text_clip_min_low_level)
		end

	is_atk_text_clip_none: BOOLEAN is
		do
			Result := (value=atk_text_clip_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_text_clip_both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_BOTH"
 			}"
 		end

	atk_text_clip_max_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_MAX"
 			}"
 		end

	atk_text_clip_min_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_MIN"
 			}"
 		end

	atk_text_clip_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_CLIP_NONE"
 			}"
 		end


end -- class ATK_TEXT_CLIP_TYPE_ENUM
