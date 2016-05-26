-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class PROTOENT_STRUCT
-- Wrapper of struct protoent defined in file /usr/include/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   protoent_struct_set_p_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for p_name field of PROTOENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "protoent_struct_set_p_name"
      }"
      end

   protoent_struct_set_p_aliases (a_structure: POINTER; a_value: POINTER) 
         -- Setter for p_aliases field of PROTOENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "protoent_struct_set_p_aliases"
      }"
      end

   protoent_struct_set_p_proto (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for p_proto field of PROTOENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "protoent_struct_set_p_proto"
      }"
      end

feature {} -- Low-level queries

   protoent_struct_get_p_name (a_structure: POINTER): POINTER 
         -- Query for p_name field of PROTOENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "protoent_struct_get_p_name"
      }"
      end

   protoent_struct_get_p_aliases (a_structure: POINTER): POINTER 
         -- Query for p_aliases field of PROTOENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "protoent_struct_get_p_aliases"
      }"
      end

   protoent_struct_get_p_proto (a_structure: POINTER): INTEGER 
         -- Query for p_proto field of PROTOENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "protoent_struct_get_p_proto"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_protoent"
               }"
               end

end -- class PROTOENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
