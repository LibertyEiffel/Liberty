-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class XMLMEMORY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xml_cleanup_memory () 
               -- xmlCleanupMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_gc_mem_get (a_free_func: POINTER; a_malloc_func: POINTER; a_malloc_atomic_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER 
               -- xmlGcMemGet
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_gc_mem_setup (a_free_func: POINTER; a_malloc_func: POINTER; a_malloc_atomic_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER 
               -- xmlGcMemSetup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_init_memory (): INTEGER 
               -- xmlInitMemory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_malloc_atomic_loc (a_size: like size_t; a_file: POINTER; a_line: INTEGER): POINTER 
               -- xmlMallocAtomicLoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_malloc_loc (a_size: like size_t; a_file: POINTER; a_line: INTEGER): POINTER 
               -- xmlMallocLoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_blocks (): INTEGER 
               -- xmlMemBlocks
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_display (a_fp: POINTER) 
               -- xmlMemDisplay
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_display_last (a_fp: POINTER; a_nb_bytes: like long) 
               -- xmlMemDisplayLast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_free (a_ptr: POINTER) 
               -- xmlMemFree
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_get (a_free_func: POINTER; a_malloc_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER 
               -- xmlMemGet
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_malloc (a_size: like size_t): POINTER 
               -- xmlMemMalloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_realloc (a_ptr: POINTER; a_size: like size_t): POINTER 
               -- xmlMemRealloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_setup (a_free_func: POINTER; a_malloc_func: POINTER; a_realloc_func: POINTER; a_strdup_func: POINTER): INTEGER 
               -- xmlMemSetup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_show (a_fp: POINTER; a_nr: INTEGER) 
               -- xmlMemShow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_strdup_loc (a_str: POINTER; a_file: POINTER; a_line: INTEGER): POINTER 
               -- xmlMemStrdupLoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_mem_used (): INTEGER 
               -- xmlMemUsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_memory_dump () 
               -- xmlMemoryDump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_memory_strdup (a_str: POINTER): POINTER 
               -- xmlMemoryStrdup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	xml_realloc_loc (a_ptr: POINTER; a_size: like size_t; a_file: POINTER; a_line: INTEGER): POINTER 
               -- xmlReallocLoc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class XMLMEMORY_EXTERNALS
