-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SPAWN_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_spawn_error_fork) or else 
				(a_value = g_spawn_error_read) or else 
				(a_value = g_spawn_error_chdir) or else 
				(a_value = g_spawn_error_acces) or else 
				(a_value = g_spawn_error_perm) or else 
				(a_value = g_spawn_error_2big) or else 
				(a_value = g_spawn_error_noexec) or else 
				(a_value = g_spawn_error_nametoolong) or else 
				(a_value = g_spawn_error_noent) or else 
				(a_value = g_spawn_error_nomem) or else 
				(a_value = g_spawn_error_notdir) or else 
				(a_value = g_spawn_error_loop) or else 
				(a_value = g_spawn_error_txtbusy) or else 
				(a_value = g_spawn_error_io) or else 
				(a_value = g_spawn_error_nfile) or else 
				(a_value = g_spawn_error_mfile) or else 
				(a_value = g_spawn_error_inval) or else 
				(a_value = g_spawn_error_isdir) or else 
				(a_value = g_spawn_error_libbad) or else 
				(a_value = g_spawn_error_failed))
		end


feature {ANY} -- Setters
	default_create, set_fork
		do
			value := g_spawn_error_fork
		end

	set_read
		do
			value := g_spawn_error_read
		end

	set_chdir
		do
			value := g_spawn_error_chdir
		end

	set_acces
		do
			value := g_spawn_error_acces
		end

	set_perm
		do
			value := g_spawn_error_perm
		end

	set_2big
		do
			value := g_spawn_error_2big
		end

	set_noexec
		do
			value := g_spawn_error_noexec
		end

	set_nametoolong
		do
			value := g_spawn_error_nametoolong
		end

	set_noent
		do
			value := g_spawn_error_noent
		end

	set_nomem
		do
			value := g_spawn_error_nomem
		end

	set_notdir
		do
			value := g_spawn_error_notdir
		end

	set_loop_external
		do
			value := g_spawn_error_loop
		end

	set_txtbusy
		do
			value := g_spawn_error_txtbusy
		end

	set_io
		do
			value := g_spawn_error_io
		end

	set_nfile
		do
			value := g_spawn_error_nfile
		end

	set_mfile
		do
			value := g_spawn_error_mfile
		end

	set_inval
		do
			value := g_spawn_error_inval
		end

	set_isdir
		do
			value := g_spawn_error_isdir
		end

	set_libbad
		do
			value := g_spawn_error_libbad
		end

	set_failed
		do
			value := g_spawn_error_failed
		end


feature {ANY} -- Queries
	is_fork: BOOLEAN
		do
			Result := (value=g_spawn_error_fork)
		end

	is_read: BOOLEAN
		do
			Result := (value=g_spawn_error_read)
		end

	is_chdir: BOOLEAN
		do
			Result := (value=g_spawn_error_chdir)
		end

	is_acces: BOOLEAN
		do
			Result := (value=g_spawn_error_acces)
		end

	is_perm: BOOLEAN
		do
			Result := (value=g_spawn_error_perm)
		end

	is_2big: BOOLEAN
		do
			Result := (value=g_spawn_error_2big)
		end

	is_noexec: BOOLEAN
		do
			Result := (value=g_spawn_error_noexec)
		end

	is_nametoolong: BOOLEAN
		do
			Result := (value=g_spawn_error_nametoolong)
		end

	is_noent: BOOLEAN
		do
			Result := (value=g_spawn_error_noent)
		end

	is_nomem: BOOLEAN
		do
			Result := (value=g_spawn_error_nomem)
		end

	is_notdir: BOOLEAN
		do
			Result := (value=g_spawn_error_notdir)
		end

	is_loop_external: BOOLEAN
		do
			Result := (value=g_spawn_error_loop)
		end

	is_txtbusy: BOOLEAN
		do
			Result := (value=g_spawn_error_txtbusy)
		end

	is_io: BOOLEAN
		do
			Result := (value=g_spawn_error_io)
		end

	is_nfile: BOOLEAN
		do
			Result := (value=g_spawn_error_nfile)
		end

	is_mfile: BOOLEAN
		do
			Result := (value=g_spawn_error_mfile)
		end

	is_inval: BOOLEAN
		do
			Result := (value=g_spawn_error_inval)
		end

	is_isdir: BOOLEAN
		do
			Result := (value=g_spawn_error_isdir)
		end

	is_libbad: BOOLEAN
		do
			Result := (value=g_spawn_error_libbad)
		end

	is_failed: BOOLEAN
		do
			Result := (value=g_spawn_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_spawn_error_fork: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_FORK"
		end

	g_spawn_error_read: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_READ"
		end

	g_spawn_error_chdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_CHDIR"
		end

	g_spawn_error_acces: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_ACCES"
		end

	g_spawn_error_perm: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_PERM"
		end

	g_spawn_error_2big: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_2BIG"
		end

	g_spawn_error_noexec: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOEXEC"
		end

	g_spawn_error_nametoolong: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NAMETOOLONG"
		end

	g_spawn_error_noent: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOENT"
		end

	g_spawn_error_nomem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOMEM"
		end

	g_spawn_error_notdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOTDIR"
		end

	g_spawn_error_loop: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_LOOP"
		end

	g_spawn_error_txtbusy: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_TXTBUSY"
		end

	g_spawn_error_io: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_IO"
		end

	g_spawn_error_nfile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NFILE"
		end

	g_spawn_error_mfile: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_MFILE"
		end

	g_spawn_error_inval: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_INVAL"
		end

	g_spawn_error_isdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_ISDIR"
		end

	g_spawn_error_libbad: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_LIBBAD"
		end

	g_spawn_error_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_FAILED"
		end


end

