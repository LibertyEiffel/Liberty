-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SHMINFO_STRUCT
-- Wrapper of struct shminfo defined in file /usr/include/x86_64-linux-gnu/bits/shm.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   shminfo_struct_set_shmmax (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shmmax field of SHMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_set_shmmax"
      }"
      end

   shminfo_struct_set_shmmin (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shmmin field of SHMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_set_shmmin"
      }"
      end

   shminfo_struct_set_shmmni (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shmmni field of SHMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_set_shmmni"
      }"
      end

   shminfo_struct_set_shmseg (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shmseg field of SHMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_set_shmseg"
      }"
      end

   shminfo_struct_set_shmall (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shmall field of SHMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_set_shmall"
      }"
      end

feature {} -- Low-level queries

   shminfo_struct_get_shmmax (a_structure: POINTER): like long_unsigned 
         -- Query for shmmax field of SHMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_get_shmmax"
      }"
      end

   shminfo_struct_get_shmmin (a_structure: POINTER): like long_unsigned 
         -- Query for shmmin field of SHMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_get_shmmin"
      }"
      end

   shminfo_struct_get_shmmni (a_structure: POINTER): like long_unsigned 
         -- Query for shmmni field of SHMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_get_shmmni"
      }"
      end

   shminfo_struct_get_shmseg (a_structure: POINTER): like long_unsigned 
         -- Query for shmseg field of SHMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_get_shmseg"
      }"
      end

   shminfo_struct_get_shmall (a_structure: POINTER): like long_unsigned 
         -- Query for shmall field of SHMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shminfo_struct_get_shmall"
      }"
      end

	-- Unwrapped private field __glibc_reserved1.
	-- Unwrapped private field __glibc_reserved2.
	-- Unwrapped private field __glibc_reserved3.
	-- Unwrapped private field __glibc_reserved4.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_shminfo"
               }"
               end

end -- class SHMINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
