-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKCELLRENDERERACCELMODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_cell_renderer_accel_mode_gtk_low_level)  or else
				(a_value = gtk_cell_renderer_accel_mode_other_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_cell_renderer_accel_mode_gtk is
		do
			value := gtk_cell_renderer_accel_mode_gtk_low_level
		end

	set_gtk_cell_renderer_accel_mode_other is
		do
			value := gtk_cell_renderer_accel_mode_other_low_level
		end

feature {ANY} -- Queries
	is_gtk_cell_renderer_accel_mode_gtk: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_accel_mode_gtk_low_level)
		end

	is_gtk_cell_renderer_accel_mode_other: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_accel_mode_other_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_cell_renderer_accel_mode_gtk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_ACCEL_MODE_GTK"
 			}"
 		end

	gtk_cell_renderer_accel_mode_other_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_ACCEL_MODE_OTHER"
 			}"
 		end


end -- class GTKCELLRENDERERACCELMODE_ENUM
