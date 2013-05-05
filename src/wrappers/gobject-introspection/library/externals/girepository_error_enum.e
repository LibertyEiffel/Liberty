-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIREPOSITORY_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_irepository_error_library_not_found_low_level)  or else
				(a_value = g_irepository_error_namespace_mismatch_low_level)  or else
				(a_value = g_irepository_error_namespace_version_conflict_low_level)  or else
				(a_value = g_irepository_error_typelib_not_found_low_level) )
		end

feature -- Setters
	default_create,
	set_g_irepository_error_library_not_found is
		do
			value := g_irepository_error_library_not_found_low_level
		end

	set_g_irepository_error_namespace_mismatch is
		do
			value := g_irepository_error_namespace_mismatch_low_level
		end

	set_g_irepository_error_namespace_version_conflict is
		do
			value := g_irepository_error_namespace_version_conflict_low_level
		end

	set_g_irepository_error_typelib_not_found is
		do
			value := g_irepository_error_typelib_not_found_low_level
		end

feature -- Queries
	is_g_irepository_error_library_not_found: BOOLEAN is
		do
			Result := (value=g_irepository_error_library_not_found_low_level)
		end

	is_g_irepository_error_namespace_mismatch: BOOLEAN is
		do
			Result := (value=g_irepository_error_namespace_mismatch_low_level)
		end

	is_g_irepository_error_namespace_version_conflict: BOOLEAN is
		do
			Result := (value=g_irepository_error_namespace_version_conflict_low_level)
		end

	is_g_irepository_error_typelib_not_found: BOOLEAN is
		do
			Result := (value=g_irepository_error_typelib_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_irepository_error_library_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND"
 			}"
 		end

	g_irepository_error_namespace_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH"
 			}"
 		end

	g_irepository_error_namespace_version_conflict_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT"
 			}"
 		end

	g_irepository_error_typelib_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND"
 			}"
 		end


end -- class GIREPOSITORY_ERROR_ENUM
