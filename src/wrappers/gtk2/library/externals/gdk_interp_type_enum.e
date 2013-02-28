-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_INTERP_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nearest_low_level)  or else
				(a_value = tiles_low_level)  or else
				(a_value = bilinear_low_level)  or else
				(a_value = hyper_low_level) )
		end

feature -- Setters
	default_create,
	set_nearest is
		do
			value := nearest_low_level
		end

	set_tiles is
		do
			value := tiles_low_level
		end

	set_bilinear is
		do
			value := bilinear_low_level
		end

	set_hyper is
		do
			value := hyper_low_level
		end

feature -- Queries
	nearest: BOOLEAN is
		do
			Result := (value=nearest_low_level)
		end

	tiles: BOOLEAN is
		do
			Result := (value=tiles_low_level)
		end

	bilinear: BOOLEAN is
		do
			Result := (value=bilinear_low_level)
		end

	hyper: BOOLEAN is
		do
			Result := (value=hyper_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nearest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INTERP_NEAREST"
 			}"
 		end

	tiles_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INTERP_TILES"
 			}"
 		end

	bilinear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INTERP_BILINEAR"
 			}"
 		end

	hyper_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INTERP_HYPER"
 			}"
 		end


end -- class GDK_INTERP_TYPE_ENUM
