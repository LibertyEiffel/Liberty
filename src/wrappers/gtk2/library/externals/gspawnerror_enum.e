-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSPAWNERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_spawn_error_2big_low_level)  or else
				(a_value = g_spawn_error_acces_low_level)  or else
				(a_value = g_spawn_error_chdir_low_level)  or else
				(a_value = g_spawn_error_failed_low_level)  or else
				(a_value = g_spawn_error_fork_low_level)  or else
				(a_value = g_spawn_error_inval_low_level)  or else
				(a_value = g_spawn_error_io_low_level)  or else
				(a_value = g_spawn_error_isdir_low_level)  or else
				(a_value = g_spawn_error_libbad_low_level)  or else
				(a_value = g_spawn_error_loop_low_level)  or else
				(a_value = g_spawn_error_mfile_low_level)  or else
				(a_value = g_spawn_error_nametoolong_low_level)  or else
				(a_value = g_spawn_error_nfile_low_level)  or else
				(a_value = g_spawn_error_noent_low_level)  or else
				(a_value = g_spawn_error_noexec_low_level)  or else
				(a_value = g_spawn_error_nomem_low_level)  or else
				(a_value = g_spawn_error_notdir_low_level)  or else
				(a_value = g_spawn_error_perm_low_level)  or else
				(a_value = g_spawn_error_read_low_level)  or else
				(a_value = g_spawn_error_too_big_low_level)  or else
				(a_value = g_spawn_error_txtbusy_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_spawn_error_2big is
		do
			value := g_spawn_error_2big_low_level
		end

	set_g_spawn_error_acces is
		do
			value := g_spawn_error_acces_low_level
		end

	set_g_spawn_error_chdir is
		do
			value := g_spawn_error_chdir_low_level
		end

	set_g_spawn_error_failed is
		do
			value := g_spawn_error_failed_low_level
		end

	set_g_spawn_error_fork is
		do
			value := g_spawn_error_fork_low_level
		end

	set_g_spawn_error_inval is
		do
			value := g_spawn_error_inval_low_level
		end

	set_g_spawn_error_io is
		do
			value := g_spawn_error_io_low_level
		end

	set_g_spawn_error_isdir is
		do
			value := g_spawn_error_isdir_low_level
		end

	set_g_spawn_error_libbad is
		do
			value := g_spawn_error_libbad_low_level
		end

	set_g_spawn_error_loop is
		do
			value := g_spawn_error_loop_low_level
		end

	set_g_spawn_error_mfile is
		do
			value := g_spawn_error_mfile_low_level
		end

	set_g_spawn_error_nametoolong is
		do
			value := g_spawn_error_nametoolong_low_level
		end

	set_g_spawn_error_nfile is
		do
			value := g_spawn_error_nfile_low_level
		end

	set_g_spawn_error_noent is
		do
			value := g_spawn_error_noent_low_level
		end

	set_g_spawn_error_noexec is
		do
			value := g_spawn_error_noexec_low_level
		end

	set_g_spawn_error_nomem is
		do
			value := g_spawn_error_nomem_low_level
		end

	set_g_spawn_error_notdir is
		do
			value := g_spawn_error_notdir_low_level
		end

	set_g_spawn_error_perm is
		do
			value := g_spawn_error_perm_low_level
		end

	set_g_spawn_error_read is
		do
			value := g_spawn_error_read_low_level
		end

	set_g_spawn_error_too_big is
		do
			value := g_spawn_error_too_big_low_level
		end

	set_g_spawn_error_txtbusy is
		do
			value := g_spawn_error_txtbusy_low_level
		end

feature {ANY} -- Queries
	is_g_spawn_error_2big: BOOLEAN is
		do
			Result := (value=g_spawn_error_2big_low_level)
		end

	is_g_spawn_error_acces: BOOLEAN is
		do
			Result := (value=g_spawn_error_acces_low_level)
		end

	is_g_spawn_error_chdir: BOOLEAN is
		do
			Result := (value=g_spawn_error_chdir_low_level)
		end

	is_g_spawn_error_failed: BOOLEAN is
		do
			Result := (value=g_spawn_error_failed_low_level)
		end

	is_g_spawn_error_fork: BOOLEAN is
		do
			Result := (value=g_spawn_error_fork_low_level)
		end

	is_g_spawn_error_inval: BOOLEAN is
		do
			Result := (value=g_spawn_error_inval_low_level)
		end

	is_g_spawn_error_io: BOOLEAN is
		do
			Result := (value=g_spawn_error_io_low_level)
		end

	is_g_spawn_error_isdir: BOOLEAN is
		do
			Result := (value=g_spawn_error_isdir_low_level)
		end

	is_g_spawn_error_libbad: BOOLEAN is
		do
			Result := (value=g_spawn_error_libbad_low_level)
		end

	is_g_spawn_error_loop: BOOLEAN is
		do
			Result := (value=g_spawn_error_loop_low_level)
		end

	is_g_spawn_error_mfile: BOOLEAN is
		do
			Result := (value=g_spawn_error_mfile_low_level)
		end

	is_g_spawn_error_nametoolong: BOOLEAN is
		do
			Result := (value=g_spawn_error_nametoolong_low_level)
		end

	is_g_spawn_error_nfile: BOOLEAN is
		do
			Result := (value=g_spawn_error_nfile_low_level)
		end

	is_g_spawn_error_noent: BOOLEAN is
		do
			Result := (value=g_spawn_error_noent_low_level)
		end

	is_g_spawn_error_noexec: BOOLEAN is
		do
			Result := (value=g_spawn_error_noexec_low_level)
		end

	is_g_spawn_error_nomem: BOOLEAN is
		do
			Result := (value=g_spawn_error_nomem_low_level)
		end

	is_g_spawn_error_notdir: BOOLEAN is
		do
			Result := (value=g_spawn_error_notdir_low_level)
		end

	is_g_spawn_error_perm: BOOLEAN is
		do
			Result := (value=g_spawn_error_perm_low_level)
		end

	is_g_spawn_error_read: BOOLEAN is
		do
			Result := (value=g_spawn_error_read_low_level)
		end

	is_g_spawn_error_too_big: BOOLEAN is
		do
			Result := (value=g_spawn_error_too_big_low_level)
		end

	is_g_spawn_error_txtbusy: BOOLEAN is
		do
			Result := (value=g_spawn_error_txtbusy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_spawn_error_2big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_2BIG"
 			}"
 		end

	g_spawn_error_acces_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_ACCES"
 			}"
 		end

	g_spawn_error_chdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_CHDIR"
 			}"
 		end

	g_spawn_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_FAILED"
 			}"
 		end

	g_spawn_error_fork_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_FORK"
 			}"
 		end

	g_spawn_error_inval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_INVAL"
 			}"
 		end

	g_spawn_error_io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_IO"
 			}"
 		end

	g_spawn_error_isdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_ISDIR"
 			}"
 		end

	g_spawn_error_libbad_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_LIBBAD"
 			}"
 		end

	g_spawn_error_loop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_LOOP"
 			}"
 		end

	g_spawn_error_mfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_MFILE"
 			}"
 		end

	g_spawn_error_nametoolong_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NAMETOOLONG"
 			}"
 		end

	g_spawn_error_nfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NFILE"
 			}"
 		end

	g_spawn_error_noent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOENT"
 			}"
 		end

	g_spawn_error_noexec_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOEXEC"
 			}"
 		end

	g_spawn_error_nomem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOMEM"
 			}"
 		end

	g_spawn_error_notdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOTDIR"
 			}"
 		end

	g_spawn_error_perm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_PERM"
 			}"
 		end

	g_spawn_error_read_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_READ"
 			}"
 		end

	g_spawn_error_too_big_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_TOO_BIG"
 			}"
 		end

	g_spawn_error_txtbusy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_TXTBUSY"
 			}"
 		end


end -- class GSPAWNERROR_ENUM
