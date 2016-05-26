-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class RPCENT_STRUCT
-- Wrapper of struct rpcent defined in file /usr/include/rpc/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   rpcent_struct_set_r_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for r_name field of RPCENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rpcent_struct_set_r_name"
      }"
      end

   rpcent_struct_set_r_aliases (a_structure: POINTER; a_value: POINTER) 
         -- Setter for r_aliases field of RPCENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rpcent_struct_set_r_aliases"
      }"
      end

   rpcent_struct_set_r_number (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for r_number field of RPCENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rpcent_struct_set_r_number"
      }"
      end

feature {} -- Low-level queries

   rpcent_struct_get_r_name (a_structure: POINTER): POINTER 
         -- Query for r_name field of RPCENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rpcent_struct_get_r_name"
      }"
      end

   rpcent_struct_get_r_aliases (a_structure: POINTER): POINTER 
         -- Query for r_aliases field of RPCENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rpcent_struct_get_r_aliases"
      }"
      end

   rpcent_struct_get_r_number (a_structure: POINTER): INTEGER 
         -- Query for r_number field of RPCENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "rpcent_struct_get_r_number"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_rpcent"
               }"
               end

end -- class RPCENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
