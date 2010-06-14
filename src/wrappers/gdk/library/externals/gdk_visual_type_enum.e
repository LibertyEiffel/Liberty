-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_VISUAL_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = static_gray_low_level)  or else
				(a_value = grayscale_low_level)  or else
				(a_value = static_color_low_level)  or else
				(a_value = pseudo_color_low_level)  or else
				(a_value = true_color_low_level)  or else
				(a_value = direct_color_low_level) )
		end

feature -- Setters
	default_create,
	set_static_gray is
		do
			value := static_gray_low_level
		end

	set_grayscale is
		do
			value := grayscale_low_level
		end

	set_static_color is
		do
			value := static_color_low_level
		end

	set_pseudo_color is
		do
			value := pseudo_color_low_level
		end

	set_true_color is
		do
			value := true_color_low_level
		end

	set_direct_color is
		do
			value := direct_color_low_level
		end

feature -- Queries
	is_static_gray: BOOLEAN is
		do
			Result := (value=static_gray_low_level)
		end

	is_grayscale: BOOLEAN is
		do
			Result := (value=grayscale_low_level)
		end

	is_static_color: BOOLEAN is
		do
			Result := (value=static_color_low_level)
		end

	is_pseudo_color: BOOLEAN is
		do
			Result := (value=pseudo_color_low_level)
		end

	is_true_color: BOOLEAN is
		do
			Result := (value=true_color_low_level)
		end

	is_direct_color: BOOLEAN is
		do
			Result := (value=direct_color_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	static_gray_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_STATIC_GRAY"
 			}"
 		end

	grayscale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_GRAYSCALE"
 			}"
 		end

	static_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_STATIC_COLOR"
 			}"
 		end

	pseudo_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_PSEUDO_COLOR"
 			}"
 		end

	true_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_TRUE_COLOR"
 			}"
 		end

	direct_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_DIRECT_COLOR"
 			}"
 		end


end -- class GDK_VISUAL_TYPE_ENUM
