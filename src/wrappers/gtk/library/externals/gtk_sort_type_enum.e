-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SORT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ascending_low_level)  or else
				(a_value = descending_low_level) )
		end

feature -- Setters
	default_create,
	set_ascending is
		do
			value := ascending_low_level
		end

	set_descending is
		do
			value := descending_low_level
		end

feature -- Queries
	is_ascending: BOOLEAN is
		do
			Result := (value=ascending_low_level)
		end

	is_descending: BOOLEAN is
		do
			Result := (value=descending_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ascending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SORT_ASCENDING"
 			}"
 		end

	descending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SORT_DESCENDING"
 			}"
 		end


end -- class GTK_SORT_TYPE_ENUM
