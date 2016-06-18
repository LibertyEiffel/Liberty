-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_FILE_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_file_error_exist) or else 
				(a_value = g_file_error_isdir) or else 
				(a_value = g_file_error_acces) or else 
				(a_value = g_file_error_nametoolong) or else 
				(a_value = g_file_error_noent) or else 
				(a_value = g_file_error_notdir) or else 
				(a_value = g_file_error_nxio) or else 
				(a_value = g_file_error_nodev) or else 
				(a_value = g_file_error_rofs) or else 
				(a_value = g_file_error_txtbsy) or else 
				(a_value = g_file_error_fault) or else 
				(a_value = g_file_error_loop) or else 
				(a_value = g_file_error_nospc) or else 
				(a_value = g_file_error_nomem) or else 
				(a_value = g_file_error_mfile) or else 
				(a_value = g_file_error_nfile) or else 
				(a_value = g_file_error_badf) or else 
				(a_value = g_file_error_inval) or else 
				(a_value = g_file_error_pipe) or else 
				(a_value = g_file_error_again) or else 
				(a_value = g_file_error_intr) or else 
				(a_value = g_file_error_io) or else 
				(a_value = g_file_error_perm) or else 
				(a_value = g_file_error_nosys) or else 
				(a_value = g_file_error_failed))
		end


feature {ANY} -- Setters
	default_create, set_exist
		do
			value := g_file_error_exist
		end

	set_isdir
		do
			value := g_file_error_isdir
		end

	set_acces
		do
			value := g_file_error_acces
		end

	set_nametoolong
		do
			value := g_file_error_nametoolong
		end

	set_noent
		do
			value := g_file_error_noent
		end

	set_notdir
		do
			value := g_file_error_notdir
		end

	set_nxio
		do
			value := g_file_error_nxio
		end

	set_nodev
		do
			value := g_file_error_nodev
		end

	set_rofs
		do
			value := g_file_error_rofs
		end

	set_txtbsy
		do
			value := g_file_error_txtbsy
		end

	set_fault
		do
			value := g_file_error_fault
		end

	set_loop_external
		do
			value := g_file_error_loop
		end

	set_nospc
		do
			value := g_file_error_nospc
		end

	set_nomem
		do
			value := g_file_error_nomem
		end

	set_mfile
		do
			value := g_file_error_mfile
		end

	set_nfile
		do
			value := g_file_error_nfile
		end

	set_badf
		do
			value := g_file_error_badf
		end

	set_inval
		do
			value := g_file_error_inval
		end

	set_pipe
		do
			value := g_file_error_pipe
		end

	set_again
		do
			value := g_file_error_again
		end

	set_intr
		do
			value := g_file_error_intr
		end

	set_io
		do
			value := g_file_error_io
		end

	set_perm
		do
			value := g_file_error_perm
		end

	set_nosys
		do
			value := g_file_error_nosys
		end

	set_failed
		do
			value := g_file_error_failed
		end


feature {ANY} -- Queries
	is_exist: BOOLEAN
		do
			Result := (value=g_file_error_exist)
		end

	is_isdir: BOOLEAN
		do
			Result := (value=g_file_error_isdir)
		end

	is_acces: BOOLEAN
		do
			Result := (value=g_file_error_acces)
		end

	is_nametoolong: BOOLEAN
		do
			Result := (value=g_file_error_nametoolong)
		end

	is_noent: BOOLEAN
		do
			Result := (value=g_file_error_noent)
		end

	is_notdir: BOOLEAN
		do
			Result := (value=g_file_error_notdir)
		end

	is_nxio: BOOLEAN
		do
			Result := (value=g_file_error_nxio)
		end

	is_nodev: BOOLEAN
		do
			Result := (value=g_file_error_nodev)
		end

	is_rofs: BOOLEAN
		do
			Result := (value=g_file_error_rofs)
		end

	is_txtbsy: BOOLEAN
		do
			Result := (value=g_file_error_txtbsy)
		end

	is_fault: BOOLEAN
		do
			Result := (value=g_file_error_fault)
		end

	is_loop_external: BOOLEAN
		do
			Result := (value=g_file_error_loop)
		end

	is_nospc: BOOLEAN
		do
			Result := (value=g_file_error_nospc)
		end

	is_nomem: BOOLEAN
		do
			Result := (value=g_file_error_nomem)
		end

	is_mfile: BOOLEAN
		do
			Result := (value=g_file_error_mfile)
		end

	is_nfile: BOOLEAN
		do
			Result := (value=g_file_error_nfile)
		end

	is_badf: BOOLEAN
		do
			Result := (value=g_file_error_badf)
		end

	is_inval: BOOLEAN
		do
			Result := (value=g_file_error_inval)
		end

	is_pipe: BOOLEAN
		do
			Result := (value=g_file_error_pipe)
		end

	is_again: BOOLEAN
		do
			Result := (value=g_file_error_again)
		end

	is_intr: BOOLEAN
		do
			Result := (value=g_file_error_intr)
		end

	is_io: BOOLEAN
		do
			Result := (value=g_file_error_io)
		end

	is_perm: BOOLEAN
		do
			Result := (value=g_file_error_perm)
		end

	is_nosys: BOOLEAN
		do
			Result := (value=g_file_error_nosys)
		end

	is_failed: BOOLEAN
		do
			Result := (value=g_file_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_error_exist: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_EXIST"
		end

	g_file_error_isdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_ISDIR"
		end

	g_file_error_acces: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_ACCES"
		end

	g_file_error_nametoolong: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NAMETOOLONG"
		end

	g_file_error_noent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOENT"
		end

	g_file_error_notdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOTDIR"
		end

	g_file_error_nxio: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NXIO"
		end

	g_file_error_nodev: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NODEV"
		end

	g_file_error_rofs: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_ROFS"
		end

	g_file_error_txtbsy: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_TXTBSY"
		end

	g_file_error_fault: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_FAULT"
		end

	g_file_error_loop: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_LOOP"
		end

	g_file_error_nospc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOSPC"
		end

	g_file_error_nomem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOMEM"
		end

	g_file_error_mfile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_MFILE"
		end

	g_file_error_nfile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NFILE"
		end

	g_file_error_badf: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_BADF"
		end

	g_file_error_inval: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_INVAL"
		end

	g_file_error_pipe: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_PIPE"
		end

	g_file_error_again: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_AGAIN"
		end

	g_file_error_intr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_INTR"
		end

	g_file_error_io: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_IO"
		end

	g_file_error_perm: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_PERM"
		end

	g_file_error_nosys: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOSYS"
		end

	g_file_error_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_FAILED"
		end


end

