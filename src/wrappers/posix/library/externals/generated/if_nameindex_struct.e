-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IF_NAMEINDEX_STRUCT
-- Wrapper of struct if_nameindex defined in file /usr/include/net/if.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   if_nameindex_struct_set_if_index (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for if_index field of IF_NAMEINDEX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "if_nameindex_struct_set_if_index"
      }"
      end

   if_nameindex_struct_set_if_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for if_name field of IF_NAMEINDEX_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "if_nameindex_struct_set_if_name"
      }"
      end

feature {} -- Low-level queries

   if_nameindex_struct_get_if_index (a_structure: POINTER): NATURAL 
         -- Query for if_index field of IF_NAMEINDEX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "if_nameindex_struct_get_if_index"
      }"
      end

   if_nameindex_struct_get_if_name (a_structure: POINTER): POINTER 
         -- Query for if_name field of IF_NAMEINDEX_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "if_nameindex_struct_get_if_name"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_if_nameindex"
               }"
               end

end -- class IF_NAMEINDEX_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
