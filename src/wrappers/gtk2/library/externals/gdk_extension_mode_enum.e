-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_EXTENSION_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = all_low_level)  or else
				(a_value = cursor_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_all is
		do
			value := all_low_level
		end

	set_cursor is
		do
			value := cursor_low_level
		end

feature -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	cursor: BOOLEAN is
		do
			Result := (value=cursor_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXTENSION_EVENTS_NONE"
 			}"
 		end

	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXTENSION_EVENTS_ALL"
 			}"
 		end

	cursor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXTENSION_EVENTS_CURSOR"
 			}"
 		end


end -- class GDK_EXTENSION_MODE_ENUM
