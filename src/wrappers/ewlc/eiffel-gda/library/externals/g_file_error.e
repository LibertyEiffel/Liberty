-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_FILE_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
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
	default_create, set_exist is
		do
			value := g_file_error_exist
		end

	set_isdir is
		do
			value := g_file_error_isdir
		end

	set_acces is
		do
			value := g_file_error_acces
		end

	set_nametoolong is
		do
			value := g_file_error_nametoolong
		end

	set_noent is
		do
			value := g_file_error_noent
		end

	set_notdir is
		do
			value := g_file_error_notdir
		end

	set_nxio is
		do
			value := g_file_error_nxio
		end

	set_nodev is
		do
			value := g_file_error_nodev
		end

	set_rofs is
		do
			value := g_file_error_rofs
		end

	set_txtbsy is
		do
			value := g_file_error_txtbsy
		end

	set_fault is
		do
			value := g_file_error_fault
		end

	set_loop_external is
		do
			value := g_file_error_loop
		end

	set_nospc is
		do
			value := g_file_error_nospc
		end

	set_nomem is
		do
			value := g_file_error_nomem
		end

	set_mfile is
		do
			value := g_file_error_mfile
		end

	set_nfile is
		do
			value := g_file_error_nfile
		end

	set_badf is
		do
			value := g_file_error_badf
		end

	set_inval is
		do
			value := g_file_error_inval
		end

	set_pipe is
		do
			value := g_file_error_pipe
		end

	set_again is
		do
			value := g_file_error_again
		end

	set_intr is
		do
			value := g_file_error_intr
		end

	set_io is
		do
			value := g_file_error_io
		end

	set_perm is
		do
			value := g_file_error_perm
		end

	set_nosys is
		do
			value := g_file_error_nosys
		end

	set_failed is
		do
			value := g_file_error_failed
		end


feature {ANY} -- Queries
	is_exist: BOOLEAN is
		do
			Result := (value=g_file_error_exist)
		end

	is_isdir: BOOLEAN is
		do
			Result := (value=g_file_error_isdir)
		end

	is_acces: BOOLEAN is
		do
			Result := (value=g_file_error_acces)
		end

	is_nametoolong: BOOLEAN is
		do
			Result := (value=g_file_error_nametoolong)
		end

	is_noent: BOOLEAN is
		do
			Result := (value=g_file_error_noent)
		end

	is_notdir: BOOLEAN is
		do
			Result := (value=g_file_error_notdir)
		end

	is_nxio: BOOLEAN is
		do
			Result := (value=g_file_error_nxio)
		end

	is_nodev: BOOLEAN is
		do
			Result := (value=g_file_error_nodev)
		end

	is_rofs: BOOLEAN is
		do
			Result := (value=g_file_error_rofs)
		end

	is_txtbsy: BOOLEAN is
		do
			Result := (value=g_file_error_txtbsy)
		end

	is_fault: BOOLEAN is
		do
			Result := (value=g_file_error_fault)
		end

	is_loop_external: BOOLEAN is
		do
			Result := (value=g_file_error_loop)
		end

	is_nospc: BOOLEAN is
		do
			Result := (value=g_file_error_nospc)
		end

	is_nomem: BOOLEAN is
		do
			Result := (value=g_file_error_nomem)
		end

	is_mfile: BOOLEAN is
		do
			Result := (value=g_file_error_mfile)
		end

	is_nfile: BOOLEAN is
		do
			Result := (value=g_file_error_nfile)
		end

	is_badf: BOOLEAN is
		do
			Result := (value=g_file_error_badf)
		end

	is_inval: BOOLEAN is
		do
			Result := (value=g_file_error_inval)
		end

	is_pipe: BOOLEAN is
		do
			Result := (value=g_file_error_pipe)
		end

	is_again: BOOLEAN is
		do
			Result := (value=g_file_error_again)
		end

	is_intr: BOOLEAN is
		do
			Result := (value=g_file_error_intr)
		end

	is_io: BOOLEAN is
		do
			Result := (value=g_file_error_io)
		end

	is_perm: BOOLEAN is
		do
			Result := (value=g_file_error_perm)
		end

	is_nosys: BOOLEAN is
		do
			Result := (value=g_file_error_nosys)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=g_file_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_error_exist: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_EXIST"
		end

	g_file_error_isdir: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_ISDIR"
		end

	g_file_error_acces: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_ACCES"
		end

	g_file_error_nametoolong: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NAMETOOLONG"
		end

	g_file_error_noent: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOENT"
		end

	g_file_error_notdir: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOTDIR"
		end

	g_file_error_nxio: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NXIO"
		end

	g_file_error_nodev: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NODEV"
		end

	g_file_error_rofs: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_ROFS"
		end

	g_file_error_txtbsy: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_TXTBSY"
		end

	g_file_error_fault: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_FAULT"
		end

	g_file_error_loop: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_LOOP"
		end

	g_file_error_nospc: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOSPC"
		end

	g_file_error_nomem: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOMEM"
		end

	g_file_error_mfile: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_MFILE"
		end

	g_file_error_nfile: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NFILE"
		end

	g_file_error_badf: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_BADF"
		end

	g_file_error_inval: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_INVAL"
		end

	g_file_error_pipe: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_PIPE"
		end

	g_file_error_again: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_AGAIN"
		end

	g_file_error_intr: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_INTR"
		end

	g_file_error_io: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_IO"
		end

	g_file_error_perm: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_PERM"
		end

	g_file_error_nosys: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_NOSYS"
		end

	g_file_error_failed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_FILE_ERROR_FAILED"
		end


end

