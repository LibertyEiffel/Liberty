-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SHMID_DS_STRUCT
-- Wrapper of struct shmid_ds defined in file /usr/include/x86_64-linux-gnu/bits/shm.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   shmid_ds_struct_set_shm_segsz (a_structure: POINTER; a_value: like size_t) 
         -- Setter for shm_segsz field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_segsz"
      }"
      end

   shmid_ds_struct_set_shm_atime (a_structure: POINTER; a_value: like long) 
         -- Setter for shm_atime field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_atime"
      }"
      end

   shmid_ds_struct_set_shm_dtime (a_structure: POINTER; a_value: like long) 
         -- Setter for shm_dtime field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_dtime"
      }"
      end

   shmid_ds_struct_set_shm_ctime (a_structure: POINTER; a_value: like long) 
         -- Setter for shm_ctime field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_ctime"
      }"
      end

   shmid_ds_struct_set_shm_cpid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for shm_cpid field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_cpid"
      }"
      end

   shmid_ds_struct_set_shm_lpid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for shm_lpid field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_lpid"
      }"
      end

   shmid_ds_struct_set_shm_nattch (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shm_nattch field of SHMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_set_shm_nattch"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field shm_perm.
   shmid_ds_struct_get_shm_segsz (a_structure: POINTER): like size_t 
         -- Query for shm_segsz field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_segsz"
      }"
      end

   shmid_ds_struct_get_shm_atime (a_structure: POINTER): like long 
         -- Query for shm_atime field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_atime"
      }"
      end

   shmid_ds_struct_get_shm_dtime (a_structure: POINTER): like long 
         -- Query for shm_dtime field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_dtime"
      }"
      end

   shmid_ds_struct_get_shm_ctime (a_structure: POINTER): like long 
         -- Query for shm_ctime field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_ctime"
      }"
      end

   shmid_ds_struct_get_shm_cpid (a_structure: POINTER): INTEGER 
         -- Query for shm_cpid field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_cpid"
      }"
      end

   shmid_ds_struct_get_shm_lpid (a_structure: POINTER): INTEGER 
         -- Query for shm_lpid field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_lpid"
      }"
      end

   shmid_ds_struct_get_shm_nattch (a_structure: POINTER): like long_unsigned 
         -- Query for shm_nattch field of SHMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shmid_ds_struct_get_shm_nattch"
      }"
      end

	-- Unwrapped private field __glibc_reserved4.
	-- Unwrapped private field __glibc_reserved5.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_shmid_ds"
               }"
               end

end -- class SHMID_DS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
