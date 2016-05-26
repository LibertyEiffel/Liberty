-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DIRENT64_STRUCT
-- Wrapper of struct dirent64 defined in file /usr/include/x86_64-linux-gnu/bits/dirent.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   dirent64_struct_set_d_ino (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for d_ino field of DIRENT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_set_d_ino"
      }"
      end

   dirent64_struct_set_d_off (a_structure: POINTER; a_value: like long) 
         -- Setter for d_off field of DIRENT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_set_d_off"
      }"
      end

   dirent64_struct_set_d_reclen (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for d_reclen field of DIRENT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_set_d_reclen"
      }"
      end

   dirent64_struct_set_d_type (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for d_type field of DIRENT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_set_d_type"
      }"
      end

   dirent64_struct_set_d_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for d_name field of DIRENT64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_set_d_name"
      }"
      end

feature {} -- Low-level queries

   dirent64_struct_get_d_ino (a_structure: POINTER): like long_unsigned 
         -- Query for d_ino field of DIRENT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_get_d_ino"
      }"
      end

   dirent64_struct_get_d_off (a_structure: POINTER): like long 
         -- Query for d_off field of DIRENT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_get_d_off"
      }"
      end

   dirent64_struct_get_d_reclen (a_structure: POINTER): NATURAL_16 
         -- Query for d_reclen field of DIRENT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_get_d_reclen"
      }"
      end

   dirent64_struct_get_d_type (a_structure: POINTER): CHARACTER 
         -- Query for d_type field of DIRENT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_get_d_type"
      }"
      end

   dirent64_struct_get_d_name (a_structure: POINTER): POINTER 
         -- Query for d_name field of DIRENT64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dirent64_struct_get_d_name"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_dirent64"
               }"
               end

end -- class DIRENT64_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
