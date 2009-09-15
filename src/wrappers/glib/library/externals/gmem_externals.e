-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GMEM_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_mem_chunk_alloc (a_mem_chunk: POINTER): POINTER is
 		-- g_mem_chunk_alloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_alloc"
		}"
		end

	g_allocator_new (a_name: POINTER; a_n_preallocs: NATURAL_32): POINTER is
 		-- g_allocator_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_allocator_new"
		}"
		end

	g_realloc (a_mem: POINTER; a_n_bytes: NATURAL_32): POINTER is
 		-- g_realloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_realloc"
		}"
		end

	g_mem_chunk_new (a_name: POINTER; an_atom_size: INTEGER_32; an_area_size: NATURAL_32; a_type: INTEGER_32): POINTER is
 		-- g_mem_chunk_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_new"
		}"
		end

	g_mem_chunk_reset (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_reset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_reset"
		}"
		end

	g_malloc0 (a_n_bytes: NATURAL_32): POINTER is
 		-- g_malloc0
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_malloc0"
		}"
		end

	g_mem_chunk_print (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_print
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_print"
		}"
		end

	g_mem_chunk_clean (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_clean
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_clean"
		}"
		end

	g_mem_chunk_free (a_mem_chunk: POINTER; a_mem: POINTER) is
 		-- g_mem_chunk_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_free"
		}"
		end

	g_try_malloc (a_n_bytes: NATURAL_32): POINTER is
 		-- g_try_malloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_try_malloc"
		}"
		end

	g_blow_chunks is
 		-- g_blow_chunks
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_blow_chunks"
		}"
		end

	g_try_realloc (a_mem: POINTER; a_n_bytes: NATURAL_32): POINTER is
 		-- g_try_realloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_try_realloc"
		}"
		end

	g_free (a_mem: POINTER) is
 		-- g_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_free"
		}"
		end

	g_malloc (a_n_bytes: NATURAL_32): POINTER is
 		-- g_malloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_malloc"
		}"
		end

	g_allocator_free (an_allocator: POINTER) is
 		-- g_allocator_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_allocator_free"
		}"
		end

	g_mem_set_vtable (a_vtable: POINTER) is
 		-- g_mem_set_vtable
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_set_vtable"
		}"
		end

	g_mem_profile is
 		-- g_mem_profile
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_profile"
		}"
		end

	g_try_malloc0 (a_n_bytes: NATURAL_32): POINTER is
 		-- g_try_malloc0
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_try_malloc0"
		}"
		end

	g_mem_is_system_malloc: INTEGER_32 is
 		-- g_mem_is_system_malloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_is_system_malloc"
		}"
		end

	g_mem_chunk_destroy (a_mem_chunk: POINTER) is
 		-- g_mem_chunk_destroy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_destroy"
		}"
		end

	g_mem_chunk_alloc0 (a_mem_chunk: POINTER): POINTER is
 		-- g_mem_chunk_alloc0
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_alloc0"
		}"
		end

	g_mem_chunk_info is
 		-- g_mem_chunk_info
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_mem_chunk_info"
		}"
		end

end
