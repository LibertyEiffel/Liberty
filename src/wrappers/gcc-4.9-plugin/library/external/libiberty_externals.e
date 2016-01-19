-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class LIBIBERTY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	buildargv (an_argument_l1379_c7: POINTER): POINTER 
               -- buildargv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	c_alloca (an_argument_l182_c7: like long_unsigned): POINTER 
               -- C_alloca
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	choose_temp_base (): POINTER 
               -- choose_temp_base
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	concat (an_argument_l4730_c7: POINTER): POINTER 
               -- concat (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	concat_copy (an_argument_l1891_c7: POINTER; an_argument_l1892_c7: POINTER): POINTER 
               -- concat_copy (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	concat_copy2 (an_argument_l5462_c7: POINTER): POINTER 
               -- concat_copy2 (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	concat_length (an_argument_l4593_c7: POINTER): like long_unsigned 
               -- concat_length (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	countargv (an_argument_l7171_c7: POINTER): INTEGER 
               -- countargv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	dos_lbasename (an_argument_l614_c7: POINTER): POINTER 
               -- dos_lbasename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	dupargv (an_argument_l264_c7: POINTER): POINTER 
               -- dupargv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	errno_max (): INTEGER 
               -- errno_max
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	expandargv (an_argument_l7316_c7: POINTER; an_argument_l7317_c7: POINTER) 
               -- expandargv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fdmatch (a_fd1: INTEGER; a_fd2: INTEGER): INTEGER 
               -- fdmatch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fdopen_unlocked (an_argument_l2853_c7: INTEGER; an_argument_l2854_c7: POINTER): POINTER 
               -- fdopen_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fopen_unlocked (an_argument_l5712_c7: POINTER; an_argument_l5713_c7: POINTER): POINTER 
               -- fopen_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	freeargv (an_argument_l5459_c7: POINTER) 
               -- freeargv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	freopen_unlocked (an_argument_l1121_c7: POINTER; an_argument_l1122_c7: POINTER; an_argument_l1123_c7: POINTER): POINTER 
               -- freopen_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	get_run_time (): like long 
               -- get_run_time
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getpwd (): POINTER 
               -- getpwd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	hex_init () 
               -- hex_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' variable _hex_value skipped.
	lbasename (an_argument_l1208_c7: POINTER): POINTER 
               -- lbasename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	libiberty_concat_ptr: POINTER
               -- libiberty_concat_ptr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "libiberty_concat_ptr"
               }"
               end

       address_of_libiberty_concat_ptr: POINTER
               -- Address of libiberty_concat_ptr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&libiberty_concat_ptr"
               }"
               end

       set_libiberty_concat_ptr (a_value: POINTER)
               -- Set variable libiberty_concat_ptr value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_libiberty_concat_ptr"
               }"
               end

	lrealpath (an_argument_l7065_c7: POINTER): POINTER 
               -- lrealpath
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	make_relative_prefix (an_argument_l7249_c7: POINTER; an_argument_l7250_c7: POINTER; an_argument_l7251_c7: POINTER): POINTER 
               -- make_relative_prefix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	make_relative_prefix_ignore_links (an_argument_l2721_c7: POINTER; an_argument_l2722_c7: POINTER; an_argument_l2723_c7: POINTER): POINTER 
               -- make_relative_prefix_ignore_links
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	make_temp_file (an_argument_l115_c7: POINTER): POINTER 
               -- make_temp_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_free (an_argument_l5505_c7: POINTER) 
               -- pex_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_get_status (an_argument_l7515_c7: POINTER; a_count: INTEGER; a_vector: POINTER): INTEGER 
               -- pex_get_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_get_times (an_argument_l5823_c7: POINTER; a_count: INTEGER; a_vector: POINTER): INTEGER 
               -- pex_get_times
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_init (a_flags: INTEGER; a_pname: POINTER; a_tempbase: POINTER): POINTER 
               -- pex_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_input_file (an_obj: POINTER; a_flags: INTEGER; an_in_name: POINTER): POINTER 
               -- pex_input_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_input_pipe (an_obj: POINTER; a_binary: INTEGER): POINTER 
               -- pex_input_pipe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_one (a_flags: INTEGER; an_executable: POINTER; an_argv: POINTER; a_pname: POINTER; an_outname: POINTER; an_errname: POINTER; a_status: POINTER; an_err: POINTER): POINTER 
               -- pex_one
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_read_err (an_argument_l4412_c7: POINTER; a_binary: INTEGER): POINTER 
               -- pex_read_err
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_read_output (an_argument_l4866_c7: POINTER; a_binary: INTEGER): POINTER 
               -- pex_read_output
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_run (an_obj: POINTER; a_flags: INTEGER; an_executable: POINTER; an_argv: POINTER; an_outname: POINTER; an_errname: POINTER; an_err: POINTER): POINTER 
               -- pex_run
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pex_run_in_environment (an_obj: POINTER; a_flags: INTEGER; an_executable: POINTER; an_argv: POINTER; an_env: POINTER; an_outname: POINTER; an_errname: POINTER; an_err: POINTER): POINTER 
               -- pex_run_in_environment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pexecute (an_argument_l7352_c7: POINTER; an_argument_l7353_c7: POINTER; an_argument_l7354_c7: POINTER; an_argument_l7355_c7: POINTER; an_argument_l7356_c7: POINTER; an_argument_l7357_c7: POINTER; an_argument_l7358_c7: INTEGER): INTEGER 
               -- pexecute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	physmem_available (): REAL 
               -- physmem_available
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	physmem_total (): REAL 
               -- physmem_total
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pwait (an_argument_l7698_c7: INTEGER; an_argument_l7699_c7: POINTER; an_argument_l7700_c7: INTEGER): INTEGER 
               -- pwait
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	reconcat (an_argument_l3957_c7: POINTER; an_argument_l3958_c7: POINTER): POINTER 
               -- reconcat (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setproctitle (a_name: POINTER) 
               -- setproctitle (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	signo_max (): INTEGER 
               -- signo_max
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	spaces (a_count: INTEGER): POINTER 
               -- spaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	stack_limit_increase (an_argument_l2677_c7: like long_unsigned) 
               -- stack_limit_increase
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	strerrno (an_argument_l3494_c7: INTEGER): POINTER 
               -- strerrno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	strsigno (an_argument_l127_c7: INTEGER): POINTER 
               -- strsigno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	strtoerrno (an_argument_l4127_c7: POINTER): INTEGER 
               -- strtoerrno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	strtosigno (an_argument_l1524_c7: POINTER): INTEGER 
               -- strtosigno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unix_lbasename (an_argument_l6093_c7: POINTER): POINTER 
               -- unix_lbasename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unlink_if_ordinary (an_argument_l3692_c7: POINTER): INTEGER 
               -- unlink_if_ordinary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unlock_std_streams () 
               -- unlock_std_streams
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unlock_stream (an_argument_l2606_c7: POINTER) 
               -- unlock_stream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	writeargv (an_argument_l371_c7: POINTER; an_argument_l372_c7: POINTER): INTEGER 
               -- writeargv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xatexit (a_fn: POINTER): INTEGER 
               -- xatexit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xcalloc (an_argument_l610_c7: like long_unsigned; an_argument_l611_c7: like long_unsigned): POINTER 
               -- xcalloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xcrc32 (an_argument_l5290_c7: POINTER; an_argument_l5291_c7: INTEGER; an_argument_l5292_c7: NATURAL): NATURAL 
               -- xcrc32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xexit (a_status: INTEGER) 
               -- xexit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xmalloc (an_argument_l6718_c7: like long_unsigned): POINTER 
               -- xmalloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xmalloc_failed (an_argument_l2274_c7: like long_unsigned) 
               -- xmalloc_failed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xmalloc_set_program_name (an_argument_l3832_c7: POINTER) 
               -- xmalloc_set_program_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xmemdup (an_argument_l1436_c7: POINTER; an_argument_l1437_c7: like long_unsigned; an_argument_l1438_c7: like long_unsigned): POINTER 
               -- xmemdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xrealloc (an_argument_l377_c7: POINTER; an_argument_l378_c7: like long_unsigned): POINTER 
               -- xrealloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xstrdup (an_argument_l1369_c7: POINTER): POINTER 
               -- xstrdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xstrerror (an_argument_l7148_c7: INTEGER): POINTER 
               -- xstrerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xstrndup (an_argument_l2299_c7: POINTER; an_argument_l2300_c7: like long_unsigned): POINTER 
               -- xstrndup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class LIBIBERTY_EXTERNALS
