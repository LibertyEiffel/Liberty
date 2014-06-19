-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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

feature {ANY} -- Setters
	default_create,
	set_g_file_error_acces
		do
			value := g_file_error_acces_low_level
		end

	set_g_file_error_again
		do
			value := g_file_error_again_low_level
		end

	set_g_file_error_badf
		do
			value := g_file_error_badf_low_level
		end

	set_g_file_error_exist
		do
			value := g_file_error_exist_low_level
		end

	set_g_file_error_failed
		do
			value := g_file_error_failed_low_level
		end

	set_g_file_error_fault
		do
			value := g_file_error_fault_low_level
		end

	set_g_file_error_intr
		do
			value := g_file_error_intr_low_level
		end

	set_g_file_error_inval
		do
			value := g_file_error_inval_low_level
		end

	set_g_file_error_io
		do
			value := g_file_error_io_low_level
		end

	set_g_file_error_isdir
		do
			value := g_file_error_isdir_low_level
		end

	set_g_file_error_loop
		do
			value := g_file_error_loop_low_level
		end

	set_g_file_error_mfile
		do
			value := g_file_error_mfile_low_level
		end

	set_g_file_error_nametoolong
		do
			value := g_file_error_nametoolong_low_level
		end

	set_g_file_error_nfile
		do
			value := g_file_error_nfile_low_level
		end

	set_g_file_error_nodev
		do
			value := g_file_error_nodev_low_level
		end

	set_g_file_error_noent
		do
			value := g_file_error_noent_low_level
		end

	set_g_file_error_nomem
		do
			value := g_file_error_nomem_low_level
		end

	set_g_file_error_nospc
		do
			value := g_file_error_nospc_low_level
		end

	set_g_file_error_nosys
		do
			value := g_file_error_nosys_low_level
		end

	set_g_file_error_notdir
		do
			value := g_file_error_notdir_low_level
		end

	set_g_file_error_nxio
		do
			value := g_file_error_nxio_low_level
		end

	set_g_file_error_perm
		do
			value := g_file_error_perm_low_level
		end

	set_g_file_error_pipe
		do
			value := g_file_error_pipe_low_level
		end

	set_g_file_error_rofs
		do
			value := g_file_error_rofs_low_level
		end

	set_g_file_error_txtbsy
		do
			value := g_file_error_txtbsy_low_level
		end

feature {ANY} -- Queries
	is_g_file_error_acces: BOOLEAN
		do
			Result := (value=g_file_error_acces_low_level)
		end

	is_g_file_error_again: BOOLEAN
		do
			Result := (value=g_file_error_again_low_level)
		end

	is_g_file_error_badf: BOOLEAN
		do
			Result := (value=g_file_error_badf_low_level)
		end

	is_g_file_error_exist: BOOLEAN
		do
			Result := (value=g_file_error_exist_low_level)
		end

	is_g_file_error_failed: BOOLEAN
		do
			Result := (value=g_file_error_failed_low_level)
		end

	is_g_file_error_fault: BOOLEAN
		do
			Result := (value=g_file_error_fault_low_level)
		end

	is_g_file_error_intr: BOOLEAN
		do
			Result := (value=g_file_error_intr_low_level)
		end

	is_g_file_error_inval: BOOLEAN
		do
			Result := (value=g_file_error_inval_low_level)
		end

	is_g_file_error_io: BOOLEAN
		do
			Result := (value=g_file_error_io_low_level)
		end

	is_g_file_error_isdir: BOOLEAN
		do
			Result := (value=g_file_error_isdir_low_level)
		end

	is_g_file_error_loop: BOOLEAN
		do
			Result := (value=g_file_error_loop_low_level)
		end

	is_g_file_error_mfile: BOOLEAN
		do
			Result := (value=g_file_error_mfile_low_level)
		end

	is_g_file_error_nametoolong: BOOLEAN
		do
			Result := (value=g_file_error_nametoolong_low_level)
		end

	is_g_file_error_nfile: BOOLEAN
		do
			Result := (value=g_file_error_nfile_low_level)
		end

	is_g_file_error_nodev: BOOLEAN
		do
			Result := (value=g_file_error_nodev_low_level)
		end

	is_g_file_error_noent: BOOLEAN
		do
			Result := (value=g_file_error_noent_low_level)
		end

	is_g_file_error_nomem: BOOLEAN
		do
			Result := (value=g_file_error_nomem_low_level)
		end

	is_g_file_error_nospc: BOOLEAN
		do
			Result := (value=g_file_error_nospc_low_level)
		end

	is_g_file_error_nosys: BOOLEAN
		do
			Result := (value=g_file_error_nosys_low_level)
		end

	is_g_file_error_notdir: BOOLEAN
		do
			Result := (value=g_file_error_notdir_low_level)
		end

	is_g_file_error_nxio: BOOLEAN
		do
			Result := (value=g_file_error_nxio_low_level)
		end

	is_g_file_error_perm: BOOLEAN
		do
			Result := (value=g_file_error_perm_low_level)
		end

	is_g_file_error_pipe: BOOLEAN
		do
			Result := (value=g_file_error_pipe_low_level)
		end

	is_g_file_error_rofs: BOOLEAN
		do
			Result := (value=g_file_error_rofs_low_level)
		end

	is_g_file_error_txtbsy: BOOLEAN
		do
			Result := (value=g_file_error_txtbsy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_error_acces_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ACCES"
 			}"
 		end

	g_file_error_again_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_AGAIN"
 			}"
 		end

	g_file_error_badf_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_BADF"
 			}"
 		end

	g_file_error_exist_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_EXIST"
 			}"
 		end

	g_file_error_failed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_FAILED"
 			}"
 		end

	g_file_error_fault_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_FAULT"
 			}"
 		end

	g_file_error_intr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_INTR"
 			}"
 		end

	g_file_error_inval_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_INVAL"
 			}"
 		end

	g_file_error_io_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_IO"
 			}"
 		end

	g_file_error_isdir_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ISDIR"
 			}"
 		end

	g_file_error_loop_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_LOOP"
 			}"
 		end

	g_file_error_mfile_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_MFILE"
 			}"
 		end

	g_file_error_nametoolong_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NAMETOOLONG"
 			}"
 		end

	g_file_error_nfile_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NFILE"
 			}"
 		end

	g_file_error_nodev_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NODEV"
 			}"
 		end

	g_file_error_noent_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOENT"
 			}"
 		end

	g_file_error_nomem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOMEM"
 			}"
 		end

	g_file_error_nospc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOSPC"
 			}"
 		end

	g_file_error_nosys_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOSYS"
 			}"
 		end

	g_file_error_notdir_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOTDIR"
 			}"
 		end

	g_file_error_nxio_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NXIO"
 			}"
 		end

	g_file_error_perm_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_PERM"
 			}"
 		end

	g_file_error_pipe_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_PIPE"
 			}"
 		end

	g_file_error_rofs_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ROFS"
 			}"
 		end

	g_file_error_txtbsy_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_TXTBSY"
 			}"
 		end


end -- class GFILE_ERROR_ENUM
