-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ENTRY_ICON_POSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = primary_low_level)  or else
				(a_value = secondary_low_level) )
		end

feature -- Setters
	default_create,
	set_primary is
		do
			value := primary_low_level
		end

	set_secondary is
		do
			value := secondary_low_level
		end

feature -- Queries
	is_primary: BOOLEAN is
		do
			Result := (value=primary_low_level)
		end

	is_secondary: BOOLEAN is
		do
			Result := (value=secondary_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	primary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ENTRY_ICON_PRIMARY"
 			}"
 		end

	secondary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ENTRY_ICON_SECONDARY"
 			}"
 		end


end -- class GTK_ENTRY_ICON_POSITION_ENUM
