-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ACCEL_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = visible_low_level)  or else
				(a_value = locked_low_level)  or else
				(a_value = mask_low_level) )
		end

feature -- Setters
	default_create,
	set_visible is
		do
			value := visible_low_level
		end

	set_locked is
		do
			value := locked_low_level
		end

	set_mask is
		do
			value := mask_low_level
		end

feature -- Queries
	visible: BOOLEAN is
		do
			Result := (value=visible_low_level)
		end

	locked: BOOLEAN is
		do
			Result := (value=locked_low_level)
		end

	mask: BOOLEAN is
		do
			Result := (value=mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	visible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ACCEL_VISIBLE"
 			}"
 		end

	locked_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ACCEL_LOCKED"
 			}"
 		end

	mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ACCEL_MASK"
 			}"
 		end


end -- class GTK_ACCEL_FLAGS_ENUM
