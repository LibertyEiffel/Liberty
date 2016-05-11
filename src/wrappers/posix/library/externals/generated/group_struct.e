-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GROUP_STRUCT
-- Wrapper of struct group defined in file /usr/include/grp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   group_struct_set_gr_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gr_name field of GROUP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_set_gr_name"
      }"
      end

   group_struct_set_gr_passwd (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gr_passwd field of GROUP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_set_gr_passwd"
      }"
      end

   group_struct_set_gr_gid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for gr_gid field of GROUP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_set_gr_gid"
      }"
      end

   group_struct_set_gr_mem (a_structure: POINTER; a_value: POINTER) 
         -- Setter for gr_mem field of GROUP_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_set_gr_mem"
      }"
      end

feature {} -- Low-level queries

   group_struct_get_gr_name (a_structure: POINTER): POINTER 
         -- Query for gr_name field of GROUP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_get_gr_name"
      }"
      end

   group_struct_get_gr_passwd (a_structure: POINTER): POINTER 
         -- Query for gr_passwd field of GROUP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_get_gr_passwd"
      }"
      end

   group_struct_get_gr_gid (a_structure: POINTER): NATURAL 
         -- Query for gr_gid field of GROUP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_get_gr_gid"
      }"
      end

   group_struct_get_gr_mem (a_structure: POINTER): POINTER 
         -- Query for gr_mem field of GROUP_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "group_struct_get_gr_mem"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_group"
               }"
               end

end -- class GROUP_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
