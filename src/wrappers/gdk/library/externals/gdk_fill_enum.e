-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FILL_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = solid_low_level)  or else
				(a_value = tiled_low_level)  or else
				(a_value = stippled_low_level)  or else
				(a_value = opaque_stippled_low_level) )
		end

feature -- Setters
	default_create,
	set_solid is
		do
			value := solid_low_level
		end

	set_tiled is
		do
			value := tiled_low_level
		end

	set_stippled is
		do
			value := stippled_low_level
		end

	set_opaque_stippled is
		do
			value := opaque_stippled_low_level
		end

feature -- Queries
	is_solid: BOOLEAN is
		do
			Result := (value=solid_low_level)
		end

	is_tiled: BOOLEAN is
		do
			Result := (value=tiled_low_level)
		end

	is_stippled: BOOLEAN is
		do
			Result := (value=stippled_low_level)
		end

	is_opaque_stippled: BOOLEAN is
		do
			Result := (value=opaque_stippled_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	solid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SOLID"
 			}"
 		end

	tiled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_TILED"
 			}"
 		end

	stippled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_STIPPLED"
 			}"
 		end

	opaque_stippled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OPAQUE_STIPPLED"
 			}"
 		end


end -- class GDK_FILL_ENUM
