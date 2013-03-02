-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMEM_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_free (a_mem: POINTER) is
 		-- g_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_free"
		}"
		end

	g_malloc (a_n_bytes: NATURAL_64): POINTER is
 		-- g_malloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc"
		}"
		end

	g_malloc0 (a_n_bytes: NATURAL_64): POINTER is
 		-- g_malloc0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc0"
		}"
		end

	g_malloc0_n (a_n_blocks: NATURAL_64; a_n_block_bytes: NATURAL_64): POINTER is
 		-- g_malloc0_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc0_n"
		}"
		end

	g_malloc_n (a_n_blocks: NATURAL_64; a_n_block_bytes: NATURAL_64): POINTER is
 		-- g_malloc_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc_n"
		}"
		end

	g_mem_gc_friendly: INTEGER_32 is
 		-- g_mem_gc_friendly
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_gc_friendly"
		}"
		end

	address_of_g_mem_gc_friendly: POINTER is
 		-- Address of g_mem_gc_friendly
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&g_mem_gc_friendly"
		}"
		end

	set_g_mem_gc_friendly (a_value: INTEGER_32) is
		-- Set variable g_mem_gc_friendly value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_g_mem_gc_friendly"
		}"
		end

	g_mem_is_system_malloc: INTEGER_32 is
 		-- g_mem_is_system_malloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_is_system_malloc()"
		}"
		end

	g_mem_profile is
 		-- g_mem_profile
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_profile()"
		}"
		end

	g_mem_set_vtable (a_vtable: POINTER) is
 		-- g_mem_set_vtable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_set_vtable"
		}"
		end

	g_realloc (a_mem: POINTER; a_n_bytes: NATURAL_64): POINTER is
 		-- g_realloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_realloc"
		}"
		end

	g_realloc_n (a_mem: POINTER; a_n_blocks: NATURAL_64; a_n_block_bytes: NATURAL_64): POINTER is
 		-- g_realloc_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_realloc_n"
		}"
		end

	g_try_malloc (a_n_bytes: NATURAL_64): POINTER is
 		-- g_try_malloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc"
		}"
		end

	g_try_malloc0 (a_n_bytes: NATURAL_64): POINTER is
 		-- g_try_malloc0
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc0"
		}"
		end

	g_try_malloc0_n (a_n_blocks: NATURAL_64; a_n_block_bytes: NATURAL_64): POINTER is
 		-- g_try_malloc0_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc0_n"
		}"
		end

	g_try_malloc_n (a_n_blocks: NATURAL_64; a_n_block_bytes: NATURAL_64): POINTER is
 		-- g_try_malloc_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc_n"
		}"
		end

	g_try_realloc (a_mem: POINTER; a_n_bytes: NATURAL_64): POINTER is
 		-- g_try_realloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_realloc"
		}"
		end

	g_try_realloc_n (a_mem: POINTER; a_n_blocks: NATURAL_64; a_n_block_bytes: NATURAL_64): POINTER is
 		-- g_try_realloc_n
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_realloc_n"
		}"
		end

	glib_mem_profiler_table: POINTER is
 		-- glib_mem_profiler_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "glib_mem_profiler_table"
		}"
		end

	address_of_glib_mem_profiler_table: POINTER is
 		-- Address of glib_mem_profiler_table
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&glib_mem_profiler_table"
		}"
		end

	set_glib_mem_profiler_table (a_value: POINTER) is
		-- Set variable glib_mem_profiler_table value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_glib_mem_profiler_table"
		}"
		end


end -- class GMEM_EXTERNALS
