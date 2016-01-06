-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GFILE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = acces_low_level)  or else
				(a_value = again_low_level)  or else
				(a_value = badf_low_level)  or else
				(a_value = exist_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = fault_low_level)  or else
				(a_value = intr_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = io_low_level)  or else
				(a_value = isdir_low_level)  or else
				(a_value = loop_external_low_level)  or else
				(a_value = mfile_low_level)  or else
				(a_value = nametoolong_low_level)  or else
				(a_value = nfile_low_level)  or else
				(a_value = nodev_low_level)  or else
				(a_value = noent_low_level)  or else
				(a_value = nomem_low_level)  or else
				(a_value = nospc_low_level)  or else
				(a_value = nosys_low_level)  or else
				(a_value = notdir_low_level)  or else
				(a_value = nxio_low_level)  or else
				(a_value = perm_low_level)  or else
				(a_value = pipe_low_level)  or else
				(a_value = rofs_low_level)  or else
				(a_value = txtbsy_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_acces
               do
                       value := acces_low_level
               end

	set_again
               do
                       value := again_low_level
               end

	set_badf
               do
                       value := badf_low_level
               end

	set_exist
               do
                       value := exist_low_level
               end

	set_failed
               do
                       value := failed_low_level
               end

	set_fault
               do
                       value := fault_low_level
               end

	set_intr
               do
                       value := intr_low_level
               end

	set_inval
               do
                       value := inval_low_level
               end

	set_io
               do
                       value := io_low_level
               end

	set_isdir
               do
                       value := isdir_low_level
               end

	set_loop_external
               do
                       value := loop_external_low_level
               end

	set_mfile
               do
                       value := mfile_low_level
               end

	set_nametoolong
               do
                       value := nametoolong_low_level
               end

	set_nfile
               do
                       value := nfile_low_level
               end

	set_nodev
               do
                       value := nodev_low_level
               end

	set_noent
               do
                       value := noent_low_level
               end

	set_nomem
               do
                       value := nomem_low_level
               end

	set_nospc
               do
                       value := nospc_low_level
               end

	set_nosys
               do
                       value := nosys_low_level
               end

	set_notdir
               do
                       value := notdir_low_level
               end

	set_nxio
               do
                       value := nxio_low_level
               end

	set_perm
               do
                       value := perm_low_level
               end

	set_pipe
               do
                       value := pipe_low_level
               end

	set_rofs
               do
                       value := rofs_low_level
               end

	set_txtbsy
               do
                       value := txtbsy_low_level
               end

feature {ANY} -- Queries
       is_acces: BOOLEAN
               do
                       Result := (value=acces_low_level)
               end

       is_again: BOOLEAN
               do
                       Result := (value=again_low_level)
               end

       is_badf: BOOLEAN
               do
                       Result := (value=badf_low_level)
               end

       is_exist: BOOLEAN
               do
                       Result := (value=exist_low_level)
               end

       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

       is_fault: BOOLEAN
               do
                       Result := (value=fault_low_level)
               end

       is_intr: BOOLEAN
               do
                       Result := (value=intr_low_level)
               end

       is_inval: BOOLEAN
               do
                       Result := (value=inval_low_level)
               end

       is_io: BOOLEAN
               do
                       Result := (value=io_low_level)
               end

       is_isdir: BOOLEAN
               do
                       Result := (value=isdir_low_level)
               end

       is_loop_external: BOOLEAN
               do
                       Result := (value=loop_external_low_level)
               end

       is_mfile: BOOLEAN
               do
                       Result := (value=mfile_low_level)
               end

       is_nametoolong: BOOLEAN
               do
                       Result := (value=nametoolong_low_level)
               end

       is_nfile: BOOLEAN
               do
                       Result := (value=nfile_low_level)
               end

       is_nodev: BOOLEAN
               do
                       Result := (value=nodev_low_level)
               end

       is_noent: BOOLEAN
               do
                       Result := (value=noent_low_level)
               end

       is_nomem: BOOLEAN
               do
                       Result := (value=nomem_low_level)
               end

       is_nospc: BOOLEAN
               do
                       Result := (value=nospc_low_level)
               end

       is_nosys: BOOLEAN
               do
                       Result := (value=nosys_low_level)
               end

       is_notdir: BOOLEAN
               do
                       Result := (value=notdir_low_level)
               end

       is_nxio: BOOLEAN
               do
                       Result := (value=nxio_low_level)
               end

       is_perm: BOOLEAN
               do
                       Result := (value=perm_low_level)
               end

       is_pipe: BOOLEAN
               do
                       Result := (value=pipe_low_level)
               end

       is_rofs: BOOLEAN
               do
                       Result := (value=rofs_low_level)
               end

       is_txtbsy: BOOLEAN
               do
                       Result := (value=txtbsy_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     acces_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_ACCES"
                       }"
               end

     again_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_AGAIN"
                       }"
               end

     badf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_BADF"
                       }"
               end

     exist_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_EXIST"
                       }"
               end

     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_FAILED"
                       }"
               end

     fault_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_FAULT"
                       }"
               end

     intr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_INTR"
                       }"
               end

     inval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_INVAL"
                       }"
               end

     io_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_IO"
                       }"
               end

     isdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_ISDIR"
                       }"
               end

     loop_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_LOOP"
                       }"
               end

     mfile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_MFILE"
                       }"
               end

     nametoolong_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NAMETOOLONG"
                       }"
               end

     nfile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NFILE"
                       }"
               end

     nodev_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NODEV"
                       }"
               end

     noent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NOENT"
                       }"
               end

     nomem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NOMEM"
                       }"
               end

     nospc_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NOSPC"
                       }"
               end

     nosys_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NOSYS"
                       }"
               end

     notdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NOTDIR"
                       }"
               end

     nxio_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_NXIO"
                       }"
               end

     perm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_PERM"
                       }"
               end

     pipe_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_PIPE"
                       }"
               end

     rofs_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_ROFS"
                       }"
               end

     txtbsy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_FILE_ERROR_TXTBSY"
                       }"
               end


end -- class GFILE_ERROR_ENUM
