-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FUNMAP_STRUCT
-- Wrapper of struct _funmap defined in file /usr/include/readline/readline.h

insert STANDARD_C_LIBRARY_TYPES

	READLINE_TYPES
feature {} -- Low-level setters

   funmap_struct_set_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for name field of FUNMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "funmap_struct_set_name"
      }"
      end

   funmap_struct_set_function (a_structure: POINTER; a_value: POINTER) 
         -- Setter for function field of FUNMAP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "funmap_struct_set_function"
      }"
      end

feature {} -- Low-level queries

   funmap_struct_get_name (a_structure: POINTER): POINTER 
         -- Query for name field of FUNMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "funmap_struct_get_name"
      }"
      end

   funmap_struct_get_function (a_structure: POINTER): POINTER 
         -- Query for function field of FUNMAP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "funmap_struct_get_function"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_funmap"
               }"
               end

end -- class FUNMAP_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
