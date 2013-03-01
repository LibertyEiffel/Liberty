-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_LAYER_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = background_low_level)  or else
				(a_value = canvas_low_level)  or else
				(a_value = widget_low_level)  or else
				(a_value = mdi_low_level)  or else
				(a_value = popup_low_level)  or else
				(a_value = overlay_low_level)  or else
				(a_value = window_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_background is
		do
			value := background_low_level
		end

	set_canvas is
		do
			value := canvas_low_level
		end

	set_widget is
		do
			value := widget_low_level
		end

	set_mdi is
		do
			value := mdi_low_level
		end

	set_popup is
		do
			value := popup_low_level
		end

	set_overlay is
		do
			value := overlay_low_level
		end

	set_window is
		do
			value := window_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	background: BOOLEAN is
		do
			Result := (value=background_low_level)
		end

	canvas: BOOLEAN is
		do
			Result := (value=canvas_low_level)
		end

	widget: BOOLEAN is
		do
			Result := (value=widget_low_level)
		end

	mdi: BOOLEAN is
		do
			Result := (value=mdi_low_level)
		end

	popup: BOOLEAN is
		do
			Result := (value=popup_low_level)
		end

	overlay: BOOLEAN is
		do
			Result := (value=overlay_low_level)
		end

	window: BOOLEAN is
		do
			Result := (value=window_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_INVALID"
 			}"
 		end

	background_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_BACKGROUND"
 			}"
 		end

	canvas_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_CANVAS"
 			}"
 		end

	widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_WIDGET"
 			}"
 		end

	mdi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_MDI"
 			}"
 		end

	popup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_POPUP"
 			}"
 		end

	overlay_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_OVERLAY"
 			}"
 		end

	window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_LAYER_WINDOW"
 			}"
 		end


end -- class ATK_LAYER_ENUM
