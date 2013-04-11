-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_IMSTATUS_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nothing_low_level)  or else
				(a_value = callback_low_level)  or else
				(a_value = none_low_level) )
		end

feature {ANY} -- Setters
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

feature {ANY} -- Queries
	nothing: BOOLEAN is
		do
			Result := (value=nothing_low_level)
		end

	callback: BOOLEAN is
		do
			Result := (value=callback_low_level)
		end

	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nothing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IM_STATUS_NOTHING"
 			}"
 		end

	callback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IM_STATUS_CALLBACK"
 			}"
 		end

	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_IM_STATUS_NONE"
 			}"
 		end


end -- class GTK_IMSTATUS_STYLE_ENUM
