-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SELECTION_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = single_low_level)  or else
				(a_value = browse_low_level)  or else
				(a_value = multiple_low_level)  or else
				(a_value = extended_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_single is
		do
			value := single_low_level
		end

	set_browse is
		do
			value := browse_low_level
		end

	set_multiple is
		do
			value := multiple_low_level
		end

	set_extended is
		do
			value := extended_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_single: BOOLEAN is
		do
			Result := (value=single_low_level)
		end

	is_browse: BOOLEAN is
		do
			Result := (value=browse_low_level)
		end

	is_multiple: BOOLEAN is
		do
			Result := (value=multiple_low_level)
		end

	is_extended: BOOLEAN is
		do
			Result := (value=extended_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_NONE"
 			}"
 		end

	single_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_SINGLE"
 			}"
 		end

	browse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_BROWSE"
 			}"
 		end

	multiple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_MULTIPLE"
 			}"
 		end

	extended_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SELECTION_EXTENDED"
 			}"
 		end


end -- class GTK_SELECTION_MODE_ENUM
