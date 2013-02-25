-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FILTER_RETURN_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = continue_low_level)  or else
				(a_value = translate_low_level)  or else
				(a_value = remove_low_level) )
		end

feature -- Setters
	default_create,
	set_continue is
		do
			value := continue_low_level
		end

	set_translate is
		do
			value := translate_low_level
		end

	set_remove is
		do
			value := remove_low_level
		end

feature -- Queries
	continue: BOOLEAN is
		do
			Result := (value=continue_low_level)
		end

	translate: BOOLEAN is
		do
			Result := (value=translate_low_level)
		end

	remove: BOOLEAN is
		do
			Result := (value=remove_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	continue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FILTER_CONTINUE"
 			}"
 		end

	translate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FILTER_TRANSLATE"
 			}"
 		end

	remove_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FILTER_REMOVE"
 			}"
 		end


end -- class GDK_FILTER_RETURN_ENUM
