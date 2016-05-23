-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FTS5PHRASE_ITER_STRUCT
-- Wrapper of struct Fts5PhraseIter defined in file /usr/include/sqlite3.h

insert STANDARD_C_LIBRARY_TYPES

	SQLITE_TYPES
feature {} -- Low-level setters

   fts5phrase_iter_struct_set_a (a_structure: POINTER; a_value: POINTER) 
         -- Setter for a field of FTS5PHRASE_ITER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5phrase_iter_struct_set_a"
      }"
      end

   fts5phrase_iter_struct_set_b (a_structure: POINTER; a_value: POINTER) 
         -- Setter for b field of FTS5PHRASE_ITER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5phrase_iter_struct_set_b"
      }"
      end

feature {} -- Low-level queries

   fts5phrase_iter_struct_get_a (a_structure: POINTER): POINTER 
         -- Query for a field of FTS5PHRASE_ITER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5phrase_iter_struct_get_a"
      }"
      end

   fts5phrase_iter_struct_get_b (a_structure: POINTER): POINTER 
         -- Query for b field of FTS5PHRASE_ITER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "fts5phrase_iter_struct_get_b"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_fts5phrase_iter"
               }"
               end

end -- class FTS5PHRASE_ITER_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
