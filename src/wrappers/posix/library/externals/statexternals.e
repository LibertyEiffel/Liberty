-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STATEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	fstatat64 (a_fd: INTEGER_32; a_file: POINTER; a_buf: POINTER; a_flag: INTEGER_32): INTEGER_32 is
 		-- fstatat64 (node at line 15)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fstatat64"
		}"
		end

	getumask: NATURAL_32 is
 		-- getumask (node at line 155)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getumask()"
		}"
		end

	fstat64 (a_fd: INTEGER_32; a_buf: POINTER): INTEGER_32 is
 		-- fstat64 (node at line 181)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fstat64"
		}"
		end

	-- `hidden' function __fxstatat64 skipped.
	futimens (a_fd: INTEGER_32; a_times: POINTER): INTEGER_32 is
 		-- futimens (node at line 219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "futimens"
		}"
		end

	-- `hidden' function __xmknodat skipped.
	-- `hidden' function __xstat64 skipped.
	lchmod (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- lchmod (node at line 404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lchmod"
		}"
		end

	fchmodat (a_fd: INTEGER_32; a_file: POINTER; a_mode: NATURAL_32; a_flag: INTEGER_32): INTEGER_32 is
 		-- fchmodat (node at line 421)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchmodat"
		}"
		end

	umask (a_mask: NATURAL_32): NATURAL_32 is
 		-- umask (node at line 447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "umask"
		}"
		end

	fstat (a_fd: INTEGER_32; a_buf: POINTER): INTEGER_32 is
 		-- fstat (node at line 462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fstat"
		}"
		end

	-- `hidden' function __lxstat64 skipped.
	mknodat (a_fd: INTEGER_32; a_path: POINTER; a_mode: NATURAL_32; a_dev: NATURAL_64): INTEGER_32 is
 		-- mknodat (node at line 538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mknodat"
		}"
		end

	-- `hidden' function __fxstat skipped.
	-- `hidden' function __fxstat64 skipped.
	lstat64 (a_file: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- lstat64 (node at line 619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lstat64"
		}"
		end

	-- `hidden' function __xstat skipped.
	utimensat (a_fd: INTEGER_32; a_path: POINTER; a_times: POINTER; a_flags: INTEGER_32): INTEGER_32 is
 		-- utimensat (node at line 649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "utimensat"
		}"
		end

	-- `hidden' function __fxstatat skipped.
	stat (a_file: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- stat (node at line 725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stat"
		}"
		end

	-- `hidden' function __xmknod skipped.
	mkdir (a_path: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- mkdir (node at line 862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkdir"
		}"
		end

	fchmod (a_fd: INTEGER_32; a_mode: NATURAL_32): INTEGER_32 is
 		-- fchmod (node at line 959)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fchmod"
		}"
		end

	chmod (a_file: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- chmod (node at line 1019)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "chmod"
		}"
		end

	fstatat (a_fd: INTEGER_32; a_file: POINTER; a_buf: POINTER; a_flag: INTEGER_32): INTEGER_32 is
 		-- fstatat (node at line 1051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fstatat"
		}"
		end

	mknod (a_path: POINTER; a_mode: NATURAL_32; a_dev: NATURAL_64): INTEGER_32 is
 		-- mknod (node at line 1061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mknod"
		}"
		end

	mkdirat (a_fd: INTEGER_32; a_path: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- mkdirat (node at line 1094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkdirat"
		}"
		end

	mkfifoat (a_fd: INTEGER_32; a_path: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- mkfifoat (node at line 1106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkfifoat"
		}"
		end

	lstat (a_file: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- lstat (node at line 1185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "lstat"
		}"
		end

	stat64 (a_file: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- stat64 (node at line 1189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stat64"
		}"
		end

	mkfifo (a_path: POINTER; a_mode: NATURAL_32): INTEGER_32 is
 		-- mkfifo (node at line 1262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "mkfifo"
		}"
		end

	-- `hidden' function __lxstat skipped.

end -- class STATEXTERNALS
