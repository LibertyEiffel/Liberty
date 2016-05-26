-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class FILE_HANDLE_STRUCT
-- Wrapper of struct file_handle defined in file /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   file_handle_struct_set_handle_bytes (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for handle_bytes field of FILE_HANDLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "file_handle_struct_set_handle_bytes"
      }"
      end

   file_handle_struct_set_handle_type (a_structure: POINTER; a_value: INTEGER) 
         -- Setter for handle_type field of FILE_HANDLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "file_handle_struct_set_handle_type"
      }"
      end

   file_handle_struct_set_f_handle (a_structure: POINTER; a_value: POINTER) 
         -- Setter for f_handle field of FILE_HANDLE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "file_handle_struct_set_f_handle"
      }"
      end

feature {} -- Low-level queries

   file_handle_struct_get_handle_bytes (a_structure: POINTER): NATURAL 
         -- Query for handle_bytes field of FILE_HANDLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "file_handle_struct_get_handle_bytes"
      }"
      end

   file_handle_struct_get_handle_type (a_structure: POINTER): INTEGER 
         -- Query for handle_type field of FILE_HANDLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "file_handle_struct_get_handle_type"
      }"
      end

   file_handle_struct_get_f_handle (a_structure: POINTER): POINTER 
         -- Query for f_handle field of FILE_HANDLE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "file_handle_struct_get_f_handle"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_file_handle"
               }"
               end

end -- class FILE_HANDLE_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
