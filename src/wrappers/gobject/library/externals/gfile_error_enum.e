-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_error_acces_low_level)  or else
				(a_value = g_file_error_again_low_level)  or else
				(a_value = g_file_error_badf_low_level)  or else
				(a_value = g_file_error_exist_low_level)  or else
				(a_value = g_file_error_failed_low_level)  or else
				(a_value = g_file_error_fault_low_level)  or else
				(a_value = g_file_error_intr_low_level)  or else
				(a_value = g_file_error_inval_low_level)  or else
				(a_value = g_file_error_io_low_level)  or else
				(a_value = g_file_error_isdir_low_level)  or else
				(a_value = g_file_error_loop_low_level)  or else
				(a_value = g_file_error_mfile_low_level)  or else
				(a_value = g_file_error_nametoolong_low_level)  or else
				(a_value = g_file_error_nfile_low_level)  or else
				(a_value = g_file_error_nodev_low_level)  or else
				(a_value = g_file_error_noent_low_level)  or else
				(a_value = g_file_error_nomem_low_level)  or else
				(a_value = g_file_error_nospc_low_level)  or else
				(a_value = g_file_error_nosys_low_level)  or else
				(a_value = g_file_error_notdir_low_level)  or else
				(a_value = g_file_error_nxio_low_level)  or else
				(a_value = g_file_error_perm_low_level)  or else
				(a_value = g_file_error_pipe_low_level)  or else
				(a_value = g_file_error_rofs_low_level)  or else
				(a_value = g_file_error_txtbsy_low_level) )
		end

feature -- Setters
	default_create,
	set_g_file_error_acces is
		do
			value := g_file_error_acces_low_level
		end

	set_g_file_error_again is
		do
			value := g_file_error_again_low_level
		end

	set_g_file_error_badf is
		do
			value := g_file_error_badf_low_level
		end

	set_g_file_error_exist is
		do
			value := g_file_error_exist_low_level
		end

	set_g_file_error_failed is
		do
			value := g_file_error_failed_low_level
		end

	set_g_file_error_fault is
		do
			value := g_file_error_fault_low_level
		end

	set_g_file_error_intr is
		do
			value := g_file_error_intr_low_level
		end

	set_g_file_error_inval is
		do
			value := g_file_error_inval_low_level
		end

	set_g_file_error_io is
		do
			value := g_file_error_io_low_level
		end

	set_g_file_error_isdir is
		do
			value := g_file_error_isdir_low_level
		end

	set_g_file_error_loop is
		do
			value := g_file_error_loop_low_level
		end

	set_g_file_error_mfile is
		do
			value := g_file_error_mfile_low_level
		end

	set_g_file_error_nametoolong is
		do
			value := g_file_error_nametoolong_low_level
		end

	set_g_file_error_nfile is
		do
			value := g_file_error_nfile_low_level
		end

	set_g_file_error_nodev is
		do
			value := g_file_error_nodev_low_level
		end

	set_g_file_error_noent is
		do
			value := g_file_error_noent_low_level
		end

	set_g_file_error_nomem is
		do
			value := g_file_error_nomem_low_level
		end

	set_g_file_error_nospc is
		do
			value := g_file_error_nospc_low_level
		end

	set_g_file_error_nosys is
		do
			value := g_file_error_nosys_low_level
		end

	set_g_file_error_notdir is
		do
			value := g_file_error_notdir_low_level
		end

	set_g_file_error_nxio is
		do
			value := g_file_error_nxio_low_level
		end

	set_g_file_error_perm is
		do
			value := g_file_error_perm_low_level
		end

	set_g_file_error_pipe is
		do
			value := g_file_error_pipe_low_level
		end

	set_g_file_error_rofs is
		do
			value := g_file_error_rofs_low_level
		end

	set_g_file_error_txtbsy is
		do
			value := g_file_error_txtbsy_low_level
		end

