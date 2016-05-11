-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SHM_INFO_STRUCT
-- Wrapper of struct shm_info defined in file /usr/include/x86_64-linux-gnu/bits/shm.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   shm_info_struct_set_used_ids (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for used_ids field of SHM_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_set_used_ids"
      }"
      end

   shm_info_struct_set_shm_tot (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shm_tot field of SHM_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_set_shm_tot"
      }"
      end

   shm_info_struct_set_shm_rss (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shm_rss field of SHM_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_set_shm_rss"
      }"
      end

   shm_info_struct_set_shm_swp (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for shm_swp field of SHM_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_set_shm_swp"
      }"
      end

   shm_info_struct_set_swap_attempts (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for swap_attempts field of SHM_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_set_swap_attempts"
      }"
      end

   shm_info_struct_set_swap_successes (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for swap_successes field of SHM_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_set_swap_successes"
      }"
      end

feature {} -- Low-level queries

   shm_info_struct_get_used_ids (a_structure: POINTER): INTEGER 
         -- Query for used_ids field of SHM_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_get_used_ids"
      }"
      end

   shm_info_struct_get_shm_tot (a_structure: POINTER): like long_unsigned 
         -- Query for shm_tot field of SHM_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_get_shm_tot"
      }"
      end

   shm_info_struct_get_shm_rss (a_structure: POINTER): like long_unsigned 
         -- Query for shm_rss field of SHM_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_get_shm_rss"
      }"
      end

   shm_info_struct_get_shm_swp (a_structure: POINTER): like long_unsigned 
         -- Query for shm_swp field of SHM_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_get_shm_swp"
      }"
      end

   shm_info_struct_get_swap_attempts (a_structure: POINTER): like long_unsigned 
         -- Query for swap_attempts field of SHM_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_get_swap_attempts"
      }"
      end

   shm_info_struct_get_swap_successes (a_structure: POINTER): like long_unsigned 
         -- Query for swap_successes field of SHM_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "shm_info_struct_get_swap_successes"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_shm_info"
               }"
               end

end -- class SHM_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
