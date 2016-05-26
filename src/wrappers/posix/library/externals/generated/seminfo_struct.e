-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SEMINFO_STRUCT
-- Wrapper of struct seminfo defined in file /usr/include/x86_64-linux-gnu/bits/sem.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   seminfo_struct_set_semmap (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semmap field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semmap"
      }"
      end

   seminfo_struct_set_semmni (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semmni field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semmni"
      }"
      end

   seminfo_struct_set_semmns (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semmns field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semmns"
      }"
      end

   seminfo_struct_set_semmnu (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semmnu field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semmnu"
      }"
      end

   seminfo_struct_set_semmsl (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semmsl field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semmsl"
      }"
      end

   seminfo_struct_set_semopm (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semopm field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semopm"
      }"
      end

   seminfo_struct_set_semume (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semume field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semume"
      }"
      end

   seminfo_struct_set_semusz (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semusz field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semusz"
      }"
      end

   seminfo_struct_set_semvmx (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semvmx field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semvmx"
      }"
      end

   seminfo_struct_set_semaem (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for semaem field of SEMINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_set_semaem"
      }"
      end

feature {} -- Low-level queries

   seminfo_struct_get_semmap (a_structure: POINTER): INTEGER 
         -- Query for semmap field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semmap"
      }"
      end

   seminfo_struct_get_semmni (a_structure: POINTER): INTEGER 
         -- Query for semmni field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semmni"
      }"
      end

   seminfo_struct_get_semmns (a_structure: POINTER): INTEGER 
         -- Query for semmns field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semmns"
      }"
      end

   seminfo_struct_get_semmnu (a_structure: POINTER): INTEGER 
         -- Query for semmnu field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semmnu"
      }"
      end

   seminfo_struct_get_semmsl (a_structure: POINTER): INTEGER 
         -- Query for semmsl field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semmsl"
      }"
      end

   seminfo_struct_get_semopm (a_structure: POINTER): INTEGER 
         -- Query for semopm field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semopm"
      }"
      end

   seminfo_struct_get_semume (a_structure: POINTER): INTEGER 
         -- Query for semume field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semume"
      }"
      end

   seminfo_struct_get_semusz (a_structure: POINTER): INTEGER 
         -- Query for semusz field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semusz"
      }"
      end

   seminfo_struct_get_semvmx (a_structure: POINTER): INTEGER 
         -- Query for semvmx field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semvmx"
      }"
      end

   seminfo_struct_get_semaem (a_structure: POINTER): INTEGER 
         -- Query for semaem field of SEMINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "seminfo_struct_get_semaem"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_seminfo"
               }"
               end

end -- class SEMINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
