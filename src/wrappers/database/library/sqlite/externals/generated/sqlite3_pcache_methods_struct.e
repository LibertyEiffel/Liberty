-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_PCACHE_METHODS_STRUCT
-- Wrapper of struct sqlite3_pcache_methods defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_pcache_methods_struct_set_parg (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pArg field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_parg"
      }"
      end

   sqlite3_pcache_methods_struct_set_xinit (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xInit field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xinit"
      }"
      end

   sqlite3_pcache_methods_struct_set_xshutdown (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xShutdown field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xshutdown"
      }"
      end

   sqlite3_pcache_methods_struct_set_xcreate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCreate field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xcreate"
      }"
      end

   sqlite3_pcache_methods_struct_set_xcachesize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCachesize field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xcachesize"
      }"
      end

   sqlite3_pcache_methods_struct_set_xpagecount (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xPagecount field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xpagecount"
      }"
      end

   sqlite3_pcache_methods_struct_set_xfetch (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFetch field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xfetch"
      }"
      end

   sqlite3_pcache_methods_struct_set_xunpin (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xUnpin field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xunpin"
      }"
      end

   sqlite3_pcache_methods_struct_set_xrekey (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRekey field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xrekey"
      }"
      end

   sqlite3_pcache_methods_struct_set_xtruncate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xTruncate field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xtruncate"
      }"
      end

   sqlite3_pcache_methods_struct_set_xdestroy (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDestroy field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_set_xdestroy"
      }"
      end

feature {} -- Low-level queries

   sqlite3_pcache_methods_struct_get_parg (a_structure: POINTER): POINTER 
         -- Query for pArg field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_parg"
      }"
      end

   sqlite3_pcache_methods_struct_get_xinit (a_structure: POINTER): POINTER 
         -- Query for xInit field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xinit"
      }"
      end

   sqlite3_pcache_methods_struct_get_xshutdown (a_structure: POINTER): POINTER 
         -- Query for xShutdown field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xshutdown"
      }"
      end

   sqlite3_pcache_methods_struct_get_xcreate (a_structure: POINTER): POINTER 
         -- Query for xCreate field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xcreate"
      }"
      end

   sqlite3_pcache_methods_struct_get_xcachesize (a_structure: POINTER): POINTER 
         -- Query for xCachesize field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xcachesize"
      }"
      end

   sqlite3_pcache_methods_struct_get_xpagecount (a_structure: POINTER): POINTER 
         -- Query for xPagecount field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xpagecount"
      }"
      end

   sqlite3_pcache_methods_struct_get_xfetch (a_structure: POINTER): POINTER 
         -- Query for xFetch field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xfetch"
      }"
      end

   sqlite3_pcache_methods_struct_get_xunpin (a_structure: POINTER): POINTER 
         -- Query for xUnpin field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xunpin"
      }"
      end

   sqlite3_pcache_methods_struct_get_xrekey (a_structure: POINTER): POINTER 
         -- Query for xRekey field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xrekey"
      }"
      end

   sqlite3_pcache_methods_struct_get_xtruncate (a_structure: POINTER): POINTER 
         -- Query for xTruncate field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xtruncate"
      }"
      end

   sqlite3_pcache_methods_struct_get_xdestroy (a_structure: POINTER): POINTER 
         -- Query for xDestroy field of SQLITE3_PCACHE_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_pcache_methods_struct_get_xdestroy"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_pcache_methods"
               }"
               end

end -- class SQLITE3_PCACHE_METHODS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
