-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_REGION_OVERLAP_T_ENUM

-- Wrapper of enum _cairo_region_overlap defined in file /usr/include/cairo/cairo.h line 3062
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = in_low_level)  or else
				(a_value = out_external_low_level)  or else
				(a_value = part_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_in
               do
                       value := in_low_level
               end

	set_out_external
               do
                       value := out_external_low_level
               end

	set_part
               do
                       value := part_low_level
               end

feature {ANY} -- Queries
       is_in: BOOLEAN
               do
                       Result := (value=in_low_level)
               end

       is_out_external: BOOLEAN
               do
                       Result := (value=out_external_low_level)
               end

       is_part: BOOLEAN
               do
                       Result := (value=part_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     in_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_REGION_OVERLAP_IN"
                       }"
               end

     out_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_REGION_OVERLAP_OUT"
                       }"
               end

     part_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_REGION_OVERLAP_PART"
                       }"
               end


end -- class CAIRO_REGION_OVERLAP_T_ENUM
