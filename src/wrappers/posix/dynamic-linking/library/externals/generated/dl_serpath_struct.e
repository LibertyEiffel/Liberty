-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DL_SERPATH_STRUCT
-- Wrapper of struct  defined in file /usr/include/dlfcn.h

insert STANDARD_C_LIBRARY_TYPES

	DL_TYPES
feature {} -- Low-level setters

   dl_serpath_struct_set_dls_name (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dls_name field of DL_SERPATH_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serpath_struct_set_dls_name"
      }"
      end

   dl_serpath_struct_set_dls_flags (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for dls_flags field of DL_SERPATH_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serpath_struct_set_dls_flags"
      }"
      end

feature {} -- Low-level queries

   dl_serpath_struct_get_dls_name (a_structure: POINTER): POINTER 
         -- Query for dls_name field of DL_SERPATH_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serpath_struct_get_dls_name"
      }"
      end

   dl_serpath_struct_get_dls_flags (a_structure: POINTER): NATURAL 
         -- Query for dls_flags field of DL_SERPATH_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "dl_serpath_struct_get_dls_flags"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_Dl_serpath"
               }"
               end

end -- class DL_SERPATH_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
