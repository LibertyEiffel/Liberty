-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSLICE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_slice_free_chain_with_offset (a_block_size: NATURAL_32; a_mem_chain: POINTER; a_next_offset: NATURAL_32) is
 		-- g_slice_free_chain_with_offset (node at line 436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_free_chain_with_offset"
		}"
		end

	g_slice_free1 (a_block_size: NATURAL_32; a_mem_block: POINTER) is
 		-- g_slice_free1 (node at line 596)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_free1"
		}"
		end

	g_slice_set_config (a_ckey: INTEGER; a_value: INTEGER_64) is
 		-- g_slice_set_config (node at line 1337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_set_config"
		}"
		end

	g_slice_alloc (a_block_size: NATURAL_32): POINTER is
 		-- g_slice_alloc (node at line 1882)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_alloc"
		}"
		end

	g_slice_get_config_state (a_ckey: INTEGER; an_address: INTEGER_64; a_n_values: POINTER): POINTER is
 		-- g_slice_get_config_state (node at line 2554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_get_config_state"
		}"
		end

	g_slice_alloc0 (a_block_size: NATURAL_32): POINTER is
 		-- g_slice_alloc0 (node at line 2781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_alloc0"
		}"
		end

	g_slice_get_config (a_ckey: INTEGER): INTEGER_64 is
 		-- g_slice_get_config (node at line 5932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_get_config"
		}"
		end

	g_slice_copy (a_block_size: NATURAL_32; a_mem_block: POINTER): POINTER is
 		-- g_slice_copy (node at line 6909)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_slice_copy"
		}"
		end


end -- class GSLICE_EXTERNALS
