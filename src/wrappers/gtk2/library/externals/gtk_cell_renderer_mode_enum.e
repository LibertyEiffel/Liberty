-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CELL_RENDERER_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = inert_low_level)  or else
				(a_value = activatable_low_level)  or else
				(a_value = editable_low_level) )
		end

feature -- Setters
	default_create,
	set_inert is
		do
			value := inert_low_level
		end

	set_activatable is
		do
			value := activatable_low_level
		end

	set_editable is
		do
			value := editable_low_level
		end

feature -- Queries
	inert: BOOLEAN is
		do
			Result := (value=inert_low_level)
		end

	activatable: BOOLEAN is
		do
			Result := (value=activatable_low_level)
		end

	editable: BOOLEAN is
		do
			Result := (value=editable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	inert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_MODE_INERT"
 			}"
 		end

	activatable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_MODE_ACTIVATABLE"
 			}"
 		end

	editable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CELL_RENDERER_MODE_EDITABLE"
 			}"
 		end


end -- class GTK_CELL_RENDERER_MODE_ENUM