feature -- Queries
	is_g_file_error_acces: BOOLEAN is
		do
			Result := (value=g_file_error_acces_low_level)
		end

	is_g_file_error_again: BOOLEAN is
		do
			Result := (value=g_file_error_again_low_level)
		end

	is_g_file_error_badf: BOOLEAN is
		do
			Result := (value=g_file_error_badf_low_level)
		end

	is_g_file_error_exist: BOOLEAN is
		do
			Result := (value=g_file_error_exist_low_level)
		end

	is_g_file_error_failed: BOOLEAN is
		do
			Result := (value=g_file_error_failed_low_level)
		end

	is_g_file_error_fault: BOOLEAN is
		do
			Result := (value=g_file_error_fault_low_level)
		end

	is_g_file_error_intr: BOOLEAN is
		do
			Result := (value=g_file_error_intr_low_level)
		end

	is_g_file_error_inval: BOOLEAN is
		do
			Result := (value=g_file_error_inval_low_level)
		end

	is_g_file_error_io: BOOLEAN is
		do
			Result := (value=g_file_error_io_low_level)
		end

	is_g_file_error_isdir: BOOLEAN is
		do
			Result := (value=g_file_error_isdir_low_level)
		end

	is_g_file_error_loop: BOOLEAN is
		do
			Result := (value=g_file_error_loop_low_level)
		end

	is_g_file_error_mfile: BOOLEAN is
		do
			Result := (value=g_file_error_mfile_low_level)
		end

	is_g_file_error_nametoolong: BOOLEAN is
		do
			Result := (value=g_file_error_nametoolong_low_level)
		end

	is_g_file_error_nfile: BOOLEAN is
		do
			Result := (value=g_file_error_nfile_low_level)
		end

	is_g_file_error_nodev: BOOLEAN is
		do
			Result := (value=g_file_error_nodev_low_level)
		end

	is_g_file_error_noent: BOOLEAN is
		do
			Result := (value=g_file_error_noent_low_level)
		end

	is_g_file_error_nomem: BOOLEAN is
		do
			Result := (value=g_file_error_nomem_low_level)
		end

	is_g_file_error_nospc: BOOLEAN is
		do
			Result := (value=g_file_error_nospc_low_level)
		end

	is_g_file_error_nosys: BOOLEAN is
		do
			Result := (value=g_file_error_nosys_low_level)
		end

	is_g_file_error_notdir: BOOLEAN is
		do
			Result := (value=g_file_error_notdir_low_level)
		end

	is_g_file_error_nxio: BOOLEAN is
		do
			Result := (value=g_file_error_nxio_low_level)
		end

	is_g_file_error_perm: BOOLEAN is
		do
			Result := (value=g_file_error_perm_low_level)
		end

	is_g_file_error_pipe: BOOLEAN is
		do
			Result := (value=g_file_error_pipe_low_level)
		end

	is_g_file_error_rofs: BOOLEAN is
		do
			Result := (value=g_file_error_rofs_low_level)
		end

	is_g_file_error_txtbsy: BOOLEAN is
		do
			Result := (value=g_file_error_txtbsy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_error_acces_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ACCES"
 			}"
 		end

	g_file_error_again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_AGAIN"
 			}"
 		end

	g_file_error_badf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_BADF"
 			}"
 		end

	g_file_error_exist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_EXIST"
 			}"
 		end

	g_file_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_FAILED"
 			}"
 		end

	g_file_error_fault_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_FAULT"
 			}"
 		end

	g_file_error_intr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_INTR"
 			}"
 		end

	g_file_error_inval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_INVAL"
 			}"
 		end

	g_file_error_io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_IO"
 			}"
 		end

	g_file_error_isdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ISDIR"
 			}"
 		end

	g_file_error_loop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_LOOP"
 			}"
 		end

	g_file_error_mfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_MFILE"
 			}"
 		end

	g_file_error_nametoolong_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NAMETOOLONG"
 			}"
 		end

	g_file_error_nfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NFILE"
 			}"
 		end

	g_file_error_nodev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NODEV"
 			}"
 		end

	g_file_error_noent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOENT"
 			}"
 		end

	g_file_error_nomem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOMEM"
 			}"
 		end

	g_file_error_nospc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOSPC"
 			}"
 		end

	g_file_error_nosys_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOSYS"
 			}"
 		end

	g_file_error_notdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOTDIR"
 			}"
 		end

	g_file_error_nxio_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NXIO"
 			}"
 		end

	g_file_error_perm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_PERM"
 			}"
 		end

	g_file_error_pipe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_PIPE"
 			}"
 		end

	g_file_error_rofs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ROFS"
 			}"
 		end

	g_file_error_txtbsy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_TXTBSY"
 			}"
 		end


end -- class GFILE_ERROR_ENUM
