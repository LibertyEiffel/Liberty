-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CELL_RENDERER_ACCEL_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gtk_low_level)  or else
				(a_value = other_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk is
		do
			value := gtk_low_level
		end

	set_other is
		do
			value := other_low_level
		end

feature -- Queries
	gtk: BOOLEAN is
		do
			Result := (value=gtk_low_level)
		end

	other: BOOLEAN is
		do
			Result := (value=other_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_ACCEL_MODE_GTK"
 			}"
 		end

	other_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_ACCEL_MODE_OTHER"
 			}"
 		end


end -- class GTK_CELL_RENDERER_ACCEL_MODE_ENUM
