-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKWINDOWATTRIBUTESTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_wa_colormap_low_level | 
				gdk_wa_noredir_low_level | 
				gdk_wa_title_low_level | 
				gdk_wa_type_hint_low_level | 
				gdk_wa_visual_low_level | 
				gdk_wa_wmclass_low_level | 
				gdk_wa_x_low_level | 
				gdk_wa_y_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_wa_colormap is
		do
			value := value.bit_or(gdk_wa_colormap_low_level)
		end

	unset_gdk_wa_colormap is
		do
			value := value.bit_xor(gdk_wa_colormap_low_level)
		end

	set_gdk_wa_noredir is
		do
			value := value.bit_or(gdk_wa_noredir_low_level)
		end

	unset_gdk_wa_noredir is
		do
			value := value.bit_xor(gdk_wa_noredir_low_level)
		end

	set_gdk_wa_title is
		do
			value := value.bit_or(gdk_wa_title_low_level)
		end

	unset_gdk_wa_title is
		do
			value := value.bit_xor(gdk_wa_title_low_level)
		end

	set_gdk_wa_type_hint is
		do
			value := value.bit_or(gdk_wa_type_hint_low_level)
		end

	unset_gdk_wa_type_hint is
		do
			value := value.bit_xor(gdk_wa_type_hint_low_level)
		end

	set_gdk_wa_visual is
		do
			value := value.bit_or(gdk_wa_visual_low_level)
		end

	unset_gdk_wa_visual is
		do
			value := value.bit_xor(gdk_wa_visual_low_level)
		end

	set_gdk_wa_wmclass is
		do
			value := value.bit_or(gdk_wa_wmclass_low_level)
		end

	unset_gdk_wa_wmclass is
		do
			value := value.bit_xor(gdk_wa_wmclass_low_level)
		end

	set_gdk_wa_x is
		do
			value := value.bit_or(gdk_wa_x_low_level)
		end

	unset_gdk_wa_x is
		do
			value := value.bit_xor(gdk_wa_x_low_level)
		end

	set_gdk_wa_y is
		do
			value := value.bit_or(gdk_wa_y_low_level)
		end

	unset_gdk_wa_y is
		do
			value := value.bit_xor(gdk_wa_y_low_level)
		end

feature {ANY} -- Queries
	is_gdk_wa_colormap: BOOLEAN is
		do
			Result := (value=gdk_wa_colormap_low_level)
		end

	is_gdk_wa_noredir: BOOLEAN is
		do
			Result := (value=gdk_wa_noredir_low_level)
		end

	is_gdk_wa_title: BOOLEAN is
		do
			Result := (value=gdk_wa_title_low_level)
		end

	is_gdk_wa_type_hint: BOOLEAN is
		do
			Result := (value=gdk_wa_type_hint_low_level)
		end

	is_gdk_wa_visual: BOOLEAN is
		do
			Result := (value=gdk_wa_visual_low_level)
		end

	is_gdk_wa_wmclass: BOOLEAN is
		do
			Result := (value=gdk_wa_wmclass_low_level)
		end

	is_gdk_wa_x: BOOLEAN is
		do
			Result := (value=gdk_wa_x_low_level)
		end

	is_gdk_wa_y: BOOLEAN is
		do
			Result := (value=gdk_wa_y_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_wa_colormap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_COLORMAP"
 			}"
 		end

	gdk_wa_noredir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_NOREDIR"
 			}"
 		end

	gdk_wa_title_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_TITLE"
 			}"
 		end

	gdk_wa_type_hint_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_TYPE_HINT"
 			}"
 		end

	gdk_wa_visual_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_VISUAL"
 			}"
 		end

	gdk_wa_wmclass_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_WMCLASS"
 			}"
 		end

	gdk_wa_x_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_X"
 			}"
 		end

	gdk_wa_y_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_WA_Y"
 			}"
 		end


end -- class GDKWINDOWATTRIBUTESTYPE_ENUM
