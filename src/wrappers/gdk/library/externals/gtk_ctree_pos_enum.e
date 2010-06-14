-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CTREE_POS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = before_low_level)  or else
				(a_value = as_child_low_level)  or else
				(a_value = after_low_level) )
		end

feature -- Setters
	default_create,
	set_before is
		do
			value := before_low_level
		end

	set_as_child is
		do
			value := as_child_low_level
		end

	set_after is
		do
			value := after_low_level
		end

feature -- Queries
	is_before: BOOLEAN is
		do
			Result := (value=before_low_level)
		end

	is_as_child: BOOLEAN is
		do
			Result := (value=as_child_low_level)
		end

	is_after: BOOLEAN is
		do
			Result := (value=after_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	before_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_POS_BEFORE"
 			}"
 		end

	as_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_POS_AS_CHILD"
 			}"
 		end

	after_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_POS_AFTER"
 			}"
 		end


end -- class GTK_CTREE_POS_ENUM
