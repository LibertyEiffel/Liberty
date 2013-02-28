-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TREE_VIEW_DROP_POSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = before_low_level)  or else
				(a_value = after_low_level)  or else
				(a_value = into_or_before_low_level)  or else
				(a_value = into_or_after_low_level) )
		end

feature -- Setters
	default_create,
	set_before is
		do
			value := before_low_level
		end

	set_after is
		do
			value := after_low_level
		end

	set_into_or_before is
		do
			value := into_or_before_low_level
		end

	set_into_or_after is
		do
			value := into_or_after_low_level
		end

feature -- Queries
	before: BOOLEAN is
		do
			Result := (value=before_low_level)
		end

	after: BOOLEAN is
		do
			Result := (value=after_low_level)
		end

	into_or_before: BOOLEAN is
		do
			Result := (value=into_or_before_low_level)
		end

	into_or_after: BOOLEAN is
		do
			Result := (value=into_or_after_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_BEFORE"
 			}"
 		end

	after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_AFTER"
 			}"
 		end

	into_or_before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_INTO_OR_BEFORE"
 			}"
 		end

	into_or_after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_DROP_INTO_OR_AFTER"
 			}"
 		end


end -- class GTK_TREE_VIEW_DROP_POSITION_ENUM
