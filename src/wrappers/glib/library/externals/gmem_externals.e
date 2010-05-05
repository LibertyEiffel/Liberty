-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMEM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_try_realloc_n (a_mem: POINTER; a_n_blocks: NATURAL_32; a_n_block_bytes: NATURAL_32): POINTER is
 		-- g_try_realloc_n (node at line 43)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_realloc_n"
		}"
		end

	g_try_malloc_n (a_n_blocks: NATURAL_32; a_n_block_bytes: NATURAL_32): POINTER is
 		-- g_try_malloc_n (node at line 54)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc_n"
		}"
		end

	g_malloc0_n (a_n_blocks: NATURAL_32; a_n_block_bytes: NATURAL_32): POINTER is
 		-- g_malloc0_n (node at line 727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc0_n"
		}"
		end

	g_mem_chunk_alloc (a_mem_chunk: POINTER): POINTER is
 		-- g_mem_chunk_alloc (node at line 731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_alloc"
		}"
		end

	g_malloc_n (a_n_blocks: NATURAL_32; a_n_block_bytes: NATURAL_32): POINTER is
 		-- g_malloc_n (node at line 991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc_n"
		}"
		end

	g_allocator_new (a_name: POINTER; a_n_preallocs: NATURAL_32): POINTER is
 		-- g_allocator_new (node at line 1212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_allocator_new"
		}"
		end

	g_realloc (a_mem: POINTER; a_n_bytes: NATURAL_32): POINTER is
 		-- g_realloc (node at line 1228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_realloc"
		}"
		end

	g_mem_chunk_new (a_name: POINTER; an_atom_size: INTEGER_32; an_area_size: NATURAL_32; a_type: INTEGER_32): POINTER is
 		-- g_mem_chunk_new (node at line 1587)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_new"
		}"
		end

	g_mem_chunk_reset (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_reset (node at line 1676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_reset"
		}"
		end

	g_malloc0 (a_n_bytes: NATURAL_32): POINTER is
 		-- g_malloc0 (node at line 2141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc0"
		}"
		end

	g_mem_chunk_print (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_print (node at line 2209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_print"
		}"
		end

	g_mem_chunk_clean (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_clean (node at line 2998)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_clean"
		}"
		end

	g_mem_chunk_free (a_mem_chunk: POINTER; a_mem: POINTER) is
 		-- g_mem_chunk_free (node at line 3002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_free"
		}"
		end

	g_try_malloc (a_n_bytes: NATURAL_32): POINTER is
 		-- g_try_malloc (node at line 3039)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc"
		}"
		end

	g_blow_chunks is
 		-- g_blow_chunks (node at line 3472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_blow_chunks()"
		}"
		end

	g_try_realloc (a_mem: POINTER; a_n_bytes: NATURAL_32): POINTER is
 		-- g_try_realloc (node at line 3936)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_realloc"
		}"
		end

	g_free (a_mem: POINTER) is
 		-- g_free (node at line 3974)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_free"
		}"
		end

	g_malloc (a_n_bytes: NATURAL_32): POINTER is
 		-- g_malloc (node at line 4363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_malloc"
		}"
		end

	g_realloc_n (a_mem: POINTER; a_n_blocks: NATURAL_32; a_n_block_bytes: NATURAL_32): POINTER is
 		-- g_realloc_n (node at line 4470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_realloc_n"
		}"
		end

	g_allocator_free (an_allocator: POINTER) is
 		-- g_allocator_free (node at line 4615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_allocator_free"
		}"
		end

	g_mem_set_vtable (a_vtable: POINTER) is
 		-- g_mem_set_vtable (node at line 5088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_set_vtable"
		}"
		end

	g_mem_profile is
 		-- g_mem_profile (node at line 5869)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_profile()"
		}"
		end

	g_try_malloc0 (a_n_bytes: NATURAL_32): POINTER is
 		-- g_try_malloc0 (node at line 6132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc0"
		}"
		end

	g_mem_is_system_malloc: INTEGER_32 is
 		-- g_mem_is_system_malloc (node at line 6447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_is_system_malloc()"
		}"
		end

	g_try_malloc0_n (a_n_blocks: NATURAL_32; a_n_block_bytes: NATURAL_32): POINTER is
 		-- g_try_malloc0_n (node at line 6468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_try_malloc0_n"
		}"
		end

	g_mem_chunk_destroy (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_destroy (node at line 6614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_destroy"
		}"
		end

	g_mem_chunk_alloc0 (a_mem_chunk: POINTER): POINTER is
 		-- g_mem_chunk_alloc0 (node at line 6637)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_alloc0"
		}"
		end

	g_mem_chunk_info is
 		-- g_mem_chunk_info (node at line 6654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_mem_chunk_info()"
		}"
		end


end -- class GMEM_EXTERNALS
