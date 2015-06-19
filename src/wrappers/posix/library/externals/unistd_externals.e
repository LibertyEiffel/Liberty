-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class UNISTD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	access (a_name: POINTER; a_type: INTEGER): INTEGER 
               -- access
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	acct (a_name: POINTER): INTEGER 
               -- acct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	alarm (a_seconds: NATURAL): NATURAL 
               -- alarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	brk (an_addr: POINTER): INTEGER 
               -- brk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	chdir (a_path: POINTER): INTEGER 
               -- chdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	chown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER 
               -- chown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	chroot (a_path: POINTER): INTEGER 
               -- chroot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	close (a_fd: INTEGER): INTEGER 
               -- close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	crypt (a_key: POINTER; a_salt: POINTER): POINTER 
               -- crypt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	daemon (a_nochdir: INTEGER; a_noclose: INTEGER): INTEGER 
               -- daemon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	dup (a_fd: INTEGER): INTEGER 
               -- dup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	dup2 (a_fd: INTEGER; a_fd2: INTEGER): INTEGER 
               -- dup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	dup3 (a_fd: INTEGER; a_fd2: INTEGER; a_flags: INTEGER): INTEGER 
               -- dup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	eaccess (a_name: POINTER; a_type: INTEGER): INTEGER 
               -- eaccess
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	encrypt (a_glibc_block: POINTER; an_edflag: INTEGER) 
               -- encrypt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	endusershell () 
               -- endusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' variable __environ skipped.
	environ: POINTER
               -- environ
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "environ"
               }"
               end

       address_of_environ: POINTER
               -- Address of environ
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&environ"
               }"
               end

       set_environ (a_value: POINTER)
               -- Set variable environ value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_environ"
               }"
               end

	euidaccess (a_name: POINTER; a_type: INTEGER): INTEGER 
               -- euidaccess
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execl (a_path: POINTER; an_arg: POINTER): INTEGER 
               -- execl (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execle (a_path: POINTER; an_arg: POINTER): INTEGER 
               -- execle (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execlp (a_file: POINTER; an_arg: POINTER): INTEGER 
               -- execlp (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execv (a_path: POINTER; an_argv: POINTER): INTEGER 
               -- execv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execve (a_path: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 
               -- execve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execvp (a_file: POINTER; an_argv: POINTER): INTEGER 
               -- execvp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	execvpe (a_file: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 
               -- execvpe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function _exit skipped.
	faccessat (a_fd: INTEGER; a_file: POINTER; a_type: INTEGER; a_flag: INTEGER): INTEGER 
               -- faccessat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fchdir (a_fd: INTEGER): INTEGER 
               -- fchdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fchown (a_fd: INTEGER; an_owner: NATURAL; a_group: NATURAL): INTEGER 
               -- fchown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fchownat (a_fd: INTEGER; a_file: POINTER; an_owner: NATURAL; a_group: NATURAL; a_flag: INTEGER): INTEGER 
               -- fchownat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fdatasync (a_fildes: INTEGER): INTEGER 
               -- fdatasync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fexecve (a_fd: INTEGER; an_argv: POINTER; an_envp: POINTER): INTEGER 
               -- fexecve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fork (): INTEGER 
               -- fork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fpathconf (a_fd: INTEGER; a_name: INTEGER): like long 
               -- fpathconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	fsync (a_fd: INTEGER): INTEGER 
               -- fsync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ftruncate (a_fd: INTEGER; a_length: like long): INTEGER 
               -- ftruncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ftruncate64 (a_fd: INTEGER; a_length: like long): INTEGER 
               -- ftruncate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	get_current_dir_name (): POINTER 
               -- get_current_dir_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getdtablesize (): INTEGER 
               -- getdtablesize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getegid (): NATURAL 
               -- getegid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	geteuid (): NATURAL 
               -- geteuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getgid (): NATURAL 
               -- getgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	gethostid (): like long 
               -- gethostid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getlogin (): POINTER 
               -- getlogin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getpagesize (): INTEGER 
               -- getpagesize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getpass (a_prompt: POINTER): POINTER 
               -- getpass
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getpgid (a_pid: INTEGER): INTEGER 
               -- getpgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	-- `hidden' function __getpgid skipped.
	getpgrp (): INTEGER 
               -- getpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getpid (): INTEGER 
               -- getpid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getppid (): INTEGER 
               -- getppid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getresgid (a_rgid: POINTER; an_egid: POINTER; a_sgid: POINTER): INTEGER 
               -- getresgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getresuid (a_ruid: POINTER; an_euid: POINTER; a_suid: POINTER): INTEGER 
               -- getresuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getsid (a_pid: INTEGER): INTEGER 
               -- getsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getuid (): NATURAL 
               -- getuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	getusershell (): POINTER 
               -- getusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	group_member (a_gid: NATURAL): INTEGER 
               -- group_member
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	isatty (a_fd: INTEGER): INTEGER 
               -- isatty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	lchown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER 
               -- lchown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	link (a_from_external: POINTER; a_to: POINTER): INTEGER 
               -- link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	linkat (a_fromfd: INTEGER; a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER; a_flags: INTEGER): INTEGER 
               -- linkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	lseek (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long 
               -- lseek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	lseek64 (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long 
               -- lseek64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	nice (an_inc: INTEGER): INTEGER 
               -- nice
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pathconf (a_path: POINTER; a_name: INTEGER): like long 
               -- pathconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pause (): INTEGER 
               -- pause
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pipe (a_pipedes: POINTER): INTEGER 
               -- pipe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pipe2 (a_pipedes: POINTER; a_flags: INTEGER): INTEGER 
               -- pipe2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	profil (a_sample_buffer: POINTER; a_size: like size_t; an_offset: like size_t; a_scale: NATURAL): INTEGER 
               -- profil
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pwrite (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t 
               -- pwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	pwrite64 (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t 
               -- pwrite64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	revoke (a_file: POINTER): INTEGER 
               -- revoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	rmdir (a_path: POINTER): INTEGER 
               -- rmdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sbrk (a_delta: like intptr_t): POINTER 
               -- sbrk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setdomainname (a_name: POINTER; a_len: like size_t): INTEGER 
               -- setdomainname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setegid (a_gid: NATURAL): INTEGER 
               -- setegid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	seteuid (an_uid: NATURAL): INTEGER 
               -- seteuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setgid (a_gid: NATURAL): INTEGER 
               -- setgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sethostid (an_id: like long): INTEGER 
               -- sethostid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sethostname (a_name: POINTER; a_len: like size_t): INTEGER 
               -- sethostname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setlogin (a_name: POINTER): INTEGER 
               -- setlogin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setpgid (a_pid: INTEGER; a_pgid: INTEGER): INTEGER 
               -- setpgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setpgrp (): INTEGER 
               -- setpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setregid (a_rgid: NATURAL; an_egid: NATURAL): INTEGER 
               -- setregid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setresgid (a_rgid: NATURAL; an_egid: NATURAL; a_sgid: NATURAL): INTEGER 
               -- setresgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setresuid (a_ruid: NATURAL; an_euid: NATURAL; a_suid: NATURAL): INTEGER 
               -- setresuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setreuid (a_ruid: NATURAL; an_euid: NATURAL): INTEGER 
               -- setreuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setsid (): INTEGER 
               -- setsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setuid (an_uid: NATURAL): INTEGER 
               -- setuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	setusershell () 
               -- setusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sleep (a_seconds: NATURAL): NATURAL 
               -- sleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	swab (a_from_external: POINTER; a_to: POINTER; a_n: like ssize_t) 
               -- swab
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	symlink (a_from_external: POINTER; a_to: POINTER): INTEGER 
               -- symlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	symlinkat (a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER): INTEGER 
               -- symlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sync () 
               -- sync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	syncfs (a_fd: INTEGER): INTEGER 
               -- syncfs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	syscall (a_sysno: like long): like long 
               -- syscall (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	sysconf (a_name: INTEGER): like long 
               -- sysconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	tcgetpgrp (a_fd: INTEGER): INTEGER 
               -- tcgetpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	tcsetpgrp (a_fd: INTEGER; a_pgrp_id: INTEGER): INTEGER 
               -- tcsetpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	truncate (a_file: POINTER; a_length: like long): INTEGER 
               -- truncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	truncate64 (a_file: POINTER; a_length: like long): INTEGER 
               -- truncate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ttyname (a_fd: INTEGER): POINTER 
               -- ttyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ttyslot (): INTEGER 
               -- ttyslot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ualarm (a_value: NATURAL; an_interval: NATURAL): NATURAL 
               -- ualarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unlink (a_name: POINTER): INTEGER 
               -- unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unlinkat (a_fd: INTEGER; a_name: POINTER; a_flag: INTEGER): INTEGER 
               -- unlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	usleep (an_useconds: NATURAL): INTEGER 
               -- usleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	vfork (): INTEGER 
               -- vfork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	vhangup (): INTEGER 
               -- vhangup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	write (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t): like ssize_t 
               -- write
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class UNISTD_EXTERNALS
