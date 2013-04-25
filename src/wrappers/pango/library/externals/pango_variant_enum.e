-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_VARIANT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = normal_low_level)  or else
				(a_value = small_caps_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_normal is
		do
			value := normal_low_level
		end

	set_small_caps is
		do
			value := small_caps_low_level
		end

feature {ANY} -- Queries
	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_small_caps: BOOLEAN is
		do
			Result := (value=small_caps_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_VARIANT_NORMAL"
 			}"
 		end

	small_caps_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_VARIANT_SMALL_CAPS"
 			}"
 		end


end -- class PANGO_VARIANT_ENUM
