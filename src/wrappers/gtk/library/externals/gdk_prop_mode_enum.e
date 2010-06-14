-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PROP_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = replace_low_level)  or else
				(a_value = prepend_low_level)  or else
				(a_value = append_low_level) )
		end

feature -- Setters
	default_create,
	set_replace is
		do
			value := replace_low_level
		end

	set_prepend is
		do
			value := prepend_low_level
		end

	set_append is
		do
			value := append_low_level
		end

feature -- Queries
	is_replace: BOOLEAN is
		do
			Result := (value=replace_low_level)
		end

	is_prepend: BOOLEAN is
		do
			Result := (value=prepend_low_level)
		end

	is_append: BOOLEAN is
		do
			Result := (value=append_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROP_MODE_REPLACE"
 			}"
 		end

	prepend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROP_MODE_PREPEND"
 			}"
 		end

	append_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROP_MODE_APPEND"
 			}"
 		end


end -- class GDK_PROP_MODE_ENUM
