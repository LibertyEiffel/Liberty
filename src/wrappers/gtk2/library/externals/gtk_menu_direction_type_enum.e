-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_MENU_DIRECTION_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = parent_low_level)  or else
				(a_value = child_low_level)  or else
				(a_value = next_low_level)  or else
				(a_value = prev_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_parent is
		do
			value := parent_low_level
		end

	set_child is
		do
			value := child_low_level
		end

	set_next is
		do
			value := next_low_level
		end

	set_prev is
		do
			value := prev_low_level
		end

feature {ANY} -- Queries
	parent: BOOLEAN is
		do
			Result := (value=parent_low_level)
		end

	child: BOOLEAN is
		do
			Result := (value=child_low_level)
		end

	next: BOOLEAN is
		do
			Result := (value=next_low_level)
		end

	prev: BOOLEAN is
		do
			Result := (value=prev_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_PARENT"
 			}"
 		end

	child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_CHILD"
 			}"
 		end

	next_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_NEXT"
 			}"
 		end

	prev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_PREV"
 			}"
 		end


end -- class GTK_MENU_DIRECTION_TYPE_ENUM
