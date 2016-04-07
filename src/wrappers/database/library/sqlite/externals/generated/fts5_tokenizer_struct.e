-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FTS5_TOKENIZER_STRUCT
-- Wrapper of struct fts5_tokenizer defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   fts5_tokenizer_struct_set_xcreate (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xCreate field of FTS5_TOKENIZER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_tokenizer_struct_set_xcreate"
      }"
      end

   fts5_tokenizer_struct_set_xdelete (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xDelete field of FTS5_TOKENIZER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_tokenizer_struct_set_xdelete"
      }"
      end

   fts5_tokenizer_struct_set_xtokenize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for xTokenize field of FTS5_TOKENIZER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_tokenizer_struct_set_xtokenize"
      }"
      end

feature {} -- Low-level queries

   fts5_tokenizer_struct_get_xcreate (a_structure: POINTER): POINTER 
         -- Query for xCreate field of FTS5_TOKENIZER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_tokenizer_struct_get_xcreate"
      }"
      end

   fts5_tokenizer_struct_get_xdelete (a_structure: POINTER): POINTER 
         -- Query for xDelete field of FTS5_TOKENIZER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_tokenizer_struct_get_xdelete"
      }"
      end

   fts5_tokenizer_struct_get_xtokenize (a_structure: POINTER): POINTER 
         -- Query for xTokenize field of FTS5_TOKENIZER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5_tokenizer_struct_get_xtokenize"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_fts5_tokenizer"
               }"
               end

end -- class FTS5_TOKENIZER_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
