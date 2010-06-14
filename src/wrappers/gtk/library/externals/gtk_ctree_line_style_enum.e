-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CTREE_LINE_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = solid_low_level)  or else
				(a_value = dotted_low_level)  or else
				(a_value = tabbed_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_solid is
		do
			value := solid_low_level
		end

	set_dotted is
		do
			value := dotted_low_level
		end

	set_tabbed is
		do
			value := tabbed_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_solid: BOOLEAN is
		do
			Result := (value=solid_low_level)
		end

	is_dotted: BOOLEAN is
		do
			Result := (value=dotted_low_level)
		end

	is_tabbed: BOOLEAN is
		do
			Result := (value=tabbed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_LINES_NONE"
 			}"
 		end

	solid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_LINES_SOLID"
 			}"
 		end

	dotted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_LINES_DOTTED"
 			}"
 		end

	tabbed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_LINES_TABBED"
 			}"
 		end


end -- class GTK_CTREE_LINE_STYLE_ENUM
