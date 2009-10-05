-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class VISIBILITY_TYPES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_visibility_low_level)  or else
				(a_value = protected_visibility_low_level) )
		end

feature -- Setters
	default_create,
	set_default_visibility is
		do
			value := default_visibility_low_level
		end

	set_protected_visibility is
		do
			value := protected_visibility_low_level
		end

feature -- Queries
	is_default_visibility: BOOLEAN is
		do
			Result := (value=default_visibility_low_level)
		end

	is_protected_visibility: BOOLEAN is
		do
			Result := (value=protected_visibility_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "DefaultVisibility"
 			}"
 		end

	protected_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "ProtectedVisibility"
 			}"
 		end


end -- class VISIBILITY_TYPES_ENUM
