-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATKLAYER_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_layer_background_low_level)  or else
				(a_value = atk_layer_canvas_low_level)  or else
				(a_value = atk_layer_invalid_low_level)  or else
				(a_value = atk_layer_mdi_low_level)  or else
				(a_value = atk_layer_overlay_low_level)  or else
				(a_value = atk_layer_popup_low_level)  or else
				(a_value = atk_layer_widget_low_level)  or else
				(a_value = atk_layer_window_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_atk_layer_background is
		do
			value := atk_layer_background_low_level
		end

	set_atk_layer_canvas is
		do
			value := atk_layer_canvas_low_level
		end

	set_atk_layer_invalid is
		do
			value := atk_layer_invalid_low_level
		end

	set_atk_layer_mdi is
		do
			value := atk_layer_mdi_low_level
		end

	set_atk_layer_overlay is
		do
			value := atk_layer_overlay_low_level
		end

	set_atk_layer_popup is
		do
			value := atk_layer_popup_low_level
		end

	set_atk_layer_widget is
		do
			value := atk_layer_widget_low_level
		end

	set_atk_layer_window is
		do
			value := atk_layer_window_low_level
		end

feature {ANY} -- Queries
	is_atk_layer_background: BOOLEAN is
		do
			Result := (value=atk_layer_background_low_level)
		end

	is_atk_layer_canvas: BOOLEAN is
		do
			Result := (value=atk_layer_canvas_low_level)
		end

	is_atk_layer_invalid: BOOLEAN is
		do
			Result := (value=atk_layer_invalid_low_level)
		end

	is_atk_layer_mdi: BOOLEAN is
		do
			Result := (value=atk_layer_mdi_low_level)
		end

	is_atk_layer_overlay: BOOLEAN is
		do
			Result := (value=atk_layer_overlay_low_level)
		end

	is_atk_layer_popup: BOOLEAN is
		do
			Result := (value=atk_layer_popup_low_level)
		end

	is_atk_layer_widget: BOOLEAN is
		do
			Result := (value=atk_layer_widget_low_level)
		end

	is_atk_layer_window: BOOLEAN is
		do
			Result := (value=atk_layer_window_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_layer_background_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_BACKGROUND"
 			}"
 		end

	atk_layer_canvas_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_CANVAS"
 			}"
 		end

	atk_layer_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_INVALID"
 			}"
 		end

	atk_layer_mdi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_MDI"
 			}"
 		end

	atk_layer_overlay_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_OVERLAY"
 			}"
 		end

	atk_layer_popup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_POPUP"
 			}"
 		end

	atk_layer_widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_WIDGET"
 			}"
 		end

	atk_layer_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_WINDOW"
 			}"
 		end


end -- class ATKLAYER_ENUM
