-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILE_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = exist_low_level)  or else
				(a_value = isdir_low_level)  or else
				(a_value = acces_low_level)  or else
				(a_value = nametoolong_low_level)  or else
				(a_value = noent_low_level)  or else
				(a_value = notdir_low_level)  or else
				(a_value = nxio_low_level)  or else
				(a_value = nodev_low_level)  or else
				(a_value = rofs_low_level)  or else
				(a_value = txtbsy_low_level)  or else
				(a_value = fault_low_level)  or else
				(a_value = loop_external_low_level)  or else
				(a_value = nospc_low_level)  or else
				(a_value = nomem_low_level)  or else
				(a_value = mfile_low_level)  or else
				(a_value = nfile_low_level)  or else
				(a_value = badf_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = pipe_low_level)  or else
				(a_value = again_low_level)  or else
				(a_value = intr_low_level)  or else
				(a_value = io_low_level)  or else
				(a_value = perm_low_level)  or else
				(a_value = nosys_low_level)  or else
				(a_value = failed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_exist is
		do
			value := exist_low_level
		end

	set_isdir is
		do
			value := isdir_low_level
		end

	set_acces is
		do
			value := acces_low_level
		end

	set_nametoolong is
		do
			value := nametoolong_low_level
		end

	set_noent is
		do
			value := noent_low_level
		end

	set_notdir is
		do
			value := notdir_low_level
		end

	set_nxio is
		do
			value := nxio_low_level
		end

	set_nodev is
		do
			value := nodev_low_level
		end

	set_rofs is
		do
			value := rofs_low_level
		end

	set_txtbsy is
		do
			value := txtbsy_low_level
		end

	set_fault is
		do
			value := fault_low_level
		end

	set_loop_external is
		do
			value := loop_external_low_level
		end

	set_nospc is
		do
			value := nospc_low_level
		end

	set_nomem is
		do
			value := nomem_low_level
		end

	set_mfile is
		do
			value := mfile_low_level
		end

	set_nfile is
		do
			value := nfile_low_level
		end

	set_badf is
		do
			value := badf_low_level
		end

	set_inval is
		do
			value := inval_low_level
		end

	set_pipe is
		do
			value := pipe_low_level
		end

	set_again is
		do
			value := again_low_level
		end

	set_intr is
		do
			value := intr_low_level
		end

	set_io is
		do
			value := io_low_level
		end

	set_perm is
		do
			value := perm_low_level
		end

	set_nosys is
		do
			value := nosys_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

feature {ANY} -- Queries
	is_exist: BOOLEAN is
		do
			Result := (value=exist_low_level)
		end

	is_isdir: BOOLEAN is
		do
			Result := (value=isdir_low_level)
		end

	is_acces: BOOLEAN is
		do
			Result := (value=acces_low_level)
		end

	is_nametoolong: BOOLEAN is
		do
			Result := (value=nametoolong_low_level)
		end

	is_noent: BOOLEAN is
		do
			Result := (value=noent_low_level)
		end

	is_notdir: BOOLEAN is
		do
			Result := (value=notdir_low_level)
		end

	is_nxio: BOOLEAN is
		do
			Result := (value=nxio_low_level)
		end

	is_nodev: BOOLEAN is
		do
			Result := (value=nodev_low_level)
		end

	is_rofs: BOOLEAN is
		do
			Result := (value=rofs_low_level)
		end

	is_txtbsy: BOOLEAN is
		do
			Result := (value=txtbsy_low_level)
		end

	is_fault: BOOLEAN is
		do
			Result := (value=fault_low_level)
		end

	is_loop_external: BOOLEAN is
		do
			Result := (value=loop_external_low_level)
		end

	is_nospc: BOOLEAN is
		do
			Result := (value=nospc_low_level)
		end

	is_nomem: BOOLEAN is
		do
			Result := (value=nomem_low_level)
		end

	is_mfile: BOOLEAN is
		do
			Result := (value=mfile_low_level)
		end

	is_nfile: BOOLEAN is
		do
			Result := (value=nfile_low_level)
		end

	is_badf: BOOLEAN is
		do
			Result := (value=badf_low_level)
		end

	is_inval: BOOLEAN is
		do
			Result := (value=inval_low_level)
		end

	is_pipe: BOOLEAN is
		do
			Result := (value=pipe_low_level)
		end

	is_again: BOOLEAN is
		do
			Result := (value=again_low_level)
		end

	is_intr: BOOLEAN is
		do
			Result := (value=intr_low_level)
		end

	is_io: BOOLEAN is
		do
			Result := (value=io_low_level)
		end

	is_perm: BOOLEAN is
		do
			Result := (value=perm_low_level)
		end

	is_nosys: BOOLEAN is
		do
			Result := (value=nosys_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	exist_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_EXIST"
 			}"
 		end

	isdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ISDIR"
 			}"
 		end

	acces_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ACCES"
 			}"
 		end

	nametoolong_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NAMETOOLONG"
 			}"
 		end

	noent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOENT"
 			}"
 		end

	notdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOTDIR"
 			}"
 		end

	nxio_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NXIO"
 			}"
 		end

	nodev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NODEV"
 			}"
 		end

	rofs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_ROFS"
 			}"
 		end

	txtbsy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_TXTBSY"
 			}"
 		end

	fault_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_FAULT"
 			}"
 		end

	loop_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_LOOP"
 			}"
 		end

	nospc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOSPC"
 			}"
 		end

	nomem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOMEM"
 			}"
 		end

	mfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_MFILE"
 			}"
 		end

	nfile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NFILE"
 			}"
 		end

	badf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_BADF"
 			}"
 		end

	inval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_INVAL"
 			}"
 		end

	pipe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_PIPE"
 			}"
 		end

	again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_AGAIN"
 			}"
 		end

	intr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_INTR"
 			}"
 		end

	io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_IO"
 			}"
 		end

	perm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_PERM"
 			}"
 		end

	nosys_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_NOSYS"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_ERROR_FAILED"
 			}"
 		end


end -- class GFILE_ERROR_ENUM
