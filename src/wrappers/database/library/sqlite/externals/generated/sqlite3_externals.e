-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	sqlite3_aggregate_context (an_argument_l534_c7: POINTER; a_n_bytes: INTEGER): POINTER 

		-- function sqlite3_aggregate_context (in 4460 at line /usr/include/sqlite3.h)i
               -- sqlite3_aggregate_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_aggregate_context"
               }"
               end

	sqlite3_aggregate_count (an_argument_l472_c7: POINTER): INTEGER 

		-- function sqlite3_aggregate_count (in 4316 at line /usr/include/sqlite3.h)i
               -- sqlite3_aggregate_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_aggregate_count"
               }"
               end

	sqlite3_auto_extension (a_x_entry_point: POINTER): INTEGER 

		-- function sqlite3_auto_extension (in 5512 at line /usr/include/sqlite3.h)i
               -- sqlite3_auto_extension
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_auto_extension"
               }"
               end

	sqlite3_backup_finish (a_p: POINTER): INTEGER 

		-- function sqlite3_backup_finish (in 7260 at line /usr/include/sqlite3.h)i
               -- sqlite3_backup_finish
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_backup_finish"
               }"
               end

	sqlite3_backup_init (a_p_dest: POINTER; a_z_dest_name: POINTER; a_p_source: POINTER; a_z_source_name: POINTER): POINTER 

		-- function sqlite3_backup_init (in 7253 at line /usr/include/sqlite3.h)i
               -- sqlite3_backup_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_backup_init"
               }"
               end

	sqlite3_backup_pagecount (a_p: POINTER): INTEGER 

		-- function sqlite3_backup_pagecount (in 7262 at line /usr/include/sqlite3.h)i
               -- sqlite3_backup_pagecount
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_backup_pagecount"
               }"
               end

	sqlite3_backup_remaining (a_p: POINTER): INTEGER 

		-- function sqlite3_backup_remaining (in 7261 at line /usr/include/sqlite3.h)i
               -- sqlite3_backup_remaining
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_backup_remaining"
               }"
               end

	sqlite3_backup_step (a_p: POINTER; a_n_page: INTEGER): INTEGER 

		-- function sqlite3_backup_step (in 7259 at line /usr/include/sqlite3.h)i
               -- sqlite3_backup_step
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_backup_step"
               }"
               end

	sqlite3_bind_blob (an_argument_l262_c7: POINTER; an_argument_l263_c7: INTEGER; an_argument_l264_c7: POINTER; a_n: INTEGER; an_argument_l266_c7: POINTER): INTEGER 

		-- function sqlite3_bind_blob (in 3578 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_blob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_blob"
               }"
               end

	sqlite3_bind_blob64 (an_argument_l269_c7: POINTER; an_argument_l270_c7: INTEGER; an_argument_l271_c7: POINTER; an_argument_l272_c7: NATURAL_64; an_argument_l273_c7: POINTER): INTEGER 

		-- function sqlite3_bind_blob64 (in 3579 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_blob64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_blob64"
               }"
               end

	sqlite3_bind_double (an_argument_l276_c7: POINTER; an_argument_l277_c7: INTEGER; an_argument_l278_c7: REAL): INTEGER 

		-- function sqlite3_bind_double (in 3581 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_double"
               }"
               end

	sqlite3_bind_int (an_argument_l281_c7: POINTER; an_argument_l282_c7: INTEGER; an_argument_l283_c7: INTEGER): INTEGER 

		-- function sqlite3_bind_int (in 3582 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_int"
               }"
               end

	sqlite3_bind_int64 (an_argument_l286_c7: POINTER; an_argument_l287_c7: INTEGER; an_argument_l288_c7: INTEGER_64): INTEGER 

		-- function sqlite3_bind_int64 (in 3583 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_int64"
               }"
               end

	sqlite3_bind_null (an_argument_l291_c7: POINTER; an_argument_l292_c7: INTEGER): INTEGER 

		-- function sqlite3_bind_null (in 3584 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_null
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_null"
               }"
               end

	sqlite3_bind_parameter_count (an_argument_l332_c7: POINTER): INTEGER 

		-- function sqlite3_bind_parameter_count (in 3612 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_parameter_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_parameter_count"
               }"
               end

	sqlite3_bind_parameter_index (an_argument_l339_c7: POINTER; a_z_name: POINTER): INTEGER 

		-- function sqlite3_bind_parameter_index (in 3657 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_parameter_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_parameter_index"
               }"
               end

	sqlite3_bind_parameter_name (an_argument_l335_c7: POINTER; an_argument_l336_c7: INTEGER): POINTER 

		-- function sqlite3_bind_parameter_name (in 3640 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_parameter_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_parameter_name"
               }"
               end

	sqlite3_bind_text (an_argument_l295_c7: POINTER; an_argument_l296_c7: INTEGER; an_argument_l297_c7: POINTER; an_argument_l298_c7: INTEGER; an_argument_l299_c7: POINTER): INTEGER 

		-- function sqlite3_bind_text (in 3585 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_text"
               }"
               end

	sqlite3_bind_text16 (an_argument_l302_c7: POINTER; an_argument_l303_c7: INTEGER; an_argument_l304_c7: POINTER; an_argument_l305_c7: INTEGER; an_argument_l306_c7: POINTER): INTEGER 

		-- function sqlite3_bind_text16 (in 3586 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_text16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_text16"
               }"
               end

	sqlite3_bind_text64 (an_argument_l309_c7: POINTER; an_argument_l310_c7: INTEGER; an_argument_l311_c7: POINTER; an_argument_l312_c7: NATURAL_64; an_argument_l313_c7: POINTER; an_encoding: CHARACTER): INTEGER 

		-- function sqlite3_bind_text64 (in 3587 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_text64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_text64"
               }"
               end

	sqlite3_bind_value (an_argument_l317_c7: POINTER; an_argument_l318_c7: INTEGER; an_argument_l319_c7: POINTER): INTEGER 

		-- function sqlite3_bind_value (in 3589 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_value"
               }"
               end

	sqlite3_bind_zeroblob (an_argument_l322_c7: POINTER; an_argument_l323_c7: INTEGER; a_n: INTEGER): INTEGER 

		-- function sqlite3_bind_zeroblob (in 3590 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_zeroblob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_zeroblob"
               }"
               end

	sqlite3_bind_zeroblob64 (an_argument_l327_c7: POINTER; an_argument_l328_c7: INTEGER; an_argument_l329_c7: NATURAL_64): INTEGER 

		-- function sqlite3_bind_zeroblob64 (in 3591 at line /usr/include/sqlite3.h)i
               -- sqlite3_bind_zeroblob64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_bind_zeroblob64"
               }"
               end

	sqlite3_blob_bytes (an_argument_l809_c7: POINTER): INTEGER 

		-- function sqlite3_blob_bytes (in 6036 at line /usr/include/sqlite3.h)i
               -- sqlite3_blob_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_blob_bytes"
               }"
               end

	sqlite3_blob_close (an_argument_l806_c7: POINTER): INTEGER 

		-- function sqlite3_blob_close (in 6020 at line /usr/include/sqlite3.h)i
               -- sqlite3_blob_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_blob_close"
               }"
               end

	sqlite3_blob_open (an_argument_l793_c7: POINTER; a_z_db: POINTER; a_z_table: POINTER; a_z_column: POINTER; an_i_row: INTEGER_64; a_flags: INTEGER; a_pp_blob: POINTER): INTEGER 

		-- function sqlite3_blob_open (in 5964 at line /usr/include/sqlite3.h)i
               -- sqlite3_blob_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_blob_open"
               }"
               end

	sqlite3_blob_read (an_argument_l812_c7: POINTER; a_z: POINTER; a_n: INTEGER; an_i_offset: INTEGER): INTEGER 

		-- function sqlite3_blob_read (in 6065 at line /usr/include/sqlite3.h)i
               -- sqlite3_blob_read
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_blob_read"
               }"
               end

	sqlite3_blob_reopen (an_argument_l802_c7: POINTER; an_argument_l803_c7: INTEGER_64): INTEGER 

		-- function sqlite3_blob_reopen (in 5997 at line /usr/include/sqlite3.h)i
               -- sqlite3_blob_reopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_blob_reopen"
               }"
               end

	sqlite3_blob_write (an_argument_l818_c7: POINTER; a_z: POINTER; a_n: INTEGER; an_i_offset: INTEGER): INTEGER 

		-- function sqlite3_blob_write (in 6107 at line /usr/include/sqlite3.h)i
               -- sqlite3_blob_write
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_blob_write"
               }"
               end

	sqlite3_busy_handler (an_argument_l85_c7: POINTER; an_argument_l86_c7: POINTER; an_argument_l87_c7: POINTER): INTEGER 

		-- function sqlite3_busy_handler (in 2188 at line /usr/include/sqlite3.h)i
               -- sqlite3_busy_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_busy_handler"
               }"
               end

	sqlite3_busy_timeout (an_argument_l90_c7: POINTER; a_ms: INTEGER): INTEGER 

		-- function sqlite3_busy_timeout (in 2211 at line /usr/include/sqlite3.h)i
               -- sqlite3_busy_timeout
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_busy_timeout"
               }"
               end

	sqlite3_cancel_auto_extension (a_x_entry_point: POINTER): INTEGER 

		-- function sqlite3_cancel_auto_extension (in 5524 at line /usr/include/sqlite3.h)i
               -- sqlite3_cancel_auto_extension
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_cancel_auto_extension"
               }"
               end

	sqlite3_changes (an_argument_l70_c7: POINTER): INTEGER 

		-- function sqlite3_changes (in 2027 at line /usr/include/sqlite3.h)i
               -- sqlite3_changes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_changes"
               }"
               end

	sqlite3_clear_bindings (an_argument_l343_c7: POINTER): INTEGER 

		-- function sqlite3_clear_bindings (in 3667 at line /usr/include/sqlite3.h)i
               -- sqlite3_clear_bindings
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_clear_bindings"
               }"
               end

	sqlite3_close (an_argument_l26_c7: POINTER): INTEGER 

		-- function sqlite3_close (in 313 at line /usr/include/sqlite3.h)i
               -- sqlite3_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_close"
               }"
               end

	sqlite3_close_v2 (an_argument_l29_c7: POINTER): INTEGER 

		-- function sqlite3_close_v2 (in 314 at line /usr/include/sqlite3.h)i
               -- sqlite3_close_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_close_v2"
               }"
               end

	sqlite3_collation_needed (an_argument_l671_c7: POINTER; an_argument_l672_c7: POINTER; an_argument_l673_c7: POINTER): INTEGER 

		-- function sqlite3_collation_needed (in 4844 at line /usr/include/sqlite3.h)i
               -- sqlite3_collation_needed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_collation_needed"
               }"
               end

	sqlite3_collation_needed16 (an_argument_l676_c7: POINTER; an_argument_l677_c7: POINTER; an_argument_l678_c7: POINTER): INTEGER 

		-- function sqlite3_collation_needed16 (in 4849 at line /usr/include/sqlite3.h)i
               -- sqlite3_collation_needed16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_collation_needed16"
               }"
               end

	sqlite3_column_blob (an_argument_l395_c7: POINTER; an_i_col: INTEGER): POINTER 

		-- function sqlite3_column_blob (in 4086 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_blob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_blob"
               }"
               end

	sqlite3_column_bytes (an_argument_l399_c7: POINTER; an_i_col: INTEGER): INTEGER 

		-- function sqlite3_column_bytes (in 4087 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_bytes"
               }"
               end

	sqlite3_column_bytes16 (an_argument_l403_c7: POINTER; an_i_col: INTEGER): INTEGER 

		-- function sqlite3_column_bytes16 (in 4088 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_bytes16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_bytes16"
               }"
               end

	sqlite3_column_count (a_p_stmt: POINTER): INTEGER 

		-- function sqlite3_column_count (in 3679 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_count"
               }"
               end

	sqlite3_column_database_name (an_argument_l357_c7: POINTER; an_argument_l358_c7: INTEGER): POINTER 

		-- function sqlite3_column_database_name (in 3757 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_database_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_database_name"
               }"
               end

	sqlite3_column_database_name16 (an_argument_l361_c7: POINTER; an_argument_l362_c7: INTEGER): POINTER 

		-- function sqlite3_column_database_name16 (in 3758 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_database_name16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_database_name16"
               }"
               end

	sqlite3_column_decltype (an_argument_l381_c7: POINTER; an_argument_l382_c7: INTEGER): POINTER 

		-- function sqlite3_column_decltype (in 3794 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_decltype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_decltype"
               }"
               end

	sqlite3_column_decltype16 (an_argument_l385_c7: POINTER; an_argument_l386_c7: INTEGER): POINTER 

		-- function sqlite3_column_decltype16 (in 3795 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_decltype16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_decltype16"
               }"
               end

	sqlite3_column_double (an_argument_l407_c7: POINTER; an_i_col: INTEGER): REAL 

		-- function sqlite3_column_double (in 4089 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_double"
               }"
               end

	sqlite3_column_int (an_argument_l411_c7: POINTER; an_i_col: INTEGER): INTEGER 

		-- function sqlite3_column_int (in 4090 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_int"
               }"
               end

	sqlite3_column_int64 (an_argument_l415_c7: POINTER; an_i_col: INTEGER): INTEGER_64 

		-- function sqlite3_column_int64 (in 4091 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_int64"
               }"
               end

	sqlite3_column_name (an_argument_l349_c7: POINTER; a_n: INTEGER): POINTER 

		-- function sqlite3_column_name (in 3708 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_name"
               }"
               end

	sqlite3_column_name16 (an_argument_l353_c7: POINTER; a_n: INTEGER): POINTER 

		-- function sqlite3_column_name16 (in 3709 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_name16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_name16"
               }"
               end

	sqlite3_column_origin_name (an_argument_l373_c7: POINTER; an_argument_l374_c7: INTEGER): POINTER 

		-- function sqlite3_column_origin_name (in 3761 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_origin_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_origin_name"
               }"
               end

	sqlite3_column_origin_name16 (an_argument_l377_c7: POINTER; an_argument_l378_c7: INTEGER): POINTER 

		-- function sqlite3_column_origin_name16 (in 3762 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_origin_name16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_origin_name16"
               }"
               end

	sqlite3_column_table_name (an_argument_l365_c7: POINTER; an_argument_l366_c7: INTEGER): POINTER 

		-- function sqlite3_column_table_name (in 3759 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_table_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_table_name"
               }"
               end

	sqlite3_column_table_name16 (an_argument_l369_c7: POINTER; an_argument_l370_c7: INTEGER): POINTER 

		-- function sqlite3_column_table_name16 (in 3760 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_table_name16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_table_name16"
               }"
               end

	sqlite3_column_text (an_argument_l419_c7: POINTER; an_i_col: INTEGER): POINTER 

		-- function sqlite3_column_text (in 4092 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_text"
               }"
               end

	sqlite3_column_text16 (an_argument_l423_c7: POINTER; an_i_col: INTEGER): POINTER 

		-- function sqlite3_column_text16 (in 4093 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_text16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_text16"
               }"
               end

	sqlite3_column_type (an_argument_l427_c7: POINTER; an_i_col: INTEGER): INTEGER 

		-- function sqlite3_column_type (in 4094 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_type"
               }"
               end

	sqlite3_column_value (an_argument_l431_c7: POINTER; an_i_col: INTEGER): POINTER 

		-- function sqlite3_column_value (in 4095 at line /usr/include/sqlite3.h)i
               -- sqlite3_column_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_column_value"
               }"
               end

	sqlite3_commit_hook (an_argument_l704_c7: POINTER; an_argument_l705_c7: POINTER; an_argument_l706_c7: POINTER): POINTER 

		-- function sqlite3_commit_hook (in 5151 at line /usr/include/sqlite3.h)i
               -- sqlite3_commit_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_commit_hook"
               }"
               end

	sqlite3_compileoption_get (a_n: INTEGER): POINTER 

		-- function sqlite3_compileoption_get (in 177 at line /usr/include/sqlite3.h)i
               -- sqlite3_compileoption_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_compileoption_get"
               }"
               end

	sqlite3_compileoption_used (a_z_opt_name: POINTER): INTEGER 

		-- function sqlite3_compileoption_used (in 176 at line /usr/include/sqlite3.h)i
               -- sqlite3_compileoption_used
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_compileoption_used"
               }"
               end

	sqlite3_complete (a_sql: POINTER): INTEGER 

		-- function sqlite3_complete (in 2126 at line /usr/include/sqlite3.h)i
               -- sqlite3_complete
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_complete"
               }"
               end

	sqlite3_complete16 (a_sql: POINTER): INTEGER 

		-- function sqlite3_complete16 (in 2127 at line /usr/include/sqlite3.h)i
               -- sqlite3_complete16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_complete16"
               }"
               end

	sqlite3_config (an_argument_l52_c7: INTEGER): INTEGER 

		-- function sqlite3_config (in 1409 at line /usr/include/sqlite3.h)i
               -- sqlite3_config (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_config"
               }"
               end

	sqlite3_context_db_handle (an_argument_l541_c7: POINTER): POINTER 

		-- function sqlite3_context_db_handle (in 4487 at line /usr/include/sqlite3.h)i
               -- sqlite3_context_db_handle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_context_db_handle"
               }"
               end

	sqlite3_create_collation (an_argument_l649_c7: POINTER; a_z_name: POINTER; an_e_text_rep: INTEGER; a_p_arg: POINTER; a_x_compare: POINTER): INTEGER 

		-- function sqlite3_create_collation (in 4794 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_collation
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_collation"
               }"
               end

	sqlite3_create_collation16 (an_argument_l664_c7: POINTER; a_z_name: POINTER; an_e_text_rep: INTEGER; a_p_arg: POINTER; a_x_compare: POINTER): INTEGER 

		-- function sqlite3_create_collation16 (in 4809 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_collation16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_collation16"
               }"
               end

	sqlite3_create_collation_v2 (an_argument_l656_c7: POINTER; a_z_name: POINTER; an_e_text_rep: INTEGER; a_p_arg: POINTER; a_x_compare: POINTER; a_x_destroy: POINTER): INTEGER 

		-- function sqlite3_create_collation_v2 (in 4801 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_collation_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_collation_v2"
               }"
               end

	sqlite3_create_function (a_db: POINTER; a_z_function_name: POINTER; a_n_arg: INTEGER; an_e_text_rep: INTEGER; a_p_app: POINTER; a_x_func: POINTER; a_x_step: POINTER; a_x_final: POINTER): INTEGER 

		-- function sqlite3_create_function (in 4250 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_function"
               }"
               end

	sqlite3_create_function16 (a_db: POINTER; a_z_function_name: POINTER; a_n_arg: INTEGER; an_e_text_rep: INTEGER; a_p_app: POINTER; a_x_func: POINTER; a_x_step: POINTER; a_x_final: POINTER): INTEGER 

		-- function sqlite3_create_function16 (in 4260 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_function16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_function16"
               }"
               end

	sqlite3_create_function_v2 (a_db: POINTER; a_z_function_name: POINTER; a_n_arg: INTEGER; an_e_text_rep: INTEGER; a_p_app: POINTER; a_x_func: POINTER; a_x_step: POINTER; a_x_final: POINTER; a_x_destroy: POINTER): INTEGER 

		-- function sqlite3_create_function_v2 (in 4270 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_function_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_function_v2"
               }"
               end

	sqlite3_create_module (a_db: POINTER; a_z_name: POINTER; a_p: POINTER; a_p_client_data: POINTER): INTEGER 

		-- function sqlite3_create_module (in 5777 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_module
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_module"
               }"
               end

	sqlite3_create_module_v2 (a_db: POINTER; a_z_name: POINTER; a_p: POINTER; a_p_client_data: POINTER; a_x_destroy: POINTER): INTEGER 

		-- function sqlite3_create_module_v2 (in 5783 at line /usr/include/sqlite3.h)i
               -- sqlite3_create_module_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_create_module_v2"
               }"
               end

	sqlite3_data_count (a_p_stmt: POINTER): INTEGER 

		-- function sqlite3_data_count (in 3896 at line /usr/include/sqlite3.h)i
               -- sqlite3_data_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_data_count"
               }"
               end

	sqlite3_data_directory: POINTER
               -- sqlite3_data_directory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_data_directory"
               }"
               end

       address_of_sqlite3_data_directory: POINTER
               -- Address of sqlite3_data_directory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&sqlite3_data_directory"
               }"
               end

       set_sqlite3_data_directory (a_value: POINTER)
               -- Set variable sqlite3_data_directory value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_sqlite3_data_directory"
               }"
               end

	sqlite3_db_cacheflush (an_argument_l986_c7: POINTER): INTEGER 

		-- function sqlite3_db_cacheflush (in 7887 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_cacheflush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_cacheflush"
               }"
               end

	sqlite3_db_config (an_argument_l56_c7: POINTER; an_op: INTEGER): INTEGER 

		-- function sqlite3_db_config (in 1428 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_config (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_config"
               }"
               end

	sqlite3_db_filename (a_db: POINTER; a_z_db_name: POINTER): POINTER 

		-- function sqlite3_db_filename (in 5076 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_filename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_filename"
               }"
               end

	sqlite3_db_handle (an_argument_l689_c7: POINTER): POINTER 

		-- function sqlite3_db_handle (in 5059 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_handle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_handle"
               }"
               end

	sqlite3_db_mutex (an_argument_l857_c7: POINTER): POINTER 

		-- function sqlite3_db_mutex (in 6411 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_mutex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_mutex"
               }"
               end

	sqlite3_db_readonly (a_db: POINTER; a_z_db_name: POINTER): INTEGER 

		-- function sqlite3_db_readonly (in 5086 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_readonly
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_readonly"
               }"
               end

	sqlite3_db_release_memory (an_argument_l725_c7: POINTER): INTEGER 

		-- function sqlite3_db_release_memory (in 5273 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_release_memory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_release_memory"
               }"
               end

	sqlite3_db_status (an_argument_l882_c7: POINTER; an_op: INTEGER; a_p_cur: POINTER; a_p_hiwtr: POINTER; a_reset_flg: INTEGER): INTEGER 

		-- function sqlite3_db_status (in 6654 at line /usr/include/sqlite3.h)i
               -- sqlite3_db_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_db_status"
               }"
               end

	sqlite3_declare_vtab (an_argument_l783_c7: POINTER; a_z_sql: POINTER): INTEGER 

		-- function sqlite3_declare_vtab (in 5846 at line /usr/include/sqlite3.h)i
               -- sqlite3_declare_vtab
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_declare_vtab"
               }"
               end

	sqlite3_enable_load_extension (a_db: POINTER; an_onoff: INTEGER): INTEGER 

		-- function sqlite3_enable_load_extension (in 5474 at line /usr/include/sqlite3.h)i
               -- sqlite3_enable_load_extension
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_enable_load_extension"
               }"
               end

	sqlite3_enable_shared_cache (an_argument_l719_c7: INTEGER): INTEGER 

		-- function sqlite3_enable_shared_cache (in 5243 at line /usr/include/sqlite3.h)i
               -- sqlite3_enable_shared_cache
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_enable_shared_cache"
               }"
               end

	sqlite3_errcode (a_db: POINTER): INTEGER 

		-- function sqlite3_errcode (in 3100 at line /usr/include/sqlite3.h)i
               -- sqlite3_errcode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_errcode"
               }"
               end

	sqlite3_errmsg (an_argument_l208_c7: POINTER): POINTER 

		-- function sqlite3_errmsg (in 3102 at line /usr/include/sqlite3.h)i
               -- sqlite3_errmsg
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_errmsg"
               }"
               end

	sqlite3_errmsg16 (an_argument_l211_c7: POINTER): POINTER 

		-- function sqlite3_errmsg16 (in 3103 at line /usr/include/sqlite3.h)i
               -- sqlite3_errmsg16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_errmsg16"
               }"
               end

	sqlite3_errstr (an_argument_l214_c7: INTEGER): POINTER 

		-- function sqlite3_errstr (in 3104 at line /usr/include/sqlite3.h)i
               -- sqlite3_errstr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_errstr"
               }"
               end

	sqlite3_exec (an_argument_l33_c7: POINTER; a_sql: POINTER; a_callback: POINTER; an_argument_l36_c7: POINTER; an_errmsg: POINTER): INTEGER 

		-- function sqlite3_exec (in 385 at line /usr/include/sqlite3.h)i
               -- sqlite3_exec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_exec"
               }"
               end

	sqlite3_expired (an_argument_l475_c7: POINTER): INTEGER 

		-- function sqlite3_expired (in 4317 at line /usr/include/sqlite3.h)i
               -- sqlite3_expired
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_expired"
               }"
               end

	sqlite3_extended_errcode (a_db: POINTER): INTEGER 

		-- function sqlite3_extended_errcode (in 3101 at line /usr/include/sqlite3.h)i
               -- sqlite3_extended_errcode
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_extended_errcode"
               }"
               end

	sqlite3_extended_result_codes (an_argument_l63_c7: POINTER; an_onoff: INTEGER): INTEGER 

		-- function sqlite3_extended_result_codes (in 1922 at line /usr/include/sqlite3.h)i
               -- sqlite3_extended_result_codes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_extended_result_codes"
               }"
               end

	sqlite3_file_control (an_argument_l860_c7: POINTER; a_z_db_name: POINTER; an_op: INTEGER; an_argument_l863_c7: POINTER): INTEGER 

		-- function sqlite3_file_control (in 6446 at line /usr/include/sqlite3.h)i
               -- sqlite3_file_control
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_file_control"
               }"
               end

	sqlite3_finalize (a_p_stmt: POINTER): INTEGER 

		-- function sqlite3_finalize (in 4123 at line /usr/include/sqlite3.h)i
               -- sqlite3_finalize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_finalize"
               }"
               end

	sqlite3_free (an_argument_l139_c7: POINTER) 

		-- function sqlite3_free (in 2497 at line /usr/include/sqlite3.h)i
               -- sqlite3_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_free"
               }"
               end

	sqlite3_free_table (a_result: POINTER) 

		-- function sqlite3_free_table (in 2294 at line /usr/include/sqlite3.h)i
               -- sqlite3_free_table
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_free_table"
               }"
               end

	sqlite3_get_autocommit (an_argument_l686_c7: POINTER): INTEGER 

		-- function sqlite3_get_autocommit (in 5046 at line /usr/include/sqlite3.h)i
               -- sqlite3_get_autocommit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_get_autocommit"
               }"
               end

	sqlite3_get_auxdata (an_argument_l544_c7: POINTER; a_n: INTEGER): POINTER 

		-- function sqlite3_get_auxdata (in 4540 at line /usr/include/sqlite3.h)i
               -- sqlite3_get_auxdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_get_auxdata"
               }"
               end

	sqlite3_get_table (a_db: POINTER; a_z_sql: POINTER; a_paz_result: POINTER; a_pn_row: POINTER; a_pn_column: POINTER; a_pz_errmsg: POINTER): INTEGER 

		-- function sqlite3_get_table (in 2286 at line /usr/include/sqlite3.h)i
               -- sqlite3_get_table
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_get_table"
               }"
               end

	sqlite3_global_recover: INTEGER 

		-- function sqlite3_global_recover (in 4319 at line /usr/include/sqlite3.h)i
               -- sqlite3_global_recover
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_global_recover"
               }"
               end

	sqlite3_initialize: INTEGER 

		-- function sqlite3_initialize (in 1373 at line /usr/include/sqlite3.h)i
               -- sqlite3_initialize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_initialize"
               }"
               end

	sqlite3_interrupt (an_argument_l76_c7: POINTER) 

		-- function sqlite3_interrupt (in 2091 at line /usr/include/sqlite3.h)i
               -- sqlite3_interrupt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_interrupt"
               }"
               end

	sqlite3_last_insert_rowid (an_argument_l67_c7: POINTER): INTEGER_64 

		-- function sqlite3_last_insert_rowid (in 1974 at line /usr/include/sqlite3.h)i
               -- sqlite3_last_insert_rowid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_last_insert_rowid"
               }"
               end

	sqlite3_libversion: POINTER 

		-- function sqlite3_libversion (in 149 at line /usr/include/sqlite3.h)i
               -- sqlite3_libversion
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_libversion"
               }"
               end

	sqlite3_libversion_number: INTEGER 

		-- function sqlite3_libversion_number (in 151 at line /usr/include/sqlite3.h)i
               -- sqlite3_libversion_number
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_libversion_number"
               }"
               end

	sqlite3_limit (an_argument_l218_c7: POINTER; an_id: INTEGER; a_new_val: INTEGER): INTEGER 

		-- function sqlite3_limit (in 3172 at line /usr/include/sqlite3.h)i
               -- sqlite3_limit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_limit"
               }"
               end

	sqlite3_load_extension (a_db: POINTER; a_z_file: POINTER; a_z_proc: POINTER; a_pz_err_msg: POINTER): INTEGER 

		-- function sqlite3_load_extension (in 5453 at line /usr/include/sqlite3.h)i
               -- sqlite3_load_extension
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_load_extension"
               }"
               end

	sqlite3_log (an_i_err_code: INTEGER; a_z_format: POINTER) 

		-- function sqlite3_log (in 7458 at line /usr/include/sqlite3.h)i
               -- sqlite3_log (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_log"
               }"
               end

	sqlite3_malloc (an_argument_l125_c7: INTEGER): POINTER 

		-- function sqlite3_malloc (in 2493 at line /usr/include/sqlite3.h)i
               -- sqlite3_malloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_malloc"
               }"
               end

	sqlite3_malloc64 (an_argument_l128_c7: NATURAL_64): POINTER 

		-- function sqlite3_malloc64 (in 2494 at line /usr/include/sqlite3.h)i
               -- sqlite3_malloc64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_malloc64"
               }"
               end

	sqlite3_memory_alarm (an_argument_l484_c7: POINTER; an_argument_l485_c7: POINTER; an_argument_l486_c7: INTEGER_64): INTEGER 

		-- function sqlite3_memory_alarm (in 4321 at line /usr/include/sqlite3.h)i
               -- sqlite3_memory_alarm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_memory_alarm"
               }"
               end

	sqlite3_memory_highwater (a_reset_flag: INTEGER): INTEGER_64 

		-- function sqlite3_memory_highwater (in 2524 at line /usr/include/sqlite3.h)i
               -- sqlite3_memory_highwater
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_memory_highwater"
               }"
               end

	sqlite3_memory_used: INTEGER_64 

		-- function sqlite3_memory_used (in 2523 at line /usr/include/sqlite3.h)i
               -- sqlite3_memory_used
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_memory_used"
               }"
               end

	sqlite3_mprintf (an_argument_l105_c7: POINTER): POINTER 

		-- function sqlite3_mprintf (in 2400 at line /usr/include/sqlite3.h)i
               -- sqlite3_mprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mprintf"
               }"
               end

	sqlite3_msize (an_argument_l142_c7: POINTER): NATURAL_64 

		-- function sqlite3_msize (in 2498 at line /usr/include/sqlite3.h)i
               -- sqlite3_msize
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_msize"
               }"
               end

	sqlite3_mutex_alloc (an_argument_l834_c7: INTEGER): POINTER 

		-- function sqlite3_mutex_alloc (in 6256 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_alloc"
               }"
               end

	sqlite3_mutex_enter (an_argument_l840_c7: POINTER) 

		-- function sqlite3_mutex_enter (in 6258 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_enter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_enter"
               }"
               end

	sqlite3_mutex_free (an_argument_l837_c7: POINTER) 

		-- function sqlite3_mutex_free (in 6257 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_free"
               }"
               end

	sqlite3_mutex_held (an_argument_l851_c7: POINTER): INTEGER 

		-- function sqlite3_mutex_held (in 6370 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_held
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_held"
               }"
               end

	sqlite3_mutex_leave (an_argument_l846_c7: POINTER) 

		-- function sqlite3_mutex_leave (in 6260 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_leave
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_leave"
               }"
               end

	sqlite3_mutex_notheld (an_argument_l854_c7: POINTER): INTEGER 

		-- function sqlite3_mutex_notheld (in 6371 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_notheld
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_notheld"
               }"
               end

	sqlite3_mutex_try (an_argument_l843_c7: POINTER): INTEGER 

		-- function sqlite3_mutex_try (in 6259 at line /usr/include/sqlite3.h)i
               -- sqlite3_mutex_try
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_mutex_try"
               }"
               end

	sqlite3_next_stmt (a_p_db: POINTER; a_p_stmt: POINTER): POINTER 

		-- function sqlite3_next_stmt (in 5102 at line /usr/include/sqlite3.h)i
               -- sqlite3_next_stmt
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_next_stmt"
               }"
               end

	sqlite3_open (a_filename: POINTER; a_pp_db: POINTER): INTEGER 

		-- function sqlite3_open (in 3000 at line /usr/include/sqlite3.h)i
               -- sqlite3_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_open"
               }"
               end

	sqlite3_open16 (a_filename: POINTER; a_pp_db: POINTER): INTEGER 

		-- function sqlite3_open16 (in 3004 at line /usr/include/sqlite3.h)i
               -- sqlite3_open16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_open16"
               }"
               end

	sqlite3_open_v2 (a_filename: POINTER; a_pp_db: POINTER; a_flags: INTEGER; a_z_vfs: POINTER): INTEGER 

		-- function sqlite3_open_v2 (in 3008 at line /usr/include/sqlite3.h)i
               -- sqlite3_open_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_open_v2"
               }"
               end

	sqlite3_os_end: INTEGER 

		-- function sqlite3_os_end (in 1376 at line /usr/include/sqlite3.h)i
               -- sqlite3_os_end
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_os_end"
               }"
               end

	sqlite3_os_init: INTEGER 

		-- function sqlite3_os_init (in 1375 at line /usr/include/sqlite3.h)i
               -- sqlite3_os_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_os_init"
               }"
               end

	sqlite3_overload_function (an_argument_l787_c7: POINTER; a_z_func_name: POINTER; a_n_arg: INTEGER): INTEGER 

		-- function sqlite3_overload_function (in 5865 at line /usr/include/sqlite3.h)i
               -- sqlite3_overload_function
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_overload_function"
               }"
               end

	sqlite3_prepare (a_db: POINTER; a_z_sql: POINTER; a_n_byte: INTEGER; a_pp_stmt: POINTER; a_pz_tail: POINTER): INTEGER 

		-- function sqlite3_prepare (in 3324 at line /usr/include/sqlite3.h)i
               -- sqlite3_prepare
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_prepare"
               }"
               end

	sqlite3_prepare16 (a_db: POINTER; a_z_sql: POINTER; a_n_byte: INTEGER; a_pp_stmt: POINTER; a_pz_tail: POINTER): INTEGER 

		-- function sqlite3_prepare16 (in 3338 at line /usr/include/sqlite3.h)i
               -- sqlite3_prepare16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_prepare16"
               }"
               end

	sqlite3_prepare16_v2 (a_db: POINTER; a_z_sql: POINTER; a_n_byte: INTEGER; a_pp_stmt: POINTER; a_pz_tail: POINTER): INTEGER 

		-- function sqlite3_prepare16_v2 (in 3345 at line /usr/include/sqlite3.h)i
               -- sqlite3_prepare16_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_prepare16_v2"
               }"
               end

	sqlite3_prepare_v2 (a_db: POINTER; a_z_sql: POINTER; a_n_byte: INTEGER; a_pp_stmt: POINTER; a_pz_tail: POINTER): INTEGER 

		-- function sqlite3_prepare_v2 (in 3331 at line /usr/include/sqlite3.h)i
               -- sqlite3_prepare_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_prepare_v2"
               }"
               end

	sqlite3_profile (an_argument_l163_c7: POINTER; a_x_profile: POINTER; an_argument_l165_c7: POINTER): POINTER 

		-- function sqlite3_profile (in 2736 at line /usr/include/sqlite3.h)i
               -- sqlite3_profile
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_profile"
               }"
               end

	sqlite3_progress_handler (an_argument_l168_c7: POINTER; an_argument_l169_c7: INTEGER; an_argument_l170_c7: POINTER; an_argument_l171_c7: POINTER) 

		-- function sqlite3_progress_handler (in 2771 at line /usr/include/sqlite3.h)i
               -- sqlite3_progress_handler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_progress_handler"
               }"
               end

	sqlite3_randomness (a_n: INTEGER; a_p: POINTER) 

		-- function sqlite3_randomness (in 2547 at line /usr/include/sqlite3.h)i
               -- sqlite3_randomness
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_randomness"
               }"
               end

	sqlite3_realloc (an_argument_l131_c7: POINTER; an_argument_l132_c7: INTEGER): POINTER 

		-- function sqlite3_realloc (in 2495 at line /usr/include/sqlite3.h)i
               -- sqlite3_realloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_realloc"
               }"
               end

	sqlite3_realloc64 (an_argument_l135_c7: POINTER; an_argument_l136_c7: NATURAL_64): POINTER 

		-- function sqlite3_realloc64 (in 2496 at line /usr/include/sqlite3.h)i
               -- sqlite3_realloc64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_realloc64"
               }"
               end

	sqlite3_release_memory (an_argument_l722_c7: INTEGER): INTEGER 

		-- function sqlite3_release_memory (in 5259 at line /usr/include/sqlite3.h)i
               -- sqlite3_release_memory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_release_memory"
               }"
               end

	sqlite3_reset (a_p_stmt: POINTER): INTEGER 

		-- function sqlite3_reset (in 4150 at line /usr/include/sqlite3.h)i
               -- sqlite3_reset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_reset"
               }"
               end

	sqlite3_reset_auto_extension 

		-- function sqlite3_reset_auto_extension (in 5532 at line /usr/include/sqlite3.h)i
               -- sqlite3_reset_auto_extension
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_reset_auto_extension"
               }"
               end

	sqlite3_result_blob (an_argument_l555_c7: POINTER; an_argument_l556_c7: POINTER; an_argument_l557_c7: INTEGER; an_argument_l558_c7: POINTER) 

		-- function sqlite3_result_blob (in 4677 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_blob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_blob"
               }"
               end

	sqlite3_result_blob64 (an_argument_l561_c7: POINTER; an_argument_l562_c7: POINTER; an_argument_l563_c7: NATURAL_64; an_argument_l564_c7: POINTER) 

		-- function sqlite3_result_blob64 (in 4678 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_blob64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_blob64"
               }"
               end

	sqlite3_result_double (an_argument_l567_c7: POINTER; an_argument_l568_c7: REAL) 

		-- function sqlite3_result_double (in 4680 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_double"
               }"
               end

	sqlite3_result_error (an_argument_l571_c7: POINTER; an_argument_l572_c7: POINTER; an_argument_l573_c7: INTEGER) 

		-- function sqlite3_result_error (in 4681 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_error"
               }"
               end

	sqlite3_result_error16 (an_argument_l576_c7: POINTER; an_argument_l577_c7: POINTER; an_argument_l578_c7: INTEGER) 

		-- function sqlite3_result_error16 (in 4682 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_error16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_error16"
               }"
               end

	sqlite3_result_error_code (an_argument_l587_c7: POINTER; an_argument_l588_c7: INTEGER) 

		-- function sqlite3_result_error_code (in 4685 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_error_code
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_error_code"
               }"
               end

	sqlite3_result_error_nomem (an_argument_l584_c7: POINTER) 

		-- function sqlite3_result_error_nomem (in 4684 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_error_nomem
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_error_nomem"
               }"
               end

	sqlite3_result_error_toobig (an_argument_l581_c7: POINTER) 

		-- function sqlite3_result_error_toobig (in 4683 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_error_toobig
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_error_toobig"
               }"
               end

	sqlite3_result_int (an_argument_l591_c7: POINTER; an_argument_l592_c7: INTEGER) 

		-- function sqlite3_result_int (in 4686 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_int"
               }"
               end

	sqlite3_result_int64 (an_argument_l595_c7: POINTER; an_argument_l596_c7: INTEGER_64) 

		-- function sqlite3_result_int64 (in 4687 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_int64"
               }"
               end

	sqlite3_result_null (an_argument_l599_c7: POINTER) 

		-- function sqlite3_result_null (in 4688 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_null
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_null"
               }"
               end

	sqlite3_result_subtype (an_argument_l645_c7: POINTER; an_argument_l646_c7: NATURAL) 

		-- function sqlite3_result_subtype (in 4712 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_subtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_subtype"
               }"
               end

	sqlite3_result_text (an_argument_l602_c7: POINTER; an_argument_l603_c7: POINTER; an_argument_l604_c7: INTEGER; an_argument_l605_c7: POINTER) 

		-- function sqlite3_result_text (in 4689 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_text"
               }"
               end

	sqlite3_result_text16 (an_argument_l615_c7: POINTER; an_argument_l616_c7: POINTER; an_argument_l617_c7: INTEGER; an_argument_l618_c7: POINTER) 

		-- function sqlite3_result_text16 (in 4692 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_text16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_text16"
               }"
               end

	sqlite3_result_text16be (an_argument_l627_c7: POINTER; an_argument_l628_c7: POINTER; an_argument_l629_c7: INTEGER; an_argument_l630_c7: POINTER) 

		-- function sqlite3_result_text16be (in 4694 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_text16be
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_text16be"
               }"
               end

	sqlite3_result_text16le (an_argument_l621_c7: POINTER; an_argument_l622_c7: POINTER; an_argument_l623_c7: INTEGER; an_argument_l624_c7: POINTER) 

		-- function sqlite3_result_text16le (in 4693 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_text16le
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_text16le"
               }"
               end

	sqlite3_result_text64 (an_argument_l608_c7: POINTER; an_argument_l609_c7: POINTER; an_argument_l610_c7: NATURAL_64; an_argument_l611_c7: POINTER; an_encoding: CHARACTER) 

		-- function sqlite3_result_text64 (in 4690 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_text64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_text64"
               }"
               end

	sqlite3_result_value (an_argument_l633_c7: POINTER; an_argument_l634_c7: POINTER) 

		-- function sqlite3_result_value (in 4695 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_value"
               }"
               end

	sqlite3_result_zeroblob (an_argument_l637_c7: POINTER; a_n: INTEGER) 

		-- function sqlite3_result_zeroblob (in 4696 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_zeroblob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_zeroblob"
               }"
               end

	sqlite3_result_zeroblob64 (an_argument_l641_c7: POINTER; a_n: NATURAL_64): INTEGER 

		-- function sqlite3_result_zeroblob64 (in 4697 at line /usr/include/sqlite3.h)i
               -- sqlite3_result_zeroblob64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_result_zeroblob64"
               }"
               end

	sqlite3_rollback_hook (an_argument_l709_c7: POINTER; an_argument_l710_c7: POINTER; an_argument_l711_c7: POINTER): POINTER 

		-- function sqlite3_rollback_hook (in 5152 at line /usr/include/sqlite3.h)i
               -- sqlite3_rollback_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_rollback_hook"
               }"
               end

	sqlite3_rtree_geometry_callback (a_db: POINTER; a_z_geom: POINTER; a_x_geom: POINTER; a_p_context: POINTER): INTEGER 

		-- function sqlite3_rtree_geometry_callback (in 8033 at line /usr/include/sqlite3.h)i
               -- sqlite3_rtree_geometry_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_rtree_geometry_callback"
               }"
               end

	sqlite3_rtree_query_callback (a_db: POINTER; a_z_query_func: POINTER; a_x_query_func: POINTER; a_p_context: POINTER; a_x_destructor: POINTER): INTEGER 

		-- function sqlite3_rtree_query_callback (in 8059 at line /usr/include/sqlite3.h)i
               -- sqlite3_rtree_query_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_rtree_query_callback"
               }"
               end

	sqlite3_set_authorizer (an_argument_l153_c7: POINTER; a_x_auth: POINTER; a_p_user_data: POINTER): INTEGER 

		-- function sqlite3_set_authorizer (in 2630 at line /usr/include/sqlite3.h)i
               -- sqlite3_set_authorizer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_set_authorizer"
               }"
               end

	sqlite3_set_auxdata (an_argument_l548_c7: POINTER; a_n: INTEGER; an_argument_l550_c7: POINTER; an_argument_l551_c7: POINTER) 

		-- function sqlite3_set_auxdata (in 4541 at line /usr/include/sqlite3.h)i
               -- sqlite3_set_auxdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_set_auxdata"
               }"
               end

	sqlite3_shutdown: INTEGER 

		-- function sqlite3_shutdown (in 1374 at line /usr/include/sqlite3.h)i
               -- sqlite3_shutdown
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_shutdown"
               }"
               end

	sqlite3_sleep (an_argument_l681_c7: INTEGER): INTEGER 

		-- function sqlite3_sleep (in 4927 at line /usr/include/sqlite3.h)i
               -- sqlite3_sleep
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_sleep"
               }"
               end

	sqlite3_snapshot_free (an_argument_l1000_c7: POINTER) 

		-- function sqlite3_snapshot_free (in 7979 at line /usr/include/sqlite3.h)i
               -- sqlite3_snapshot_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_snapshot_free"
               }"
               end

	sqlite3_snapshot_get (a_db: POINTER; a_z_schema: POINTER; a_pp_snapshot: POINTER): INTEGER 

		-- function sqlite3_snapshot_get (in 7937 at line /usr/include/sqlite3.h)i
               -- sqlite3_snapshot_get
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_snapshot_get"
               }"
               end

	sqlite3_snapshot_open (a_db: POINTER; a_z_schema: POINTER; a_p_snapshot: POINTER): INTEGER 

		-- function sqlite3_snapshot_open (in 7962 at line /usr/include/sqlite3.h)i
               -- sqlite3_snapshot_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_snapshot_open"
               }"
               end

	sqlite3_snprintf (an_argument_l113_c7: INTEGER; an_argument_l114_c7: POINTER; an_argument_l115_c7: POINTER): POINTER 

		-- function sqlite3_snprintf (in 2402 at line /usr/include/sqlite3.h)i
               -- sqlite3_snprintf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_snprintf"
               }"
               end

	sqlite3_soft_heap_limit (a_n: INTEGER) 

		-- function sqlite3_soft_heap_limit (in 5336 at line /usr/include/sqlite3.h)i
               -- sqlite3_soft_heap_limit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_soft_heap_limit"
               }"
               end

	sqlite3_soft_heap_limit64 (a_n: INTEGER_64): INTEGER_64 

		-- function sqlite3_soft_heap_limit64 (in 5325 at line /usr/include/sqlite3.h)i
               -- sqlite3_soft_heap_limit64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_soft_heap_limit64"
               }"
               end

	sqlite3_sourceid: POINTER 

		-- function sqlite3_sourceid (in 150 at line /usr/include/sqlite3.h)i
               -- sqlite3_sourceid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_sourceid"
               }"
               end

	sqlite3_sql (a_p_stmt: POINTER): POINTER 

		-- function sqlite3_sql (in 3361 at line /usr/include/sqlite3.h)i
               -- sqlite3_sql
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_sql"
               }"
               end

	sqlite3_status (an_op: INTEGER; a_p_current: POINTER; a_p_highwater: POINTER; a_reset_flag: INTEGER): INTEGER 

		-- function sqlite3_status (in 6528 at line /usr/include/sqlite3.h)i
               -- sqlite3_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_status"
               }"
               end

	sqlite3_status64 (an_op: INTEGER; a_p_current: POINTER; a_p_highwater: POINTER; a_reset_flag: INTEGER): INTEGER 

		-- function sqlite3_status64 (in 6529 at line /usr/include/sqlite3.h)i
               -- sqlite3_status64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_status64"
               }"
               end

	sqlite3_step (an_argument_l389_c7: POINTER): INTEGER 

		-- function sqlite3_step (in 3875 at line /usr/include/sqlite3.h)i
               -- sqlite3_step
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_step"
               }"
               end

	sqlite3_stmt_busy (an_argument_l257_c7: POINTER): INTEGER 

		-- function sqlite3_stmt_busy (in 3414 at line /usr/include/sqlite3.h)i
               -- sqlite3_stmt_busy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_stmt_busy"
               }"
               end

	sqlite3_stmt_readonly (a_p_stmt: POINTER): INTEGER 

		-- function sqlite3_stmt_readonly (in 3393 at line /usr/include/sqlite3.h)i
               -- sqlite3_stmt_readonly
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_stmt_readonly"
               }"
               end

	sqlite3_stmt_scanstatus (a_p_stmt: POINTER; an_idx: INTEGER; an_i_scan_status_op: INTEGER; a_p_out: POINTER): INTEGER 

		-- function sqlite3_stmt_scanstatus (in 7839 at line /usr/include/sqlite3.h)i
               -- sqlite3_stmt_scanstatus
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_stmt_scanstatus"
               }"
               end

	sqlite3_stmt_scanstatus_reset (an_argument_l983_c7: POINTER) 

		-- function sqlite3_stmt_scanstatus_reset (in 7855 at line /usr/include/sqlite3.h)i
               -- sqlite3_stmt_scanstatus_reset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_stmt_scanstatus_reset"
               }"
               end

	sqlite3_stmt_status (an_argument_l889_c7: POINTER; an_op: INTEGER; a_reset_flg: INTEGER): INTEGER 

		-- function sqlite3_stmt_status (in 6784 at line /usr/include/sqlite3.h)i
               -- sqlite3_stmt_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_stmt_status"
               }"
               end

	sqlite3_strglob (a_z_glob: POINTER; a_z_str: POINTER): INTEGER 

		-- function sqlite3_strglob (in 7412 at line /usr/include/sqlite3.h)i
               -- sqlite3_strglob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_strglob"
               }"
               end

	sqlite3_stricmp (an_argument_l926_c7: POINTER; an_argument_l927_c7: POINTER): INTEGER 

		-- function sqlite3_stricmp (in 7394 at line /usr/include/sqlite3.h)i
               -- sqlite3_stricmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_stricmp"
               }"
               end

	sqlite3_strlike (a_z_glob: POINTER; a_z_str: POINTER; a_c_esc: NATURAL): INTEGER 

		-- function sqlite3_strlike (in 7435 at line /usr/include/sqlite3.h)i
               -- sqlite3_strlike
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_strlike"
               }"
               end

	sqlite3_strnicmp (an_argument_l930_c7: POINTER; an_argument_l931_c7: POINTER; an_argument_l932_c7: INTEGER): INTEGER 

		-- function sqlite3_strnicmp (in 7395 at line /usr/include/sqlite3.h)i
               -- sqlite3_strnicmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_strnicmp"
               }"
               end

	sqlite3_table_column_metadata (a_db: POINTER; a_z_db_name: POINTER; a_z_table_name: POINTER; a_z_column_name: POINTER; a_pz_data_type: POINTER; a_pz_coll_seq: POINTER; a_p_not_null: POINTER; a_p_primary_key: POINTER; a_p_autoinc: POINTER): INTEGER 

		-- function sqlite3_table_column_metadata (in 5406 at line /usr/include/sqlite3.h)i
               -- sqlite3_table_column_metadata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_table_column_metadata"
               }"
               end

	sqlite3_temp_directory: POINTER
               -- sqlite3_temp_directory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_temp_directory"
               }"
               end

       address_of_sqlite3_temp_directory: POINTER
               -- Address of sqlite3_temp_directory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&sqlite3_temp_directory"
               }"
               end

       set_sqlite3_temp_directory (a_value: POINTER)
               -- Set variable sqlite3_temp_directory value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_sqlite3_temp_directory"
               }"
               end

	sqlite3_test_control (an_op: INTEGER): INTEGER 

		-- function sqlite3_test_control (in 6465 at line /usr/include/sqlite3.h)i
               -- sqlite3_test_control (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_test_control"
               }"
               end

	sqlite3_thread_cleanup 

		-- function sqlite3_thread_cleanup (in 4320 at line /usr/include/sqlite3.h)i
               -- sqlite3_thread_cleanup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_thread_cleanup"
               }"
               end

	sqlite3_threadsafe: INTEGER 

		-- function sqlite3_threadsafe (in 216 at line /usr/include/sqlite3.h)i
               -- sqlite3_threadsafe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_threadsafe"
               }"
               end

	sqlite3_total_changes (an_argument_l73_c7: POINTER): INTEGER 

		-- function sqlite3_total_changes (in 2051 at line /usr/include/sqlite3.h)i
               -- sqlite3_total_changes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_total_changes"
               }"
               end

	sqlite3_trace (an_argument_l158_c7: POINTER; a_x_trace: POINTER; an_argument_l160_c7: POINTER): POINTER 

		-- function sqlite3_trace (in 2735 at line /usr/include/sqlite3.h)i
               -- sqlite3_trace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_trace"
               }"
               end

	sqlite3_transfer_bindings (an_argument_l478_c7: POINTER; an_argument_l479_c7: POINTER): INTEGER 

		-- function sqlite3_transfer_bindings (in 4318 at line /usr/include/sqlite3.h)i
               -- sqlite3_transfer_bindings
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_transfer_bindings"
               }"
               end

	sqlite3_unlock_notify (a_p_blocked: POINTER; a_x_notify: POINTER; a_p_notify_arg: POINTER): INTEGER 

		-- function sqlite3_unlock_notify (in 7379 at line /usr/include/sqlite3.h)i
               -- sqlite3_unlock_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_unlock_notify"
               }"
               end

	sqlite3_update_hook (an_argument_l714_c7: POINTER; an_argument_l715_c7: POINTER; an_argument_l716_c7: POINTER): POINTER 

		-- function sqlite3_update_hook (in 5203 at line /usr/include/sqlite3.h)i
               -- sqlite3_update_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_update_hook"
               }"
               end

	sqlite3_uri_boolean (a_z_file: POINTER; a_z_param: POINTER; a_b_default: INTEGER): INTEGER 

		-- function sqlite3_uri_boolean (in 3055 at line /usr/include/sqlite3.h)i
               -- sqlite3_uri_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_uri_boolean"
               }"
               end

	sqlite3_uri_int64 (an_argument_l197_c7: POINTER; an_argument_l198_c7: POINTER; an_argument_l199_c7: INTEGER_64): INTEGER_64 

		-- function sqlite3_uri_int64 (in 3056 at line /usr/include/sqlite3.h)i
               -- sqlite3_uri_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_uri_int64"
               }"
               end

	sqlite3_uri_parameter (a_z_filename: POINTER; a_z_param: POINTER): POINTER 

		-- function sqlite3_uri_parameter (in 3054 at line /usr/include/sqlite3.h)i
               -- sqlite3_uri_parameter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_uri_parameter"
               }"
               end

	sqlite3_user_data (an_argument_l538_c7: POINTER): POINTER 

		-- function sqlite3_user_data (in 4475 at line /usr/include/sqlite3.h)i
               -- sqlite3_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_user_data"
               }"
               end

	sqlite3_value_blob (an_argument_l489_c7: POINTER): POINTER 

		-- function sqlite3_value_blob (in 4371 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_blob
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_blob"
               }"
               end

	sqlite3_value_bytes (an_argument_l492_c7: POINTER): INTEGER 

		-- function sqlite3_value_bytes (in 4372 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_bytes"
               }"
               end

	sqlite3_value_bytes16 (an_argument_l495_c7: POINTER): INTEGER 

		-- function sqlite3_value_bytes16 (in 4373 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_bytes16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_bytes16"
               }"
               end

	sqlite3_value_double (an_argument_l498_c7: POINTER): REAL 

		-- function sqlite3_value_double (in 4374 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_double"
               }"
               end

	sqlite3_value_dup (an_argument_l528_c7: POINTER): POINTER 

		-- function sqlite3_value_dup (in 4414 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_dup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_dup"
               }"
               end

	sqlite3_value_free (an_argument_l531_c7: POINTER) 

		-- function sqlite3_value_free (in 4415 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_free"
               }"
               end

	sqlite3_value_int (an_argument_l501_c7: POINTER): INTEGER 

		-- function sqlite3_value_int (in 4375 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_int"
               }"
               end

	sqlite3_value_int64 (an_argument_l504_c7: POINTER): INTEGER_64 

		-- function sqlite3_value_int64 (in 4376 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_int64"
               }"
               end

	sqlite3_value_numeric_type (an_argument_l522_c7: POINTER): INTEGER 

		-- function sqlite3_value_numeric_type (in 4382 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_numeric_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_numeric_type"
               }"
               end

	sqlite3_value_subtype (an_argument_l525_c7: POINTER): NATURAL 

		-- function sqlite3_value_subtype (in 4398 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_subtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_subtype"
               }"
               end

	sqlite3_value_text (an_argument_l507_c7: POINTER): POINTER 

		-- function sqlite3_value_text (in 4377 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_text"
               }"
               end

	sqlite3_value_text16 (an_argument_l510_c7: POINTER): POINTER 

		-- function sqlite3_value_text16 (in 4378 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_text16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_text16"
               }"
               end

	sqlite3_value_text16be (an_argument_l516_c7: POINTER): POINTER 

		-- function sqlite3_value_text16be (in 4380 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_text16be
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_text16be"
               }"
               end

	sqlite3_value_text16le (an_argument_l513_c7: POINTER): POINTER 

		-- function sqlite3_value_text16le (in 4379 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_text16le
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_text16le"
               }"
               end

	sqlite3_value_type (an_argument_l519_c7: POINTER): INTEGER 

		-- function sqlite3_value_type (in 4381 at line /usr/include/sqlite3.h)i
               -- sqlite3_value_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_value_type"
               }"
               end

	sqlite3_version: POINTER
               -- sqlite3_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_version"
               }"
               end

       address_of_sqlite3_version: POINTER
               -- Address of sqlite3_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&sqlite3_version"
               }"
               end

       set_sqlite3_version (a_value: POINTER)
               -- Set variable sqlite3_version value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_sqlite3_version"
               }"
               end

	sqlite3_vfs_find (a_z_vfs_name: POINTER): POINTER 

		-- function sqlite3_vfs_find (in 6138 at line /usr/include/sqlite3.h)i
               -- sqlite3_vfs_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vfs_find"
               }"
               end

	sqlite3_vfs_register (an_argument_l827_c7: POINTER; a_make_dflt: INTEGER): INTEGER 

		-- function sqlite3_vfs_register (in 6139 at line /usr/include/sqlite3.h)i
               -- sqlite3_vfs_register
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vfs_register"
               }"
               end

	sqlite3_vfs_unregister (an_argument_l831_c7: POINTER): INTEGER 

		-- function sqlite3_vfs_unregister (in 6140 at line /usr/include/sqlite3.h)i
               -- sqlite3_vfs_unregister
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vfs_unregister"
               }"
               end

	sqlite3_vmprintf (an_argument_l109_c7: POINTER; an_argument_l110_c7: POINTER): POINTER 

		-- function sqlite3_vmprintf (in 2401 at line /usr/include/sqlite3.h)i
               -- sqlite3_vmprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vmprintf"
               }"
               end

	sqlite3_vsnprintf (an_argument_l119_c7: INTEGER; an_argument_l120_c7: POINTER; an_argument_l121_c7: POINTER; an_argument_l122_c7: POINTER): POINTER 

		-- function sqlite3_vsnprintf (in 2403 at line /usr/include/sqlite3.h)i
               -- sqlite3_vsnprintf
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vsnprintf"
               }"
               end

	sqlite3_vtab_config (an_argument_l969_c7: POINTER; an_op: INTEGER): INTEGER 

		-- function sqlite3_vtab_config (in 7681 at line /usr/include/sqlite3.h)i
               -- sqlite3_vtab_config (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vtab_config"
               }"
               end

	sqlite3_vtab_on_conflict (an_argument_l974_c7: POINTER): INTEGER 

		-- function sqlite3_vtab_on_conflict (in 7734 at line /usr/include/sqlite3.h)i
               -- sqlite3_vtab_on_conflict
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_vtab_on_conflict"
               }"
               end

	sqlite3_wal_autocheckpoint (a_db: POINTER; a_n: INTEGER): INTEGER 

		-- function sqlite3_wal_autocheckpoint (in 7529 at line /usr/include/sqlite3.h)i
               -- sqlite3_wal_autocheckpoint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_wal_autocheckpoint"
               }"
               end

	sqlite3_wal_checkpoint (a_db: POINTER; a_z_db: POINTER): INTEGER 

		-- function sqlite3_wal_checkpoint (in 7551 at line /usr/include/sqlite3.h)i
               -- sqlite3_wal_checkpoint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_wal_checkpoint"
               }"
               end

	sqlite3_wal_checkpoint_v2 (a_db: POINTER; a_z_db: POINTER; an_e_mode: INTEGER; a_pn_log: POINTER; a_pn_ckpt: POINTER): INTEGER 

		-- function sqlite3_wal_checkpoint_v2 (in 7645 at line /usr/include/sqlite3.h)i
               -- sqlite3_wal_checkpoint_v2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_wal_checkpoint_v2"
               }"
               end

	sqlite3_wal_hook (an_argument_l949_c7: POINTER; an_argument_l950_c7: POINTER; an_argument_l951_c7: POINTER): POINTER 

		-- function sqlite3_wal_hook (in 7494 at line /usr/include/sqlite3.h)i
               -- sqlite3_wal_hook
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sqlite3_wal_hook"
               }"
               end


end -- class SQLITE3_EXTERNALS
