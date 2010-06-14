-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CLIST_DRAG_POS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = before_low_level)  or else
				(a_value = into_low_level)  or else
				(a_value = after_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_before is
		do
			value := before_low_level
		end

	set_into is
		do
			value := into_low_level
		end

	set_after is
		do
			value := after_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_before: BOOLEAN is
		do
			Result := (value=before_low_level)
		end

	is_into: BOOLEAN is
		do
			Result := (value=into_low_level)
		end

	is_after: BOOLEAN is
		do
			Result := (value=after_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CLIST_DRAG_NONE"
 			}"
 		end

	before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CLIST_DRAG_BEFORE"
 			}"
 		end

	into_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CLIST_DRAG_INTO"
 			}"
 		end

	after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CLIST_DRAG_AFTER"
 			}"
 		end


end -- class GTK_CLIST_DRAG_POS_ENUM
