-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class CAIRO_SURFACE_OBSERVER_MODE_T_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = normal_low_level)  or else
				(a_value = record_operations_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_normal is
		do
			value := normal_low_level
		end

	set_record_operations is
		do
			value := record_operations_low_level
		end

feature {ANY} -- Queries
	normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	record_operations: BOOLEAN is
		do
			Result := (value=record_operations_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CAIRO_SURFACE_OBSERVER_NORMAL"
 			}"
 		end

	record_operations_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CAIRO_SURFACE_OBSERVER_RECORD_OPERATIONS"
 			}"
 		end


end -- class CAIRO_SURFACE_OBSERVER_MODE_T_ENUM
