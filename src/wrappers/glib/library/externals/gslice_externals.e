-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSLICE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_slice_alloc (a_block_size: like long_unsigned): POINTER 
               -- g_slice_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_alloc"
               }"
               end

	g_slice_alloc0 (a_block_size: like long_unsigned): POINTER 
               -- g_slice_alloc0
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_alloc0"
               }"
               end

	g_slice_copy (a_block_size: like long_unsigned; a_mem_block: POINTER): POINTER 
               -- g_slice_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_copy"
               }"
               end

	g_slice_free1 (a_block_size: like long_unsigned; a_mem_block: POINTER) 
               -- g_slice_free1
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_free1"
               }"
               end

	g_slice_free_chain_with_offset (a_block_size: like long_unsigned; a_mem_chain: POINTER; a_next_offset: like long_unsigned) 
               -- g_slice_free_chain_with_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_free_chain_with_offset"
               }"
               end

	g_slice_get_config (a_ckey: INTEGER): like long 
               -- g_slice_get_config
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_get_config"
               }"
               end

	g_slice_get_config_state (a_ckey: INTEGER; an_address: like long; a_n_values: POINTER): POINTER 
               -- g_slice_get_config_state
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_get_config_state"
               }"
               end

	g_slice_set_config (a_ckey: INTEGER; a_value: like long) 
               -- g_slice_set_config
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_slice_set_config"
               }"
               end


end -- class GSLICE_EXTERNALS
