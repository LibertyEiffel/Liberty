-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STDIOEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	tmpfile: POINTER is
 		-- tmpfile (node at line 35)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile()"
		}"
		end

	vprintf (a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vprintf (node at line 46)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vprintf"
		}"
		end

	remove (a_filename: POINTER): INTEGER_32 is
 		-- remove (node at line 51)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remove"
		}"
		end

	popen (a_command: POINTER; a_modes: POINTER): POINTER is
 		-- popen (node at line 137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "popen"
		}"
		end

	fgetc_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fgetc_unlocked (node at line 141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetc_unlocked"
		}"
		end

	renameat (an_oldfd: INTEGER_32; an_old: POINTER; a_newfd: INTEGER_32; a_new: POINTER): INTEGER_32 is
 		-- renameat (node at line 144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "renameat"
		}"
		end

	vsnprintf (a_s: POINTER; a_maxlen: NATURAL_64; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsnprintf (node at line 169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsnprintf"
		}"
		end

	setbuf (a_stream: POINTER; a_buf: POINTER) is
 		-- setbuf (node at line 175)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuf"
		}"
		end

	obstack_vprintf (an_obstack: POINTER; a_format: POINTER; an_args: POINTER): INTEGER_32 is
 		-- obstack_vprintf (node at line 198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "obstack_vprintf"
		}"
		end

	fflush (a_stream: POINTER): INTEGER_32 is
 		-- fflush (node at line 203)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush"
		}"
		end

	setvbuf (a_stream: POINTER; a_buf: POINTER; a_modes: INTEGER_32; a_n: NATURAL_64): INTEGER_32 is
 		-- setvbuf (node at line 206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setvbuf"
		}"
		end

	putc_unlocked (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putc_unlocked (node at line 260)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putc_unlocked"
		}"
		end

	asprintf (a_ptr: POINTER; a_fmt: POINTER): INTEGER_32 is
 		-- asprintf (variadic)  (node at line 275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asprintf"
		}"
		end

	vsscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsscanf (node at line 431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsscanf"
		}"
		end

	ftello64 (a_stream: POINTER): INTEGER_64 is
 		-- ftello64 (node at line 445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello64"
		}"
		end

	fcloseall: INTEGER_32 is
 		-- fcloseall (node at line 529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcloseall()"
		}"
		end

	fopen64 (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen64 (node at line 558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen64"
		}"
		end

	sprintf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sprintf (variadic)  (node at line 565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sprintf"
		}"
		end

	fmemopen (a_s: POINTER; a_len: NATURAL_64; a_modes: POINTER): POINTER is
 		-- fmemopen (node at line 598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmemopen"
		}"
		end

	putchar (a_c: INTEGER_32): INTEGER_32 is
 		-- putchar (node at line 603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putchar"
		}"
		end

	getc (a_stream: POINTER): INTEGER_32 is
 		-- getc (node at line 632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getc"
		}"
		end

	gets (a_s: POINTER): POINTER is
 		-- gets (node at line 638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gets"
		}"
		end

	funlockfile (a_stream: POINTER) is
 		-- funlockfile (node at line 652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "funlockfile"
		}"
		end

	feof_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- feof_unlocked (node at line 657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "feof_unlocked"
		}"
		end

	printf (a_format: POINTER): INTEGER_32 is
 		-- printf (variadic)  (node at line 667)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "printf"
		}"
		end

	-- `hidden' function __asprintf skipped.
	tmpfile64: POINTER is
 		-- tmpfile64 (node at line 718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile64()"
		}"
		end

	fseek (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseek (node at line 744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseek"
		}"
		end

	getchar: INTEGER_32 is
 		-- getchar (node at line 763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getchar()"
		}"
		end

	clearerr (a_stream: POINTER) is
 		-- clearerr (node at line 776)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr"
		}"
		end

	fwrite_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fwrite_unlocked (node at line 788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite_unlocked"
		}"
		end

	getchar_unlocked: INTEGER_32 is
 		-- getchar_unlocked (node at line 794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getchar_unlocked()"
		}"
		end

	vsprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsprintf (node at line 915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsprintf"
		}"
		end

	vasprintf (a_ptr: POINTER; a_f: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vasprintf (node at line 923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vasprintf"
		}"
		end

	fdopen (a_fd: INTEGER_32; a_modes: POINTER): POINTER is
 		-- fdopen (node at line 1074)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdopen"
		}"
		end

	freopen64 (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen64 (node at line 1081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen64"
		}"
		end

	ftrylockfile (a_stream: POINTER): INTEGER_32 is
 		-- ftrylockfile (node at line 1134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftrylockfile"
		}"
		end

	fseeko64 (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko64 (node at line 1137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko64"
		}"
		end

	fileno_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fileno_unlocked (node at line 1153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno_unlocked"
		}"
		end

	fgetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos (node at line 1173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos"
		}"
		end

	snprintf (a_s: POINTER; a_maxlen: NATURAL_64; a_format: POINTER): INTEGER_32 is
 		-- snprintf (variadic)  (node at line 1209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "snprintf"
		}"
		end

	putchar_unlocked (a_c: INTEGER_32): INTEGER_32 is
 		-- putchar_unlocked (node at line 1238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putchar_unlocked"
		}"
		end

	tmpnam (a_s: POINTER): POINTER is
 		-- tmpnam (node at line 1241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam"
		}"
		end

	cuserid (a_s: POINTER): POINTER is
 		-- cuserid (node at line 1244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cuserid"
		}"
		end

	tempnam (a_dir: POINTER; a_pfx: POINTER): POINTER is
 		-- tempnam (node at line 1307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tempnam"
		}"
		end

	ftello (a_stream: POINTER): INTEGER_64 is
 		-- ftello (node at line 1353)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello"
		}"
		end

	getw (a_stream: POINTER): INTEGER_32 is
 		-- getw (node at line 1380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getw"
		}"
		end

	fscanf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fscanf (variadic)  (node at line 1389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fscanf"
		}"
		end

	perror (a_s: POINTER) is
 		-- perror (node at line 1450)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "perror"
		}"
		end

	fsetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos64 (node at line 1481)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos64"
		}"
		end

	obstack_printf (an_obstack: POINTER; a_format: POINTER): INTEGER_32 is
 		-- obstack_printf (variadic)  (node at line 1492)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "obstack_printf"
		}"
		end

	fseeko (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko (node at line 1523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko"
		}"
		end

	fileno (a_stream: POINTER): INTEGER_32 is
 		-- fileno (node at line 1537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno"
		}"
		end

	ferror (a_stream: POINTER): INTEGER_32 is
 		-- ferror (node at line 1544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ferror"
		}"
		end

	vfscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfscanf (node at line 1564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfscanf"
		}"
		end

	scanf (a_format: POINTER): INTEGER_32 is
 		-- scanf (variadic)  (node at line 1616)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scanf"
		}"
		end

	fsetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos (node at line 1675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos"
		}"
		end

	setbuffer (a_stream: POINTER; a_buf: POINTER; a_size: NATURAL_64) is
 		-- setbuffer (node at line 1783)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuffer"
		}"
		end

	rename_external (an_old: POINTER; a_new: POINTER): INTEGER_32 is
 		-- rename (node at line 1805)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rename"
		}"
		end

	getdelim (a_lineptr: POINTER; a_n: POINTER; a_delimiter: INTEGER_32; a_stream: POINTER): INTEGER_64 is
 		-- getdelim (node at line 1812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdelim"
		}"
		end

	clearerr_unlocked (a_stream: POINTER) is
 		-- clearerr_unlocked (node at line 1969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr_unlocked"
		}"
		end

	ctermid (a_s: POINTER): POINTER is
 		-- ctermid (node at line 1978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctermid"
		}"
		end

	fputc_unlocked (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- fputc_unlocked (node at line 1981)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputc_unlocked"
		}"
		end

	freopen (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen (node at line 2018)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen"
		}"
		end

	fputc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- fputc (node at line 2048)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputc"
		}"
		end

	fputs (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs (node at line 2052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs"
		}"
		end

	getc_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- getc_unlocked (node at line 2100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getc_unlocked"
		}"
		end

	ftell (a_stream: POINTER): INTEGER_64 is
 		-- ftell (node at line 2109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftell"
		}"
		end

	pclose (a_stream: POINTER): INTEGER_32 is
 		-- pclose (node at line 2215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pclose"
		}"
		end

	-- `hidden' function __getdelim skipped.
	fclose (a_stream: POINTER): INTEGER_32 is
 		-- fclose (node at line 2362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fclose"
		}"
		end

	sscanf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sscanf (variadic)  (node at line 2431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sscanf"
		}"
		end

	fwrite (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_s: POINTER): NATURAL_64 is
 		-- fwrite (node at line 2475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite"
		}"
		end

	ungetc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- ungetc (node at line 2509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ungetc"
		}"
		end

	flockfile (a_stream: POINTER) is
 		-- flockfile (node at line 2514)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "flockfile"
		}"
		end

		-- function fopencookie is not wrappable
	getline (a_lineptr: POINTER; a_n: POINTER; a_stream: POINTER): INTEGER_64 is
 		-- getline (node at line 2677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getline"
		}"
		end

	tmpnam_r (a_s: POINTER): POINTER is
 		-- tmpnam_r (node at line 2682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam_r"
		}"
		end

	putc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putc (node at line 2736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putc"
		}"
		end

	puts (a_s: POINTER): INTEGER_32 is
 		-- puts (node at line 2740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "puts"
		}"
		end

	putw (a_w: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putw (node at line 2743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putw"
		}"
		end

	fopen (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen (node at line 2788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen"
		}"
		end

	fprintf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fprintf (variadic)  (node at line 2808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fprintf"
		}"
		end

	feof (a_stream: POINTER): INTEGER_32 is
 		-- feof (node at line 2813)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "feof"
		}"
		end

	dprintf (a_fd: INTEGER_32; a_fmt: POINTER): INTEGER_32 is
 		-- dprintf (variadic)  (node at line 2876)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dprintf"
		}"
		end

	fgets_unlocked (a_s: POINTER; a_n: INTEGER_32; a_stream: POINTER): POINTER is
 		-- fgets_unlocked (node at line 2894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgets_unlocked"
		}"
		end

	fread (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fread (node at line 2928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fread"
		}"
		end

	ferror_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- ferror_unlocked (node at line 3035)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ferror_unlocked"
		}"
		end

	fputs_unlocked (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs_unlocked (node at line 3041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs_unlocked"
		}"
		end

	setlinebuf (a_stream: POINTER) is
 		-- setlinebuf (node at line 3128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setlinebuf"
		}"
		end

	vfprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfprintf (node at line 3131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfprintf"
		}"
		end

	vdprintf (a_fd: INTEGER_32; a_fmt: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vdprintf (node at line 3197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vdprintf"
		}"
		end

	open_memstream (a_bufloc: POINTER; a_sizeloc: POINTER): POINTER is
 		-- open_memstream (node at line 3202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open_memstream"
		}"
		end

	fflush_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fflush_unlocked (node at line 3364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush_unlocked"
		}"
		end

	fread_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fread_unlocked (node at line 3382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fread_unlocked"
		}"
		end

	fgetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos64 (node at line 3417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos64"
		}"
		end

	vscanf (a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vscanf (node at line 3438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vscanf"
		}"
		end

	fgetc (a_stream: POINTER): INTEGER_32 is
 		-- fgetc (node at line 3496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetc"
		}"
		end

	fgets (a_s: POINTER; a_n: INTEGER_32; a_stream: POINTER): POINTER is
 		-- fgets (node at line 3499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgets"
		}"
		end

	rewind (a_stream: POINTER) is
 		-- rewind (node at line 3511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rewind"
		}"
		end


end -- class STDIOEXTERNALS
