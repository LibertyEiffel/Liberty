-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_PCACHE_PAGE_STRUCT
-- Wrapper of struct sqlite3_pcache_page defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_pcache_page_struct_set_pbuf (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pBuf field of SQLITE3_PCACHE_PAGE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_page_struct_set_pbuf"
      }"
      end

   sqlite3_pcache_page_struct_set_pextra (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pExtra field of SQLITE3_PCACHE_PAGE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_page_struct_set_pextra"
      }"
      end

feature {} -- Low-level queries

   sqlite3_pcache_page_struct_get_pbuf (a_structure: POINTER): POINTER 
         -- Query for pBuf field of SQLITE3_PCACHE_PAGE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_page_struct_get_pbuf"
      }"
      end

   sqlite3_pcache_page_struct_get_pextra (a_structure: POINTER): POINTER 
         -- Query for pExtra field of SQLITE3_PCACHE_PAGE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_page_struct_get_pextra"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_pcache_page"
               }"
               end

end -- class SQLITE3_PCACHE_PAGE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
