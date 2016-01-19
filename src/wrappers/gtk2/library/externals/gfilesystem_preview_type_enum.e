-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILESYSTEM_PREVIEW_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_filesystem_preview_type_if_always_low_level)  or else
				(a_value = g_filesystem_preview_type_if_local_low_level)  or else
				(a_value = g_filesystem_preview_type_never_low_level) )
		end

feature -- Setters
	default_create,
	set_g_filesystem_preview_type_if_always is
		do
			value := g_filesystem_preview_type_if_always_low_level
		end

	set_g_filesystem_preview_type_if_local is
		do
			value := g_filesystem_preview_type_if_local_low_level
		end

	set_g_filesystem_preview_type_never is
		do
			value := g_filesystem_preview_type_never_low_level
		end

feature -- Queries
	is_g_filesystem_preview_type_if_always: BOOLEAN is
		do
			Result := (value=g_filesystem_preview_type_if_always_low_level)
		end

	is_g_filesystem_preview_type_if_local: BOOLEAN is
		do
			Result := (value=g_filesystem_preview_type_if_local_low_level)
		end

	is_g_filesystem_preview_type_never: BOOLEAN is
		do
			Result := (value=g_filesystem_preview_type_never_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_filesystem_preview_type_if_always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILESYSTEM_PREVIEW_TYPE_IF_ALWAYS"
 			}"
 		end

	g_filesystem_preview_type_if_local_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILESYSTEM_PREVIEW_TYPE_IF_LOCAL"
 			}"
 		end

	g_filesystem_preview_type_never_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILESYSTEM_PREVIEW_TYPE_NEVER"
 			}"
 		end


end -- class GFILESYSTEM_PREVIEW_TYPE_ENUM
