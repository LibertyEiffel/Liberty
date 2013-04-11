-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TAG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = no_tag_low_level)  or else
				(a_value = tag_one_low_level)  or else
				(a_value = tag_two_low_level)  or else
				(a_value = tag_three_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_no_tag is
		do
			value := no_tag_low_level
		end

	set_tag_one is
		do
			value := tag_one_low_level
		end

	set_tag_two is
		do
			value := tag_two_low_level
		end

	set_tag_three is
		do
			value := tag_three_low_level
		end

feature {ANY} -- Queries
	no_tag: BOOLEAN is
		do
			Result := (value=no_tag_low_level)
		end

	tag_one: BOOLEAN is
		do
			Result := (value=tag_one_low_level)
		end

	tag_two: BOOLEAN is
		do
			Result := (value=tag_two_low_level)
		end

	tag_three: BOOLEAN is
		do
			Result := (value=tag_three_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	no_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "noTag"
 			}"
 		end

	tag_one_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "tagOne"
 			}"
 		end

	tag_two_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "tagTwo"
 			}"
 		end

	tag_three_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "tagThree"
 			}"
 		end


end -- class TAG_ENUM
