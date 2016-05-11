-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SERVENT_STRUCT
-- Wrapper of struct servent defined in file /usr/include/netdb.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   servent_struct_set_s_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for s_name field of SERVENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_set_s_name"
      }"
      end

   servent_struct_set_s_aliases (a_structure: POINTER; a_value: POINTER) 
         -- Setter for s_aliases field of SERVENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_set_s_aliases"
      }"
      end

   servent_struct_set_s_port (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for s_port field of SERVENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_set_s_port"
      }"
      end

   servent_struct_set_s_proto (a_structure: POINTER; a_value: POINTER) 
         -- Setter for s_proto field of SERVENT_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_set_s_proto"
      }"
      end

feature {} -- Low-level queries

   servent_struct_get_s_name (a_structure: POINTER): POINTER 
         -- Query for s_name field of SERVENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_get_s_name"
      }"
      end

   servent_struct_get_s_aliases (a_structure: POINTER): POINTER 
         -- Query for s_aliases field of SERVENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_get_s_aliases"
      }"
      end

   servent_struct_get_s_port (a_structure: POINTER): INTEGER 
         -- Query for s_port field of SERVENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_get_s_port"
      }"
      end

   servent_struct_get_s_proto (a_structure: POINTER): POINTER 
         -- Query for s_proto field of SERVENT_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "servent_struct_get_s_proto"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_servent"
               }"
               end

end -- class SERVENT_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
