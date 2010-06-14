-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_IMPREEDIT_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nothing_low_level)  or else
				(a_value = callback_low_level)  or else
				(a_value = none_low_level) )
		end

feature -- Setters
	default_create,
	set_nothing is
		do
			value := nothing_low_level
		end

	set_callback is
		do
			value := callback_low_level
		end

	set_none is
		do
			value := none_low_level
		end

feature -- Queries
	is_nothing: BOOLEAN is
		do
			Result := (value=nothing_low_level)
		end

	is_callback: BOOLEAN is
		do
			Result := (value=callback_low_level)
		end

	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nothing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IM_PREEDIT_NOTHING"
 			}"
 		end

	callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IM_PREEDIT_CALLBACK"
 			}"
 		end

	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IM_PREEDIT_NONE"
 			}"
 		end


end -- class GTK_IMPREEDIT_STYLE_ENUM
