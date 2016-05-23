-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_PATTERN_TYPE_T_ENUM

-- Wrapper of enum _cairo_pattern_type defined in file /usr/include/cairo/cairo.h line 2795
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = linear_low_level)  or else
				(a_value = mesh_low_level)  or else
				(a_value = radial_low_level)  or else
				(a_value = raster_source_low_level)  or else
				(a_value = solid_low_level)  or else
				(a_value = surface_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_linear
               do
                       value := linear_low_level
               end

	set_mesh
               do
                       value := mesh_low_level
               end

	set_radial
               do
                       value := radial_low_level
               end

	set_raster_source
               do
                       value := raster_source_low_level
               end

	set_solid
               do
                       value := solid_low_level
               end

	set_surface
               do
                       value := surface_low_level
               end

feature {ANY} -- Queries
       is_linear: BOOLEAN
               do
                       Result := (value=linear_low_level)
               end

       is_mesh: BOOLEAN
               do
                       Result := (value=mesh_low_level)
               end

       is_radial: BOOLEAN
               do
                       Result := (value=radial_low_level)
               end

       is_raster_source: BOOLEAN
               do
                       Result := (value=raster_source_low_level)
               end

       is_solid: BOOLEAN
               do
                       Result := (value=solid_low_level)
               end

       is_surface: BOOLEAN
               do
                       Result := (value=surface_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     linear_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATTERN_TYPE_LINEAR"
                       }"
               end

     mesh_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATTERN_TYPE_MESH"
                       }"
               end

     radial_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATTERN_TYPE_RADIAL"
                       }"
               end

     raster_source_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATTERN_TYPE_RASTER_SOURCE"
                       }"
               end

     solid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATTERN_TYPE_SOLID"
                       }"
               end

     surface_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATTERN_TYPE_SURFACE"
                       }"
               end


end -- class CAIRO_PATTERN_TYPE_T_ENUM
