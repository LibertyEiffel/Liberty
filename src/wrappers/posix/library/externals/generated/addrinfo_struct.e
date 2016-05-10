-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class ADDRINFO_STRUCT
-- Wrapper of struct addrinfo defined in file /usr/include/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   addrinfo_struct_set_ai_flags (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ai_flags field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_flags"
      }"
      end

   addrinfo_struct_set_ai_family (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ai_family field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_family"
      }"
      end

   addrinfo_struct_set_ai_socktype (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ai_socktype field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_socktype"
      }"
      end

   addrinfo_struct_set_ai_protocol (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ai_protocol field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_protocol"
      }"
      end

   addrinfo_struct_set_ai_addrlen (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for ai_addrlen field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_addrlen"
      }"
      end

   addrinfo_struct_set_ai_addr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ai_addr field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_addr"
      }"
      end

   addrinfo_struct_set_ai_canonname (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ai_canonname field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_canonname"
      }"
      end

   addrinfo_struct_set_ai_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ai_next field of ADDRINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_set_ai_next"
      }"
      end

feature {} -- Low-level queries

   addrinfo_struct_get_ai_flags (a_structure: POINTER): INTEGER 
         -- Query for ai_flags field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_flags"
      }"
      end

   addrinfo_struct_get_ai_family (a_structure: POINTER): INTEGER 
         -- Query for ai_family field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_family"
      }"
      end

   addrinfo_struct_get_ai_socktype (a_structure: POINTER): INTEGER 
         -- Query for ai_socktype field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_socktype"
      }"
      end

   addrinfo_struct_get_ai_protocol (a_structure: POINTER): INTEGER 
         -- Query for ai_protocol field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_protocol"
      }"
      end

   addrinfo_struct_get_ai_addrlen (a_structure: POINTER): NATURAL 
         -- Query for ai_addrlen field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_addrlen"
      }"
      end

   addrinfo_struct_get_ai_addr (a_structure: POINTER): POINTER 
         -- Query for ai_addr field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_addr"
      }"
      end

   addrinfo_struct_get_ai_canonname (a_structure: POINTER): POINTER 
         -- Query for ai_canonname field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_canonname"
      }"
      end

   addrinfo_struct_get_ai_next (a_structure: POINTER): POINTER 
         -- Query for ai_next field of ADDRINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "addrinfo_struct_get_ai_next"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_addrinfo"
               }"
               end

end -- class ADDRINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
