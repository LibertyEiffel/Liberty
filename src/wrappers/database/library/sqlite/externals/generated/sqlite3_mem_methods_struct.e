-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_MEM_METHODS_STRUCT
-- Wrapper of struct sqlite3_mem_methods defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_mem_methods_struct_set_xmalloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xMalloc field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xmalloc"
      }"
      end

   sqlite3_mem_methods_struct_set_xfree (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFree field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xfree"
      }"
      end

   sqlite3_mem_methods_struct_set_xrealloc (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRealloc field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xrealloc"
      }"
      end

   sqlite3_mem_methods_struct_set_xsize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xSize field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xsize"
      }"
      end

   sqlite3_mem_methods_struct_set_xroundup (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xRoundup field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xroundup"
      }"
      end

   sqlite3_mem_methods_struct_set_xinit (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xInit field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xinit"
      }"
      end

   sqlite3_mem_methods_struct_set_xshutdown (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xShutdown field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_xshutdown"
      }"
      end

   sqlite3_mem_methods_struct_set_pappdata (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pAppData field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_set_pappdata"
      }"
      end

feature {} -- Low-level queries

   sqlite3_mem_methods_struct_get_xmalloc (a_structure: POINTER): POINTER 
         -- Query for xMalloc field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xmalloc"
      }"
      end

   sqlite3_mem_methods_struct_get_xfree (a_structure: POINTER): POINTER 
         -- Query for xFree field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xfree"
      }"
      end

   sqlite3_mem_methods_struct_get_xrealloc (a_structure: POINTER): POINTER 
         -- Query for xRealloc field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xrealloc"
      }"
      end

   sqlite3_mem_methods_struct_get_xsize (a_structure: POINTER): POINTER 
         -- Query for xSize field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xsize"
      }"
      end

   sqlite3_mem_methods_struct_get_xroundup (a_structure: POINTER): POINTER 
         -- Query for xRoundup field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xroundup"
      }"
      end

   sqlite3_mem_methods_struct_get_xinit (a_structure: POINTER): POINTER 
         -- Query for xInit field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xinit"
      }"
      end

   sqlite3_mem_methods_struct_get_xshutdown (a_structure: POINTER): POINTER 
         -- Query for xShutdown field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_xshutdown"
      }"
      end

   sqlite3_mem_methods_struct_get_pappdata (a_structure: POINTER): POINTER 
         -- Query for pAppData field of SQLITE3_MEM_METHODS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_mem_methods_struct_get_pappdata"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_mem_methods"
               }"
               end

end -- class SQLITE3_MEM_METHODS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
