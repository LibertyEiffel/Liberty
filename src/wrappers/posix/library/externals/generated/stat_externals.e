-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STAT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	chmod (a_file: POINTER; a_mode: NATURAL): INTEGER 

		-- function chmod (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- chmod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "chmod"
               }"
               end

	fchmod (a_fd: INTEGER; a_mode: NATURAL): INTEGER 

		-- function fchmod (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- fchmod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchmod"
               }"
               end

	fchmodat (a_fd: INTEGER; a_file: POINTER; a_mode: NATURAL; a_flag: INTEGER): INTEGER 

		-- function fchmodat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- fchmodat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fchmodat"
               }"
               end

	fstat (a_fd: INTEGER; a_buf: POINTER): INTEGER 

		-- function fstat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- fstat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fstat"
               }"
               end

	fstat64 (a_fd: INTEGER; a_buf: POINTER): INTEGER 

		-- function fstat64 (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- fstat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fstat64"
               }"
               end

	fstatat (a_fd: INTEGER; a_file: POINTER; a_buf: POINTER; a_flag: INTEGER): INTEGER 

		-- function fstatat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- fstatat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fstatat"
               }"
               end

	fstatat64 (a_fd: INTEGER; a_file: POINTER; a_buf: POINTER; a_flag: INTEGER): INTEGER 

		-- function fstatat64 (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- fstatat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fstatat64"
               }"
               end

	futimens (a_fd: INTEGER; a_times: POINTER): INTEGER 

		-- function futimens (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- futimens
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "futimens"
               }"
               end

	-- `hidden' function __fxstat skipped.
	-- `hidden' function __fxstat64 skipped.
	-- `hidden' function __fxstatat skipped.
	-- `hidden' function __fxstatat64 skipped.
	getumask: NATURAL 

		-- function getumask (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- getumask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getumask()"
               }"
               end

	lchmod (a_file: POINTER; a_mode: NATURAL): INTEGER 

		-- function lchmod (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- lchmod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lchmod"
               }"
               end

	lstat (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function lstat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- lstat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lstat"
               }"
               end

	lstat64 (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function lstat64 (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- lstat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "lstat64"
               }"
               end

	-- `hidden' function __lxstat skipped.
	-- `hidden' function __lxstat64 skipped.
	mkdir (a_path: POINTER; a_mode: NATURAL): INTEGER 

		-- function mkdir (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- mkdir
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkdir"
               }"
               end

	mkdirat (a_fd: INTEGER; a_path: POINTER; a_mode: NATURAL): INTEGER 

		-- function mkdirat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- mkdirat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkdirat"
               }"
               end

	mkfifo (a_path: POINTER; a_mode: NATURAL): INTEGER 

		-- function mkfifo (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- mkfifo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkfifo"
               }"
               end

	mkfifoat (a_fd: INTEGER; a_path: POINTER; a_mode: NATURAL): INTEGER 

		-- function mkfifoat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- mkfifoat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mkfifoat"
               }"
               end

	mknod (a_path: POINTER; a_mode: NATURAL; a_dev: like long_unsigned): INTEGER 

		-- function mknod (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- mknod
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mknod"
               }"
               end

	mknodat (a_fd: INTEGER; a_path: POINTER; a_mode: NATURAL; a_dev: like long_unsigned): INTEGER 

		-- function mknodat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- mknodat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "mknodat"
               }"
               end

	stat (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function stat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- stat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stat"
               }"
               end

	stat64 (a_file: POINTER; a_buf: POINTER): INTEGER 

		-- function stat64 (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- stat64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stat64"
               }"
               end

	umask (a_mask: NATURAL): NATURAL 

		-- function umask (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- umask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "umask"
               }"
               end

	utimensat (a_fd: INTEGER; a_path: POINTER; a_times: POINTER; a_flags: INTEGER): INTEGER 

		-- function utimensat (in `/usr/include/x86_64-linux-gnu/sys/stat.h')
               -- utimensat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "utimensat"
               }"
               end

	-- `hidden' function __xmknod skipped.
	-- `hidden' function __xmknodat skipped.
	-- `hidden' function __xstat skipped.
	-- `hidden' function __xstat64 skipped.

end -- class STAT_EXTERNALS
