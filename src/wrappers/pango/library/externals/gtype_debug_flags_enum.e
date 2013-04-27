-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTYPE_DEBUG_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = objects_low_level)  or else
				(a_value = signals_low_level)  or else
				(a_value = mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_objects is
		do
			value := objects_low_level
		end

	set_signals is
		do
			value := signals_low_level
		end

	set_mask is
		do
			value := mask_low_level
		end

feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_objects: BOOLEAN is
		do
			Result := (value=objects_low_level)
		end

	is_signals: BOOLEAN is
		do
			Result := (value=signals_low_level)
		end

	is_mask: BOOLEAN is
		do
			Result := (value=mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TYPE_DEBUG_NONE"
 			}"
 		end

	objects_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TYPE_DEBUG_OBJECTS"
 			}"
 		end

	signals_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TYPE_DEBUG_SIGNALS"
 			}"
 		end

	mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TYPE_DEBUG_MASK"
 			}"
 		end


end -- class GTYPE_DEBUG_FLAGS_ENUM
