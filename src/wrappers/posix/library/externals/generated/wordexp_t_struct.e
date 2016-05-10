-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class WORDEXP_T_STRUCT
-- Wrapper of struct  defined in file /usr/include/wordexp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   wordexp_t_struct_set_we_wordc (a_structure: POINTER; a_value: like size_t) 
         -- Setter for we_wordc field of WORDEXP_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wordexp_t_struct_set_we_wordc"
      }"
      end

   wordexp_t_struct_set_we_wordv (a_structure: POINTER; a_value: POINTER) 
         -- Setter for we_wordv field of WORDEXP_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wordexp_t_struct_set_we_wordv"
      }"
      end

   wordexp_t_struct_set_we_offs (a_structure: POINTER; a_value: like size_t) 
         -- Setter for we_offs field of WORDEXP_T_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wordexp_t_struct_set_we_offs"
      }"
      end

feature {} -- Low-level queries

   wordexp_t_struct_get_we_wordc (a_structure: POINTER): like size_t 
         -- Query for we_wordc field of WORDEXP_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wordexp_t_struct_get_we_wordc"
      }"
      end

   wordexp_t_struct_get_we_wordv (a_structure: POINTER): POINTER 
         -- Query for we_wordv field of WORDEXP_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wordexp_t_struct_get_we_wordv"
      }"
      end

   wordexp_t_struct_get_we_offs (a_structure: POINTER): like size_t 
         -- Query for we_offs field of WORDEXP_T_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "wordexp_t_struct_get_we_offs"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_wordexp_t"
               }"
               end

end -- class WORDEXP_T_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
