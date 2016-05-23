-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_VTAB_CURSOR_STRUCT
-- Wrapper of struct sqlite3_vtab_cursor defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_vtab_cursor_struct_set_pvtab (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pVtab field of SQLITE3_VTAB_CURSOR_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_cursor_struct_set_pvtab"
      }"
      end

feature {} -- Low-level queries

   sqlite3_vtab_cursor_struct_get_pvtab (a_structure: POINTER): POINTER 
         -- Query for pVtab field of SQLITE3_VTAB_CURSOR_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_vtab_cursor_struct_get_pvtab"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_vtab_cursor"
               }"
               end

end -- class SQLITE3_VTAB_CURSOR_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
