-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UNISTD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	access (a_name: POINTER; a_type: INTEGER): INTEGER is
 		-- access
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "access"
		}"
		end

	acct (a_name: POINTER): INTEGER is
 		-- acct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acct"
		}"
		end

	alarm (a_seconds: NATURAL): NATURAL is
 		-- alarm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "alarm"
		}"
		end

	brk (an_addr: POINTER): INTEGER is
 		-- brk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "brk"
		}"
		end

	chdir (a_path: POINTER): INTEGER is
 		-- chdir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chdir"
		}"
		end

	chown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER is
 		-- chown
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chown"
		}"
		end

	chroot (a_path: POINTER): INTEGER is
 		-- chroot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chroot"
		}"
		end

	close (a_fd: INTEGER): INTEGER is
 		-- close
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "close"
		}"
		end

	crypt (a_key: POINTER; a_salt: POINTER): POINTER is
 		-- crypt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "crypt"
		}"
		end

	ctermid (a_s: POINTER): POINTER is
 		-- ctermid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctermid"
		}"
		end

	daemon (a_nochdir: INTEGER; a_noclose: INTEGER): INTEGER is
 		-- daemon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "daemon"
		}"
		end

	dup (a_fd: INTEGER): INTEGER is
 		-- dup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dup"
		}"
		end

	dup2 (a_fd: INTEGER; a_fd2: INTEGER): INTEGER is
 		-- dup2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dup2"
		}"
		end

	dup3 (a_fd: INTEGER; a_fd2: INTEGER; a_flags: INTEGER): INTEGER is
 		-- dup3
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dup3"
		}"
		end

	eaccess (a_name: POINTER; a_type: INTEGER): INTEGER is
 		-- eaccess
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "eaccess"
		}"
		end

	encrypt (a_libc_block: POINTER; an_edflag: INTEGER) is
 		-- encrypt
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "encrypt"
		}"
		end

	endusershell is
 		-- endusershell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endusershell()"
		}"
		end

	environ: POINTER is
 		-- environ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "environ"
		}"
		end

	address_of_environ: POINTER is
 		-- Address of environ
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&environ"
		}"
		end

	set_environ (a_value: POINTER) is
		-- Set variable environ value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_environ"
		}"
		end

	-- `hidden' variable __environ skipped.
	euidaccess (a_name: POINTER; a_type: INTEGER): INTEGER is
 		-- euidaccess
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "euidaccess"
		}"
		end

	execl (a_path: POINTER; an_arg: POINTER): INTEGER is
 		-- execl (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execl"
		}"
		end

	execle (a_path: POINTER; an_arg: POINTER): INTEGER is
 		-- execle (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execle"
		}"
		end

	execlp (a_file: POINTER; an_arg: POINTER): INTEGER is
 		-- execlp (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execlp"
		}"
		end

	execv (a_path: POINTER; an_argv: POINTER): INTEGER is
 		-- execv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execv"
		}"
		end

	execve (a_path: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER is
 		-- execve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execve"
		}"
		end

	execvp (a_file: POINTER; an_argv: POINTER): INTEGER is
 		-- execvp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execvp"
		}"
		end

	execvpe (a_file: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER is
 		-- execvpe
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execvpe"
		}"
		end

	-- `hidden' function _exit skipped.
	faccessat (a_fd: INTEGER; a_file: POINTER; a_type: INTEGER; a_flag: INTEGER): INTEGER is
 		-- faccessat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "faccessat"
		}"
		end

	fchdir (a_fd: INTEGER): INTEGER is
 		-- fchdir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchdir"
		}"
		end

	fchown (a_fd: INTEGER; an_owner: NATURAL; a_group: NATURAL): INTEGER is
 		-- fchown
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchown"
		}"
		end

	fchownat (a_fd: INTEGER; a_file: POINTER; an_owner: NATURAL; a_group: NATURAL; a_flag: INTEGER): INTEGER is
 		-- fchownat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchownat"
		}"
		end

	fdatasync (a_fildes: INTEGER): INTEGER is
 		-- fdatasync
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdatasync"
		}"
		end

	fexecve (a_fd: INTEGER; an_argv: POINTER; an_envp: POINTER): INTEGER is
 		-- fexecve
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fexecve"
		}"
		end

	fork: INTEGER is
 		-- fork
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fork()"
		}"
		end

	fpathconf (a_fd: INTEGER; a_name: INTEGER): like long is
 		-- fpathconf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fpathconf"
		}"
		end

	fsync (a_fd: INTEGER): INTEGER is
 		-- fsync
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsync"
		}"
		end

	ftruncate (a_fd: INTEGER; a_length: like long): INTEGER is
 		-- ftruncate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftruncate"
		}"
		end

	ftruncate64 (a_fd: INTEGER; a_length: INTEGER_64): INTEGER is
 		-- ftruncate64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftruncate64"
		}"
		end

	get_current_dir_name: POINTER is
 		-- get_current_dir_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "get_current_dir_name()"
		}"
		end

	getdtablesize: INTEGER is
 		-- getdtablesize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdtablesize()"
		}"
		end

	getegid: NATURAL is
 		-- getegid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getegid()"
		}"
		end

	geteuid: NATURAL is
 		-- geteuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "geteuid()"
		}"
		end

	getgid: NATURAL is
 		-- getgid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getgid()"
		}"
		end

	gethostid: like long is
 		-- gethostid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gethostid()"
		}"
		end

	getlogin: POINTER is
 		-- getlogin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getlogin()"
		}"
		end

	getpagesize: INTEGER is
 		-- getpagesize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpagesize()"
		}"
		end

	getpass (a_prompt: POINTER): POINTER is
 		-- getpass
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpass"
		}"
		end

	-- `hidden' function __getpgid skipped.
	getpgid (a_pid: INTEGER): INTEGER is
 		-- getpgid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpgid"
		}"
		end

	getpgrp: INTEGER is
 		-- getpgrp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpgrp()"
		}"
		end

	getpid: INTEGER is
 		-- getpid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpid()"
		}"
		end

	getppid: INTEGER is
 		-- getppid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getppid()"
		}"
		end

	getresgid (a_rgid: POINTER; an_egid: POINTER; a_sgid: POINTER): INTEGER is
 		-- getresgid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getresgid"
		}"
		end

	getresuid (a_ruid: POINTER; an_euid: POINTER; a_suid: POINTER): INTEGER is
 		-- getresuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getresuid"
		}"
		end

	getsid (a_pid: INTEGER): INTEGER is
 		-- getsid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getsid"
		}"
		end

	getuid: NATURAL is
 		-- getuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getuid()"
		}"
		end

	getusershell: POINTER is
 		-- getusershell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getusershell()"
		}"
		end

	group_member (a_gid: NATURAL): INTEGER is
 		-- group_member
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "group_member"
		}"
		end

	isatty (a_fd: INTEGER): INTEGER is
 		-- isatty
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isatty"
		}"
		end

	lchown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER is
 		-- lchown
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lchown"
		}"
		end

	link (a_from_external: POINTER; a_to: POINTER): INTEGER is
 		-- link
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "link"
		}"
		end

	linkat (a_fromfd: INTEGER; a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER; a_flags: INTEGER): INTEGER is
 		-- linkat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "linkat"
		}"
		end

	lseek (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long is
 		-- lseek
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lseek"
		}"
		end

	lseek64 (a_fd: INTEGER; an_offset: INTEGER_64; a_whence: INTEGER): INTEGER_64 is
 		-- lseek64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lseek64"
		}"
		end

	nice (an_inc: INTEGER): INTEGER is
 		-- nice
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nice"
		}"
		end

	pathconf (a_path: POINTER; a_name: INTEGER): like long is
 		-- pathconf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pathconf"
		}"
		end

	pause: INTEGER is
 		-- pause
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pause()"
		}"
		end

	pipe (a_pipedes: POINTER): INTEGER is
 		-- pipe
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pipe"
		}"
		end

	pipe2 (a_pipedes: POINTER; a_flags: INTEGER): INTEGER is
 		-- pipe2
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pipe2"
		}"
		end

	profil (a_sample_buffer: POINTER; a_size: like size_t; an_offset: like size_t; a_scale: NATURAL): INTEGER is
 		-- profil
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "profil"
		}"
		end

	pwrite (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t is
 		-- pwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pwrite"
		}"
		end

	pwrite64 (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: INTEGER_64): like ssize_t is
 		-- pwrite64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pwrite64"
		}"
		end

	revoke (a_file: POINTER): INTEGER is
 		-- revoke
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "revoke"
		}"
		end

	rmdir (a_path: POINTER): INTEGER is
 		-- rmdir
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rmdir"
		}"
		end

	sbrk (a_delta: like intptr_t): POINTER is
 		-- sbrk
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sbrk"
		}"
		end

	setdomainname (a_name: POINTER; a_len: like size_t): INTEGER is
 		-- setdomainname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setdomainname"
		}"
		end

	setegid (a_gid: NATURAL): INTEGER is
 		-- setegid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setegid"
		}"
		end

	seteuid (an_uid: NATURAL): INTEGER is
 		-- seteuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "seteuid"
		}"
		end

	setgid (a_gid: NATURAL): INTEGER is
 		-- setgid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setgid"
		}"
		end

	sethostid (an_id: like long): INTEGER is
 		-- sethostid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sethostid"
		}"
		end

	sethostname (a_name: POINTER; a_len: like size_t): INTEGER is
 		-- sethostname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sethostname"
		}"
		end

	setlogin (a_name: POINTER): INTEGER is
 		-- setlogin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setlogin"
		}"
		end

	setpgid (a_pid: INTEGER; a_pgid: INTEGER): INTEGER is
 		-- setpgid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setpgid"
		}"
		end

	setpgrp: INTEGER is
 		-- setpgrp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setpgrp()"
		}"
		end

	setregid (a_rgid: NATURAL; an_egid: NATURAL): INTEGER is
 		-- setregid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setregid"
		}"
		end

	setresgid (a_rgid: NATURAL; an_egid: NATURAL; a_sgid: NATURAL): INTEGER is
 		-- setresgid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setresgid"
		}"
		end

	setresuid (a_ruid: NATURAL; an_euid: NATURAL; a_suid: NATURAL): INTEGER is
 		-- setresuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setresuid"
		}"
		end

	setreuid (a_ruid: NATURAL; an_euid: NATURAL): INTEGER is
 		-- setreuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setreuid"
		}"
		end

	setsid: INTEGER is
 		-- setsid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setsid()"
		}"
		end

	setuid (an_uid: NATURAL): INTEGER is
 		-- setuid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setuid"
		}"
		end

	setusershell is
 		-- setusershell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setusershell()"
		}"
		end

	sleep (a_seconds: NATURAL): NATURAL is
 		-- sleep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sleep"
		}"
		end

	swab (a_from_external: POINTER; a_to: POINTER; a_n: like ssize_t) is
 		-- swab
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "swab"
		}"
		end

	symlink (a_from_external: POINTER; a_to: POINTER): INTEGER is
 		-- symlink
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "symlink"
		}"
		end

	symlinkat (a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER): INTEGER is
 		-- symlinkat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "symlinkat"
		}"
		end

	sync is
 		-- sync
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sync()"
		}"
		end

	syncfs (a_fd: INTEGER): INTEGER is
 		-- syncfs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "syncfs"
		}"
		end

	syscall (a_sysno: like long): like long is
 		-- syscall (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "syscall"
		}"
		end

	sysconf (a_name: INTEGER): like long is
 		-- sysconf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sysconf"
		}"
		end

	tcgetpgrp (a_fd: INTEGER): INTEGER is
 		-- tcgetpgrp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcgetpgrp"
		}"
		end

	tcsetpgrp (a_fd: INTEGER; a_pgrp_id: INTEGER): INTEGER is
 		-- tcsetpgrp
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcsetpgrp"
		}"
		end

	truncate (a_file: POINTER; a_length: like long): INTEGER is
 		-- truncate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "truncate"
		}"
		end

	truncate64 (a_file: POINTER; a_length: INTEGER_64): INTEGER is
 		-- truncate64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "truncate64"
		}"
		end

	ttyname (a_fd: INTEGER): POINTER is
 		-- ttyname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ttyname"
		}"
		end

	ttyslot: INTEGER is
 		-- ttyslot
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ttyslot()"
		}"
		end

	ualarm (a_value: NATURAL; an_interval: NATURAL): NATURAL is
 		-- ualarm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ualarm"
		}"
		end

	unlink (a_name: POINTER): INTEGER is
 		-- unlink
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unlink"
		}"
		end

	unlinkat (a_fd: INTEGER; a_name: POINTER; a_flag: INTEGER): INTEGER is
 		-- unlinkat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unlinkat"
		}"
		end

	usleep (an_useconds: NATURAL): INTEGER is
 		-- usleep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "usleep"
		}"
		end

	vfork: INTEGER is
 		-- vfork
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfork()"
		}"
		end

	vhangup: INTEGER is
 		-- vhangup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vhangup()"
		}"
		end

	write (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t): like ssize_t is
 		-- write
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "write"
		}"
		end


end -- class UNISTD_EXTERNALS
