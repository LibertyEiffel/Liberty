-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GZ_FILE_S_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	ZLIB_TYPES
feature {} -- Low-level setters

   gz_file_s_struct_set_have (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for have field of GZ_FILE_S_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gz_file_s_struct_set_have"
      }"
      end

   gz_file_s_struct_set_next (a_structure: POINTER; a_value: POINTER) 
         -- Setter for next field of GZ_FILE_S_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gz_file_s_struct_set_next"
      }"
      end

   gz_file_s_struct_set_pos (a_structure: POINTER; a_value: like long) 
         -- Setter for pos field of GZ_FILE_S_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gz_file_s_struct_set_pos"
      }"
      end

feature {} -- Low-level queries

   gz_file_s_struct_get_have (a_structure: POINTER): NATURAL 
         -- Query for have field of GZ_FILE_S_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gz_file_s_struct_get_have"
      }"
      end

   gz_file_s_struct_get_next (a_structure: POINTER): POINTER 
         -- Query for next field of GZ_FILE_S_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gz_file_s_struct_get_next"
      }"
      end

   gz_file_s_struct_get_pos (a_structure: POINTER): like long 
         -- Query for pos field of GZ_FILE_S_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gz_file_s_struct_get_pos"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_gzFile_s"
               }"
               end

end -- class GZ_FILE_S_STRUCT
-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
