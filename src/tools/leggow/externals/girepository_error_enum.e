-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIREPOSITORY_ERROR_ENUM

-- Wrapper of enum GIRepositoryError defined in file /usr/include/gobject-introspection-1.0/girepository.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = library_not_found_low_level)  or else
				(a_value = namespace_mismatch_low_level)  or else
				(a_value = namespace_version_conflict_low_level)  or else
				(a_value = typelib_not_found_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_library_not_found
               do
                       value := library_not_found_low_level
               end

	set_namespace_mismatch
               do
                       value := namespace_mismatch_low_level
               end

	set_namespace_version_conflict
               do
                       value := namespace_version_conflict_low_level
               end

	set_typelib_not_found
               do
                       value := typelib_not_found_low_level
               end

feature {ANY} -- Queries
       is_library_not_found: BOOLEAN
               do
                       Result := (value=library_not_found_low_level)
               end

       is_namespace_mismatch: BOOLEAN
               do
                       Result := (value=namespace_mismatch_low_level)
               end

       is_namespace_version_conflict: BOOLEAN
               do
                       Result := (value=namespace_version_conflict_low_level)
               end

       is_typelib_not_found: BOOLEAN
               do
                       Result := (value=typelib_not_found_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     library_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IREPOSITORY_ERROR_LIBRARY_NOT_FOUND"
                       }"
               end

     namespace_mismatch_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IREPOSITORY_ERROR_NAMESPACE_MISMATCH"
                       }"
               end

     namespace_version_conflict_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IREPOSITORY_ERROR_NAMESPACE_VERSION_CONFLICT"
                       }"
               end

     typelib_not_found_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IREPOSITORY_ERROR_TYPELIB_NOT_FOUND"
                       }"
               end


end -- class GIREPOSITORY_ERROR_ENUM
