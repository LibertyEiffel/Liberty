-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_FONT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = t_low_level)  or else
				(a_value = tset_low_level) )
		end

feature -- Setters
	default_create,
	set_t is
		do
			value := t_low_level
		end

	set_tset is
		do
			value := tset_low_level
		end

feature -- Queries
	is_t: BOOLEAN is
		do
			Result := (value=t_low_level)
		end

	is_tset: BOOLEAN is
		do
			Result := (value=tset_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	t_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FONT_FONT"
 			}"
 		end

	tset_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FONT_FONTSET"
 			}"
 		end


end -- class GDK_FONT_TYPE_ENUM
