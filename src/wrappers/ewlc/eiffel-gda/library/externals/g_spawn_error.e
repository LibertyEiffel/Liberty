-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SPAWN_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
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
	default_create, set_fork is
		do
			value := g_spawn_error_fork
		end

	set_read is
		do
			value := g_spawn_error_read
		end

	set_chdir is
		do
			value := g_spawn_error_chdir
		end

	set_acces is
		do
			value := g_spawn_error_acces
		end

	set_perm is
		do
			value := g_spawn_error_perm
		end

	set_2big is
		do
			value := g_spawn_error_2big
		end

	set_noexec is
		do
			value := g_spawn_error_noexec
		end

	set_nametoolong is
		do
			value := g_spawn_error_nametoolong
		end

	set_noent is
		do
			value := g_spawn_error_noent
		end

	set_nomem is
		do
			value := g_spawn_error_nomem
		end

	set_notdir is
		do
			value := g_spawn_error_notdir
		end

	set_loop_external is
		do
			value := g_spawn_error_loop
		end

	set_txtbusy is
		do
			value := g_spawn_error_txtbusy
		end

	set_io is
		do
			value := g_spawn_error_io
		end

	set_nfile is
		do
			value := g_spawn_error_nfile
		end

	set_mfile is
		do
			value := g_spawn_error_mfile
		end

	set_inval is
		do
			value := g_spawn_error_inval
		end

	set_isdir is
		do
			value := g_spawn_error_isdir
		end

	set_libbad is
		do
			value := g_spawn_error_libbad
		end

	set_failed is
		do
			value := g_spawn_error_failed
		end


feature {ANY} -- Queries
	is_fork: BOOLEAN is
		do
			Result := (value=g_spawn_error_fork)
		end

	is_read: BOOLEAN is
		do
			Result := (value=g_spawn_error_read)
		end

	is_chdir: BOOLEAN is
		do
			Result := (value=g_spawn_error_chdir)
		end

	is_acces: BOOLEAN is
		do
			Result := (value=g_spawn_error_acces)
		end

	is_perm: BOOLEAN is
		do
			Result := (value=g_spawn_error_perm)
		end

	is_2big: BOOLEAN is
		do
			Result := (value=g_spawn_error_2big)
		end

	is_noexec: BOOLEAN is
		do
			Result := (value=g_spawn_error_noexec)
		end

	is_nametoolong: BOOLEAN is
		do
			Result := (value=g_spawn_error_nametoolong)
		end

	is_noent: BOOLEAN is
		do
			Result := (value=g_spawn_error_noent)
		end

	is_nomem: BOOLEAN is
		do
			Result := (value=g_spawn_error_nomem)
		end

	is_notdir: BOOLEAN is
		do
			Result := (value=g_spawn_error_notdir)
		end

	is_loop_external: BOOLEAN is
		do
			Result := (value=g_spawn_error_loop)
		end

	is_txtbusy: BOOLEAN is
		do
			Result := (value=g_spawn_error_txtbusy)
		end

	is_io: BOOLEAN is
		do
			Result := (value=g_spawn_error_io)
		end

	is_nfile: BOOLEAN is
		do
			Result := (value=g_spawn_error_nfile)
		end

	is_mfile: BOOLEAN is
		do
			Result := (value=g_spawn_error_mfile)
		end

	is_inval: BOOLEAN is
		do
			Result := (value=g_spawn_error_inval)
		end

	is_isdir: BOOLEAN is
		do
			Result := (value=g_spawn_error_isdir)
		end

	is_libbad: BOOLEAN is
		do
			Result := (value=g_spawn_error_libbad)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=g_spawn_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_spawn_error_fork: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_FORK"
		end

	g_spawn_error_read: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_READ"
		end

	g_spawn_error_chdir: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_CHDIR"
		end

	g_spawn_error_acces: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_ACCES"
		end

	g_spawn_error_perm: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_PERM"
		end

	g_spawn_error_2big: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_2BIG"
		end

	g_spawn_error_noexec: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOEXEC"
		end

	g_spawn_error_nametoolong: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NAMETOOLONG"
		end

	g_spawn_error_noent: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOENT"
		end

	g_spawn_error_nomem: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOMEM"
		end

	g_spawn_error_notdir: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NOTDIR"
		end

	g_spawn_error_loop: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_LOOP"
		end

	g_spawn_error_txtbusy: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_TXTBUSY"
		end

	g_spawn_error_io: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_IO"
		end

	g_spawn_error_nfile: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_NFILE"
		end

	g_spawn_error_mfile: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_MFILE"
		end

	g_spawn_error_inval: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_INVAL"
		end

	g_spawn_error_isdir: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_ISDIR"
		end

	g_spawn_error_libbad: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_LIBBAD"
		end

	g_spawn_error_failed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SPAWN_ERROR_FAILED"
		end


end

