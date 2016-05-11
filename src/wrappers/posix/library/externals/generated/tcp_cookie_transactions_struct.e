-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TCP_COOKIE_TRANSACTIONS_STRUCT
-- Wrapper of struct tcp_cookie_transactions defined in file /usr/include/netinet/tcp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   tcp_cookie_transactions_struct_set_tcpct_flags (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for tcpct_flags field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_set_tcpct_flags"
      }"
      end

   tcp_cookie_transactions_struct_set_tcpct_cookie_desired (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpct_cookie_desired field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_set_tcpct_cookie_desired"
      }"
      end

   tcp_cookie_transactions_struct_set_tcpct_s_data_desired (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for tcpct_s_data_desired field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_set_tcpct_s_data_desired"
      }"
      end

   tcp_cookie_transactions_struct_set_tcpct_used (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for tcpct_used field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_set_tcpct_used"
      }"
      end

   tcp_cookie_transactions_struct_set_tcpct_value (a_structure: POINTER; a_value: POINTER) 
         -- Setter for tcpct_value field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_set_tcpct_value"
      }"
      end

feature {} -- Low-level queries

   tcp_cookie_transactions_struct_get_tcpct_flags (a_structure: POINTER): NATURAL_16 
         -- Query for tcpct_flags field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_get_tcpct_flags"
      }"
      end

	-- Unwrapped private field __tcpct_pad1.
   tcp_cookie_transactions_struct_get_tcpct_cookie_desired (a_structure: POINTER): CHARACTER 
         -- Query for tcpct_cookie_desired field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_get_tcpct_cookie_desired"
      }"
      end

   tcp_cookie_transactions_struct_get_tcpct_s_data_desired (a_structure: POINTER): NATURAL_16 
         -- Query for tcpct_s_data_desired field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_get_tcpct_s_data_desired"
      }"
      end

   tcp_cookie_transactions_struct_get_tcpct_used (a_structure: POINTER): NATURAL_16 
         -- Query for tcpct_used field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_get_tcpct_used"
      }"
      end

   tcp_cookie_transactions_struct_get_tcpct_value (a_structure: POINTER): POINTER 
         -- Query for tcpct_value field of TCP_COOKIE_TRANSACTIONS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_cookie_transactions_struct_get_tcpct_value"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tcp_cookie_transactions"
               }"
               end

end -- class TCP_COOKIE_TRANSACTIONS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
