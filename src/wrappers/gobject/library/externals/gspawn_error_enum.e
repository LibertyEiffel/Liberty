-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSPAWN_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_g_spawn_error_2big
		do
			value := g_spawn_error_2big_low_level
		end

	set_g_spawn_error_acces
		do
			value := g_spawn_error_acces_low_level
		end

	set_g_spawn_error_chdir
		do
			value := g_spawn_error_chdir_low_level
		end

	set_g_spawn_error_failed
		do
			value := g_spawn_error_failed_low_level
		end

	set_g_spawn_error_fork
		do
			value := g_spawn_error_fork_low_level
		end

	set_g_spawn_error_inval
		do
			value := g_spawn_error_inval_low_level
		end

	set_g_spawn_error_io
		do
			value := g_spawn_error_io_low_level
		end

	set_g_spawn_error_isdir
		do
			value := g_spawn_error_isdir_low_level
		end

	set_g_spawn_error_libbad
		do
			value := g_spawn_error_libbad_low_level
		end

	set_g_spawn_error_loop
		do
			value := g_spawn_error_loop_low_level
		end

	set_g_spawn_error_mfile
		do
			value := g_spawn_error_mfile_low_level
		end

	set_g_spawn_error_nametoolong
		do
			value := g_spawn_error_nametoolong_low_level
		end

	set_g_spawn_error_nfile
		do
			value := g_spawn_error_nfile_low_level
		end

	set_g_spawn_error_noent
		do
			value := g_spawn_error_noent_low_level
		end

	set_g_spawn_error_noexec
		do
			value := g_spawn_error_noexec_low_level
		end

	set_g_spawn_error_nomem
		do
			value := g_spawn_error_nomem_low_level
		end

	set_g_spawn_error_notdir
		do
			value := g_spawn_error_notdir_low_level
		end

	set_g_spawn_error_perm
		do
			value := g_spawn_error_perm_low_level
		end

	set_g_spawn_error_read
		do
			value := g_spawn_error_read_low_level
		end

	set_g_spawn_error_too_big
		do
			value := g_spawn_error_too_big_low_level
		end

	set_g_spawn_error_txtbusy
		do
			value := g_spawn_error_txtbusy_low_level
		end

feature {ANY} -- Queries
	is_g_spawn_error_2big: BOOLEAN
		do
			Result := (value=g_spawn_error_2big_low_level)
		end

	is_g_spawn_error_acces: BOOLEAN
		do
			Result := (value=g_spawn_error_acces_low_level)
		end

	is_g_spawn_error_chdir: BOOLEAN
		do
			Result := (value=g_spawn_error_chdir_low_level)
		end

	is_g_spawn_error_failed: BOOLEAN
		do
			Result := (value=g_spawn_error_failed_low_level)
		end

	is_g_spawn_error_fork: BOOLEAN
		do
			Result := (value=g_spawn_error_fork_low_level)
		end

	is_g_spawn_error_inval: BOOLEAN
		do
			Result := (value=g_spawn_error_inval_low_level)
		end

	is_g_spawn_error_io: BOOLEAN
		do
			Result := (value=g_spawn_error_io_low_level)
		end

	is_g_spawn_error_isdir: BOOLEAN
		do
			Result := (value=g_spawn_error_isdir_low_level)
		end

	is_g_spawn_error_libbad: BOOLEAN
		do
			Result := (value=g_spawn_error_libbad_low_level)
		end

	is_g_spawn_error_loop: BOOLEAN
		do
			Result := (value=g_spawn_error_loop_low_level)
		end

	is_g_spawn_error_mfile: BOOLEAN
		do
			Result := (value=g_spawn_error_mfile_low_level)
		end

	is_g_spawn_error_nametoolong: BOOLEAN
		do
			Result := (value=g_spawn_error_nametoolong_low_level)
		end

	is_g_spawn_error_nfile: BOOLEAN
		do
			Result := (value=g_spawn_error_nfile_low_level)
		end

	is_g_spawn_error_noent: BOOLEAN
		do
			Result := (value=g_spawn_error_noent_low_level)
		end

	is_g_spawn_error_noexec: BOOLEAN
		do
			Result := (value=g_spawn_error_noexec_low_level)
		end

	is_g_spawn_error_nomem: BOOLEAN
		do
			Result := (value=g_spawn_error_nomem_low_level)
		end

	is_g_spawn_error_notdir: BOOLEAN
		do
			Result := (value=g_spawn_error_notdir_low_level)
		end

	is_g_spawn_error_perm: BOOLEAN
		do
			Result := (value=g_spawn_error_perm_low_level)
		end

	is_g_spawn_error_read: BOOLEAN
		do
			Result := (value=g_spawn_error_read_low_level)
		end

	is_g_spawn_error_too_big: BOOLEAN
		do
			Result := (value=g_spawn_error_too_big_low_level)
		end

	is_g_spawn_error_txtbusy: BOOLEAN
		do
			Result := (value=g_spawn_error_txtbusy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_spawn_error_2big_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_2BIG"
 			}"
 		end

	g_spawn_error_acces_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_ACCES"
 			}"
 		end

	g_spawn_error_chdir_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_CHDIR"
 			}"
 		end

	g_spawn_error_failed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_FAILED"
 			}"
 		end

	g_spawn_error_fork_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_FORK"
 			}"
 		end

	g_spawn_error_inval_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_INVAL"
 			}"
 		end

	g_spawn_error_io_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_IO"
 			}"
 		end

	g_spawn_error_isdir_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_ISDIR"
 			}"
 		end

	g_spawn_error_libbad_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_LIBBAD"
 			}"
 		end

	g_spawn_error_loop_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_LOOP"
 			}"
 		end

	g_spawn_error_mfile_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_MFILE"
 			}"
 		end

	g_spawn_error_nametoolong_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NAMETOOLONG"
 			}"
 		end

	g_spawn_error_nfile_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NFILE"
 			}"
 		end

	g_spawn_error_noent_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOENT"
 			}"
 		end

	g_spawn_error_noexec_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOEXEC"
 			}"
 		end

	g_spawn_error_nomem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOMEM"
 			}"
 		end

	g_spawn_error_notdir_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_NOTDIR"
 			}"
 		end

	g_spawn_error_perm_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_PERM"
 			}"
 		end

	g_spawn_error_read_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_READ"
 			}"
 		end

	g_spawn_error_too_big_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_TOO_BIG"
 			}"
 		end

	g_spawn_error_txtbusy_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SPAWN_ERROR_TXTBUSY"
 			}"
 		end


end -- class GSPAWN_ERROR_ENUM
