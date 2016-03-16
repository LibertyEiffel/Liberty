-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DL_SERINFO_STRUCT
-- Wrapper of struct  defined in file /usr/include/dlfcn.h

insert STANDARD_C_LIBRARY_TYPES

	DL_TYPES
feature {} -- Low-level setters

   dl_serinfo_struct_set_dls_size (a_structure: POINTER; a_value: like size_t) 
         -- Setter for dls_size field of DL_SERINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serinfo_struct_set_dls_size"
      }"
      end

   dl_serinfo_struct_set_dls_cnt (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for dls_cnt field of DL_SERINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serinfo_struct_set_dls_cnt"
      }"
      end

   dl_serinfo_struct_set_dls_serpath (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dls_serpath field of DL_SERINFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serinfo_struct_set_dls_serpath"
      }"
      end

feature {} -- Low-level queries

   dl_serinfo_struct_get_dls_size (a_structure: POINTER): like size_t 
         -- Query for dls_size field of DL_SERINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serinfo_struct_get_dls_size"
      }"
      end

   dl_serinfo_struct_get_dls_cnt (a_structure: POINTER): NATURAL 
         -- Query for dls_cnt field of DL_SERINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serinfo_struct_get_dls_cnt"
      }"
      end

   dl_serinfo_struct_get_dls_serpath (a_structure: POINTER): POINTER 
         -- Query for dls_serpath field of DL_SERINFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serinfo_struct_get_dls_serpath"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_Dl_serinfo"
               }"
               end

end -- class DL_SERINFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
