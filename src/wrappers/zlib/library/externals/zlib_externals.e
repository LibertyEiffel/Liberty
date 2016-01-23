-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class ZLIB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	adler32 (an_adler: like long_unsigned; a_buf: POINTER; a_len: NATURAL): like long_unsigned 
               -- adler32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "adler32"
               }"
               end

	adler32_combine (an_argument_l1246_c7: like long_unsigned; an_argument_l1247_c7: like long_unsigned; an_argument_l1248_c7: like long): like long_unsigned 
               -- adler32_combine
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "adler32_combine"
               }"
               end

	adler32_combine64 (an_argument_l1221_c7: like long_unsigned; an_argument_l1222_c7: like long_unsigned; an_argument_l1223_c7: like long): like long_unsigned 
               -- adler32_combine64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "adler32_combine64"
               }"
               end

	compress (a_dest: POINTER; a_dest_len: POINTER; a_source: POINTER; a_source_len: like long_unsigned): INTEGER 
               -- compress
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "compress"
               }"
               end

	compress2 (a_dest: POINTER; a_dest_len: POINTER; a_source: POINTER; a_source_len: like long_unsigned; a_level: INTEGER): INTEGER 
               -- compress2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "compress2"
               }"
               end

	compress_bound (a_source_len: like long_unsigned): like long_unsigned 
               -- compressBound
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "compressBound"
               }"
               end

	crc32 (a_crc: like long_unsigned; a_buf: POINTER; a_len: NATURAL): like long_unsigned 
               -- crc32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "crc32"
               }"
               end

	crc32_combine (an_argument_l1251_c7: like long_unsigned; an_argument_l1252_c7: like long_unsigned; an_argument_l1253_c7: like long): like long_unsigned 
               -- crc32_combine
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "crc32_combine"
               }"
               end

	crc32_combine64 (an_argument_l1226_c7: like long_unsigned; an_argument_l1227_c7: like long_unsigned; an_argument_l1228_c7: like long): like long_unsigned 
               -- crc32_combine64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "crc32_combine64"
               }"
               end

	deflate (a_strm: POINTER; a_flush: INTEGER): INTEGER 
               -- deflate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflate"
               }"
               end

	deflate_bound (a_strm: POINTER; a_source_len: like long_unsigned): like long_unsigned 
               -- deflateBound
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateBound"
               }"
               end

	deflate_copy (a_dest: POINTER; a_source: POINTER): INTEGER 
               -- deflateCopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateCopy"
               }"
               end

	deflate_end (a_strm: POINTER): INTEGER 
               -- deflateEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateEnd"
               }"
               end

	deflate_init (a_strm: POINTER; a_level: INTEGER; a_version: POINTER; a_stream_size: INTEGER): INTEGER 
               -- deflateInit_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateInit_"
               }"
               end

	deflate_init2 (a_strm: POINTER; a_level: INTEGER; a_method: INTEGER; a_window_bits: INTEGER; a_mem_level: INTEGER; a_strategy: INTEGER; a_version: POINTER; a_stream_size: INTEGER): INTEGER 
               -- deflateInit2_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateInit2_"
               }"
               end

	deflate_params (a_strm: POINTER; a_level: INTEGER; a_strategy: INTEGER): INTEGER 
               -- deflateParams
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateParams"
               }"
               end

	deflate_pending (a_strm: POINTER; a_pending: POINTER; a_bits: POINTER): INTEGER 
               -- deflatePending
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflatePending"
               }"
               end

	deflate_prime (a_strm: POINTER; a_bits: INTEGER; a_value: INTEGER): INTEGER 
               -- deflatePrime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflatePrime"
               }"
               end

	deflate_reset (a_strm: POINTER): INTEGER 
               -- deflateReset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateReset"
               }"
               end

	deflate_reset_keep (an_argument_l1270_c7: POINTER): INTEGER 
               -- deflateResetKeep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateResetKeep"
               }"
               end

	deflate_set_dictionary (a_strm: POINTER; a_dictionary: POINTER; a_dict_length: NATURAL): INTEGER 
               -- deflateSetDictionary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateSetDictionary"
               }"
               end

	deflate_set_header (a_strm: POINTER; a_head: POINTER): INTEGER 
               -- deflateSetHeader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateSetHeader"
               }"
               end

	deflate_tune (a_strm: POINTER; a_good_length: INTEGER; a_max_lazy: INTEGER; a_nice_length: INTEGER; a_max_chain: INTEGER): INTEGER 
               -- deflateTune
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "deflateTune"
               }"
               end

	get_crc_table: POINTER 
               -- get_crc_table
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "get_crc_table"
               }"
               end

	gzbuffer (a_file: POINTER; a_size: NATURAL): INTEGER 
               -- gzbuffer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzbuffer"
               }"
               end

	gzclearerr (a_file: POINTER) 
               -- gzclearerr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzclearerr"
               }"
               end

	gzclose (a_file: POINTER): INTEGER 
               -- gzclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzclose"
               }"
               end

	gzclose_r (a_file: POINTER): INTEGER 
               -- gzclose_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzclose_r"
               }"
               end

	gzclose_w (a_file: POINTER): INTEGER 
               -- gzclose_w
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzclose_w"
               }"
               end

	gzdirect (a_file: POINTER): INTEGER 
               -- gzdirect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzdirect"
               }"
               end

	gzdopen (a_fd: INTEGER; a_mode: POINTER): POINTER 
               -- gzdopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzdopen"
               }"
               end

	gzeof (a_file: POINTER): INTEGER 
               -- gzeof
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzeof"
               }"
               end

	gzerror (a_file: POINTER; an_errnum: POINTER): POINTER 
               -- gzerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzerror"
               }"
               end

	gzflush (a_file: POINTER; a_flush: INTEGER): INTEGER 
               -- gzflush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzflush"
               }"
               end

	gzgetc (a_file: POINTER): INTEGER 
               -- gzgetc_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzgetc_"
               }"
               end

	gzgetc (a_file: POINTER): INTEGER 
               -- gzgetc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzgetc"
               }"
               end

	gzgets (a_file: POINTER; a_buf: POINTER; a_len: INTEGER): POINTER 
               -- gzgets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzgets"
               }"
               end

	gzoffset (an_argument_l1243_c7: POINTER): like long 
               -- gzoffset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzoffset"
               }"
               end

	gzoffset64 (an_argument_l1218_c7: POINTER): like long 
               -- gzoffset64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzoffset64"
               }"
               end

	gzopen (an_argument_l1231_c7: POINTER; an_argument_l1232_c7: POINTER): POINTER 
               -- gzopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzopen"
               }"
               end

	gzopen64 (an_argument_l1206_c7: POINTER; an_argument_l1207_c7: POINTER): POINTER 
               -- gzopen64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzopen64"
               }"
               end

	gzprintf (a_file: POINTER; a_format: POINTER): INTEGER 
               -- gzprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzprintf"
               }"
               end

	gzputc (a_file: POINTER; a_c: INTEGER): INTEGER 
               -- gzputc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzputc"
               }"
               end

	gzputs (a_file: POINTER; a_s: POINTER): INTEGER 
               -- gzputs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzputs"
               }"
               end

	gzread (a_file: POINTER; a_buf: POINTER; a_len: NATURAL): INTEGER 
               -- gzread
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzread"
               }"
               end

	gzrewind (a_file: POINTER): INTEGER 
               -- gzrewind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzrewind"
               }"
               end

	gzseek (an_argument_l1235_c7: POINTER; an_argument_l1236_c7: like long; an_argument_l1237_c7: INTEGER): like long 
               -- gzseek
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzseek"
               }"
               end

	gzseek64 (an_argument_l1210_c7: POINTER; an_argument_l1211_c7: like long; an_argument_l1212_c7: INTEGER): like long 
               -- gzseek64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzseek64"
               }"
               end

	gzsetparams (a_file: POINTER; a_level: INTEGER; a_strategy: INTEGER): INTEGER 
               -- gzsetparams
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzsetparams"
               }"
               end

	gztell (an_argument_l1240_c7: POINTER): like long 
               -- gztell
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gztell"
               }"
               end

	gztell64 (an_argument_l1215_c7: POINTER): like long 
               -- gztell64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gztell64"
               }"
               end

	gzungetc (a_c: INTEGER; a_file: POINTER): INTEGER 
               -- gzungetc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzungetc"
               }"
               end

	gzvprintf (a_file: POINTER; a_format: POINTER; a_va: POINTER): INTEGER 
               -- gzvprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzvprintf"
               }"
               end

	gzwrite (a_file: POINTER; a_buf: POINTER; a_len: NATURAL): INTEGER 
               -- gzwrite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gzwrite"
               }"
               end

	inflate (a_strm: POINTER; a_flush: INTEGER): INTEGER 
               -- inflate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflate"
               }"
               end

	inflate_back (a_strm: POINTER; an_in: POINTER; an_in_desc: POINTER; an_out_external: POINTER; an_out_desc: POINTER): INTEGER 
               -- inflateBack
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateBack"
               }"
               end

	inflate_back_end (a_strm: POINTER): INTEGER 
               -- inflateBackEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateBackEnd"
               }"
               end

	inflate_back_init (a_strm: POINTER; a_window_bits: INTEGER; a_window: POINTER; a_version: POINTER; a_stream_size: INTEGER): INTEGER 
               -- inflateBackInit_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateBackInit_"
               }"
               end

	inflate_copy (a_dest: POINTER; a_source: POINTER): INTEGER 
               -- inflateCopy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateCopy"
               }"
               end

	inflate_end (a_strm: POINTER): INTEGER 
               -- inflateEnd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateEnd"
               }"
               end

	inflate_get_dictionary (a_strm: POINTER; a_dictionary: POINTER; a_dict_length: POINTER): INTEGER 
               -- inflateGetDictionary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateGetDictionary"
               }"
               end

	inflate_get_header (a_strm: POINTER; a_head: POINTER): INTEGER 
               -- inflateGetHeader
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateGetHeader"
               }"
               end

	inflate_init (a_strm: POINTER; a_version: POINTER; a_stream_size: INTEGER): INTEGER 
               -- inflateInit_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateInit_"
               }"
               end

	inflate_init2 (a_strm: POINTER; a_window_bits: INTEGER; a_version: POINTER; a_stream_size: INTEGER): INTEGER 
               -- inflateInit2_
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateInit2_"
               }"
               end

	inflate_mark (a_strm: POINTER): like long 
               -- inflateMark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateMark"
               }"
               end

	inflate_prime (a_strm: POINTER; a_bits: INTEGER; a_value: INTEGER): INTEGER 
               -- inflatePrime
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflatePrime"
               }"
               end

	inflate_reset (a_strm: POINTER): INTEGER 
               -- inflateReset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateReset"
               }"
               end

	inflate_reset2 (a_strm: POINTER; a_window_bits: INTEGER): INTEGER 
               -- inflateReset2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateReset2"
               }"
               end

	inflate_reset_keep (an_argument_l1267_c7: POINTER): INTEGER 
               -- inflateResetKeep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateResetKeep"
               }"
               end

	inflate_set_dictionary (a_strm: POINTER; a_dictionary: POINTER; a_dict_length: NATURAL): INTEGER 
               -- inflateSetDictionary
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateSetDictionary"
               }"
               end

	inflate_sync (a_strm: POINTER): INTEGER 
               -- inflateSync
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateSync"
               }"
               end

	inflate_sync_point (an_argument_l1259_c7: POINTER): INTEGER 
               -- inflateSyncPoint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateSyncPoint"
               }"
               end

	inflate_undermine (an_argument_l1263_c7: POINTER; an_argument_l1264_c7: INTEGER): INTEGER 
               -- inflateUndermine
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inflateUndermine"
               }"
               end

	uncompress (a_dest: POINTER; a_dest_len: POINTER; a_source: POINTER; a_source_len: like long_unsigned): INTEGER 
               -- uncompress
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "uncompress"
               }"
               end

	z_error (an_argument_l1256_c7: INTEGER): POINTER 
               -- zError
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zError"
               }"
               end

	zlib_compile_flags: like long_unsigned 
               -- zlibCompileFlags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zlibCompileFlags"
               }"
               end

	zlib_version: POINTER 
               -- zlibVersion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "zlibVersion"
               }"
               end


end -- class ZLIB_EXTERNALS
