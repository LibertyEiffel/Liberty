-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKVISUALTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_visual_direct_color_low_level)  or else
				(a_value = gdk_visual_grayscale_low_level)  or else
				(a_value = gdk_visual_pseudo_color_low_level)  or else
				(a_value = gdk_visual_static_color_low_level)  or else
				(a_value = gdk_visual_static_gray_low_level)  or else
				(a_value = gdk_visual_true_color_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_visual_direct_color is
		do
			value := gdk_visual_direct_color_low_level
		end

	set_gdk_visual_grayscale is
		do
			value := gdk_visual_grayscale_low_level
		end

	set_gdk_visual_pseudo_color is
		do
			value := gdk_visual_pseudo_color_low_level
		end

	set_gdk_visual_static_color is
		do
			value := gdk_visual_static_color_low_level
		end

	set_gdk_visual_static_gray is
		do
			value := gdk_visual_static_gray_low_level
		end

	set_gdk_visual_true_color is
		do
			value := gdk_visual_true_color_low_level
		end

feature {ANY} -- Queries
	is_gdk_visual_direct_color: BOOLEAN is
		do
			Result := (value=gdk_visual_direct_color_low_level)
		end

	is_gdk_visual_grayscale: BOOLEAN is
		do
			Result := (value=gdk_visual_grayscale_low_level)
		end

	is_gdk_visual_pseudo_color: BOOLEAN is
		do
			Result := (value=gdk_visual_pseudo_color_low_level)
		end

	is_gdk_visual_static_color: BOOLEAN is
		do
			Result := (value=gdk_visual_static_color_low_level)
		end

	is_gdk_visual_static_gray: BOOLEAN is
		do
			Result := (value=gdk_visual_static_gray_low_level)
		end

	is_gdk_visual_true_color: BOOLEAN is
		do
			Result := (value=gdk_visual_true_color_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_visual_direct_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_DIRECT_COLOR"
 			}"
 		end

	gdk_visual_grayscale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_GRAYSCALE"
 			}"
 		end

	gdk_visual_pseudo_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_PSEUDO_COLOR"
 			}"
 		end

	gdk_visual_static_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_STATIC_COLOR"
 			}"
 		end

	gdk_visual_static_gray_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_STATIC_GRAY"
 			}"
 		end

	gdk_visual_true_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISUAL_TRUE_COLOR"
 			}"
 		end


end -- class GDKVISUALTYPE_ENUM
