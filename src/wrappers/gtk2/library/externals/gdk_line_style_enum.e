-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_LINE_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = solid_low_level)  or else
				(a_value = on_off_dash_low_level)  or else
				(a_value = double_dash_low_level) )
		end

feature -- Setters
	default_create,
	set_solid is
		do
			value := solid_low_level
		end

	set_on_off_dash is
		do
			value := on_off_dash_low_level
		end

	set_double_dash is
		do
			value := double_dash_low_level
		end

feature -- Queries
	solid: BOOLEAN is
		do
			Result := (value=solid_low_level)
		end

	on_off_dash: BOOLEAN is
		do
			Result := (value=on_off_dash_low_level)
		end

	double_dash: BOOLEAN is
		do
			Result := (value=double_dash_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	solid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LINE_SOLID"
 			}"
 		end

	on_off_dash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LINE_ON_OFF_DASH"
 			}"
 		end

	double_dash_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LINE_DOUBLE_DASH"
 			}"
 		end


end -- class GDK_LINE_STYLE_ENUM
