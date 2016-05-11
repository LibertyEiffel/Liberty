-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SEMBUF_STRUCT
-- Wrapper of struct sembuf defined in file /usr/include/x86_64-linux-gnu/sys/sem.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   sembuf_struct_set_sem_num (a_structure: POINTER; a_value: NATURAL_16) 
         -- Setter for sem_num field of SEMBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sembuf_struct_set_sem_num"
      }"
      end

   sembuf_struct_set_sem_op (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for sem_op field of SEMBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sembuf_struct_set_sem_op"
      }"
      end

   sembuf_struct_set_sem_flg (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for sem_flg field of SEMBUF_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sembuf_struct_set_sem_flg"
      }"
      end

feature {} -- Low-level queries

   sembuf_struct_get_sem_num (a_structure: POINTER): NATURAL_16 
         -- Query for sem_num field of SEMBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sembuf_struct_get_sem_num"
      }"
      end

   sembuf_struct_get_sem_op (a_structure: POINTER): INTEGER_16 
         -- Query for sem_op field of SEMBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sembuf_struct_get_sem_op"
      }"
      end

   sembuf_struct_get_sem_flg (a_structure: POINTER): INTEGER_16 
         -- Query for sem_flg field of SEMBUF_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "sembuf_struct_get_sem_flg"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_sembuf"
               }"
               end

end -- class SEMBUF_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
