-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TCP_MD5SIG_STRUCT
-- Wrapper of struct tcp_md5sig defined in file /usr/include/netinet/tcp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   tcp_md5sig_struct_set_tcpm_keylen (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for tcpm_keylen field of TCP_MD5SIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_md5sig_struct_set_tcpm_keylen"
      }"
      end

   tcp_md5sig_struct_set_tcpm_key (a_structure: POINTER; a_value: POINTER) 
         -- Setter for tcpm_key field of TCP_MD5SIG_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_md5sig_struct_set_tcpm_key"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field tcpm_addr.
	-- Unwrapped private field __tcpm_pad1.
   tcp_md5sig_struct_get_tcpm_keylen (a_structure: POINTER): NATURAL_16 
         -- Query for tcpm_keylen field of TCP_MD5SIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_md5sig_struct_get_tcpm_keylen"
      }"
      end

	-- Unwrapped private field __tcpm_pad2.
   tcp_md5sig_struct_get_tcpm_key (a_structure: POINTER): POINTER 
         -- Query for tcpm_key field of TCP_MD5SIG_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_md5sig_struct_get_tcpm_key"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tcp_md5sig"
               }"
               end

end -- class TCP_MD5SIG_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
