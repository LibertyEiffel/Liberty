-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FLOCK64_STRUCT
-- Wrapper of struct flock64 defined in file /usr/include/x86_64-linux-gnu/bits/fcntl.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   flock64_struct_set_l_type (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for l_type field of FLOCK64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_set_l_type"
      }"
      end

   flock64_struct_set_l_whence (a_structure: POINTER; a_value: INTEGER_16) 
         -- Setter for l_whence field of FLOCK64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_set_l_whence"
      }"
      end

   flock64_struct_set_l_start (a_structure: POINTER; a_value: like long) 
         -- Setter for l_start field of FLOCK64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_set_l_start"
      }"
      end

   flock64_struct_set_l_len (a_structure: POINTER; a_value: like long) 
         -- Setter for l_len field of FLOCK64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_set_l_len"
      }"
      end

   flock64_struct_set_l_pid (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for l_pid field of FLOCK64_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_set_l_pid"
      }"
      end

feature {} -- Low-level queries

   flock64_struct_get_l_type (a_structure: POINTER): INTEGER_16 
         -- Query for l_type field of FLOCK64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_get_l_type"
      }"
      end

   flock64_struct_get_l_whence (a_structure: POINTER): INTEGER_16 
         -- Query for l_whence field of FLOCK64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_get_l_whence"
      }"
      end

   flock64_struct_get_l_start (a_structure: POINTER): like long 
         -- Query for l_start field of FLOCK64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_get_l_start"
      }"
      end

   flock64_struct_get_l_len (a_structure: POINTER): like long 
         -- Query for l_len field of FLOCK64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_get_l_len"
      }"
      end

   flock64_struct_get_l_pid (a_structure: POINTER): INTEGER 
         -- Query for l_pid field of FLOCK64_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "flock64_struct_get_l_pid"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_flock64"
               }"
               end

end -- class FLOCK64_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
