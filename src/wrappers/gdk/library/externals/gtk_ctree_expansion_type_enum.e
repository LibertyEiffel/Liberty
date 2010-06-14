-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CTREE_EXPANSION_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = expand_low_level)  or else
				(a_value = expand_recursive_low_level)  or else
				(a_value = collapse_low_level)  or else
				(a_value = collapse_recursive_low_level)  or else
				(a_value = toggle_low_level)  or else
				(a_value = toggle_recursive_low_level) )
		end

feature -- Setters
	default_create,
	set_expand is
		do
			value := expand_low_level
		end

	set_expand_recursive is
		do
			value := expand_recursive_low_level
		end

	set_collapse is
		do
			value := collapse_low_level
		end

	set_collapse_recursive is
		do
			value := collapse_recursive_low_level
		end

	set_toggle is
		do
			value := toggle_low_level
		end

	set_toggle_recursive is
		do
			value := toggle_recursive_low_level
		end

feature -- Queries
	is_expand: BOOLEAN is
		do
			Result := (value=expand_low_level)
		end

	is_expand_recursive: BOOLEAN is
		do
			Result := (value=expand_recursive_low_level)
		end

	is_collapse: BOOLEAN is
		do
			Result := (value=collapse_low_level)
		end

	is_collapse_recursive: BOOLEAN is
		do
			Result := (value=collapse_recursive_low_level)
		end

	is_toggle: BOOLEAN is
		do
			Result := (value=toggle_low_level)
		end

	is_toggle_recursive: BOOLEAN is
		do
			Result := (value=toggle_recursive_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	expand_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANSION_EXPAND"
 			}"
 		end

	expand_recursive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANSION_EXPAND_RECURSIVE"
 			}"
 		end

	collapse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANSION_COLLAPSE"
 			}"
 		end

	collapse_recursive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANSION_COLLAPSE_RECURSIVE"
 			}"
 		end

	toggle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANSION_TOGGLE"
 			}"
 		end

	toggle_recursive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANSION_TOGGLE_RECURSIVE"
 			}"
 		end


end -- class GTK_CTREE_EXPANSION_TYPE_ENUM
