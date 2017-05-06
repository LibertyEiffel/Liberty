-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STDIO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __asprintf skipped.
	asprintf (a_ptr: POINTER; a_fmt: POINTER): INTEGER 

		-- function asprintf (in `/usr/include/stdio.h')
               -- asprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "asprintf"
               }"
               end

	clearerr (a_stream: POINTER) 

		-- function clearerr (in `/usr/include/stdio.h')
               -- clearerr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clearerr"
               }"
               end

	clearerr_unlocked (a_stream: POINTER) 

		-- function clearerr_unlocked (in `/usr/include/stdio.h')
               -- clearerr_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clearerr_unlocked"
               }"
               end

	ctermid (a_s: POINTER): POINTER 

		-- function ctermid (in `/usr/include/stdio.h')
               -- ctermid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ctermid"
               }"
               end

	cuserid (a_s: POINTER): POINTER 

		-- function cuserid (in `/usr/include/stdio.h')
               -- cuserid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cuserid"
               }"
               end

	dprintf (a_fd: INTEGER; a_fmt: POINTER): INTEGER 

		-- function dprintf (in `/usr/include/stdio.h')
               -- dprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dprintf"
               }"
               end

	fclose (a_stream: POINTER): INTEGER 

		-- function fclose (in `/usr/include/stdio.h')
               -- fclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fclose"
               }"
               end

	fcloseall: INTEGER 

		-- function fcloseall (in `/usr/include/stdio.h')
               -- fcloseall
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcloseall()"
               }"
               end

	fdopen (a_fd: INTEGER; a_modes: POINTER): POINTER 

		-- function fdopen (in `/usr/include/stdio.h')
               -- fdopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fdopen"
               }"
               end

	feof (a_stream: POINTER): INTEGER 

		-- function feof (in `/usr/include/stdio.h')
               -- feof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feof"
               }"
               end

	feof_unlocked (a_stream: POINTER): INTEGER 

		-- function feof_unlocked (in `/usr/include/stdio.h')
               -- feof_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feof_unlocked"
               }"
               end

	ferror (a_stream: POINTER): INTEGER 

		-- function ferror (in `/usr/include/stdio.h')
               -- ferror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ferror"
               }"
               end

	ferror_unlocked (a_stream: POINTER): INTEGER 

		-- function ferror_unlocked (in `/usr/include/stdio.h')
               -- ferror_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ferror_unlocked"
               }"
               end

	fflush (a_stream: POINTER): INTEGER 

		-- function fflush (in `/usr/include/stdio.h')
               -- fflush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fflush"
               }"
               end

	fflush_unlocked (a_stream: POINTER): INTEGER 

		-- function fflush_unlocked (in `/usr/include/stdio.h')
               -- fflush_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fflush_unlocked"
               }"
               end

	fgetc (a_stream: POINTER): INTEGER 

		-- function fgetc (in `/usr/include/stdio.h')
               -- fgetc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetc"
               }"
               end

	fgetc_unlocked (a_stream: POINTER): INTEGER 

		-- function fgetc_unlocked (in `/usr/include/stdio.h')
               -- fgetc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetc_unlocked"
               }"
               end

	fgetpos (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fgetpos (in `/usr/include/stdio.h')
               -- fgetpos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetpos"
               }"
               end

	fgetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fgetpos64 (in `/usr/include/stdio.h')
               -- fgetpos64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetpos64"
               }"
               end

	fgets (a_s: POINTER; a_n: INTEGER; a_stream: POINTER): POINTER 

		-- function fgets (in `/usr/include/stdio.h')
               -- fgets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgets"
               }"
               end

	fgets_unlocked (a_s: POINTER; a_n: INTEGER; a_stream: POINTER): POINTER 

		-- function fgets_unlocked (in `/usr/include/stdio.h')
               -- fgets_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgets_unlocked"
               }"
               end

	fileno (a_stream: POINTER): INTEGER 

		-- function fileno (in `/usr/include/stdio.h')
               -- fileno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fileno"
               }"
               end

	fileno_unlocked (a_stream: POINTER): INTEGER 

		-- function fileno_unlocked (in `/usr/include/stdio.h')
               -- fileno_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fileno_unlocked"
               }"
               end

	flockfile (a_stream: POINTER) 

		-- function flockfile (in `/usr/include/stdio.h')
               -- flockfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "flockfile"
               }"
               end

	fmemopen (a_s: POINTER; a_len: like long_unsigned; a_modes: POINTER): POINTER 

		-- function fmemopen (in `/usr/include/stdio.h')
               -- fmemopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fmemopen"
               }"
               end

	fopen (a_filename: POINTER; a_modes: POINTER): POINTER 

		-- function fopen (in `/usr/include/stdio.h')
               -- fopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fopen"
               }"
               end

	fopen64 (a_filename: POINTER; a_modes: POINTER): POINTER 

		-- function fopen64 (in `/usr/include/stdio.h')
               -- fopen64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fopen64"
               }"
               end

       -- unwrappable function fopencookie in file `/usr/include/stdio.h'
	fprintf (a_stream: POINTER; a_format: POINTER): INTEGER 

		-- function fprintf (in `/usr/include/stdio.h')
               -- fprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fprintf"
               }"
               end

	fputc (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function fputc (in `/usr/include/stdio.h')
               -- fputc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputc"
               }"
               end

	fputc_unlocked (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function fputc_unlocked (in `/usr/include/stdio.h')
               -- fputc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputc_unlocked"
               }"
               end

	fputs (a_s: POINTER; a_stream: POINTER): INTEGER 

		-- function fputs (in `/usr/include/stdio.h')
               -- fputs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputs"
               }"
               end

	fputs_unlocked (a_s: POINTER; a_stream: POINTER): INTEGER 

		-- function fputs_unlocked (in `/usr/include/stdio.h')
               -- fputs_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputs_unlocked"
               }"
               end

	fread (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_stream: POINTER): like long_unsigned 

		-- function fread (in `/usr/include/stdio.h')
               -- fread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fread"
               }"
               end

	fread_unlocked (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_stream: POINTER): like long_unsigned 

		-- function fread_unlocked (in `/usr/include/stdio.h')
               -- fread_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fread_unlocked"
               }"
               end

	freopen (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER 

		-- function freopen (in `/usr/include/stdio.h')
               -- freopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "freopen"
               }"
               end

	freopen64 (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER 

		-- function freopen64 (in `/usr/include/stdio.h')
               -- freopen64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "freopen64"
               }"
               end

	fscanf (a_stream: POINTER; a_format: POINTER): INTEGER 

		-- function fscanf (in `/usr/include/stdio.h')
               -- fscanf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fscanf"
               }"
               end

	fseek (a_stream: POINTER; an_off: like long; a_whence: INTEGER): INTEGER 

		-- function fseek (in `/usr/include/stdio.h')
               -- fseek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fseek"
               }"
               end

	fseeko (a_stream: POINTER; an_off: like long; a_whence: INTEGER): INTEGER 

		-- function fseeko (in `/usr/include/stdio.h')
               -- fseeko
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fseeko"
               }"
               end

	fseeko64 (a_stream: POINTER; an_off: like long; a_whence: INTEGER): INTEGER 

		-- function fseeko64 (in `/usr/include/stdio.h')
               -- fseeko64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fseeko64"
               }"
               end

	fsetpos (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fsetpos (in `/usr/include/stdio.h')
               -- fsetpos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fsetpos"
               }"
               end

	fsetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fsetpos64 (in `/usr/include/stdio.h')
               -- fsetpos64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fsetpos64"
               }"
               end

	ftell (a_stream: POINTER): like long 

		-- function ftell (in `/usr/include/stdio.h')
               -- ftell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftell"
               }"
               end

	ftello (a_stream: POINTER): like long 

		-- function ftello (in `/usr/include/stdio.h')
               -- ftello
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftello"
               }"
               end

	ftello64 (a_stream: POINTER): like long 

		-- function ftello64 (in `/usr/include/stdio.h')
               -- ftello64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftello64"
               }"
               end

	ftrylockfile (a_stream: POINTER): INTEGER 

		-- function ftrylockfile (in `/usr/include/stdio.h')
               -- ftrylockfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftrylockfile"
               }"
               end

	funlockfile (a_stream: POINTER) 

		-- function funlockfile (in `/usr/include/stdio.h')
               -- funlockfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "funlockfile"
               }"
               end

	fwrite (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_s: POINTER): like long_unsigned 

		-- function fwrite (in `/usr/include/stdio.h')
               -- fwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fwrite"
               }"
               end

	fwrite_unlocked (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_stream: POINTER): like long_unsigned 

		-- function fwrite_unlocked (in `/usr/include/stdio.h')
               -- fwrite_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fwrite_unlocked"
               }"
               end

	getc (a_stream: POINTER): INTEGER 

		-- function getc (in `/usr/include/stdio.h')
               -- getc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getc"
               }"
               end

	getc_unlocked (a_stream: POINTER): INTEGER 

		-- function getc_unlocked (in `/usr/include/stdio.h')
               -- getc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getc_unlocked"
               }"
               end

	getchar: INTEGER 

		-- function getchar (in `/usr/include/stdio.h')
               -- getchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getchar()"
               }"
               end

	getchar_unlocked: INTEGER 

		-- function getchar_unlocked (in `/usr/include/stdio.h')
               -- getchar_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getchar_unlocked()"
               }"
               end

	-- `hidden' function __getdelim skipped.
	getdelim (a_lineptr: POINTER; a_n: POINTER; a_delimiter: INTEGER; a_stream: POINTER): like long 

		-- function getdelim (in `/usr/include/stdio.h')
               -- getdelim
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdelim"
               }"
               end

	getline (a_lineptr: POINTER; a_n: POINTER; a_stream: POINTER): like long 

		-- function getline (in `/usr/include/stdio.h')
               -- getline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getline"
               }"
               end

	gets (a_s: POINTER): POINTER 

		-- function gets (in `/usr/include/stdio.h')
               -- gets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gets"
               }"
               end

	getw (a_stream: POINTER): INTEGER 

		-- function getw (in `/usr/include/stdio.h')
               -- getw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getw"
               }"
               end

	obstack_printf (an_obstack: POINTER; a_format: POINTER): INTEGER 

		-- function obstack_printf (in `/usr/include/stdio.h')
               -- obstack_printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "obstack_printf"
               }"
               end

	obstack_vprintf (an_obstack: POINTER; a_format: POINTER; an_args: POINTER): INTEGER 

		-- function obstack_vprintf (in `/usr/include/stdio.h')
               -- obstack_vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "obstack_vprintf"
               }"
               end

	open_memstream (a_bufloc: POINTER; a_sizeloc: POINTER): POINTER 

		-- function open_memstream (in `/usr/include/stdio.h')
               -- open_memstream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open_memstream"
               }"
               end

	pclose (a_stream: POINTER): INTEGER 

		-- function pclose (in `/usr/include/stdio.h')
               -- pclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pclose"
               }"
               end

	perror (a_s: POINTER) 

		-- function perror (in `/usr/include/stdio.h')
               -- perror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "perror"
               }"
               end

	popen (a_command: POINTER; a_modes: POINTER): POINTER 

		-- function popen (in `/usr/include/stdio.h')
               -- popen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "popen"
               }"
               end

	printf (a_format: POINTER): INTEGER 

		-- function printf (in `/usr/include/stdio.h')
               -- printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "printf"
               }"
               end

	putc (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function putc (in `/usr/include/stdio.h')
               -- putc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putc"
               }"
               end

	putc_unlocked (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function putc_unlocked (in `/usr/include/stdio.h')
               -- putc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putc_unlocked"
               }"
               end

	putchar (a_c: INTEGER): INTEGER 

		-- function putchar (in `/usr/include/stdio.h')
               -- putchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putchar"
               }"
               end

	putchar_unlocked (a_c: INTEGER): INTEGER 

		-- function putchar_unlocked (in `/usr/include/stdio.h')
               -- putchar_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putchar_unlocked"
               }"
               end

	puts (a_s: POINTER): INTEGER 

		-- function puts (in `/usr/include/stdio.h')
               -- puts
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "puts"
               }"
               end

	putw (a_w: INTEGER; a_stream: POINTER): INTEGER 

		-- function putw (in `/usr/include/stdio.h')
               -- putw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putw"
               }"
               end

	remove (a_filename: POINTER): INTEGER 

		-- function remove (in `/usr/include/stdio.h')
               -- remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "remove"
               }"
               end

	rename_external (an_old: POINTER; a_new: POINTER): INTEGER 

		-- function rename (in `/usr/include/stdio.h')
               -- rename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rename"
               }"
               end

	renameat (an_oldfd: INTEGER; an_old: POINTER; a_newfd: INTEGER; a_new: POINTER): INTEGER 

		-- function renameat (in `/usr/include/stdio.h')
               -- renameat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "renameat"
               }"
               end

	rewind (a_stream: POINTER) 

		-- function rewind (in `/usr/include/stdio.h')
               -- rewind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rewind"
               }"
               end

	scanf (a_format: POINTER): INTEGER 

		-- function scanf (in `/usr/include/stdio.h')
               -- scanf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "scanf"
               }"
               end

	setbuf (a_stream: POINTER; a_buf: POINTER) 

		-- function setbuf (in `/usr/include/stdio.h')
               -- setbuf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setbuf"
               }"
               end

	setbuffer (a_stream: POINTER; a_buf: POINTER; a_size: like long_unsigned) 

		-- function setbuffer (in `/usr/include/stdio.h')
               -- setbuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setbuffer"
               }"
               end

	setlinebuf (a_stream: POINTER) 

		-- function setlinebuf (in `/usr/include/stdio.h')
               -- setlinebuf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setlinebuf"
               }"
               end

	setvbuf (a_stream: POINTER; a_buf: POINTER; a_modes: INTEGER; a_n: like long_unsigned): INTEGER 

		-- function setvbuf (in `/usr/include/stdio.h')
               -- setvbuf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setvbuf"
               }"
               end

	snprintf (a_s: POINTER; a_maxlen: like long_unsigned; a_format: POINTER): INTEGER 

		-- function snprintf (in `/usr/include/stdio.h')
               -- snprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "snprintf"
               }"
               end

	sprintf (a_s: POINTER; a_format: POINTER): INTEGER 

		-- function sprintf (in `/usr/include/stdio.h')
               -- sprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sprintf"
               }"
               end

	sscanf (a_s: POINTER; a_format: POINTER): INTEGER 

		-- function sscanf (in `/usr/include/stdio.h')
               -- sscanf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sscanf"
               }"
               end

	stderr: POINTER
               -- stderr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stderr"
               }"
               end

       address_of_stderr: POINTER
               -- Address of stderr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&stderr"
               }"
               end

       set_stderr (a_value: POINTER)
               -- Set variable stderr value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_stderr"
               }"
               end

	stdin: POINTER
               -- stdin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stdin"
               }"
               end

       address_of_stdin: POINTER
               -- Address of stdin
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&stdin"
               }"
               end

       set_stdin (a_value: POINTER)
               -- Set variable stdin value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_stdin"
               }"
               end

	stdout: POINTER
               -- stdout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "stdout"
               }"
               end

       address_of_stdout: POINTER
               -- Address of stdout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&stdout"
               }"
               end

       set_stdout (a_value: POINTER)
               -- Set variable stdout value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_stdout"
               }"
               end

	tempnam (a_dir: POINTER; a_pfx: POINTER): POINTER 

		-- function tempnam (in `/usr/include/stdio.h')
               -- tempnam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tempnam"
               }"
               end

	tmpfile: POINTER 

		-- function tmpfile (in `/usr/include/stdio.h')
               -- tmpfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpfile()"
               }"
               end

	tmpfile64: POINTER 

		-- function tmpfile64 (in `/usr/include/stdio.h')
               -- tmpfile64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpfile64()"
               }"
               end

	tmpnam (a_s: POINTER): POINTER 

		-- function tmpnam (in `/usr/include/stdio.h')
               -- tmpnam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpnam"
               }"
               end

	tmpnam_r (a_s: POINTER): POINTER 

		-- function tmpnam_r (in `/usr/include/stdio.h')
               -- tmpnam_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpnam_r"
               }"
               end

	ungetc (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function ungetc (in `/usr/include/stdio.h')
               -- ungetc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ungetc"
               }"
               end

	vasprintf (a_ptr: POINTER; a_f: POINTER; an_arg: POINTER): INTEGER 

		-- function vasprintf (in `/usr/include/stdio.h')
               -- vasprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vasprintf"
               }"
               end

	vdprintf (a_fd: INTEGER; a_fmt: POINTER; an_arg: POINTER): INTEGER 

		-- function vdprintf (in `/usr/include/stdio.h')
               -- vdprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vdprintf"
               }"
               end

	vfprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vfprintf (in `/usr/include/stdio.h')
               -- vfprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vfprintf"
               }"
               end

	vfscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vfscanf (in `/usr/include/stdio.h')
               -- vfscanf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vfscanf"
               }"
               end

	vprintf (a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vprintf (in `/usr/include/stdio.h')
               -- vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vprintf"
               }"
               end

	vscanf (a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vscanf (in `/usr/include/stdio.h')
               -- vscanf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vscanf"
               }"
               end

	vsnprintf (a_s: POINTER; a_maxlen: like long_unsigned; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vsnprintf (in `/usr/include/stdio.h')
               -- vsnprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsnprintf"
               }"
               end

	vsprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vsprintf (in `/usr/include/stdio.h')
               -- vsprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsprintf"
               }"
               end

	vsscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vsscanf (in `/usr/include/stdio.h')
               -- vsscanf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsscanf"
               }"
               end


end -- class STDIO_EXTERNALS
