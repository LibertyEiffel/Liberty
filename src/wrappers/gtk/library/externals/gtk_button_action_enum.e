-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_BUTTON_ACTION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = ignored_low_level)  or else
				(a_value = selects_low_level)  or else
				(a_value = drags_low_level)  or else
				(a_value = expands_low_level) )
		end

feature -- Setters
	default_create,
	set_ignored is
		do
			value := ignored_low_level
		end

	set_selects is
		do
			value := selects_low_level
		end

	set_drags is
		do
			value := drags_low_level
		end

	set_expands is
		do
			value := expands_low_level
		end

feature -- Queries
	is_ignored: BOOLEAN is
		do
			Result := (value=ignored_low_level)
		end

	is_selects: BOOLEAN is
		do
			Result := (value=selects_low_level)
		end

	is_drags: BOOLEAN is
		do
			Result := (value=drags_low_level)
		end

	is_expands: BOOLEAN is
		do
			Result := (value=expands_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	ignored_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTON_IGNORED"
 			}"
 		end

	selects_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTON_SELECTS"
 			}"
 		end

	drags_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTON_DRAGS"
 			}"
 		end

	expands_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUTTON_EXPANDS"
 			}"
 		end


end -- class GTK_BUTTON_ACTION_ENUM
