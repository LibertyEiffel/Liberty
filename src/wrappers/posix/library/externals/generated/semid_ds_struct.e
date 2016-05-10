-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SEMID_DS_STRUCT
-- Wrapper of struct semid_ds defined in file /usr/include/x86_64-linux-gnu/bits/sem.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   semid_ds_struct_set_sem_otime (a_structure: POINTER; a_value: like long) 
         -- Setter for sem_otime field of SEMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "semid_ds_struct_set_sem_otime"
      }"
      end

   semid_ds_struct_set_sem_ctime (a_structure: POINTER; a_value: like long) 
         -- Setter for sem_ctime field of SEMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "semid_ds_struct_set_sem_ctime"
      }"
      end

   semid_ds_struct_set_sem_nsems (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for sem_nsems field of SEMID_DS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "semid_ds_struct_set_sem_nsems"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field sem_perm.
   semid_ds_struct_get_sem_otime (a_structure: POINTER): like long 
         -- Query for sem_otime field of SEMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "semid_ds_struct_get_sem_otime"
      }"
      end

	-- Unwrapped private field __glibc_reserved1.
   semid_ds_struct_get_sem_ctime (a_structure: POINTER): like long 
         -- Query for sem_ctime field of SEMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "semid_ds_struct_get_sem_ctime"
      }"
      end

	-- Unwrapped private field __glibc_reserved2.
   semid_ds_struct_get_sem_nsems (a_structure: POINTER): like long_unsigned 
         -- Query for sem_nsems field of SEMID_DS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "semid_ds_struct_get_sem_nsems"
      }"
      end

	-- Unwrapped private field __glibc_reserved3.
	-- Unwrapped private field __glibc_reserved4.
feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_semid_ds"
               }"
               end

end -- class SEMID_DS_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
