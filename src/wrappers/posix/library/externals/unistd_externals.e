-- This file has been created by wrapper-generator.
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
                       feature_name: "access"
               }"
               end

	acct (a_name: POINTER): INTEGER 
               -- acct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "acct"
               }"
               end

	alarm (a_seconds: NATURAL): NATURAL 
               -- alarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "alarm"
               }"
               end

	brk (an_addr: POINTER): INTEGER 
               -- brk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "brk"
               }"
               end

	chdir (a_path: POINTER): INTEGER 
               -- chdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chdir"
               }"
               end

	chown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER 
               -- chown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chown"
               }"
               end

	chroot (a_path: POINTER): INTEGER 
               -- chroot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chroot"
               }"
               end

	close (a_fd: INTEGER): INTEGER 
               -- close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "close"
               }"
               end

	confstr (a_name: INTEGER; a_buf: POINTER; a_len: like size_t): like size_t 
               -- confstr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "confstr"
               }"
               end

	crypt (a_key: POINTER; a_salt: POINTER): POINTER 
               -- crypt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "crypt"
               }"
               end

	daemon (a_nochdir: INTEGER; a_noclose: INTEGER): INTEGER 
               -- daemon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "daemon"
               }"
               end

	dup (a_fd: INTEGER): INTEGER 
               -- dup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dup"
               }"
               end

	dup2 (a_fd: INTEGER; a_fd2: INTEGER): INTEGER 
               -- dup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dup2"
               }"
               end

	dup3 (a_fd: INTEGER; a_fd2: INTEGER; a_flags: INTEGER): INTEGER 
               -- dup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dup3"
               }"
               end

	eaccess (a_name: POINTER; a_type: INTEGER): INTEGER 
               -- eaccess
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "eaccess"
               }"
               end

	encrypt (a_glibc_block: POINTER; an_edflag: INTEGER) 
               -- encrypt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "encrypt"
               }"
               end

	endusershell 
               -- endusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endusershell"
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
                       feature_name: "euidaccess"
               }"
               end

	execl (a_path: POINTER; an_arg: POINTER): INTEGER 
               -- execl (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execl"
               }"
               end

	execle (a_path: POINTER; an_arg: POINTER): INTEGER 
               -- execle (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execle"
               }"
               end

	execlp (a_file: POINTER; an_arg: POINTER): INTEGER 
               -- execlp (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execlp"
               }"
               end

	execv (a_path: POINTER; an_argv: POINTER): INTEGER 
               -- execv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execv"
               }"
               end

	execve (a_path: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 
               -- execve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execve"
               }"
               end

	execvp (a_file: POINTER; an_argv: POINTER): INTEGER 
               -- execvp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execvp"
               }"
               end

	execvpe (a_file: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 
               -- execvpe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execvpe"
               }"
               end

	-- `hidden' function _exit skipped.
	faccessat (a_fd: INTEGER; a_file: POINTER; a_type: INTEGER; a_flag: INTEGER): INTEGER 
               -- faccessat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "faccessat"
               }"
               end

	fchdir (a_fd: INTEGER): INTEGER 
               -- fchdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchdir"
               }"
               end

	fchown (a_fd: INTEGER; an_owner: NATURAL; a_group: NATURAL): INTEGER 
               -- fchown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchown"
               }"
               end

	fchownat (a_fd: INTEGER; a_file: POINTER; an_owner: NATURAL; a_group: NATURAL; a_flag: INTEGER): INTEGER 
               -- fchownat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchownat"
               }"
               end

	fdatasync (a_fildes: INTEGER): INTEGER 
               -- fdatasync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fdatasync"
               }"
               end

	fexecve (a_fd: INTEGER; an_argv: POINTER; an_envp: POINTER): INTEGER 
               -- fexecve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fexecve"
               }"
               end

	fork: INTEGER 
               -- fork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fork"
               }"
               end

	fpathconf (a_fd: INTEGER; a_name: INTEGER): like long 
               -- fpathconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fpathconf"
               }"
               end

	fsync (a_fd: INTEGER): INTEGER 
               -- fsync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fsync"
               }"
               end

	ftruncate (a_fd: INTEGER; a_length: like long): INTEGER 
               -- ftruncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftruncate"
               }"
               end

	ftruncate64 (a_fd: INTEGER; a_length: like long): INTEGER 
               -- ftruncate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftruncate64"
               }"
               end

	get_current_dir_name: POINTER 
               -- get_current_dir_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "get_current_dir_name"
               }"
               end

	getcwd (a_buf: POINTER; a_size: like size_t): POINTER 
               -- getcwd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getcwd"
               }"
               end

	getdomainname (a_name: POINTER; a_len: like size_t): INTEGER 
               -- getdomainname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdomainname"
               }"
               end

	getdtablesize: INTEGER 
               -- getdtablesize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdtablesize"
               }"
               end

	getegid: NATURAL 
               -- getegid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getegid"
               }"
               end

	geteuid: NATURAL 
               -- geteuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "geteuid"
               }"
               end

	getgid: NATURAL 
               -- getgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgid"
               }"
               end

	getgroups (a_size: INTEGER; a_list: POINTER): INTEGER 
               -- getgroups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgroups"
               }"
               end

	gethostid: like long 
               -- gethostid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostid"
               }"
               end

	gethostname (a_name: POINTER; a_len: like size_t): INTEGER 
               -- gethostname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostname"
               }"
               end

	getlogin: POINTER 
               -- getlogin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getlogin"
               }"
               end

	getlogin_r (a_name: POINTER; a_name_len: like size_t): INTEGER 
               -- getlogin_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getlogin_r"
               }"
               end

	getpagesize: INTEGER 
               -- getpagesize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpagesize"
               }"
               end

	getpass (a_prompt: POINTER): POINTER 
               -- getpass
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpass"
               }"
               end

	-- `hidden' function __getpgid skipped.
	getpgid (a_pid: INTEGER): INTEGER 
               -- getpgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpgid"
               }"
               end

	getpgrp: INTEGER 
               -- getpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpgrp"
               }"
               end

	getpid: INTEGER 
               -- getpid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpid"
               }"
               end

	getppid: INTEGER 
               -- getppid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getppid"
               }"
               end

	getresgid (a_rgid: POINTER; an_egid: POINTER; a_sgid: POINTER): INTEGER 
               -- getresgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getresgid"
               }"
               end

	getresuid (a_ruid: POINTER; an_euid: POINTER; a_suid: POINTER): INTEGER 
               -- getresuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getresuid"
               }"
               end

	getsid (a_pid: INTEGER): INTEGER 
               -- getsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getsid"
               }"
               end

	getuid: NATURAL 
               -- getuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getuid"
               }"
               end

	getusershell: POINTER 
               -- getusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getusershell"
               }"
               end

	getwd (a_buf: POINTER): POINTER 
               -- getwd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getwd"
               }"
               end

	group_member (a_gid: NATURAL): INTEGER 
               -- group_member
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "group_member"
               }"
               end

	isatty (a_fd: INTEGER): INTEGER 
               -- isatty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isatty"
               }"
               end

	lchown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER 
               -- lchown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lchown"
               }"
               end

	link (a_from_external: POINTER; a_to: POINTER): INTEGER 
               -- link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "link"
               }"
               end

	linkat (a_fromfd: INTEGER; a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER; a_flags: INTEGER): INTEGER 
               -- linkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "linkat"
               }"
               end

	lseek (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long 
               -- lseek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lseek"
               }"
               end

	lseek64 (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long 
               -- lseek64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lseek64"
               }"
               end

	nice (an_inc: INTEGER): INTEGER 
               -- nice
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nice"
               }"
               end

	pathconf (a_path: POINTER; a_name: INTEGER): like long 
               -- pathconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pathconf"
               }"
               end

	pause: INTEGER 
               -- pause
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pause"
               }"
               end

	pipe (a_pipedes: POINTER): INTEGER 
               -- pipe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pipe"
               }"
               end

	pipe2 (a_pipedes: POINTER; a_flags: INTEGER): INTEGER 
               -- pipe2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pipe2"
               }"
               end

	pread (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t; an_offset: like long): like ssize_t 
               -- pread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pread"
               }"
               end

	pread64 (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t; an_offset: like long): like ssize_t 
               -- pread64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pread64"
               }"
               end

	profil (a_sample_buffer: POINTER; a_size: like size_t; an_offset: like size_t; a_scale: NATURAL): INTEGER 
               -- profil
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "profil"
               }"
               end

	pwrite (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t 
               -- pwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pwrite"
               }"
               end

	pwrite64 (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t 
               -- pwrite64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pwrite64"
               }"
               end

	read (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t): like ssize_t 
               -- read
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "read"
               }"
               end

	readlink (a_path: POINTER; a_buf: POINTER; a_len: like size_t): like ssize_t 
               -- readlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readlink"
               }"
               end

	readlinkat (a_fd: INTEGER; a_path: POINTER; a_buf: POINTER; a_len: like size_t): like ssize_t 
               -- readlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readlinkat"
               }"
               end

	revoke (a_file: POINTER): INTEGER 
               -- revoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "revoke"
               }"
               end

	rmdir (a_path: POINTER): INTEGER 
               -- rmdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rmdir"
               }"
               end

	sbrk (a_delta: like intptr_t): POINTER 
               -- sbrk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sbrk"
               }"
               end

	setdomainname (a_name: POINTER; a_len: like size_t): INTEGER 
               -- setdomainname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setdomainname"
               }"
               end

	setegid (a_gid: NATURAL): INTEGER 
               -- setegid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setegid"
               }"
               end

	seteuid (an_uid: NATURAL): INTEGER 
               -- seteuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seteuid"
               }"
               end

	setgid (a_gid: NATURAL): INTEGER 
               -- setgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setgid"
               }"
               end

	sethostid (an_id: like long): INTEGER 
               -- sethostid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sethostid"
               }"
               end

	sethostname (a_name: POINTER; a_len: like size_t): INTEGER 
               -- sethostname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sethostname"
               }"
               end

	setlogin (a_name: POINTER): INTEGER 
               -- setlogin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setlogin"
               }"
               end

	setpgid (a_pid: INTEGER; a_pgid: INTEGER): INTEGER 
               -- setpgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setpgid"
               }"
               end

	setpgrp: INTEGER 
               -- setpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setpgrp"
               }"
               end

	setregid (a_rgid: NATURAL; an_egid: NATURAL): INTEGER 
               -- setregid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setregid"
               }"
               end

	setresgid (a_rgid: NATURAL; an_egid: NATURAL; a_sgid: NATURAL): INTEGER 
               -- setresgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setresgid"
               }"
               end

	setresuid (a_ruid: NATURAL; an_euid: NATURAL; a_suid: NATURAL): INTEGER 
               -- setresuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setresuid"
               }"
               end

	setreuid (a_ruid: NATURAL; an_euid: NATURAL): INTEGER 
               -- setreuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setreuid"
               }"
               end

	setsid: INTEGER 
               -- setsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setsid"
               }"
               end

	setuid (an_uid: NATURAL): INTEGER 
               -- setuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setuid"
               }"
               end

	setusershell 
               -- setusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setusershell"
               }"
               end

	sleep (a_seconds: NATURAL): NATURAL 
               -- sleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sleep"
               }"
               end

	swab (a_from_external: POINTER; a_to: POINTER; a_n: like ssize_t) 
               -- swab
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "swab"
               }"
               end

	symlink (a_from_external: POINTER; a_to: POINTER): INTEGER 
               -- symlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "symlink"
               }"
               end

	symlinkat (a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER): INTEGER 
               -- symlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "symlinkat"
               }"
               end

	sync 
               -- sync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sync"
               }"
               end

	syncfs (a_fd: INTEGER): INTEGER 
               -- syncfs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "syncfs"
               }"
               end

	syscall (a_sysno: like long): like long 
               -- syscall (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "syscall"
               }"
               end

	sysconf (a_name: INTEGER): like long 
               -- sysconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sysconf"
               }"
               end

	tcgetpgrp (a_fd: INTEGER): INTEGER 
               -- tcgetpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcgetpgrp"
               }"
               end

	tcsetpgrp (a_fd: INTEGER; a_pgrp_id: INTEGER): INTEGER 
               -- tcsetpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcsetpgrp"
               }"
               end

	truncate (a_file: POINTER; a_length: like long): INTEGER 
               -- truncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "truncate"
               }"
               end

	truncate64 (a_file: POINTER; a_length: like long): INTEGER 
               -- truncate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "truncate64"
               }"
               end

	ttyname (a_fd: INTEGER): POINTER 
               -- ttyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ttyname"
               }"
               end

	ttyname_r (a_fd: INTEGER; a_buf: POINTER; a_buflen: like size_t): INTEGER 
               -- ttyname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ttyname_r"
               }"
               end

	ttyslot: INTEGER 
               -- ttyslot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ttyslot"
               }"
               end

	ualarm (a_value: NATURAL; an_interval: NATURAL): NATURAL 
               -- ualarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ualarm"
               }"
               end

	unlink (a_name: POINTER): INTEGER 
               -- unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unlink"
               }"
               end

	unlinkat (a_fd: INTEGER; a_name: POINTER; a_flag: INTEGER): INTEGER 
               -- unlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unlinkat"
               }"
               end

	usleep (an_useconds: NATURAL): INTEGER 
               -- usleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "usleep"
               }"
               end

	vfork: INTEGER 
               -- vfork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vfork"
               }"
               end

	vhangup: INTEGER 
               -- vhangup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vhangup"
               }"
               end

	write (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t): like ssize_t 
               -- write
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "write"
               }"
               end


end -- class UNISTD_EXTERNALS
