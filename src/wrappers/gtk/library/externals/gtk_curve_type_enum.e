-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CURVE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = linear_low_level)  or else
				(a_value = spline_low_level)  or else
				(a_value = free_low_level) )
		end

feature -- Setters
	default_create,
	set_linear is
		do
			value := linear_low_level
		end

	set_spline is
		do
			value := spline_low_level
		end

	set_free is
		do
			value := free_low_level
		end

feature -- Queries
	is_linear: BOOLEAN is
		do
			Result := (value=linear_low_level)
		end

	is_spline: BOOLEAN is
		do
			Result := (value=spline_low_level)
		end

	is_free: BOOLEAN is
		do
			Result := (value=free_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	linear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CURVE_TYPE_LINEAR"
 			}"
 		end

	spline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CURVE_TYPE_SPLINE"
 			}"
 		end

	free_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CURVE_TYPE_FREE"
 			}"
 		end


end -- class GTK_CURVE_TYPE_ENUM
