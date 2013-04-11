-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_SUBWINDOW_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = clip_by_children_low_level)  or else
				(a_value = include_inferiors_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_clip_by_children is
		do
			value := clip_by_children_low_level
		end

	set_include_inferiors is
		do
			value := include_inferiors_low_level
		end

feature {ANY} -- Queries
	clip_by_children: BOOLEAN is
		do
			Result := (value=clip_by_children_low_level)
		end

	include_inferiors: BOOLEAN is
		do
			Result := (value=include_inferiors_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	clip_by_children_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLIP_BY_CHILDREN"
 			}"
 		end

	include_inferiors_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_INCLUDE_INFERIORS"
 			}"
 		end


end -- class GDK_SUBWINDOW_MODE_ENUM
