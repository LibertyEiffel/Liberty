-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_FILE_STRUCT
-- Wrapper of struct sqlite3_file defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_file_struct_set_pmethods (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pMethods field of SQLITE3_FILE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_file_struct_set_pmethods"
      }"
      end

feature {} -- Low-level queries

   sqlite3_file_struct_get_pmethods (a_structure: POINTER): POINTER 
         -- Query for pMethods field of SQLITE3_FILE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_file_struct_get_pmethods"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_file"
               }"
               end

end -- class SQLITE3_FILE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
