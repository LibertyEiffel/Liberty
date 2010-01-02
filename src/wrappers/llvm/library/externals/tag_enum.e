-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TAG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = notag_low_level)  or else
				(a_value = tagtwo_low_level)  or else
				(a_value = tagthree_low_level) )
		end

feature -- Setters
	default_create,
	set_notag is
		do
			value := notag_low_level
		end

	set_tagtwo is
		do
			value := tagtwo_low_level
		end

	set_tagthree is
		do
			value := tagthree_low_level
		end

feature -- Queries
	is_notag: BOOLEAN is
		do
			Result := (value=notag_low_level)
		end

	is_tagtwo: BOOLEAN is
		do
			Result := (value=tagtwo_low_level)
		end

	is_tagthree: BOOLEAN is
		do
			Result := (value=tagthree_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	notag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "noTag"
 			}"
 		end

	tagtwo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "tagTwo"
 			}"
 		end

	tagthree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "tagThree"
 			}"
 		end


end -- class TAG_ENUM
