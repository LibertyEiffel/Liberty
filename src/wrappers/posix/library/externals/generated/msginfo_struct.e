-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class MSGINFO_STRUCT
-- Wrapper of struct msginfo defined in file /usr/include/x86_64-linux-gnu/bits/msq.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   msginfo_struct_set_msgpool (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgpool field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgpool"
      }"
      end

   msginfo_struct_set_msgmap (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgmap field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgmap"
      }"
      end

   msginfo_struct_set_msgmax (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgmax field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgmax"
      }"
      end

   msginfo_struct_set_msgmnb (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgmnb field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgmnb"
      }"
      end

   msginfo_struct_set_msgmni (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgmni field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgmni"
      }"
      end

   msginfo_struct_set_msgssz (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgssz field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgssz"
      }"
      end

   msginfo_struct_set_msgtql (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for msgtql field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgtql"
      }"
      end

   msginfo_struct_set_msgseg (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for msgseg field of MSGINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_set_msgseg"
      }"
      end

feature {} -- Low-level queries

   msginfo_struct_get_msgpool (a_structure: POINTER): INTEGER 
         -- Query for msgpool field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgpool"
      }"
      end

   msginfo_struct_get_msgmap (a_structure: POINTER): INTEGER 
         -- Query for msgmap field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgmap"
      }"
      end

   msginfo_struct_get_msgmax (a_structure: POINTER): INTEGER 
         -- Query for msgmax field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgmax"
      }"
      end

   msginfo_struct_get_msgmnb (a_structure: POINTER): INTEGER 
         -- Query for msgmnb field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgmnb"
      }"
      end

   msginfo_struct_get_msgmni (a_structure: POINTER): INTEGER 
         -- Query for msgmni field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgmni"
      }"
      end

   msginfo_struct_get_msgssz (a_structure: POINTER): INTEGER 
         -- Query for msgssz field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgssz"
      }"
      end

   msginfo_struct_get_msgtql (a_structure: POINTER): INTEGER 
         -- Query for msgtql field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgtql"
      }"
      end

   msginfo_struct_get_msgseg (a_structure: POINTER): NATURAL_16 
         -- Query for msgseg field of MSGINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "msginfo_struct_get_msgseg"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_msginfo"
               }"
               end

end -- class MSGINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
