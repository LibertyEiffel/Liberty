-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKBUILDERERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_builder_error_duplicate_id_low_level)  or else
				(a_value = gtk_builder_error_invalid_attribute_low_level)  or else
				(a_value = gtk_builder_error_invalid_tag_low_level)  or else
				(a_value = gtk_builder_error_invalid_type_function_low_level)  or else
				(a_value = gtk_builder_error_invalid_value_low_level)  or else
				(a_value = gtk_builder_error_missing_attribute_low_level)  or else
				(a_value = gtk_builder_error_missing_property_value_low_level)  or else
				(a_value = gtk_builder_error_unhandled_tag_low_level)  or else
				(a_value = gtk_builder_error_version_mismatch_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_builder_error_duplicate_id is
		do
			value := gtk_builder_error_duplicate_id_low_level
		end

	set_gtk_builder_error_invalid_attribute is
		do
			value := gtk_builder_error_invalid_attribute_low_level
		end

	set_gtk_builder_error_invalid_tag is
		do
			value := gtk_builder_error_invalid_tag_low_level
		end

	set_gtk_builder_error_invalid_type_function is
		do
			value := gtk_builder_error_invalid_type_function_low_level
		end

	set_gtk_builder_error_invalid_value is
		do
			value := gtk_builder_error_invalid_value_low_level
		end

	set_gtk_builder_error_missing_attribute is
		do
			value := gtk_builder_error_missing_attribute_low_level
		end

	set_gtk_builder_error_missing_property_value is
		do
			value := gtk_builder_error_missing_property_value_low_level
		end

	set_gtk_builder_error_unhandled_tag is
		do
			value := gtk_builder_error_unhandled_tag_low_level
		end

	set_gtk_builder_error_version_mismatch is
		do
			value := gtk_builder_error_version_mismatch_low_level
		end

feature {ANY} -- Queries
	is_gtk_builder_error_duplicate_id: BOOLEAN is
		do
			Result := (value=gtk_builder_error_duplicate_id_low_level)
		end

	is_gtk_builder_error_invalid_attribute: BOOLEAN is
		do
			Result := (value=gtk_builder_error_invalid_attribute_low_level)
		end

	is_gtk_builder_error_invalid_tag: BOOLEAN is
		do
			Result := (value=gtk_builder_error_invalid_tag_low_level)
		end

	is_gtk_builder_error_invalid_type_function: BOOLEAN is
		do
			Result := (value=gtk_builder_error_invalid_type_function_low_level)
		end

	is_gtk_builder_error_invalid_value: BOOLEAN is
		do
			Result := (value=gtk_builder_error_invalid_value_low_level)
		end

	is_gtk_builder_error_missing_attribute: BOOLEAN is
		do
			Result := (value=gtk_builder_error_missing_attribute_low_level)
		end

	is_gtk_builder_error_missing_property_value: BOOLEAN is
		do
			Result := (value=gtk_builder_error_missing_property_value_low_level)
		end

	is_gtk_builder_error_unhandled_tag: BOOLEAN is
		do
			Result := (value=gtk_builder_error_unhandled_tag_low_level)
		end

	is_gtk_builder_error_version_mismatch: BOOLEAN is
		do
			Result := (value=gtk_builder_error_version_mismatch_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_builder_error_duplicate_id_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_DUPLICATE_ID"
 			}"
 		end

	gtk_builder_error_invalid_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_ATTRIBUTE"
 			}"
 		end

	gtk_builder_error_invalid_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_TAG"
 			}"
 		end

	gtk_builder_error_invalid_type_function_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_TYPE_FUNCTION"
 			}"
 		end

	gtk_builder_error_invalid_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_INVALID_VALUE"
 			}"
 		end

	gtk_builder_error_missing_attribute_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_MISSING_ATTRIBUTE"
 			}"
 		end

	gtk_builder_error_missing_property_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_MISSING_PROPERTY_VALUE"
 			}"
 		end

	gtk_builder_error_unhandled_tag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_UNHANDLED_TAG"
 			}"
 		end

	gtk_builder_error_version_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_BUILDER_ERROR_VERSION_MISMATCH"
 			}"
 		end


end -- class GTKBUILDERERROR_ENUM
