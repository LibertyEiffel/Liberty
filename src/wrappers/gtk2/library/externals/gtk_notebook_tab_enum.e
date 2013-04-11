-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_NOTEBOOK_TAB_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = first_low_level)  or else
				(a_value = last_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_first is
		do
			value := first_low_level
		end

	set_last is
		do
			value := last_low_level
		end

feature {ANY} -- Queries
	first: BOOLEAN is
		do
			Result := (value=first_low_level)
		end

	last: BOOLEAN is
		do
			Result := (value=last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	first_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NOTEBOOK_TAB_FIRST"
 			}"
 		end

	last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_NOTEBOOK_TAB_LAST"
 			}"
 		end


end -- class GTK_NOTEBOOK_TAB_ENUM
