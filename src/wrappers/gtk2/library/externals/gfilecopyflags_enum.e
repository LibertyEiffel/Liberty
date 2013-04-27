-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILECOPYFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_copy_all_metadata_low_level)  or else
				(a_value = g_file_copy_backup_low_level)  or else
				(a_value = g_file_copy_no_fallback_for_move_low_level)  or else
				(a_value = g_file_copy_nofollow_symlinks_low_level)  or else
				(a_value = g_file_copy_none_low_level)  or else
				(a_value = g_file_copy_overwrite_low_level)  or else
				(a_value = g_file_copy_target_default_perms_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_file_copy_all_metadata is
		do
			value := g_file_copy_all_metadata_low_level
		end

	set_g_file_copy_backup is
		do
			value := g_file_copy_backup_low_level
		end

	set_g_file_copy_no_fallback_for_move is
		do
			value := g_file_copy_no_fallback_for_move_low_level
		end

	set_g_file_copy_nofollow_symlinks is
		do
			value := g_file_copy_nofollow_symlinks_low_level
		end

	set_g_file_copy_none is
		do
			value := g_file_copy_none_low_level
		end

	set_g_file_copy_overwrite is
		do
			value := g_file_copy_overwrite_low_level
		end

	set_g_file_copy_target_default_perms is
		do
			value := g_file_copy_target_default_perms_low_level
		end

feature {ANY} -- Queries
	is_g_file_copy_all_metadata: BOOLEAN is
		do
			Result := (value=g_file_copy_all_metadata_low_level)
		end

	is_g_file_copy_backup: BOOLEAN is
		do
			Result := (value=g_file_copy_backup_low_level)
		end

	is_g_file_copy_no_fallback_for_move: BOOLEAN is
		do
			Result := (value=g_file_copy_no_fallback_for_move_low_level)
		end

	is_g_file_copy_nofollow_symlinks: BOOLEAN is
		do
			Result := (value=g_file_copy_nofollow_symlinks_low_level)
		end

	is_g_file_copy_none: BOOLEAN is
		do
			Result := (value=g_file_copy_none_low_level)
		end

	is_g_file_copy_overwrite: BOOLEAN is
		do
			Result := (value=g_file_copy_overwrite_low_level)
		end

	is_g_file_copy_target_default_perms: BOOLEAN is
		do
			Result := (value=g_file_copy_target_default_perms_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_copy_all_metadata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_ALL_METADATA"
 			}"
 		end

	g_file_copy_backup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_BACKUP"
 			}"
 		end

	g_file_copy_no_fallback_for_move_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_NO_FALLBACK_FOR_MOVE"
 			}"
 		end

	g_file_copy_nofollow_symlinks_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_NOFOLLOW_SYMLINKS"
 			}"
 		end

	g_file_copy_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_NONE"
 			}"
 		end

	g_file_copy_overwrite_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_OVERWRITE"
 			}"
 		end

	g_file_copy_target_default_perms_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_COPY_TARGET_DEFAULT_PERMS"
 			}"
 		end


end -- class GFILECOPYFLAGS_ENUM
