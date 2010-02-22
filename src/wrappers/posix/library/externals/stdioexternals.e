-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class STDIOEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	tmpfile: POINTER is
 		-- tmpfile (node at line 21)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile()"
		}"
		end

	vprintf (a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vprintf (node at line 24)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vprintf"
		}"
		end

	remove (a_filename: POINTER): INTEGER_32 is
 		-- remove (node at line 28)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "remove"
		}"
		end

	fseeko64 (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko64 (node at line 50)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko64"
		}"
		end

	popen (a_command: POINTER; a_modes: POINTER): POINTER is
 		-- popen (node at line 55)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "popen"
		}"
		end

	fgetc_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fgetc_unlocked (node at line 59)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetc_unlocked"
		}"
		end

	renameat (an_oldfd: INTEGER_32; an_old: POINTER; a_newfd: INTEGER_32; a_new: POINTER): INTEGER_32 is
 		-- renameat (node at line 62)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "renameat"
		}"
		end

	vsnprintf (a_s: POINTER; a_maxlen: NATURAL_64; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsnprintf (node at line 69)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsnprintf"
		}"
		end

	setbuf (a_stream: POINTER; a_buf: POINTER) is
 		-- setbuf (node at line 75)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuf"
		}"
		end

	rename_external (an_old: POINTER; a_new: POINTER): INTEGER_32 is
 		-- rename (node at line 91)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rename"
		}"
		end

	obstack_vprintf (an_obstack: POINTER; a_format: POINTER; an_args: POINTER): INTEGER_32 is
 		-- obstack_vprintf (node at line 95)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "obstack_vprintf"
		}"
		end

	fflush (a_stream: POINTER): INTEGER_32 is
 		-- fflush (node at line 100)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush"
		}"
		end

	setvbuf (a_stream: POINTER; a_buf: POINTER; a_modes: INTEGER_32; a_n: NATURAL_64): INTEGER_32 is
 		-- setvbuf (node at line 103)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setvbuf"
		}"
		end

	putc_unlocked (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putc_unlocked (node at line 121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putc_unlocked"
		}"
		end

	asprintf (a_ptr: POINTER; a_fmt: POINTER): INTEGER_32 is
 		-- asprintf (variadic)  (node at line 128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "asprintf"
		}"
		end

	vsscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsscanf (node at line 193)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsscanf"
		}"
		end

	ftello64 (a_stream: POINTER): INTEGER_64 is
 		-- ftello64 (node at line 201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello64"
		}"
		end

	setlinebuf (a_stream: POINTER) is
 		-- setlinebuf (node at line 219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setlinebuf"
		}"
		end

	fcloseall: INTEGER_32 is
 		-- fcloseall (node at line 245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fcloseall()"
		}"
		end

	fopen64 (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen64 (node at line 251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen64"
		}"
		end

	sprintf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sprintf (variadic)  (node at line 255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sprintf"
		}"
		end

	fgetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos64 (node at line 260)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos64"
		}"
		end

	putchar (a_c: INTEGER_32): INTEGER_32 is
 		-- putchar (node at line 273)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putchar"
		}"
		end

	getc (a_stream: POINTER): INTEGER_32 is
 		-- getc (node at line 291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getc"
		}"
		end

	gets (a_s: POINTER): POINTER is
 		-- gets (node at line 294)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gets"
		}"
		end

	getw (a_stream: POINTER): INTEGER_32 is
 		-- getw (node at line 297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getw"
		}"
		end

	funlockfile (a_stream: POINTER) is
 		-- funlockfile (node at line 307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "funlockfile"
		}"
		end

	printf (a_format: POINTER): INTEGER_32 is
 		-- printf (variadic)  (node at line 311)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "printf"
		}"
		end

	-- `hidden' function __asprintf skipped.
	tmpfile64: POINTER is
 		-- tmpfile64 (node at line 332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpfile64()"
		}"
		end

	fseek (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseek (node at line 336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseek"
		}"
		end

	getchar: INTEGER_32 is
 		-- getchar (node at line 349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getchar()"
		}"
		end

	fseeko (a_stream: POINTER; an_off: INTEGER_64; a_whence: INTEGER_32): INTEGER_32 is
 		-- fseeko (node at line 350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fseeko"
		}"
		end

	clearerr (a_stream: POINTER) is
 		-- clearerr (node at line 356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr"
		}"
		end

	fwrite_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fwrite_unlocked (node at line 365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite_unlocked"
		}"
		end

	getchar_unlocked: INTEGER_32 is
 		-- getchar_unlocked (node at line 371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getchar_unlocked()"
		}"
		end

	vsprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vsprintf (node at line 411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vsprintf"
		}"
		end

	vasprintf (a_ptr: POINTER; a_f: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vasprintf (node at line 423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vasprintf"
		}"
		end

	fdopen (a_fd: INTEGER_32; a_modes: POINTER): POINTER is
 		-- fdopen (node at line 467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fdopen"
		}"
		end

	freopen64 (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen64 (node at line 476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen64"
		}"
		end

	ftrylockfile (a_stream: POINTER): INTEGER_32 is
 		-- ftrylockfile (node at line 482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftrylockfile"
		}"
		end

	fileno_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fileno_unlocked (node at line 490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno_unlocked"
		}"
		end

	fgetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fgetpos (node at line 493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetpos"
		}"
		end

	snprintf (a_s: POINTER; a_maxlen: NATURAL_64; a_format: POINTER): INTEGER_32 is
 		-- snprintf (variadic)  (node at line 520)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "snprintf"
		}"
		end

	putchar_unlocked (a_c: INTEGER_32): INTEGER_32 is
 		-- putchar_unlocked (node at line 543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putchar_unlocked"
		}"
		end

	tmpnam (a_s: POINTER): POINTER is
 		-- tmpnam (node at line 552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam"
		}"
		end

	cuserid (a_s: POINTER): POINTER is
 		-- cuserid (node at line 555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cuserid"
		}"
		end

	tempnam (a_dir: POINTER; a_pfx: POINTER): POINTER is
 		-- tempnam (node at line 586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tempnam"
		}"
		end

	ftello (a_stream: POINTER): INTEGER_64 is
 		-- ftello (node at line 622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftello"
		}"
		end

	fscanf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fscanf (variadic)  (node at line 634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fscanf"
		}"
		end

	perror (a_s: POINTER) is
 		-- perror (node at line 649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "perror"
		}"
		end

	obstack_printf (an_obstack: POINTER; a_format: POINTER): INTEGER_32 is
 		-- obstack_printf (variadic)  (node at line 669)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "obstack_printf"
		}"
		end

	fileno (a_stream: POINTER): INTEGER_32 is
 		-- fileno (node at line 679)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fileno"
		}"
		end

	ferror (a_stream: POINTER): INTEGER_32 is
 		-- ferror (node at line 682)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ferror"
		}"
		end

	rewind (a_stream: POINTER) is
 		-- rewind (node at line 685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "rewind"
		}"
		end

	vfscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfscanf (node at line 696)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfscanf"
		}"
		end

	scanf (a_format: POINTER): INTEGER_32 is
 		-- scanf (variadic)  (node at line 722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "scanf"
		}"
		end

	fsetpos (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos (node at line 743)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos"
		}"
		end

	setbuffer (a_stream: POINTER; a_buf: POINTER; a_size: NATURAL_64) is
 		-- setbuffer (node at line 770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setbuffer"
		}"
		end

	getdelim (a_lineptr: POINTER; a_n: POINTER; a_delimiter: INTEGER_32; a_stream: POINTER): INTEGER_64 is
 		-- getdelim (node at line 779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getdelim"
		}"
		end

	fsetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- fsetpos64 (node at line 832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fsetpos64"
		}"
		end

	clearerr_unlocked (a_stream: POINTER) is
 		-- clearerr_unlocked (node at line 854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "clearerr_unlocked"
		}"
		end

	ctermid (a_s: POINTER): POINTER is
 		-- ctermid (node at line 857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ctermid"
		}"
		end

	fputc_unlocked (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- fputc_unlocked (node at line 860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputc_unlocked"
		}"
		end

	freopen (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER is
 		-- freopen (node at line 864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "freopen"
		}"
		end

	fputc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- fputc (node at line 869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputc"
		}"
		end

	fputs (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs (node at line 877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs"
		}"
		end

	getc_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- getc_unlocked (node at line 892)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getc_unlocked"
		}"
		end

	ftell (a_stream: POINTER): INTEGER_64 is
 		-- ftell (node at line 898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ftell"
		}"
		end

	pclose (a_stream: POINTER): INTEGER_32 is
 		-- pclose (node at line 943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pclose"
		}"
		end

	-- `hidden' function __getdelim skipped.
	tmpnam_r (a_s: POINTER): POINTER is
 		-- tmpnam_r (node at line 955)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "tmpnam_r"
		}"
		end

	fclose (a_stream: POINTER): INTEGER_32 is
 		-- fclose (node at line 974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fclose"
		}"
		end

	fmemopen (a_s: POINTER; a_len: NATURAL_64; a_modes: POINTER): POINTER is
 		-- fmemopen (node at line 977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fmemopen"
		}"
		end

	sscanf (a_s: POINTER; a_format: POINTER): INTEGER_32 is
 		-- sscanf (variadic)  (node at line 993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sscanf"
		}"
		end

	fwrite (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_s: POINTER): NATURAL_64 is
 		-- fwrite (node at line 1009)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fwrite"
		}"
		end

	ungetc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- ungetc (node at line 1032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ungetc"
		}"
		end

		-- function fopencookie is not wrappable
	getline (a_lineptr: POINTER; a_n: POINTER; a_stream: POINTER): INTEGER_64 is
 		-- getline (node at line 1063)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getline"
		}"
		end

	putc (a_c: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putc (node at line 1077)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putc"
		}"
		end

	puts (a_s: POINTER): INTEGER_32 is
 		-- puts (node at line 1081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "puts"
		}"
		end

	putw (a_w: INTEGER_32; a_stream: POINTER): INTEGER_32 is
 		-- putw (node at line 1084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "putw"
		}"
		end

	fopen (a_filename: POINTER; a_modes: POINTER): POINTER is
 		-- fopen (node at line 1112)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fopen"
		}"
		end

	fprintf (a_stream: POINTER; a_format: POINTER): INTEGER_32 is
 		-- fprintf (variadic)  (node at line 1128)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fprintf"
		}"
		end

	dprintf (a_fd: INTEGER_32; a_fmt: POINTER): INTEGER_32 is
 		-- dprintf (variadic)  (node at line 1150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dprintf"
		}"
		end

	fread (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fread (node at line 1166)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fread"
		}"
		end

	fgets_unlocked (a_s: POINTER; a_n: INTEGER_32; a_stream: POINTER): POINTER is
 		-- fgets_unlocked (node at line 1190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgets_unlocked"
		}"
		end

	ferror_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- ferror_unlocked (node at line 1215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ferror_unlocked"
		}"
		end

	feof_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- feof_unlocked (node at line 1221)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "feof_unlocked"
		}"
		end

	fputs_unlocked (a_s: POINTER; a_stream: POINTER): INTEGER_32 is
 		-- fputs_unlocked (node at line 1224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fputs_unlocked"
		}"
		end

	vfprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vfprintf (node at line 1247)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vfprintf"
		}"
		end

	vdprintf (a_fd: INTEGER_32; a_fmt: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vdprintf (node at line 1262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vdprintf"
		}"
		end

	open_memstream (a_bufloc: POINTER; a_sizeloc: POINTER): POINTER is
 		-- open_memstream (node at line 1267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "open_memstream"
		}"
		end

	fflush_unlocked (a_stream: POINTER): INTEGER_32 is
 		-- fflush_unlocked (node at line 1314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fflush_unlocked"
		}"
		end

	fread_unlocked (a_ptr: POINTER; a_size: NATURAL_64; a_n: NATURAL_64; a_stream: POINTER): NATURAL_64 is
 		-- fread_unlocked (node at line 1323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fread_unlocked"
		}"
		end

	flockfile (a_stream: POINTER) is
 		-- flockfile (node at line 1346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "flockfile"
		}"
		end

	vscanf (a_format: POINTER; an_arg: POINTER): INTEGER_32 is
 		-- vscanf (node at line 1361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vscanf"
		}"
		end

	feof (a_stream: POINTER): INTEGER_32 is
 		-- feof (node at line 1370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "feof"
		}"
		end

	fgetc (a_stream: POINTER): INTEGER_32 is
 		-- fgetc (node at line 1374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgetc"
		}"
		end

	fgets (a_s: POINTER; a_n: INTEGER_32; a_stream: POINTER): POINTER is
 		-- fgets (node at line 1377)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fgets"
		}"
		end


end -- class STDIOEXTERNALS
