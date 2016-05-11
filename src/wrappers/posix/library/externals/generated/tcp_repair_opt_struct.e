-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TCP_REPAIR_OPT_STRUCT
-- Wrapper of struct tcp_repair_opt defined in file /usr/include/netinet/tcp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   tcp_repair_opt_struct_set_opt_code (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for opt_code field of TCP_REPAIR_OPT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_repair_opt_struct_set_opt_code"
      }"
      end

   tcp_repair_opt_struct_set_opt_val (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for opt_val field of TCP_REPAIR_OPT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_repair_opt_struct_set_opt_val"
      }"
      end

feature {} -- Low-level queries

   tcp_repair_opt_struct_get_opt_code (a_structure: POINTER): NATURAL 
         -- Query for opt_code field of TCP_REPAIR_OPT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_repair_opt_struct_get_opt_code"
      }"
      end

   tcp_repair_opt_struct_get_opt_val (a_structure: POINTER): NATURAL 
         -- Query for opt_val field of TCP_REPAIR_OPT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_repair_opt_struct_get_opt_val"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tcp_repair_opt"
               }"
               end

end -- class TCP_REPAIR_OPT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
