-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTSNAME_STRUCT
-- Wrapper of struct utsname defined in file /usr/include/x86_64-linux-gnu/sys/utsname.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   utsname_struct_set_sysname (a_structure: POINTER; a_value: POINTER) 
         -- Setter for sysname field of UTSNAME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_set_sysname"
      }"
      end

   utsname_struct_set_nodename (a_structure: POINTER; a_value: POINTER) 
         -- Setter for nodename field of UTSNAME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_set_nodename"
      }"
      end

   utsname_struct_set_release (a_structure: POINTER; a_value: POINTER) 
         -- Setter for release field of UTSNAME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_set_release"
      }"
      end

   utsname_struct_set_version (a_structure: POINTER; a_value: POINTER) 
         -- Setter for version field of UTSNAME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_set_version"
      }"
      end

   utsname_struct_set_machine (a_structure: POINTER; a_value: POINTER) 
         -- Setter for machine field of UTSNAME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_set_machine"
      }"
      end

   utsname_struct_set_domainname (a_structure: POINTER; a_value: POINTER) 
         -- Setter for domainname field of UTSNAME_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_set_domainname"
      }"
      end

feature {} -- Low-level queries

   utsname_struct_get_sysname (a_structure: POINTER): POINTER 
         -- Query for sysname field of UTSNAME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_get_sysname"
      }"
      end

   utsname_struct_get_nodename (a_structure: POINTER): POINTER 
         -- Query for nodename field of UTSNAME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_get_nodename"
      }"
      end

   utsname_struct_get_release (a_structure: POINTER): POINTER 
         -- Query for release field of UTSNAME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_get_release"
      }"
      end

   utsname_struct_get_version (a_structure: POINTER): POINTER 
         -- Query for version field of UTSNAME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_get_version"
      }"
      end

   utsname_struct_get_machine (a_structure: POINTER): POINTER 
         -- Query for machine field of UTSNAME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_get_machine"
      }"
      end

   utsname_struct_get_domainname (a_structure: POINTER): POINTER 
         -- Query for domainname field of UTSNAME_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "utsname_struct_get_domainname"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_utsname"
               }"
               end

end -- class UTSNAME_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
