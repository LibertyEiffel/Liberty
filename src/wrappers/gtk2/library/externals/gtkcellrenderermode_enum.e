-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKCELLRENDERERMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_cell_renderer_mode_activatable_low_level)  or else
				(a_value = gtk_cell_renderer_mode_editable_low_level)  or else
				(a_value = gtk_cell_renderer_mode_inert_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_cell_renderer_mode_activatable is
		do
			value := gtk_cell_renderer_mode_activatable_low_level
		end

	set_gtk_cell_renderer_mode_editable is
		do
			value := gtk_cell_renderer_mode_editable_low_level
		end

	set_gtk_cell_renderer_mode_inert is
		do
			value := gtk_cell_renderer_mode_inert_low_level
		end

feature {ANY} -- Queries
	is_gtk_cell_renderer_mode_activatable: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_mode_activatable_low_level)
		end

	is_gtk_cell_renderer_mode_editable: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_mode_editable_low_level)
		end

	is_gtk_cell_renderer_mode_inert: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_mode_inert_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_cell_renderer_mode_activatable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_MODE_ACTIVATABLE"
 			}"
 		end

	gtk_cell_renderer_mode_editable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_MODE_EDITABLE"
 			}"
 		end

	gtk_cell_renderer_mode_inert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_MODE_INERT"
 			}"
 		end


end -- class GTKCELLRENDERERMODE_ENUM
