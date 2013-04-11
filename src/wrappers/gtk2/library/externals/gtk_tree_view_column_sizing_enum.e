-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TREE_VIEW_COLUMN_SIZING_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = grow_only_low_level)  or else
				(a_value = autosize_low_level)  or else
				(a_value = fixed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_grow_only is
		do
			value := grow_only_low_level
		end

	set_autosize is
		do
			value := autosize_low_level
		end

	set_fixed is
		do
			value := fixed_low_level
		end

feature {ANY} -- Queries
	grow_only: BOOLEAN is
		do
			Result := (value=grow_only_low_level)
		end

	autosize: BOOLEAN is
		do
			Result := (value=autosize_low_level)
		end

	fixed: BOOLEAN is
		do
			Result := (value=fixed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	grow_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_COLUMN_GROW_ONLY"
 			}"
 		end

	autosize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_COLUMN_AUTOSIZE"
 			}"
 		end

	fixed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_COLUMN_FIXED"
 			}"
 		end


end -- class GTK_TREE_VIEW_COLUMN_SIZING_ENUM
