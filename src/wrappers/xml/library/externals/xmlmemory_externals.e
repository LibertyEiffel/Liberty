-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLMEMORY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_cleanup_memory is
 		-- xmlCleanupMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupMemory()"
		}"
		end

	xml_gc_mem_get (a_free_func: POINTER; a_malloc_func: POINTER; a_malloc_atomic_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER is
 		-- xmlGcMemGet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGcMemGet"
		}"
		end

	xml_gc_mem_setup (a_free_func: POINTER; a_malloc_func: POINTER; a_malloc_atomic_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER is
 		-- xmlGcMemSetup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGcMemSetup"
		}"
		end

	xml_init_memory: INTEGER is
 		-- xmlInitMemory
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitMemory()"
		}"
		end

	xml_malloc_atomic_loc (a_size: like size_t; a_file: POINTER; a_line: INTEGER): POINTER is
 		-- xmlMallocAtomicLoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMallocAtomicLoc"
		}"
		end

	xml_malloc_loc (a_size: like size_t; a_file: POINTER; a_line: INTEGER): POINTER is
 		-- xmlMallocLoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMallocLoc"
		}"
		end

	xml_mem_blocks: INTEGER is
 		-- xmlMemBlocks
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemBlocks()"
		}"
		end

	xml_mem_display (a_fp: POINTER) is
 		-- xmlMemDisplay
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemDisplay"
		}"
		end

	xml_mem_display_last (a_fp: POINTER; a_nb_bytes: like long) is
 		-- xmlMemDisplayLast
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemDisplayLast"
		}"
		end

	xml_mem_free (a_ptr: POINTER) is
 		-- xmlMemFree
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemFree"
		}"
		end

	xml_mem_get (a_free_func: POINTER; a_malloc_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER is
 		-- xmlMemGet
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemGet"
		}"
		end

	xml_mem_malloc (a_size: like size_t): POINTER is
 		-- xmlMemMalloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemMalloc"
		}"
		end

	xml_mem_realloc (a_ptr: POINTER; a_size: like size_t): POINTER is
 		-- xmlMemRealloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemRealloc"
		}"
		end

	xml_mem_setup (a_free_func: POINTER; a_malloc_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER is
 		-- xmlMemSetup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemSetup"
		}"
		end

	xml_mem_show (a_fp: POINTER; a_nr: INTEGER) is
 		-- xmlMemShow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemShow"
		}"
		end

	xml_mem_strdup_loc (a_str: POINTER; a_file: POINTER; a_line: INTEGER): POINTER is
 		-- xmlMemStrdupLoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemStrdupLoc"
		}"
		end

	xml_mem_used: INTEGER is
 		-- xmlMemUsed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemUsed()"
		}"
		end

	xml_memory_dump is
 		-- xmlMemoryDump
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemoryDump()"
		}"
		end

	xml_memory_strdup (a_str: POINTER): POINTER is
 		-- xmlMemoryStrdup
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemoryStrdup"
		}"
		end

	xml_realloc_loc (a_ptr: POINTER; a_size: like size_t; a_file: POINTER; a_line: INTEGER): POINTER is
 		-- xmlReallocLoc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReallocLoc"
		}"
		end


end -- class XMLMEMORY_EXTERNALS
