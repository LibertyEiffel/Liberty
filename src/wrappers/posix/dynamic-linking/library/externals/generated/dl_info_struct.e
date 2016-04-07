-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DL_INFO_STRUCT
-- Wrapper of struct  defined in file /usr/include/dlfcn.h

insert STANDARD_C_LIBRARY_TYPES

	DL_TYPES
feature {} -- Low-level setters

   dl_info_struct_set_dli_fname (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dli_fname field of DL_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_set_dli_fname"
      }"
      end

   dl_info_struct_set_dli_fbase (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dli_fbase field of DL_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_set_dli_fbase"
      }"
      end

   dl_info_struct_set_dli_sname (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dli_sname field of DL_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_set_dli_sname"
      }"
      end

   dl_info_struct_set_dli_saddr (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dli_saddr field of DL_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_set_dli_saddr"
      }"
      end

feature {} -- Low-level queries

   dl_info_struct_get_dli_fname (a_structure: POINTER): POINTER 
         -- Query for dli_fname field of DL_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_get_dli_fname"
      }"
      end

   dl_info_struct_get_dli_fbase (a_structure: POINTER): POINTER 
         -- Query for dli_fbase field of DL_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_get_dli_fbase"
      }"
      end

   dl_info_struct_get_dli_sname (a_structure: POINTER): POINTER 
         -- Query for dli_sname field of DL_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_get_dli_sname"
      }"
      end

   dl_info_struct_get_dli_saddr (a_structure: POINTER): POINTER 
         -- Query for dli_saddr field of DL_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_info_struct_get_dli_saddr"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_Dl_info"
               }"
               end

end -- class DL_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
