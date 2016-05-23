-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FTS5_API_STRUCT
-- Wrapper of struct fts5_api defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   fts5_api_struct_set_iversion (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for iVersion field of FTS5_API_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_set_iversion"
      }"
      end

   fts5_api_struct_set_xcreatetokenizer (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCreateTokenizer field of FTS5_API_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_set_xcreatetokenizer"
      }"
      end

   fts5_api_struct_set_xfindtokenizer (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xFindTokenizer field of FTS5_API_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_set_xfindtokenizer"
      }"
      end

   fts5_api_struct_set_xcreatefunction (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCreateFunction field of FTS5_API_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_set_xcreatefunction"
      }"
      end

feature {} -- Low-level queries

   fts5_api_struct_get_iversion (a_structure: POINTER): INTEGER 
         -- Query for iVersion field of FTS5_API_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_get_iversion"
      }"
      end

   fts5_api_struct_get_xcreatetokenizer (a_structure: POINTER): POINTER 
         -- Query for xCreateTokenizer field of FTS5_API_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_get_xcreatetokenizer"
      }"
      end

   fts5_api_struct_get_xfindtokenizer (a_structure: POINTER): POINTER 
         -- Query for xFindTokenizer field of FTS5_API_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_get_xfindtokenizer"
      }"
      end

   fts5_api_struct_get_xcreatefunction (a_structure: POINTER): POINTER 
         -- Query for xCreateFunction field of FTS5_API_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_api_struct_get_xcreatefunction"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_fts5_api"
               }"
               end

end -- class FTS5_API_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
