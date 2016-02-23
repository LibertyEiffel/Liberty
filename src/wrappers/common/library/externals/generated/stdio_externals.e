-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STDIO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __asprintf skipped.
	asprintf (a_ptr: POINTER; a_fmt: POINTER): INTEGER 

		-- function asprintf (in 405 at line /usr/include/stdio.h)i
               -- asprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "asprintf"
               }"
               end

	clearerr (a_stream: POINTER) 

		-- function clearerr (in 826 at line /usr/include/stdio.h)i
               -- clearerr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clearerr"
               }"
               end

	clearerr_unlocked (a_stream: POINTER) 

		-- function clearerr_unlocked (in 835 at line /usr/include/stdio.h)i
               -- clearerr_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "clearerr_unlocked"
               }"
               end

	ctermid (a_s: POINTER): POINTER 

		-- function ctermid (in 885 at line /usr/include/stdio.h)i
               -- ctermid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ctermid"
               }"
               end

	cuserid (a_s: POINTER): POINTER 

		-- function cuserid (in 891 at line /usr/include/stdio.h)i
               -- cuserid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cuserid"
               }"
               end

	dprintf (a_fd: INTEGER; a_fmt: POINTER): INTEGER 

		-- function dprintf (in 415 at line /usr/include/stdio.h)i
               -- dprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dprintf"
               }"
               end

	fclose (a_stream: POINTER): INTEGER 

		-- function fclose (in 237 at line /usr/include/stdio.h)i
               -- fclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fclose"
               }"
               end

	fcloseall: INTEGER 

		-- function fcloseall (in 262 at line /usr/include/stdio.h)i
               -- fcloseall
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fcloseall"
               }"
               end

	fdopen (a_fd: INTEGER; a_modes: POINTER): POINTER 

		-- function fdopen (in 306 at line /usr/include/stdio.h)i
               -- fdopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fdopen"
               }"
               end

	feof (a_stream: POINTER): INTEGER 

		-- function feof (in 828 at line /usr/include/stdio.h)i
               -- feof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feof"
               }"
               end

	feof_unlocked (a_stream: POINTER): INTEGER 

		-- function feof_unlocked (in 836 at line /usr/include/stdio.h)i
               -- feof_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "feof_unlocked"
               }"
               end

	ferror (a_stream: POINTER): INTEGER 

		-- function ferror (in 830 at line /usr/include/stdio.h)i
               -- ferror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ferror"
               }"
               end

	ferror_unlocked (a_stream: POINTER): INTEGER 

		-- function ferror_unlocked (in 837 at line /usr/include/stdio.h)i
               -- ferror_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ferror_unlocked"
               }"
               end

	fflush (a_stream: POINTER): INTEGER 

		-- function fflush (in 242 at line /usr/include/stdio.h)i
               -- fflush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fflush"
               }"
               end

	fflush_unlocked (a_stream: POINTER): INTEGER 

		-- function fflush_unlocked (in 252 at line /usr/include/stdio.h)i
               -- fflush_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fflush_unlocked"
               }"
               end

	fgetc (a_stream: POINTER): INTEGER 

		-- function fgetc (in 531 at line /usr/include/stdio.h)i
               -- fgetc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetc"
               }"
               end

	fgetc_unlocked (a_stream: POINTER): INTEGER 

		-- function fgetc_unlocked (in 561 at line /usr/include/stdio.h)i
               -- fgetc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetc_unlocked"
               }"
               end

	fgetpos (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fgetpos (in 798 at line /usr/include/stdio.h)i
               -- fgetpos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetpos"
               }"
               end

	fgetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fgetpos64 (in 820 at line /usr/include/stdio.h)i
               -- fgetpos64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetpos64"
               }"
               end

	fgets (a_s: POINTER; a_n: INTEGER; a_stream: POINTER): POINTER 

		-- function fgets (in 622 at line /usr/include/stdio.h)i
               -- fgets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgets"
               }"
               end

	fgets_unlocked (a_s: POINTER; a_n: INTEGER; a_stream: POINTER): POINTER 

		-- function fgets_unlocked (in 649 at line /usr/include/stdio.h)i
               -- fgets_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgets_unlocked"
               }"
               end

	fileno (a_stream: POINTER): INTEGER 

		-- function fileno (in 858 at line /usr/include/stdio.h)i
               -- fileno
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fileno"
               }"
               end

	fileno_unlocked (a_stream: POINTER): INTEGER 

		-- function fileno_unlocked (in 863 at line /usr/include/stdio.h)i
               -- fileno_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fileno_unlocked"
               }"
               end

	flockfile (a_stream: POINTER) 

		-- function flockfile (in 913 at line /usr/include/stdio.h)i
               -- flockfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "flockfile"
               }"
               end

	fmemopen (a_s: POINTER; a_len: like long_unsigned; a_modes: POINTER): POINTER 

		-- function fmemopen (in 319 at line /usr/include/stdio.h)i
               -- fmemopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fmemopen"
               }"
               end

	fopen (a_filename: POINTER; a_modes: POINTER): POINTER 

		-- function fopen (in 272 at line /usr/include/stdio.h)i
               -- fopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fopen"
               }"
               end

	fopen64 (a_filename: POINTER; a_modes: POINTER): POINTER 

		-- function fopen64 (in 297 at line /usr/include/stdio.h)i
               -- fopen64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fopen64"
               }"
               end

       -- function fopencookie (at line 312 in file /usr/include/stdio.h is not wrappable
	fprintf (a_stream: POINTER; a_format: POINTER): INTEGER 

		-- function fprintf (in 356 at line /usr/include/stdio.h)i
               -- fprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fprintf"
               }"
               end

	fputc (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function fputc (in 573 at line /usr/include/stdio.h)i
               -- fputc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputc"
               }"
               end

	fputc_unlocked (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function fputc_unlocked (in 594 at line /usr/include/stdio.h)i
               -- fputc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputc_unlocked"
               }"
               end

	fputs (a_s: POINTER; a_stream: POINTER): INTEGER 

		-- function fputs (in 689 at line /usr/include/stdio.h)i
               -- fputs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputs"
               }"
               end

	fputs_unlocked (a_s: POINTER; a_stream: POINTER): INTEGER 

		-- function fputs_unlocked (in 726 at line /usr/include/stdio.h)i
               -- fputs_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fputs_unlocked"
               }"
               end

	fread (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_stream: POINTER): like long_unsigned 

		-- function fread (in 709 at line /usr/include/stdio.h)i
               -- fread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fread"
               }"
               end

	fread_unlocked (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_stream: POINTER): like long_unsigned 

		-- function fread_unlocked (in 737 at line /usr/include/stdio.h)i
               -- fread_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fread_unlocked"
               }"
               end

	freopen (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER 

		-- function freopen (in 278 at line /usr/include/stdio.h)i
               -- freopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "freopen"
               }"
               end

	freopen64 (a_filename: POINTER; a_modes: POINTER; a_stream: POINTER): POINTER 

		-- function freopen64 (in 299 at line /usr/include/stdio.h)i
               -- freopen64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "freopen64"
               }"
               end

	fscanf (a_stream: POINTER; a_format: POINTER): INTEGER 

		-- function fscanf (in 425 at line /usr/include/stdio.h)i
               -- fscanf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fscanf"
               }"
               end

	fseek (a_stream: POINTER; an_off: like long; a_whence: INTEGER): INTEGER 

		-- function fseek (in 749 at line /usr/include/stdio.h)i
               -- fseek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fseek"
               }"
               end

	fseeko (a_stream: POINTER; an_off: like long; a_whence: INTEGER): INTEGER 

		-- function fseeko (in 773 at line /usr/include/stdio.h)i
               -- fseeko
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fseeko"
               }"
               end

	fseeko64 (a_stream: POINTER; an_off: like long; a_whence: INTEGER): INTEGER 

		-- function fseeko64 (in 818 at line /usr/include/stdio.h)i
               -- fseeko64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fseeko64"
               }"
               end

	fsetpos (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fsetpos (in 803 at line /usr/include/stdio.h)i
               -- fsetpos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fsetpos"
               }"
               end

	fsetpos64 (a_stream: POINTER; a_pos: POINTER): INTEGER 

		-- function fsetpos64 (in 821 at line /usr/include/stdio.h)i
               -- fsetpos64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fsetpos64"
               }"
               end

	ftell (a_stream: POINTER): like long 

		-- function ftell (in 754 at line /usr/include/stdio.h)i
               -- ftell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftell"
               }"
               end

	ftello (a_stream: POINTER): like long 

		-- function ftello (in 778 at line /usr/include/stdio.h)i
               -- ftello
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftello"
               }"
               end

	ftello64 (a_stream: POINTER): like long 

		-- function ftello64 (in 819 at line /usr/include/stdio.h)i
               -- ftello64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftello64"
               }"
               end

	ftrylockfile (a_stream: POINTER): INTEGER 

		-- function ftrylockfile (in 917 at line /usr/include/stdio.h)i
               -- ftrylockfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ftrylockfile"
               }"
               end

	funlockfile (a_stream: POINTER) 

		-- function funlockfile (in 920 at line /usr/include/stdio.h)i
               -- funlockfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "funlockfile"
               }"
               end

	fwrite (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_s: POINTER): like long_unsigned 

		-- function fwrite (in 715 at line /usr/include/stdio.h)i
               -- fwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fwrite"
               }"
               end

	fwrite_unlocked (a_ptr: POINTER; a_size: like long_unsigned; a_n: like long_unsigned; a_stream: POINTER): like long_unsigned 

		-- function fwrite_unlocked (in 739 at line /usr/include/stdio.h)i
               -- fwrite_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fwrite_unlocked"
               }"
               end

	getc (a_stream: POINTER): INTEGER 

		-- function getc (in 532 at line /usr/include/stdio.h)i
               -- getc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getc"
               }"
               end

	getc_unlocked (a_stream: POINTER): INTEGER 

		-- function getc_unlocked (in 550 at line /usr/include/stdio.h)i
               -- getc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getc_unlocked"
               }"
               end

	getchar: INTEGER 

		-- function getchar (in 538 at line /usr/include/stdio.h)i
               -- getchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getchar"
               }"
               end

	getchar_unlocked: INTEGER 

		-- function getchar_unlocked (in 551 at line /usr/include/stdio.h)i
               -- getchar_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getchar_unlocked"
               }"
               end

	-- `hidden' function __getdelim skipped.
	getdelim (a_lineptr: POINTER; a_n: POINTER; a_delimiter: INTEGER; a_stream: POINTER): like long 

		-- function getdelim (in 668 at line /usr/include/stdio.h)i
               -- getdelim
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getdelim"
               }"
               end

	getline (a_lineptr: POINTER; a_n: POINTER; a_stream: POINTER): like long 

		-- function getline (in 678 at line /usr/include/stdio.h)i
               -- getline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getline"
               }"
               end

	gets (a_s: POINTER): POINTER 

		-- function gets (in 638 at line /usr/include/stdio.h)i
               -- gets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gets"
               }"
               end

	getw (a_stream: POINTER): INTEGER 

		-- function getw (in 610 at line /usr/include/stdio.h)i
               -- getw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getw"
               }"
               end

	obstack_printf (an_obstack: POINTER; a_format: POINTER): INTEGER 

		-- function obstack_printf (in 899 at line /usr/include/stdio.h)i
               -- obstack_printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "obstack_printf"
               }"
               end

	obstack_vprintf (an_obstack: POINTER; a_format: POINTER; an_args: POINTER): INTEGER 

		-- function obstack_vprintf (in 902 at line /usr/include/stdio.h)i
               -- obstack_vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "obstack_vprintf"
               }"
               end

	open_memstream (a_bufloc: POINTER; a_sizeloc: POINTER): POINTER 

		-- function open_memstream (in 325 at line /usr/include/stdio.h)i
               -- open_memstream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "open_memstream"
               }"
               end

	pclose (a_stream: POINTER): INTEGER 

		-- function pclose (in 879 at line /usr/include/stdio.h)i
               -- pclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pclose"
               }"
               end

	perror (a_s: POINTER) 

		-- function perror (in 846 at line /usr/include/stdio.h)i
               -- perror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "perror"
               }"
               end

	popen (a_command: POINTER; a_modes: POINTER): POINTER 

		-- function popen (in 873 at line /usr/include/stdio.h)i
               -- popen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "popen"
               }"
               end

	printf (a_format: POINTER): INTEGER 

		-- function printf (in 362 at line /usr/include/stdio.h)i
               -- printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "printf"
               }"
               end

	putc (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function putc (in 574 at line /usr/include/stdio.h)i
               -- putc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putc"
               }"
               end

	putc_unlocked (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function putc_unlocked (in 602 at line /usr/include/stdio.h)i
               -- putc_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putc_unlocked"
               }"
               end

	putchar (a_c: INTEGER): INTEGER 

		-- function putchar (in 580 at line /usr/include/stdio.h)i
               -- putchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putchar"
               }"
               end

	putchar_unlocked (a_c: INTEGER): INTEGER 

		-- function putchar_unlocked (in 603 at line /usr/include/stdio.h)i
               -- putchar_unlocked
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putchar_unlocked"
               }"
               end

	puts (a_s: POINTER): INTEGER 

		-- function puts (in 695 at line /usr/include/stdio.h)i
               -- puts
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "puts"
               }"
               end

	putw (a_w: INTEGER; a_stream: POINTER): INTEGER 

		-- function putw (in 613 at line /usr/include/stdio.h)i
               -- putw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putw"
               }"
               end

	remove (a_filename: POINTER): INTEGER 

		-- function remove (in 178 at line /usr/include/stdio.h)i
               -- remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "remove"
               }"
               end

	rename_external (an_old: POINTER; a_new: POINTER): INTEGER 

		-- function rename (in 180 at line /usr/include/stdio.h)i
               -- rename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rename"
               }"
               end

	renameat (an_oldfd: INTEGER; an_old: POINTER; a_newfd: INTEGER; a_new: POINTER): INTEGER 

		-- function renameat (in 185 at line /usr/include/stdio.h)i
               -- renameat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "renameat"
               }"
               end

	rewind (a_stream: POINTER) 

		-- function rewind (in 759 at line /usr/include/stdio.h)i
               -- rewind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rewind"
               }"
               end

	scanf (a_format: POINTER): INTEGER 

		-- function scanf (in 431 at line /usr/include/stdio.h)i
               -- scanf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "scanf"
               }"
               end

	setbuf (a_stream: POINTER; a_buf: POINTER) 

		-- function setbuf (in 332 at line /usr/include/stdio.h)i
               -- setbuf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setbuf"
               }"
               end

	setbuffer (a_stream: POINTER; a_buf: POINTER; a_size: like long_unsigned) 

		-- function setbuffer (in 343 at line /usr/include/stdio.h)i
               -- setbuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setbuffer"
               }"
               end

	setlinebuf (a_stream: POINTER) 

		-- function setlinebuf (in 347 at line /usr/include/stdio.h)i
               -- setlinebuf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setlinebuf"
               }"
               end

	setvbuf (a_stream: POINTER; a_buf: POINTER; a_modes: INTEGER; a_n: like long_unsigned): INTEGER 

		-- function setvbuf (in 336 at line /usr/include/stdio.h)i
               -- setvbuf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setvbuf"
               }"
               end

	snprintf (a_s: POINTER; a_maxlen: like long_unsigned; a_format: POINTER): INTEGER 

		-- function snprintf (in 386 at line /usr/include/stdio.h)i
               -- snprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "snprintf"
               }"
               end

	sprintf (a_s: POINTER; a_format: POINTER): INTEGER 

		-- function sprintf (in 364 at line /usr/include/stdio.h)i
               -- sprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sprintf"
               }"
               end

	sscanf (a_s: POINTER; a_format: POINTER): INTEGER 

		-- function sscanf (in 433 at line /usr/include/stdio.h)i
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

		-- function tempnam (in 227 at line /usr/include/stdio.h)i
               -- tempnam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tempnam"
               }"
               end

	tmpfile: POINTER 

		-- function tmpfile (in 195 at line /usr/include/stdio.h)i
               -- tmpfile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpfile"
               }"
               end

	tmpfile64: POINTER 

		-- function tmpfile64 (in 205 at line /usr/include/stdio.h)i
               -- tmpfile64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpfile64"
               }"
               end

	tmpnam (a_s: POINTER): POINTER 

		-- function tmpnam (in 209 at line /usr/include/stdio.h)i
               -- tmpnam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpnam"
               }"
               end

	tmpnam_r (a_s: POINTER): POINTER 

		-- function tmpnam_r (in 215 at line /usr/include/stdio.h)i
               -- tmpnam_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tmpnam_r"
               }"
               end

	ungetc (a_c: INTEGER; a_stream: POINTER): INTEGER 

		-- function ungetc (in 702 at line /usr/include/stdio.h)i
               -- ungetc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ungetc"
               }"
               end

	vasprintf (a_ptr: POINTER; a_f: POINTER; an_arg: POINTER): INTEGER 

		-- function vasprintf (in 399 at line /usr/include/stdio.h)i
               -- vasprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vasprintf"
               }"
               end

	vdprintf (a_fd: INTEGER; a_fmt: POINTER; an_arg: POINTER): INTEGER 

		-- function vdprintf (in 412 at line /usr/include/stdio.h)i
               -- vdprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vdprintf"
               }"
               end

	vfprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vfprintf (in 371 at line /usr/include/stdio.h)i
               -- vfprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vfprintf"
               }"
               end

	vfscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vfscanf (in 471 at line /usr/include/stdio.h)i
               -- vfscanf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vfscanf"
               }"
               end

	vprintf (a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vprintf (in 377 at line /usr/include/stdio.h)i
               -- vprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vprintf"
               }"
               end

	vscanf (a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vscanf (in 479 at line /usr/include/stdio.h)i
               -- vscanf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vscanf"
               }"
               end

	vsnprintf (a_s: POINTER; a_maxlen: like long_unsigned; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vsnprintf (in 390 at line /usr/include/stdio.h)i
               -- vsnprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsnprintf"
               }"
               end

	vsprintf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vsprintf (in 379 at line /usr/include/stdio.h)i
               -- vsprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsprintf"
               }"
               end

	vsscanf (a_s: POINTER; a_format: POINTER; an_arg: POINTER): INTEGER 

		-- function vsscanf (in 483 at line /usr/include/stdio.h)i
               -- vsscanf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsscanf"
               }"
               end


end -- class STDIO_EXTERNALS
