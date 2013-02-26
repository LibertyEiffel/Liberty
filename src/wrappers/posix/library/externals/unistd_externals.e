-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UNISTD_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	environ: POINTER is
 		-- environ (node at line 546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "environ"
		}"
		end

	address_of_environ: POINTER is
 		-- Address of environ (node at line 546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&environ"
		}"
		end

	-- `hidden' variable __environ skipped.
	sync is
 		-- sync (node at line 53)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sync()"
		}"
		end

	gethostid: INTEGER_64 is
 		-- gethostid (node at line 57)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gethostid()"
		}"
		end

	alarm (a_seconds: NATURAL_32): NATURAL_32 is
 		-- alarm (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "alarm"
		}"
		end

	pwrite64 (a_fd: INTEGER_32; a_buf: POINTER; a_n: NATURAL_64; an_offset: INTEGER_64): INTEGER_64 is
 		-- pwrite64 (node at line 74)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pwrite64"
		}"
		end

	execl (a_path: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- execl (variadic call)  (node at line 291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execl"
		}"
		end

	setsid: INTEGER_32 is
 		-- setsid (node at line 296)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setsid()"
		}"
		end

	execv (a_path: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- execv (node at line 301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execv"
		}"
		end

	execve (a_path: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER_32 is
 		-- execve (node at line 337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execve"
		}"
		end

	sysconf (a_name: INTEGER_32): INTEGER_64 is
 		-- sysconf (node at line 410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sysconf"
		}"
		end

	symlink (a_from_external: POINTER; a_to: POINTER): INTEGER_32 is
 		-- symlink (node at line 462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "symlink"
		}"
		end

	encrypt (a_libc_block: POINTER; an_edflag: INTEGER_32) is
 		-- encrypt (node at line 524)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "encrypt"
		}"
		end

	setresuid (a_ruid: NATURAL_32; an_euid: NATURAL_32; a_suid: NATURAL_32): INTEGER_32 is
 		-- setresuid (node at line 553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setresuid"
		}"
		end

	brk (an_addr: POINTER): INTEGER_32 is
 		-- brk (node at line 1132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "brk"
		}"
		end

	chroot (a_path: POINTER): INTEGER_32 is
 		-- chroot (node at line 1212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chroot"
		}"
		end

	getresuid (a_ruid: POINTER; an_euid: POINTER; a_suid: POINTER): INTEGER_32 is
 		-- getresuid (node at line 1294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getresuid"
		}"
		end

	group_member (a_gid: NATURAL_32): INTEGER_32 is
 		-- group_member (node at line 1299)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "group_member"
		}"
		end

	unlinkat (a_fd: INTEGER_32; a_name: POINTER; a_flag: INTEGER_32): INTEGER_32 is
 		-- unlinkat (node at line 1335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unlinkat"
		}"
		end

	getresgid (a_rgid: POINTER; an_egid: POINTER; a_sgid: POINTER): INTEGER_32 is
 		-- getresgid (node at line 1526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getresgid"
		}"
		end

	usleep (an_useconds: NATURAL_32): INTEGER_32 is
 		-- usleep (node at line 1548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "usleep"
		}"
		end

	linkat (a_fromfd: INTEGER_32; a_from_external: POINTER; a_tofd: INTEGER_32; a_to: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- linkat (node at line 1610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "linkat"
		}"
		end

	acct (a_name: POINTER): INTEGER_32 is
 		-- acct (node at line 1659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "acct"
		}"
		end

	vfork: INTEGER_32 is
 		-- vfork (node at line 1741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfork()"
		}"
		end

	vhangup: INTEGER_32 is
 		-- vhangup (node at line 1771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vhangup()"
		}"
		end

	setreuid (a_ruid: NATURAL_32; an_euid: NATURAL_32): INTEGER_32 is
 		-- setreuid (node at line 1791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setreuid"
		}"
		end

	truncate (a_file: POINTER; a_length: INTEGER_64): INTEGER_32 is
 		-- truncate (node at line 2082)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "truncate"
		}"
		end

	execle (a_path: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- execle (variadic call)  (node at line 2115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execle"
		}"
		end

	execlp (a_file: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- execlp (variadic call)  (node at line 2127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execlp"
		}"
		end

	isatty (a_fd: INTEGER_32): INTEGER_32 is
 		-- isatty (node at line 2251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "isatty"
		}"
		end

	ttyslot: INTEGER_32 is
 		-- ttyslot (node at line 2261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ttyslot()"
		}"
		end

	syscall (a_sysno: INTEGER_64): INTEGER_64 is
 		-- syscall (variadic call)  (node at line 2270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "syscall"
		}"
		end

	setuid (an_uid: NATURAL_32): INTEGER_32 is
 		-- setuid (node at line 2283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setuid"
		}"
		end

	getgid: NATURAL_32 is
 		-- getgid (node at line 2292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getgid()"
		}"
		end

	chdir (a_path: POINTER): INTEGER_32 is
 		-- chdir (node at line 2397)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chdir"
		}"
		end

	nice (an_inc: INTEGER_32): INTEGER_32 is
 		-- nice (node at line 2490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "nice"
		}"
		end

	execvp (a_file: POINTER; an_argv: POINTER): INTEGER_32 is
 		-- execvp (node at line 2512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execvp"
		}"
		end

	pwrite (a_fd: INTEGER_32; a_buf: POINTER; a_n: NATURAL_64; an_offset: INTEGER_64): INTEGER_64 is
 		-- pwrite (node at line 2631)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pwrite"
		}"
		end

	setresgid (a_rgid: NATURAL_32; an_egid: NATURAL_32; a_sgid: NATURAL_32): INTEGER_32 is
 		-- setresgid (node at line 2671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setresgid"
		}"
		end

	fchdir (a_fd: INTEGER_32): INTEGER_32 is
 		-- fchdir (node at line 2971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchdir"
		}"
		end

	chown (a_file: POINTER; an_owner: NATURAL_32; a_group: NATURAL_32): INTEGER_32 is
 		-- chown (node at line 3040)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chown"
		}"
		end

	swab (a_from_external: POINTER; a_to: POINTER; a_n: INTEGER_64) is
 		-- swab (node at line 3089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "swab"
		}"
		end

	getpgrp: INTEGER_32 is
 		-- getpgrp (node at line 3109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpgrp()"
		}"
		end

	getlogin: POINTER is
 		-- getlogin (node at line 3267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getlogin()"
		}"
		end

	close (a_fd: INTEGER_32): INTEGER_32 is
 		-- close (node at line 3398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "close"
		}"
		end

	fchownat (a_fd: INTEGER_32; a_file: POINTER; an_owner: NATURAL_32; a_group: NATURAL_32; a_flag: INTEGER_32): INTEGER_32 is
 		-- fchownat (node at line 3422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchownat"
		}"
		end

	setpgid (a_pid: INTEGER_32; a_pgid: INTEGER_32): INTEGER_32 is
 		-- setpgid (node at line 3638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setpgid"
		}"
		end

	seteuid (an_uid: NATURAL_32): INTEGER_32 is
 		-- seteuid (node at line 3691)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "seteuid"
		}"
		end

	lseek (a_fd: INTEGER_32; an_offset: INTEGER_64; a_whence: INTEGER_32): INTEGER_64 is
 		-- lseek (node at line 3712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lseek"
		}"
		end

	fchown (a_fd: INTEGER_32; an_owner: NATURAL_32; a_group: NATURAL_32): INTEGER_32 is
 		-- fchown (node at line 3731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchown"
		}"
		end

	revoke (a_file: POINTER): INTEGER_32 is
 		-- revoke (node at line 3736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "revoke"
		}"
		end

	symlinkat (a_from_external: POINTER; a_tofd: INTEGER_32; a_to: POINTER): INTEGER_32 is
 		-- symlinkat (node at line 3807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "symlinkat"
		}"
		end

	ualarm (a_value: NATURAL_32; an_interval: NATURAL_32): NATURAL_32 is
 		-- ualarm (node at line 3853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ualarm"
		}"
		end

	euidaccess (a_name: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- euidaccess (node at line 3907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "euidaccess"
		}"
		end

	getegid: NATURAL_32 is
 		-- getegid (node at line 3937)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getegid()"
		}"
		end

	profil (a_sample_buffer: POINTER; a_size: NATURAL_64; an_offset: NATURAL_64; a_scale: NATURAL_32): INTEGER_32 is
 		-- profil (node at line 4056)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "profil"
		}"
		end

	fsync (a_fd: INTEGER_32): INTEGER_32 is
 		-- fsync (node at line 4185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsync"
		}"
		end

	dup2 (a_fd: INTEGER_32; a_fd2: INTEGER_32): INTEGER_32 is
 		-- dup2 (node at line 4220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dup2"
		}"
		end

	dup3 (a_fd: INTEGER_32; a_fd2: INTEGER_32; a_flags: INTEGER_32): INTEGER_32 is
 		-- dup3 (node at line 4224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dup3"
		}"
		end

	pipe (a_pipedes: POINTER): INTEGER_32 is
 		-- pipe (node at line 4229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pipe"
		}"
		end

	lseek64 (a_fd: INTEGER_32; an_offset: INTEGER_64; a_whence: INTEGER_32): INTEGER_64 is
 		-- lseek64 (node at line 4242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lseek64"
		}"
		end

	get_current_dir_name: POINTER is
 		-- get_current_dir_name (node at line 4375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "get_current_dir_name()"
		}"
		end

	pause: INTEGER_32 is
 		-- pause (node at line 4383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pause()"
		}"
		end

	truncate64 (a_file: POINTER; a_length: INTEGER_64): INTEGER_32 is
 		-- truncate64 (node at line 4511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "truncate64"
		}"
		end

	getsid (a_pid: INTEGER_32): INTEGER_32 is
 		-- getsid (node at line 4647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getsid"
		}"
		end

	getpagesize: INTEGER_32 is
 		-- getpagesize (node at line 4654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpagesize()"
		}"
		end

	geteuid: NATURAL_32 is
 		-- geteuid (node at line 4669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "geteuid()"
		}"
		end

	sethostname (a_name: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- sethostname (node at line 4721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sethostname"
		}"
		end

	-- `hidden' function _exit skipped.
	link (a_from_external: POINTER; a_to: POINTER): INTEGER_32 is
 		-- link (node at line 4907)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "link"
		}"
		end

	fork: INTEGER_32 is
 		-- fork (node at line 4925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fork()"
		}"
		end

	getuid: NATURAL_32 is
 		-- getuid (node at line 4941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getuid()"
		}"
		end

	ctermid (a_s: POINTER): POINTER is
 		-- ctermid (node at line 5004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctermid"
		}"
		end

	setgid (a_gid: NATURAL_32): INTEGER_32 is
 		-- setgid (node at line 5141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setgid"
		}"
		end

	ftruncate64 (a_fd: INTEGER_32; a_length: INTEGER_64): INTEGER_32 is
 		-- ftruncate64 (node at line 5144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftruncate64"
		}"
		end

	eaccess (a_name: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- eaccess (node at line 5187)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "eaccess"
		}"
		end

	crypt (a_key: POINTER; a_salt: POINTER): POINTER is
 		-- crypt (node at line 5335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "crypt"
		}"
		end

	ttyname (a_fd: INTEGER_32): POINTER is
 		-- ttyname (node at line 5548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ttyname"
		}"
		end

	setregid (a_rgid: NATURAL_32; an_egid: NATURAL_32): INTEGER_32 is
 		-- setregid (node at line 5610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setregid"
		}"
		end

	unlink (a_name: POINTER): INTEGER_32 is
 		-- unlink (node at line 5676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "unlink"
		}"
		end

	getpgid (a_pid: INTEGER_32): INTEGER_32 is
 		-- getpgid (node at line 5693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpgid"
		}"
		end

	sbrk (a_delta: INTEGER_64): POINTER is
 		-- sbrk (node at line 5839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sbrk"
		}"
		end

	getdtablesize: INTEGER_32 is
 		-- getdtablesize (node at line 6024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdtablesize()"
		}"
		end

	getpid: INTEGER_32 is
 		-- getpid (node at line 6143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpid()"
		}"
		end

	setlogin (a_name: POINTER): INTEGER_32 is
 		-- setlogin (node at line 6158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setlogin"
		}"
		end

	daemon (a_nochdir: INTEGER_32; a_noclose: INTEGER_32): INTEGER_32 is
 		-- daemon (node at line 6204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "daemon"
		}"
		end

	fdatasync (a_fildes: INTEGER_32): INTEGER_32 is
 		-- fdatasync (node at line 6468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdatasync"
		}"
		end

	pathconf (a_path: POINTER; a_name: INTEGER_32): INTEGER_64 is
 		-- pathconf (node at line 6626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pathconf"
		}"
		end

	sleep (a_seconds: NATURAL_32): NATURAL_32 is
 		-- sleep (node at line 6633)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sleep"
		}"
		end

	write (a_fd: INTEGER_32; a_buf: POINTER; a_n: NATURAL_64): INTEGER_64 is
 		-- write (node at line 6687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "write"
		}"
		end

	tcgetpgrp (a_fd: INTEGER_32): INTEGER_32 is
 		-- tcgetpgrp (node at line 6712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcgetpgrp"
		}"
		end

	-- `hidden' function __getpgid skipped.
	tcsetpgrp (a_fd: INTEGER_32; a_pgrp_id: INTEGER_32): INTEGER_32 is
 		-- tcsetpgrp (node at line 6971)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tcsetpgrp"
		}"
		end

	execvpe (a_file: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER_32 is
 		-- execvpe (node at line 7147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "execvpe"
		}"
		end

	lchown (a_file: POINTER; an_owner: NATURAL_32; a_group: NATURAL_32): INTEGER_32 is
 		-- lchown (node at line 7181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lchown"
		}"
		end

	syncfs (a_fd: INTEGER_32): INTEGER_32 is
 		-- syncfs (node at line 7312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "syncfs"
		}"
		end

	fexecve (a_fd: INTEGER_32; an_argv: POINTER; an_envp: POINTER): INTEGER_32 is
 		-- fexecve (node at line 7415)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fexecve"
		}"
		end

	faccessat (a_fd: INTEGER_32; a_file: POINTER; a_type: INTEGER_32; a_flag: INTEGER_32): INTEGER_32 is
 		-- faccessat (node at line 7555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "faccessat"
		}"
		end

	getusershell: POINTER is
 		-- getusershell (node at line 7571)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getusershell()"
		}"
		end

	getppid: INTEGER_32 is
 		-- getppid (node at line 7583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getppid()"
		}"
		end

	access (a_name: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- access (node at line 7620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "access"
		}"
		end

	setpgrp: INTEGER_32 is
 		-- setpgrp (node at line 7624)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setpgrp()"
		}"
		end

	setdomainname (a_name: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- setdomainname (node at line 7654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setdomainname"
		}"
		end

	sethostid (an_id: INTEGER_64): INTEGER_32 is
 		-- sethostid (node at line 7688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sethostid"
		}"
		end

	setusershell is
 		-- setusershell (node at line 7713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setusershell()"
		}"
		end

	setegid (a_gid: NATURAL_32): INTEGER_32 is
 		-- setegid (node at line 7741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setegid"
		}"
		end

	fpathconf (a_fd: INTEGER_32; a_name: INTEGER_32): INTEGER_64 is
 		-- fpathconf (node at line 7803)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fpathconf"
		}"
		end

	pipe2 (a_pipedes: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- pipe2 (node at line 8041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pipe2"
		}"
		end

	rmdir (a_path: POINTER): INTEGER_32 is
 		-- rmdir (node at line 8237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rmdir"
		}"
		end

	endusershell is
 		-- endusershell (node at line 8362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "endusershell()"
		}"
		end

	dup (a_fd: INTEGER_32): INTEGER_32 is
 		-- dup (node at line 8378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dup"
		}"
		end

	getpass (a_prompt: POINTER): POINTER is
 		-- getpass (node at line 8985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getpass"
		}"
		end

	ftruncate (a_fd: INTEGER_32; a_length: INTEGER_64): INTEGER_32 is
 		-- ftruncate (node at line 9008)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftruncate"
		}"
		end


end -- class UNISTD_EXTERNALS
