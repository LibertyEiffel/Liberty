-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STDIO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	stderr: POINTER is
 		-- stderr (node at line 167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stderr"
		}"
		end

	address_of_stderr: POINTER is
 		-- Address of stderr (node at line 167)
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
 		-- stdin (node at line 165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stdin"
		}"
		end

	address_of_stdin: POINTER is
 		-- Address of stdin (node at line 165)
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
 		-- stdout (node at line 166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "stdout"
		}"
		end

	address_of_stdout: POINTER is
 		-- Address of stdout (node at line 166)
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

	tmpfile: POINTER is
 		-- tmpfile (node at line 42)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile()"
		}"
		end

	remove (a_filename: POINTER): INTEGER_32 is
 		-- remove (node at line 58)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remove"
		}"
		end

	popen (a_command: POINTER; a_modes: POINTER): POINTER is
 		-- popen (node at line 144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "popen"
		}"
		end

	renameat (an_oldfd: INTEGER_32; an_old: POINTER; a_newfd: INTEGER_32; a_new: POINTER): INTEGER_32 is
 		-- renameat (node at line 151)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "renameat"
		}"
		end

	obstack_vprintf (an_obstack: POINTER; a_format: POINTER; an_args: POINTER): INTEGER_32 is
 		-- obstack_vprintf (node at line 162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "obstack_vprintf"
		}"
		end

	vsnprintf (a_s: POINTER; a_maxlen: NATURAL_64; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsnprintf (node at line 184)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsnprintf"
		}"
		end

	fflush (a_stream: POINTER): INTEGER_32 is
 		-- fflush (node at line 212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush"
		}"
		end

	setvbuf (a_stream: POINTER; a_buf: POINTER; a_modes: INTEGER_32; a_n: NATURAL_64): INTEGER_32 is
 		-- setvbuf (node at line 215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setvbuf"
		}"
		end

	asprintf (a_ptr: POINTER; a_fmt: POINTER): INTEGER_32 is
 		-- asprintf (variadic call)  (node at line 284)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asprintf"
		}"
		end

	vsscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsscanf (node at line 440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsscanf"
		}"
		end

	-- `hidden' function __getdelim skipped.
	ftello64 (a_stream: POINTER): INTEGER_64 is
 		-- ftello64 (node at line 463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello64"
		}"
		end

	fcloseall: INTEGER_32 is
 		-- fcloseall (node at line 553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcloseall()"
		}"
		end

	fopen64 (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen64 (node at line 582)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen64"
		}"
		end

	sprintf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sprintf (variadic call)  (node at line 589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sprintf"
		}"
		end

	fmemopen (a_s: POINTER; a_len: NATURAL_64; a_modes: POINTER): POINTER is
 		-- fmemopen (node at line 619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmemopen"
		}"
		end

	getc (a_stream: POINTER): INTEGER_32 is
 		-- getc (node at line 653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getc"
		}"
		end

	gets (a_s: POINTER): POINTER is
 		-- gets (node at line 659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gets"
		}"
		end

	funlockfile (a_stream: POINTER) is
 		-- funlockfile (node at line 673)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "funlockfile"
		}"
		end

	printf (a_format: POINTER): INTEGER_32 is
 		-- printf (variadic call)  (node at line 688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "printf"
		}"
		end

	-- `hidden' function __asprintf skipped.
	tmpfile64: POINTER is
 		-- tmpfile64 (node at line 739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile64()"
		}"
		end

	fseek (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseek (node at line 765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseek"
		}"
		end

	clearerr (a_stream: POINTER) is
 		-- clearerr (node at line 802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr"
		}"
		end

	fwrite_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fwrite_unlocked (node at line 814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite_unlocked"
		}"
		end

	vsprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsprintf (node at line 950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsprintf"
		}"
		end

	vasprintf (a_ptr: POINTER; a_f: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vasprintf (node at line 958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vasprintf"
		}"
		end

	fdopen (a_fd: INTEGER_32; a_modes: POINTER): POINTER is
 		-- fdopen (node at line 1116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdopen"
		}"
		end

	freopen64 (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen64 (node at line 1123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen64"
		}"
		end

	ftrylockfile (a_stream: POINTER): INTEGER_32 is
 		-- ftrylockfile (node at line 1183)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftrylockfile"
		}"
		end

	fseeko64 (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko64 (node at line 1186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko64"
		}"
		end

	fileno_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fileno_unlocked (node at line 1202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno_unlocked"
		}"
		end

	fgetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos (node at line 1222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos"
		}"
		end

	snprintf (a_s: POINTER; a_maxlen: NATURAL_64; a_format: POINTER): INTEGER_32 is
 		-- snprintf (variadic call)  (node at line 1255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "snprintf"
		}"
		end

	tmpnam (a_s: POINTER): POINTER is
 		-- tmpnam (node at line 1286)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam"
		}"
		end

	cuserid (a_s: POINTER): POINTER is
 		-- cuserid (node at line 1289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cuserid"
		}"
		end

	tempnam (a_dir: POINTER; a_pfx: POINTER): POINTER is
 		-- tempnam (node at line 1352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tempnam"
		}"
		end

	ftello (a_stream: POINTER): INTEGER_64 is
 		-- ftello (node at line 1398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello"
		}"
		end

	getw (a_stream: POINTER): INTEGER_32 is
 		-- getw (node at line 1429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getw"
		}"
		end

	fscanf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fscanf (variadic call)  (node at line 1438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fscanf"
		}"
		end

	perror (a_s: POINTER) is
 		-- perror (node at line 1500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "perror"
		}"
		end

	fsetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos64 (node at line 1530)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos64"
		}"
		end

	obstack_printf (an_obstack: POINTER; a_format: POINTER): INTEGER_32 is
 		-- obstack_printf (variadic call)  (node at line 1541)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "obstack_printf"
		}"
		end

	fseeko (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko (node at line 1572)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko"
		}"
		end

	fileno (a_stream: POINTER): INTEGER_32 is
 		-- fileno (node at line 1586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno"
		}"
		end

	ferror (a_stream: POINTER): INTEGER_32 is
 		-- ferror (node at line 1593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ferror"
		}"
		end

	vfscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfscanf (node at line 1613)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfscanf"
		}"
		end

	scanf (a_format: POINTER): INTEGER_32 is
 		-- scanf (variadic call)  (node at line 1665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scanf"
		}"
		end

	fsetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos (node at line 1730)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos"
		}"
		end

	setbuffer (a_stream: POINTER; a_buf: POINTER; a_size: NATURAL_64) is
 		-- setbuffer (node at line 1846)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuffer"
		}"
		end

	rename_external (an_old: POINTER; a_new: POINTER): INTEGER_32 is
 		-- rename (node at line 1868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rename"
		}"
		end

	getdelim (a_lineptr: POINTER; a_n: POINTER; a_delimiter: INTEGER_32; a_stream: POINTER): INTEGER_64 is
 		-- getdelim (node at line 1875)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdelim"
		}"
		end

	clearerr_unlocked (a_stream: POINTER) is
 		-- clearerr_unlocked (node at line 2035)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr_unlocked"
		}"
		end

	ctermid (a_s: POINTER): POINTER is
 		-- ctermid (node at line 2044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctermid"
		}"
		end

	freopen (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen (node at line 2084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen"
		}"
		end

	fputc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- fputc (node at line 2114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputc"
		}"
		end

	fputs (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs (node at line 2118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs"
		}"
		end

	ftell (a_stream: POINTER): INTEGER_64 is
 		-- ftell (node at line 2175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftell"
		}"
		end

	pclose (a_stream: POINTER): INTEGER_32 is
 		-- pclose (node at line 2279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pclose"
		}"
		end

	fclose (a_stream: POINTER): INTEGER_32 is
 		-- fclose (node at line 2422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fclose"
		}"
		end

	sscanf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sscanf (variadic call)  (node at line 2499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sscanf"
		}"
		end

	fwrite (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_s: POINTER): NATURAL_64 is
 		-- fwrite (node at line 2544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite"
		}"
		end

	ungetc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- ungetc (node at line 2578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ungetc"
		}"
		end

	flockfile (a_stream: POINTER) is
 		-- flockfile (node at line 2583)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "flockfile"
		}"
		end

	-- function fopencookie (at line 311 in file /usr/include/stdio.h is not wrappable
	tmpnam_r (a_s: POINTER): POINTER is
 		-- tmpnam_r (node at line 2760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam_r"
		}"
		end

	setbuf (a_stream: POINTER; a_buf: POINTER) is
 		-- setbuf (node at line 2763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuf"
		}"
		end

	putc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putc (node at line 2822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putc"
		}"
		end

	puts (a_s: POINTER): INTEGER_32 is
 		-- puts (node at line 2826)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "puts"
		}"
		end

	putw (a_w: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putw (node at line 2829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putw"
		}"
		end

	fopen (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen (node at line 2878)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen"
		}"
		end

	fprintf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fprintf (variadic call)  (node at line 2901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fprintf"
		}"
		end

	feof (a_stream: POINTER): INTEGER_32 is
 		-- feof (node at line 2906)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "feof"
		}"
		end

	dprintf (a_fd: INTEGER_32; a_fmt: POINTER): INTEGER_32 is
 		-- dprintf (variadic call)  (node at line 2973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dprintf"
		}"
		end

	fgets_unlocked (a_s: POINTER; a_n: INTEGER_32; a_stream: POINTER): POINTER is
 		-- fgets_unlocked (node at line 2991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgets_unlocked"
		}"
		end

	fread (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fread (node at line 3030)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fread"
		}"
		end

	fputs_unlocked (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs_unlocked (node at line 3143)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs_unlocked"
		}"
		end

	setlinebuf (a_stream: POINTER) is
 		-- setlinebuf (node at line 3236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setlinebuf"
		}"
		end

	vfprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfprintf (node at line 3239)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfprintf"
		}"
		end

	vdprintf (a_fd: INTEGER_32; a_fmt: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vdprintf (node at line 3302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vdprintf"
		}"
		end

	open_memstream (a_bufloc: POINTER; a_sizeloc: POINTER): POINTER is
 		-- open_memstream (node at line 3307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open_memstream"
		}"
		end

	fflush_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fflush_unlocked (node at line 3474)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush_unlocked"
		}"
		end

	fread_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fread_unlocked (node at line 3493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fread_unlocked"
		}"
		end

	fgetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos64 (node at line 3528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos64"
		}"
		end

	vscanf (a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vscanf (node at line 3542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vscanf"
		}"
		end

	fgetc (a_stream: POINTER): INTEGER_32 is
 		-- fgetc (node at line 3611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetc"
		}"
		end

	fgets (a_s: POINTER; a_n: INTEGER_32; a_stream: POINTER): POINTER is
 		-- fgets (node at line 3614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgets"
		}"
		end

	rewind (a_stream: POINTER) is
 		-- rewind (node at line 3626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rewind"
		}"
		end


end -- class STDIO_EXTERNALS
