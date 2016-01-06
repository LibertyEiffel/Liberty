-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GSPAWN_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = a_2big_low_level)  or else
				(a_value = acces_low_level)  or else
				(a_value = chdir_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = fork_low_level)  or else
				(a_value = inval_low_level)  or else
				(a_value = io_low_level)  or else
				(a_value = isdir_low_level)  or else
				(a_value = libbad_low_level)  or else
				(a_value = loop_external_low_level)  or else
				(a_value = mfile_low_level)  or else
				(a_value = nametoolong_low_level)  or else
				(a_value = nfile_low_level)  or else
				(a_value = noent_low_level)  or else
				(a_value = noexec_low_level)  or else
				(a_value = nomem_low_level)  or else
				(a_value = notdir_low_level)  or else
				(a_value = perm_low_level)  or else
				(a_value = read_low_level)  or else
				(a_value = too_big_low_level)  or else
				(a_value = txtbusy_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_a_2big
               do
                       value := a_2big_low_level
               end

	set_acces
               do
                       value := acces_low_level
               end

	set_chdir
               do
                       value := chdir_low_level
               end

	set_failed
               do
                       value := failed_low_level
               end

	set_fork
               do
                       value := fork_low_level
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

	set_libbad
               do
                       value := libbad_low_level
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

	set_noent
               do
                       value := noent_low_level
               end

	set_noexec
               do
                       value := noexec_low_level
               end

	set_nomem
               do
                       value := nomem_low_level
               end

	set_notdir
               do
                       value := notdir_low_level
               end

	set_perm
               do
                       value := perm_low_level
               end

	set_read
               do
                       value := read_low_level
               end

	set_too_big
               do
                       value := too_big_low_level
               end

	set_txtbusy
               do
                       value := txtbusy_low_level
               end

feature {ANY} -- Queries
       is_a_2big: BOOLEAN
               do
                       Result := (value=a_2big_low_level)
               end

       is_acces: BOOLEAN
               do
                       Result := (value=acces_low_level)
               end

       is_chdir: BOOLEAN
               do
                       Result := (value=chdir_low_level)
               end

       is_failed: BOOLEAN
               do
                       Result := (value=failed_low_level)
               end

       is_fork: BOOLEAN
               do
                       Result := (value=fork_low_level)
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

       is_libbad: BOOLEAN
               do
                       Result := (value=libbad_low_level)
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

       is_noent: BOOLEAN
               do
                       Result := (value=noent_low_level)
               end

       is_noexec: BOOLEAN
               do
                       Result := (value=noexec_low_level)
               end

       is_nomem: BOOLEAN
               do
                       Result := (value=nomem_low_level)
               end

       is_notdir: BOOLEAN
               do
                       Result := (value=notdir_low_level)
               end

       is_perm: BOOLEAN
               do
                       Result := (value=perm_low_level)
               end

       is_read: BOOLEAN
               do
                       Result := (value=read_low_level)
               end

       is_too_big: BOOLEAN
               do
                       Result := (value=too_big_low_level)
               end

       is_txtbusy: BOOLEAN
               do
                       Result := (value=txtbusy_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     a_2big_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_2BIG"
                       }"
               end

     acces_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_ACCES"
                       }"
               end

     chdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_CHDIR"
                       }"
               end

     failed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_FAILED"
                       }"
               end

     fork_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_FORK"
                       }"
               end

     inval_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_INVAL"
                       }"
               end

     io_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_IO"
                       }"
               end

     isdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_ISDIR"
                       }"
               end

     libbad_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_LIBBAD"
                       }"
               end

     loop_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_LOOP"
                       }"
               end

     mfile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_MFILE"
                       }"
               end

     nametoolong_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_NAMETOOLONG"
                       }"
               end

     nfile_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_NFILE"
                       }"
               end

     noent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_NOENT"
                       }"
               end

     noexec_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_NOEXEC"
                       }"
               end

     nomem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_NOMEM"
                       }"
               end

     notdir_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_NOTDIR"
                       }"
               end

     perm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_PERM"
                       }"
               end

     read_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_READ"
                       }"
               end

     too_big_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_TOO_BIG"
                       }"
               end

     txtbusy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SPAWN_ERROR_TXTBUSY"
                       }"
               end


end -- class GSPAWN_ERROR_ENUM
