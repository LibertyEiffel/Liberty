-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SQLITE3_INDEX_ORDERBY_STRUCT
-- Wrapper of struct sqlite3_index_orderby defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   sqlite3_index_orderby_struct_set_icolumn (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for iColumn field of SQLITE3_INDEX_ORDERBY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_orderby_struct_set_icolumn"
      }"
      end

   sqlite3_index_orderby_struct_set_desc (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for desc field of SQLITE3_INDEX_ORDERBY_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_orderby_struct_set_desc"
      }"
      end

feature {} -- Low-level queries

   sqlite3_index_orderby_struct_get_icolumn (a_structure: POINTER): INTEGER 
         -- Query for iColumn field of SQLITE3_INDEX_ORDERBY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_orderby_struct_get_icolumn"
      }"
      end

   sqlite3_index_orderby_struct_get_desc (a_structure: POINTER): CHARACTER 
         -- Query for desc field of SQLITE3_INDEX_ORDERBY_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sqlite3_index_orderby_struct_get_desc"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sqlite3_index_orderby"
               }"
               end

end -- class SQLITE3_INDEX_ORDERBY_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
