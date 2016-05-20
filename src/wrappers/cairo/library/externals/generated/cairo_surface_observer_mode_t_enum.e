-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_SURFACE_OBSERVER_MODE_T_ENUM

-- Wrapper of enum cairo_surface_observer_mode_t defined in file /usr/include/cairo/cairo.h line 2223
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = normal_low_level)  or else
				(a_value = record_operations_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_normal
               do
                       value := normal_low_level
               end

	set_record_operations
               do
                       value := record_operations_low_level
               end

feature {ANY} -- Queries
       is_normal: BOOLEAN
               do
                       Result := (value=normal_low_level)
               end

       is_record_operations: BOOLEAN
               do
                       Result := (value=record_operations_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     normal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_OBSERVER_NORMAL"
                       }"
               end

     record_operations_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS"
                       }"
               end


end -- class CAIRO_SURFACE_OBSERVER_MODE_T_ENUM
