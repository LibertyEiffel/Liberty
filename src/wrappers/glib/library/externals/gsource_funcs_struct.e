-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSOURCE_FUNCS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gsource_funcs_struct_set_prepare (a_structure: POINTER; a_value: POINTER) 
         -- Setter for prepare field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_set_prepare"
      }"
      end

   gsource_funcs_struct_set_check_field (a_structure: POINTER; a_value: POINTER) 
         -- Setter for check field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_set_check_field"
      }"
      end

   gsource_funcs_struct_set_dispatch (a_structure: POINTER; a_value: POINTER) 
         -- Setter for dispatch field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_set_dispatch"
      }"
      end

   gsource_funcs_struct_set_finalize (a_structure: POINTER; a_value: POINTER) 
         -- Setter for finalize field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_set_finalize"
      }"
      end

   gsource_funcs_struct_set_closure_callback (a_structure: POINTER; a_value: POINTER) 
         -- Setter for closure_callback field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_set_closure_callback"
      }"
      end

   gsource_funcs_struct_set_closure_marshal (a_structure: POINTER; a_value: POINTER) 
         -- Setter for closure_marshal field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_set_closure_marshal"
      }"
      end

feature {} -- Low-level queries

   gsource_funcs_struct_get_prepare (a_structure: POINTER): POINTER 
         -- Query for prepare field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_get_prepare"
      }"
      end

   gsource_funcs_struct_get_check_field (a_structure: POINTER): POINTER 
         -- Query for check field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_get_check_field"
      }"
      end

   gsource_funcs_struct_get_dispatch (a_structure: POINTER): POINTER 
         -- Query for dispatch field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_get_dispatch"
      }"
      end

   gsource_funcs_struct_get_finalize (a_structure: POINTER): POINTER 
         -- Query for finalize field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_get_finalize"
      }"
      end

   gsource_funcs_struct_get_closure_callback (a_structure: POINTER): POINTER 
         -- Query for closure_callback field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_get_closure_callback"
      }"
      end

   gsource_funcs_struct_get_closure_marshal (a_structure: POINTER): POINTER 
         -- Query for closure_marshal field of GSOURCE_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_funcs_struct_get_closure_marshal"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GSourceFuncs"
               }"
               end

end -- class GSOURCE_FUNCS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
