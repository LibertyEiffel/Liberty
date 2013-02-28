-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DEST_DEFAULTS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = motion_low_level)  or else
				(a_value = highlight_low_level)  or else
				(a_value = drop_low_level)  or else
				(a_value = all_low_level) )
		end

feature -- Setters
	default_create,
	set_motion is
		do
			value := motion_low_level
		end

	set_highlight is
		do
			value := highlight_low_level
		end

	set_drop is
		do
			value := drop_low_level
		end

	set_all is
		do
			value := all_low_level
		end

feature -- Queries
	motion: BOOLEAN is
		do
			Result := (value=motion_low_level)
		end

	highlight: BOOLEAN is
		do
			Result := (value=highlight_low_level)
		end

	drop: BOOLEAN is
		do
			Result := (value=drop_low_level)
		end

	all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	motion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_MOTION"
 			}"
 		end

	highlight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_HIGHLIGHT"
 			}"
 		end

	drop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_DROP"
 			}"
 		end

	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_ALL"
 			}"
 		end


end -- class GTK_DEST_DEFAULTS_ENUM
