-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CAIRO_SURFACE_OBSERVER_MODE_T_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = cairo_surface_observer_normal_low_level)  or else
				(a_value = cairo_surface_observer_record_operations_low_level) )
		end

feature -- Setters
	default_create,
	set_cairo_surface_observer_normal is
		do
			value := cairo_surface_observer_normal_low_level
		end

	set_cairo_surface_observer_record_operations is
		do
			value := cairo_surface_observer_record_operations_low_level
		end

feature -- Queries
	is_cairo_surface_observer_normal: BOOLEAN is
		do
			Result := (value=cairo_surface_observer_normal_low_level)
		end

	is_cairo_surface_observer_record_operations: BOOLEAN is
		do
			Result := (value=cairo_surface_observer_record_operations_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	cairo_surface_observer_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CAIRO_SURFACE_OBSERVER_NORMAL"
 			}"
 		end

	cairo_surface_observer_record_operations_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS"
 			}"
 		end


end -- class CAIRO_SURFACE_OBSERVER_MODE_T_ENUM
