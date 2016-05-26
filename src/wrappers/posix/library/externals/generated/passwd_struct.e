-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class PASSWD_STRUCT
-- Wrapper of struct passwd defined in file /usr/include/pwd.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   passwd_struct_set_pw_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pw_name field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_name"
      }"
      end

   passwd_struct_set_pw_passwd (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pw_passwd field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_passwd"
      }"
      end

   passwd_struct_set_pw_uid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for pw_uid field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_uid"
      }"
      end

   passwd_struct_set_pw_gid (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for pw_gid field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_gid"
      }"
      end

   passwd_struct_set_pw_gecos (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pw_gecos field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_gecos"
      }"
      end

   passwd_struct_set_pw_dir (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pw_dir field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_dir"
      }"
      end

   passwd_struct_set_pw_shell (a_structure: POINTER; a_value: POINTER) 
         -- Setter for pw_shell field of PASSWD_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_set_pw_shell"
      }"
      end

feature {} -- Low-level queries

   passwd_struct_get_pw_name (a_structure: POINTER): POINTER 
         -- Query for pw_name field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_name"
      }"
      end

   passwd_struct_get_pw_passwd (a_structure: POINTER): POINTER 
         -- Query for pw_passwd field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_passwd"
      }"
      end

   passwd_struct_get_pw_uid (a_structure: POINTER): NATURAL 
         -- Query for pw_uid field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_uid"
      }"
      end

   passwd_struct_get_pw_gid (a_structure: POINTER): NATURAL 
         -- Query for pw_gid field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_gid"
      }"
      end

   passwd_struct_get_pw_gecos (a_structure: POINTER): POINTER 
         -- Query for pw_gecos field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_gecos"
      }"
      end

   passwd_struct_get_pw_dir (a_structure: POINTER): POINTER 
         -- Query for pw_dir field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_dir"
      }"
      end

   passwd_struct_get_pw_shell (a_structure: POINTER): POINTER 
         -- Query for pw_shell field of PASSWD_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "passwd_struct_get_pw_shell"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_passwd"
               }"
               end

end -- class PASSWD_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
