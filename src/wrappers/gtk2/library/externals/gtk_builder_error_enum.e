-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_BUILDER_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_type_function_low_level)  or else
				(a_value = unhandled_tag_low_level)  or else
				(a_value = missing_attribute_low_level)  or else
				(a_value = invalid_attribute_low_level)  or else
				(a_value = invalid_tag_low_level)  or else
				(a_value = missing_property_value_low_level)  or else
				(a_value = invalid_value_low_level)  or else
				(a_value = version_mismatch_low_level)  or else
				(a_value = duplicate_id_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid_type_function is
		do
			value := invalid_type_function_low_level
		end

	set_unhandled_tag is
		do
			value := unhandled_tag_low_level
		end

	set_missing_attribute is
		do
			value := missing_attribute_low_level
		end

	set_invalid_attribute is
		do
			value := invalid_attribute_low_level
		end

	set_invalid_tag is
		do
			value := invalid_tag_low_level
		end

	set_missing_property_value is
		do
			value := missing_property_value_low_level
		end

	set_invalid_value is
		do
			value := invalid_value_low_level
		end

	set_version_mismatch is
		do
			value := version_mismatch_low_level
		end

	set_duplicate_id is
		do
			value := duplicate_id_low_level
		end

feature -- Queries
	invalid_type_function: BOOLEAN is
		do
			Result := (value=invalid_type_function_low_level)
		end

	unhandled_tag: BOOLEAN is
		do
			Result := (value=unhandled_tag_low_level)
		end

	missing_attribute: BOOLEAN is
		do
			Result := (value=missing_attribute_low_level)
		end

	invalid_attribute: BOOLEAN is
		do
			Result := (value=invalid_attribute_low_level)
		end

	invalid_tag: BOOLEAN is
		do
			Result := (value=invalid_tag_low_level)
		end

	missing_property_value: BOOLEAN is
		do
			Result := (value=missing_property_value_low_level)
		end

	invalid_value: BOOLEAN is
		do
			Result := (value=invalid_value_low_level)
		end

	version_mismatch: BOOLEAN is
		do
			Result := (value=version_mismatch_low_level)
		end

	duplicate_id: BOOLEAN is
		do
			Result := (value=duplicate_id_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_type_function_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION"
 			}"
 		end

	unhandled_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_UNHANDLED_TAG"
 			}"
 		end

	missing_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_MISSING_ATTRIBUTE"
 			}"
 		end

	invalid_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_ATTRIBUTE"
 			}"
 		end

	invalid_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_TAG"
 			}"
 		end

	missing_property_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE"
 			}"
 		end

	invalid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_VALUE"
 			}"
 		end

	version_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_VERSION_MISMATCH"
 			}"
 		end

	duplicate_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_DUPLICATE_ID"
 			}"
 		end


end -- class GTK_BUILDER_ERROR_ENUM
