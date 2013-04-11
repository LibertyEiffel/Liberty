-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SHADOW_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = in_low_level)  or else
				(a_value = out_external_low_level)  or else
				(a_value = etched_in_low_level)  or else
				(a_value = etched_out_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_in is
		do
			value := in_low_level
		end

	set_out_external is
		do
			value := out_external_low_level
		end

	set_etched_in is
		do
			value := etched_in_low_level
		end

	set_etched_out is
		do
			value := etched_out_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	in: BOOLEAN is
		do
			Result := (value=in_low_level)
		end

	out_external: BOOLEAN is
		do
			Result := (value=out_external_low_level)
		end

	etched_in: BOOLEAN is
		do
			Result := (value=etched_in_low_level)
		end

	etched_out: BOOLEAN is
		do
			Result := (value=etched_out_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_NONE"
 			}"
 		end

	in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_IN"
 			}"
 		end

	out_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_OUT"
 			}"
 		end

	etched_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_ETCHED_IN"
 			}"
 		end

	etched_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SHADOW_ETCHED_OUT"
 			}"
 		end


end -- class GTK_SHADOW_TYPE_ENUM
