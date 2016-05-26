-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UNISTD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	access (a_name: POINTER; a_type: INTEGER): INTEGER 

		-- function access (in `/usr/include/unistd.h')
               -- access
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "access"
               }"
               end

	acct (a_name: POINTER): INTEGER 

		-- function acct (in `/usr/include/unistd.h')
               -- acct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "acct"
               }"
               end

	alarm (a_seconds: NATURAL): NATURAL 

		-- function alarm (in `/usr/include/unistd.h')
               -- alarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "alarm"
               }"
               end

	brk (an_addr: POINTER): INTEGER 

		-- function brk (in `/usr/include/unistd.h')
               -- brk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "brk"
               }"
               end

	chdir (a_path: POINTER): INTEGER 

		-- function chdir (in `/usr/include/unistd.h')
               -- chdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chdir"
               }"
               end

	chown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER 

		-- function chown (in `/usr/include/unistd.h')
               -- chown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chown"
               }"
               end

	chroot (a_path: POINTER): INTEGER 

		-- function chroot (in `/usr/include/unistd.h')
               -- chroot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chroot"
               }"
               end

	close (a_fd: INTEGER): INTEGER 

		-- function close (in `/usr/include/unistd.h')
               -- close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "close"
               }"
               end

	confstr (a_name: INTEGER; a_buf: POINTER; a_len: like size_t): like size_t 

		-- function confstr (in `/usr/include/unistd.h')
               -- confstr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "confstr"
               }"
               end

	crypt (a_key: POINTER; a_salt: POINTER): POINTER 

		-- function crypt (in `/usr/include/unistd.h')
               -- crypt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "crypt"
               }"
               end

	daemon (a_nochdir: INTEGER; a_noclose: INTEGER): INTEGER 

		-- function daemon (in `/usr/include/unistd.h')
               -- daemon
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "daemon"
               }"
               end

	dup (a_fd: INTEGER): INTEGER 

		-- function dup (in `/usr/include/unistd.h')
               -- dup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dup"
               }"
               end

	dup2 (a_fd: INTEGER; a_fd2: INTEGER): INTEGER 

		-- function dup2 (in `/usr/include/unistd.h')
               -- dup2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dup2"
               }"
               end

	dup3 (a_fd: INTEGER; a_fd2: INTEGER; a_flags: INTEGER): INTEGER 

		-- function dup3 (in `/usr/include/unistd.h')
               -- dup3
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dup3"
               }"
               end

	eaccess (a_name: POINTER; a_type: INTEGER): INTEGER 

		-- function eaccess (in `/usr/include/unistd.h')
               -- eaccess
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "eaccess"
               }"
               end

	encrypt (a_glibc_block: POINTER; an_edflag: INTEGER) 

		-- function encrypt (in `/usr/include/unistd.h')
               -- encrypt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "encrypt"
               }"
               end

	endusershell 

		-- function endusershell (in `/usr/include/unistd.h')
               -- endusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endusershell()"
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

		-- function euidaccess (in `/usr/include/unistd.h')
               -- euidaccess
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "euidaccess"
               }"
               end

	execl (a_path: POINTER; an_arg: POINTER): INTEGER 

		-- function execl (in `/usr/include/unistd.h')
               -- execl (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execl"
               }"
               end

	execle (a_path: POINTER; an_arg: POINTER): INTEGER 

		-- function execle (in `/usr/include/unistd.h')
               -- execle (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execle"
               }"
               end

	execlp (a_file: POINTER; an_arg: POINTER): INTEGER 

		-- function execlp (in `/usr/include/unistd.h')
               -- execlp (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execlp"
               }"
               end

	execv (a_path: POINTER; an_argv: POINTER): INTEGER 

		-- function execv (in `/usr/include/unistd.h')
               -- execv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execv"
               }"
               end

	execve (a_path: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 

		-- function execve (in `/usr/include/unistd.h')
               -- execve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execve"
               }"
               end

	execvp (a_file: POINTER; an_argv: POINTER): INTEGER 

		-- function execvp (in `/usr/include/unistd.h')
               -- execvp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "execvp"
               }"
               end

	execvpe (a_file: POINTER; an_argv: POINTER; an_envp: POINTER): INTEGER 

		-- function execvpe (in `/usr/include/unistd.h')
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

		-- function faccessat (in `/usr/include/unistd.h')
               -- faccessat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "faccessat"
               }"
               end

	fchdir (a_fd: INTEGER): INTEGER 

		-- function fchdir (in `/usr/include/unistd.h')
               -- fchdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchdir"
               }"
               end

	fchown (a_fd: INTEGER; an_owner: NATURAL; a_group: NATURAL): INTEGER 

		-- function fchown (in `/usr/include/unistd.h')
               -- fchown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchown"
               }"
               end

	fchownat (a_fd: INTEGER; a_file: POINTER; an_owner: NATURAL; a_group: NATURAL; a_flag: INTEGER): INTEGER 

		-- function fchownat (in `/usr/include/unistd.h')
               -- fchownat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchownat"
               }"
               end

	fdatasync (a_fildes: INTEGER): INTEGER 

		-- function fdatasync (in `/usr/include/unistd.h')
               -- fdatasync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fdatasync"
               }"
               end

	fexecve (a_fd: INTEGER; an_argv: POINTER; an_envp: POINTER): INTEGER 

		-- function fexecve (in `/usr/include/unistd.h')
               -- fexecve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fexecve"
               }"
               end

	fork: INTEGER 

		-- function fork (in `/usr/include/unistd.h')
               -- fork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fork()"
               }"
               end

	fpathconf (a_fd: INTEGER; a_name: INTEGER): like long 

		-- function fpathconf (in `/usr/include/unistd.h')
               -- fpathconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fpathconf"
               }"
               end

	fsync (a_fd: INTEGER): INTEGER 

		-- function fsync (in `/usr/include/unistd.h')
               -- fsync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fsync"
               }"
               end

	ftruncate (a_fd: INTEGER; a_length: like long): INTEGER 

		-- function ftruncate (in `/usr/include/unistd.h')
               -- ftruncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftruncate"
               }"
               end

	ftruncate64 (a_fd: INTEGER; a_length: like long): INTEGER 

		-- function ftruncate64 (in `/usr/include/unistd.h')
               -- ftruncate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftruncate64"
               }"
               end

	get_current_dir_name: POINTER 

		-- function get_current_dir_name (in `/usr/include/unistd.h')
               -- get_current_dir_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "get_current_dir_name()"
               }"
               end

	getcwd (a_buf: POINTER; a_size: like size_t): POINTER 

		-- function getcwd (in `/usr/include/unistd.h')
               -- getcwd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getcwd"
               }"
               end

	getdomainname (a_name: POINTER; a_len: like size_t): INTEGER 

		-- function getdomainname (in `/usr/include/unistd.h')
               -- getdomainname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdomainname"
               }"
               end

	getdtablesize: INTEGER 

		-- function getdtablesize (in `/usr/include/unistd.h')
               -- getdtablesize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdtablesize()"
               }"
               end

	getegid: NATURAL 

		-- function getegid (in `/usr/include/unistd.h')
               -- getegid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getegid()"
               }"
               end

	geteuid: NATURAL 

		-- function geteuid (in `/usr/include/unistd.h')
               -- geteuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "geteuid()"
               }"
               end

	getgid: NATURAL 

		-- function getgid (in `/usr/include/unistd.h')
               -- getgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgid()"
               }"
               end

	getgroups (a_size: INTEGER; a_list: POINTER): INTEGER 

		-- function getgroups (in `/usr/include/unistd.h')
               -- getgroups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgroups"
               }"
               end

	gethostid: like long 

		-- function gethostid (in `/usr/include/unistd.h')
               -- gethostid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostid()"
               }"
               end

	gethostname (a_name: POINTER; a_len: like size_t): INTEGER 

		-- function gethostname (in `/usr/include/unistd.h')
               -- gethostname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostname"
               }"
               end

	getlogin: POINTER 

		-- function getlogin (in `/usr/include/unistd.h')
               -- getlogin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getlogin()"
               }"
               end

	getlogin_r (a_name: POINTER; a_name_len: like size_t): INTEGER 

		-- function getlogin_r (in `/usr/include/unistd.h')
               -- getlogin_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getlogin_r"
               }"
               end

	getpagesize: INTEGER 

		-- function getpagesize (in `/usr/include/unistd.h')
               -- getpagesize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpagesize()"
               }"
               end

	getpass (a_prompt: POINTER): POINTER 

		-- function getpass (in `/usr/include/unistd.h')
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

		-- function getpgid (in `/usr/include/unistd.h')
               -- getpgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpgid"
               }"
               end

	getpgrp: INTEGER 

		-- function getpgrp (in `/usr/include/unistd.h')
               -- getpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpgrp()"
               }"
               end

	getpid: INTEGER 

		-- function getpid (in `/usr/include/unistd.h')
               -- getpid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpid()"
               }"
               end

	getppid: INTEGER 

		-- function getppid (in `/usr/include/unistd.h')
               -- getppid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getppid()"
               }"
               end

	getresgid (a_rgid: POINTER; an_egid: POINTER; a_sgid: POINTER): INTEGER 

		-- function getresgid (in `/usr/include/unistd.h')
               -- getresgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getresgid"
               }"
               end

	getresuid (a_ruid: POINTER; an_euid: POINTER; a_suid: POINTER): INTEGER 

		-- function getresuid (in `/usr/include/unistd.h')
               -- getresuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getresuid"
               }"
               end

	getsid (a_pid: INTEGER): INTEGER 

		-- function getsid (in `/usr/include/unistd.h')
               -- getsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getsid"
               }"
               end

	getuid: NATURAL 

		-- function getuid (in `/usr/include/unistd.h')
               -- getuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getuid()"
               }"
               end

	getusershell: POINTER 

		-- function getusershell (in `/usr/include/unistd.h')
               -- getusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getusershell()"
               }"
               end

	getwd (a_buf: POINTER): POINTER 

		-- function getwd (in `/usr/include/unistd.h')
               -- getwd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getwd"
               }"
               end

	group_member (a_gid: NATURAL): INTEGER 

		-- function group_member (in `/usr/include/unistd.h')
               -- group_member
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "group_member"
               }"
               end

	isatty (a_fd: INTEGER): INTEGER 

		-- function isatty (in `/usr/include/unistd.h')
               -- isatty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "isatty"
               }"
               end

	lchown (a_file: POINTER; an_owner: NATURAL; a_group: NATURAL): INTEGER 

		-- function lchown (in `/usr/include/unistd.h')
               -- lchown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lchown"
               }"
               end

	link (a_from_external: POINTER; a_to: POINTER): INTEGER 

		-- function link (in `/usr/include/unistd.h')
               -- link
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "link"
               }"
               end

	linkat (a_fromfd: INTEGER; a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER; a_flags: INTEGER): INTEGER 

		-- function linkat (in `/usr/include/unistd.h')
               -- linkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "linkat"
               }"
               end

	lseek (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long 

		-- function lseek (in `/usr/include/unistd.h')
               -- lseek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lseek"
               }"
               end

	lseek64 (a_fd: INTEGER; an_offset: like long; a_whence: INTEGER): like long 

		-- function lseek64 (in `/usr/include/unistd.h')
               -- lseek64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lseek64"
               }"
               end

	nice (an_inc: INTEGER): INTEGER 

		-- function nice (in `/usr/include/unistd.h')
               -- nice
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "nice"
               }"
               end

	pathconf (a_path: POINTER; a_name: INTEGER): like long 

		-- function pathconf (in `/usr/include/unistd.h')
               -- pathconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pathconf"
               }"
               end

	pause: INTEGER 

		-- function pause (in `/usr/include/unistd.h')
               -- pause
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pause()"
               }"
               end

	pipe (a_pipedes: POINTER): INTEGER 

		-- function pipe (in `/usr/include/unistd.h')
               -- pipe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pipe"
               }"
               end

	pipe2 (a_pipedes: POINTER; a_flags: INTEGER): INTEGER 

		-- function pipe2 (in `/usr/include/unistd.h')
               -- pipe2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pipe2"
               }"
               end

	pread (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t; an_offset: like long): like ssize_t 

		-- function pread (in `/usr/include/unistd.h')
               -- pread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pread"
               }"
               end

	pread64 (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t; an_offset: like long): like ssize_t 

		-- function pread64 (in `/usr/include/unistd.h')
               -- pread64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pread64"
               }"
               end

	profil (a_sample_buffer: POINTER; a_size: like size_t; an_offset: like size_t; a_scale: NATURAL): INTEGER 

		-- function profil (in `/usr/include/unistd.h')
               -- profil
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "profil"
               }"
               end

	pwrite (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t 

		-- function pwrite (in `/usr/include/unistd.h')
               -- pwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pwrite"
               }"
               end

	pwrite64 (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t; an_offset: like long): like ssize_t 

		-- function pwrite64 (in `/usr/include/unistd.h')
               -- pwrite64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pwrite64"
               }"
               end

	read (a_fd: INTEGER; a_buf: POINTER; a_nbytes: like size_t): like ssize_t 

		-- function read (in `/usr/include/unistd.h')
               -- read
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "read"
               }"
               end

	readlink (a_path: POINTER; a_buf: POINTER; a_len: like size_t): like ssize_t 

		-- function readlink (in `/usr/include/unistd.h')
               -- readlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readlink"
               }"
               end

	readlinkat (a_fd: INTEGER; a_path: POINTER; a_buf: POINTER; a_len: like size_t): like ssize_t 

		-- function readlinkat (in `/usr/include/unistd.h')
               -- readlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "readlinkat"
               }"
               end

	revoke (a_file: POINTER): INTEGER 

		-- function revoke (in `/usr/include/unistd.h')
               -- revoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "revoke"
               }"
               end

	rmdir (a_path: POINTER): INTEGER 

		-- function rmdir (in `/usr/include/unistd.h')
               -- rmdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rmdir"
               }"
               end

	sbrk (a_delta: like intptr_t): POINTER 

		-- function sbrk (in `/usr/include/unistd.h')
               -- sbrk
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sbrk"
               }"
               end

	setdomainname (a_name: POINTER; a_len: like size_t): INTEGER 

		-- function setdomainname (in `/usr/include/unistd.h')
               -- setdomainname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setdomainname"
               }"
               end

	setegid (a_gid: NATURAL): INTEGER 

		-- function setegid (in `/usr/include/unistd.h')
               -- setegid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setegid"
               }"
               end

	seteuid (an_uid: NATURAL): INTEGER 

		-- function seteuid (in `/usr/include/unistd.h')
               -- seteuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "seteuid"
               }"
               end

	setgid (a_gid: NATURAL): INTEGER 

		-- function setgid (in `/usr/include/unistd.h')
               -- setgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setgid"
               }"
               end

	sethostid (an_id: like long): INTEGER 

		-- function sethostid (in `/usr/include/unistd.h')
               -- sethostid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sethostid"
               }"
               end

	sethostname (a_name: POINTER; a_len: like size_t): INTEGER 

		-- function sethostname (in `/usr/include/unistd.h')
               -- sethostname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sethostname"
               }"
               end

	setlogin (a_name: POINTER): INTEGER 

		-- function setlogin (in `/usr/include/unistd.h')
               -- setlogin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setlogin"
               }"
               end

	setpgid (a_pid: INTEGER; a_pgid: INTEGER): INTEGER 

		-- function setpgid (in `/usr/include/unistd.h')
               -- setpgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setpgid"
               }"
               end

	setpgrp: INTEGER 

		-- function setpgrp (in `/usr/include/unistd.h')
               -- setpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setpgrp()"
               }"
               end

	setregid (a_rgid: NATURAL; an_egid: NATURAL): INTEGER 

		-- function setregid (in `/usr/include/unistd.h')
               -- setregid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setregid"
               }"
               end

	setresgid (a_rgid: NATURAL; an_egid: NATURAL; a_sgid: NATURAL): INTEGER 

		-- function setresgid (in `/usr/include/unistd.h')
               -- setresgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setresgid"
               }"
               end

	setresuid (a_ruid: NATURAL; an_euid: NATURAL; a_suid: NATURAL): INTEGER 

		-- function setresuid (in `/usr/include/unistd.h')
               -- setresuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setresuid"
               }"
               end

	setreuid (a_ruid: NATURAL; an_euid: NATURAL): INTEGER 

		-- function setreuid (in `/usr/include/unistd.h')
               -- setreuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setreuid"
               }"
               end

	setsid: INTEGER 

		-- function setsid (in `/usr/include/unistd.h')
               -- setsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setsid()"
               }"
               end

	setuid (an_uid: NATURAL): INTEGER 

		-- function setuid (in `/usr/include/unistd.h')
               -- setuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setuid"
               }"
               end

	setusershell 

		-- function setusershell (in `/usr/include/unistd.h')
               -- setusershell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setusershell()"
               }"
               end

	sleep (a_seconds: NATURAL): NATURAL 

		-- function sleep (in `/usr/include/unistd.h')
               -- sleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sleep"
               }"
               end

	swab (a_from_external: POINTER; a_to: POINTER; a_n: like ssize_t) 

		-- function swab (in `/usr/include/unistd.h')
               -- swab
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "swab"
               }"
               end

	symlink (a_from_external: POINTER; a_to: POINTER): INTEGER 

		-- function symlink (in `/usr/include/unistd.h')
               -- symlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "symlink"
               }"
               end

	symlinkat (a_from_external: POINTER; a_tofd: INTEGER; a_to: POINTER): INTEGER 

		-- function symlinkat (in `/usr/include/unistd.h')
               -- symlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "symlinkat"
               }"
               end

	sync 

		-- function sync (in `/usr/include/unistd.h')
               -- sync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sync()"
               }"
               end

	syncfs (a_fd: INTEGER): INTEGER 

		-- function syncfs (in `/usr/include/unistd.h')
               -- syncfs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "syncfs"
               }"
               end

	syscall (a_sysno: like long): like long 

		-- function syscall (in `/usr/include/unistd.h')
               -- syscall (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "syscall"
               }"
               end

	sysconf (a_name: INTEGER): like long 

		-- function sysconf (in `/usr/include/unistd.h')
               -- sysconf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sysconf"
               }"
               end

	tcgetpgrp (a_fd: INTEGER): INTEGER 

		-- function tcgetpgrp (in `/usr/include/unistd.h')
               -- tcgetpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcgetpgrp"
               }"
               end

	tcsetpgrp (a_fd: INTEGER; a_pgrp_id: INTEGER): INTEGER 

		-- function tcsetpgrp (in `/usr/include/unistd.h')
               -- tcsetpgrp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcsetpgrp"
               }"
               end

	truncate (a_file: POINTER; a_length: like long): INTEGER 

		-- function truncate (in `/usr/include/unistd.h')
               -- truncate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "truncate"
               }"
               end

	truncate64 (a_file: POINTER; a_length: like long): INTEGER 

		-- function truncate64 (in `/usr/include/unistd.h')
               -- truncate64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "truncate64"
               }"
               end

	ttyname (a_fd: INTEGER): POINTER 

		-- function ttyname (in `/usr/include/unistd.h')
               -- ttyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ttyname"
               }"
               end

	ttyname_r (a_fd: INTEGER; a_buf: POINTER; a_buflen: like size_t): INTEGER 

		-- function ttyname_r (in `/usr/include/unistd.h')
               -- ttyname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ttyname_r"
               }"
               end

	ttyslot: INTEGER 

		-- function ttyslot (in `/usr/include/unistd.h')
               -- ttyslot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ttyslot()"
               }"
               end

	ualarm (a_value: NATURAL; an_interval: NATURAL): NATURAL 

		-- function ualarm (in `/usr/include/unistd.h')
               -- ualarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ualarm"
               }"
               end

	unlink (a_name: POINTER): INTEGER 

		-- function unlink (in `/usr/include/unistd.h')
               -- unlink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unlink"
               }"
               end

	unlinkat (a_fd: INTEGER; a_name: POINTER; a_flag: INTEGER): INTEGER 

		-- function unlinkat (in `/usr/include/unistd.h')
               -- unlinkat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "unlinkat"
               }"
               end

	usleep (an_useconds: NATURAL): INTEGER 

		-- function usleep (in `/usr/include/unistd.h')
               -- usleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "usleep"
               }"
               end

	vfork: INTEGER 

		-- function vfork (in `/usr/include/unistd.h')
               -- vfork
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vfork()"
               }"
               end

	vhangup: INTEGER 

		-- function vhangup (in `/usr/include/unistd.h')
               -- vhangup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vhangup()"
               }"
               end

	write (a_fd: INTEGER; a_buf: POINTER; a_n: like size_t): like ssize_t 

		-- function write (in `/usr/include/unistd.h')
               -- write
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "write"
               }"
               end


end -- class UNISTD_EXTERNALS
