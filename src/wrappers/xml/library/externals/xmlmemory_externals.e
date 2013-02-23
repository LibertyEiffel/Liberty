-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XMLMEMORY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xml_mem_show (a_fp: POINTER; a_nr: INTEGER_32) is
 		-- xmlMemShow (node at line 116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemShow"
		}"
		end

	xml_malloc_atomic_loc (a_size: NATURAL_64; a_file: POINTER; a_line: INTEGER_32): POINTER is
 		-- xmlMallocAtomicLoc (node at line 206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMallocAtomicLoc"
		}"
		end

	xml_mem_display_last (a_fp: POINTER; a_nb_bytes: INTEGER_64) is
 		-- xmlMemDisplayLast (node at line 1680)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemDisplayLast"
		}"
		end

	xml_memory_dump is
 		-- xmlMemoryDump (node at line 1694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemoryDump()"
		}"
		end

	xml_mem_get (a_free_func: POINTER; a_malloc_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER_32 is
 		-- xmlMemGet (node at line 1814)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemGet"
		}"
		end

	xml_mem_strdup_loc (a_str: POINTER; a_file: POINTER; a_line: INTEGER_32): POINTER is
 		-- xmlMemStrdupLoc (node at line 2003)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemStrdupLoc"
		}"
		end

	xml_mem_setup (a_free_func: POINTER; a_malloc_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER_32 is
 		-- xmlMemSetup (node at line 2333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemSetup"
		}"
		end

	xml_malloc_loc (a_size: NATURAL_64; a_file: POINTER; a_line: INTEGER_32): POINTER is
 		-- xmlMallocLoc (node at line 2360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMallocLoc"
		}"
		end

	xml_mem_used: INTEGER_32 is
 		-- xmlMemUsed (node at line 2868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemUsed()"
		}"
		end

	xml_mem_malloc (a_size: NATURAL_64): POINTER is
 		-- xmlMemMalloc (node at line 2918)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemMalloc"
		}"
		end

	xml_mem_free (a_ptr: POINTER) is
 		-- xmlMemFree (node at line 2927)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemFree"
		}"
		end

	xml_mem_realloc (a_ptr: POINTER; a_size: NATURAL_64): POINTER is
 		-- xmlMemRealloc (node at line 3332)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemRealloc"
		}"
		end

	xml_gc_mem_setup (a_free_func: POINTER; a_malloc_func: POINTER; a_malloc_atomic_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER_32 is
 		-- xmlGcMemSetup (node at line 3426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGcMemSetup"
		}"
		end

	xml_realloc_loc (a_ptr: POINTER; a_size: NATURAL_64; a_file: POINTER; a_line: INTEGER_32): POINTER is
 		-- xmlReallocLoc (node at line 4462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlReallocLoc"
		}"
		end

	xml_init_memory: INTEGER_32 is
 		-- xmlInitMemory (node at line 4480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlInitMemory()"
		}"
		end

	xml_mem_blocks: INTEGER_32 is
 		-- xmlMemBlocks (node at line 4852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemBlocks()"
		}"
		end

	xml_mem_display (a_fp: POINTER) is
 		-- xmlMemDisplay (node at line 5243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemDisplay"
		}"
		end

	xml_memory_strdup (a_str: POINTER): POINTER is
 		-- xmlMemoryStrdup (node at line 5607)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlMemoryStrdup"
		}"
		end

	xml_gc_mem_get (a_free_func: POINTER; a_malloc_func: POINTER; a_malloc_atomic_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER_32 is
 		-- xmlGcMemGet (node at line 5781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlGcMemGet"
		}"
		end

	xml_cleanup_memory is
 		-- xmlCleanupMemory (node at line 5810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xmlCleanupMemory()"
		}"
		end


end -- class XMLMEMORY_EXTERNALS
