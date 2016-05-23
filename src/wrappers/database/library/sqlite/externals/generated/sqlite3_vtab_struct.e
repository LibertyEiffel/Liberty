-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_VTAB_STRUCT
-- Wrapper of struct sqlite3_vtab defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_vtab_struct_set_pmodule (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pModule field of SQLITE3_VTAB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_struct_set_pmodule"
      }"
      end

   sqlite3_vtab_struct_set_nref (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for nRef field of SQLITE3_VTAB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_struct_set_nref"
      }"
      end

   sqlite3_vtab_struct_set_zerrmsg (a_structure: POINTER; a_value: POINTER) 
         -- Setter for zErrMsg field of SQLITE3_VTAB_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_struct_set_zerrmsg"
      }"
      end

feature {} -- Low-level queries

   sqlite3_vtab_struct_get_pmodule (a_structure: POINTER): POINTER 
         -- Query for pModule field of SQLITE3_VTAB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_struct_get_pmodule"
      }"
      end

   sqlite3_vtab_struct_get_nref (a_structure: POINTER): INTEGER 
         -- Query for nRef field of SQLITE3_VTAB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_struct_get_nref"
      }"
      end

   sqlite3_vtab_struct_get_zerrmsg (a_structure: POINTER): POINTER 
         -- Query for zErrMsg field of SQLITE3_VTAB_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_struct_get_zerrmsg"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_vtab"
               }"
               end

end -- class SQLITE3_VTAB_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
