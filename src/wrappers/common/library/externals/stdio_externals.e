-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STDIO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	clearerr (a_stream: POINTER) is
 		-- clearerr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr"
		}"
		end

	clearerr_unlocked (a_stream: POINTER) is
 		-- clearerr_unlocked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr_unlocked"
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

	cuserid (a_s: POINTER): POINTER is
 		-- cuserid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cuserid"
		}"
		end

	fclose (a_stream: POINTER): INTEGER_32 is
 		-- fclose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fclose"
		}"
		end

	fcloseall: INTEGER_32 is
 		-- fcloseall
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcloseall()"
		}"
		end

	fdopen (a_fd: INTEGER_32; a_modes: POINTER): POINTER is
 		-- fdopen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdopen"
		}"
		end

	feof (a_stream: POINTER): INTEGER_32 is
 		-- feof
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "feof"
		}"
		end

	ferror (a_stream: POINTER): INTEGER_32 is
 		-- ferror
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ferror"
		}"
		end

	fflush (a_stream: POINTER): INTEGER_32 is
 		-- fflush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush"
		}"
		end

	fflush_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fflush_unlocked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush_unlocked"
		}"
		end

	fgetc (a_stream: POINTER): INTEGER_32 is
 		-- fgetc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetc"
		}"
		end

	fgetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos"
		}"
		end

	fgetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos64"
		}"
		end

	fileno (a_stream: POINTER): INTEGER_32 is
 		-- fileno
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno"
		}"
		end

	fileno_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fileno_unlocked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno_unlocked"
		}"
		end

	flockfile (a_stream: POINTER) is
 		-- flockfile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "flockfile"
		}"
		end

	fmemopen (a_s: POINTER; a_len: NATURAL_64; a_modes: POINTER): POINTER is
 		-- fmemopen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmemopen"
		}"
		end

	fopen (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen"
		}"
		end

	fopen64 (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen64"
		}"
		end

	-- function fopencookie (at line 315 in file /usr/include/stdio.h is not wrappable
	fputc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- fputc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputc"
		}"
		end

	fputs (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs"
		}"
		end

	fputs_unlocked (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs_unlocked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs_unlocked"
		}"
		end

	freopen (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen"
		}"
		end

	freopen64 (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen64"
		}"
		end

	fscanf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fscanf (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fscanf"
		}"
		end

	fseek (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseek
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseek"
		}"
		end

	fseeko (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko"
		}"
		end

	fseeko64 (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko64"
		}"
		end

	fsetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos"
		}"
		end

	fsetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos64"
		}"
		end

	ftell (a_stream: POINTER): INTEGER_64 is
 		-- ftell
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftell"
		}"
		end

	ftello (a_stream: POINTER): INTEGER_64 is
 		-- ftello
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello"
		}"
		end

	ftello64 (a_stream: POINTER): INTEGER_64 is
 		-- ftello64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello64"
		}"
		end

	ftrylockfile (a_stream: POINTER): INTEGER_32 is
 		-- ftrylockfile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftrylockfile"
		}"
		end

	funlockfile (a_stream: POINTER) is
 		-- funlockfile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "funlockfile"
		}"
		end

	fwrite (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_s: POINTER): NATURAL_64 is
 		-- fwrite
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite"
		}"
		end

	fwrite_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fwrite_unlocked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite_unlocked"
		}"
		end

	getc (a_stream: POINTER): INTEGER_32 is
 		-- getc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getc"
		}"
		end

	-- `hidden' function __getdelim skipped.
	getdelim (a_lineptr: POINTER; a_n: POINTER; a_delimiter: INTEGER_32; a_stream: POINTER): INTEGER_64 is
 		-- getdelim
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdelim"
		}"
		end

	getw (a_stream: POINTER): INTEGER_32 is
 		-- getw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getw"
		}"
		end

	open_memstream (a_bufloc: POINTER; a_sizeloc: POINTER): POINTER is
 		-- open_memstream
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open_memstream"
		}"
		end

	pclose (a_stream: POINTER): INTEGER_32 is
 		-- pclose
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pclose"
		}"
		end

	perror (a_s: POINTER) is
 		-- perror
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "perror"
		}"
		end

	popen (a_command: POINTER; a_modes: POINTER): POINTER is
 		-- popen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "popen"
		}"
		end

	putc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putc"
		}"
		end

	puts (a_s: POINTER): INTEGER_32 is
 		-- puts
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "puts"
		}"
		end

	putw (a_w: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putw"
		}"
		end

	remove (a_filename: POINTER): INTEGER_32 is
 		-- remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remove"
		}"
		end

	rename_external (an_old: POINTER; a_new: POINTER): INTEGER_32 is
 		-- rename
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rename"
		}"
		end

	renameat (an_oldfd: INTEGER_32; an_old: POINTER; a_newfd: INTEGER_32; a_new: POINTER): INTEGER_32 is
 		-- renameat
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "renameat"
		}"
		end

	rewind (a_stream: POINTER) is
 		-- rewind
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rewind"
		}"
		end

	scanf (a_format: POINTER): INTEGER_32 is
 		-- scanf (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scanf"
		}"
		end

	setbuf (a_stream: POINTER; a_buf: POINTER) is
 		-- setbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuf"
		}"
		end

	setbuffer (a_stream: POINTER; a_buf: POINTER; a_size: NATURAL_64) is
 		-- setbuffer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuffer"
		}"
		end

	setlinebuf (a_stream: POINTER) is
 		-- setlinebuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setlinebuf"
		}"
		end

	setvbuf (a_stream: POINTER; a_buf: POINTER; a_modes: INTEGER_32; a_n: NATURAL_64): INTEGER_32 is
 		-- setvbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setvbuf"
		}"
		end

	sscanf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sscanf (variadic call) 
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sscanf"
		}"
		end

	stderr: POINTER is
 		-- stderr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stderr"
		}"
		end

	address_of_stderr: POINTER is
 		-- Address of stderr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&stderr"
		}"
		end

	set_stderr (a_value: POINTER) is
		-- Set variable stderr value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_stderr"
		}"
		end

	stdin: POINTER is
 		-- stdin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stdin"
		}"
		end

	address_of_stdin: POINTER is
 		-- Address of stdin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&stdin"
		}"
		end

	set_stdin (a_value: POINTER) is
		-- Set variable stdin value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_stdin"
		}"
		end

	stdout: POINTER is
 		-- stdout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stdout"
		}"
		end

	address_of_stdout: POINTER is
 		-- Address of stdout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&stdout"
		}"
		end

	set_stdout (a_value: POINTER) is
		-- Set variable stdout value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_stdout"
		}"
		end

	tempnam (a_dir: POINTER; a_pfx: POINTER): POINTER is
 		-- tempnam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tempnam"
		}"
		end

	tmpfile: POINTER is
 		-- tmpfile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile()"
		}"
		end

	tmpfile64: POINTER is
 		-- tmpfile64
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile64()"
		}"
		end

	tmpnam (a_s: POINTER): POINTER is
 		-- tmpnam
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam"
		}"
		end

	tmpnam_r (a_s: POINTER): POINTER is
 		-- tmpnam_r
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam_r"
		}"
		end

	ungetc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- ungetc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ungetc"
		}"
		end

	vfscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfscanf"
		}"
		end

	vscanf (a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vscanf"
		}"
		end

	vsscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsscanf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsscanf"
		}"
		end


end -- class STDIO_EXTERNALS
