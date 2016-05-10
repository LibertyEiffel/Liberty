-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class STRIOCTL_STRUCT
-- Wrapper of struct strioctl defined in file /usr/include/x86_64-linux-gnu/bits/stropts.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   strioctl_struct_set_ic_cmd (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ic_cmd field of STRIOCTL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_set_ic_cmd"
      }"
      end

   strioctl_struct_set_ic_timout (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ic_timout field of STRIOCTL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_set_ic_timout"
      }"
      end

   strioctl_struct_set_ic_len (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for ic_len field of STRIOCTL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_set_ic_len"
      }"
      end

   strioctl_struct_set_ic_dp (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ic_dp field of STRIOCTL_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_set_ic_dp"
      }"
      end

feature {} -- Low-level queries

   strioctl_struct_get_ic_cmd (a_structure: POINTER): INTEGER 
         -- Query for ic_cmd field of STRIOCTL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_get_ic_cmd"
      }"
      end

   strioctl_struct_get_ic_timout (a_structure: POINTER): INTEGER 
         -- Query for ic_timout field of STRIOCTL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_get_ic_timout"
      }"
      end

   strioctl_struct_get_ic_len (a_structure: POINTER): INTEGER 
         -- Query for ic_len field of STRIOCTL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_get_ic_len"
      }"
      end

   strioctl_struct_get_ic_dp (a_structure: POINTER): POINTER 
         -- Query for ic_dp field of STRIOCTL_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "strioctl_struct_get_ic_dp"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_strioctl"
               }"
               end

end -- class STRIOCTL_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
