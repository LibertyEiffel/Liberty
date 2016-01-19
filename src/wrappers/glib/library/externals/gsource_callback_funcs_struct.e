-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GSOURCE_CALLBACK_FUNCS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

   gsource_callback_funcs_struct_set_ref (a_structure: POINTER; a_value: POINTER) 
         -- Setter for ref field of GSOURCE_CALLBACK_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_callback_funcs_struct_set_ref"
      }"
      end

   gsource_callback_funcs_struct_set_unref (a_structure: POINTER; a_value: POINTER) 
         -- Setter for unref field of GSOURCE_CALLBACK_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_callback_funcs_struct_set_unref"
      }"
      end

   gsource_callback_funcs_struct_set_get (a_structure: POINTER; a_value: POINTER) 
         -- Setter for get field of GSOURCE_CALLBACK_FUNCS_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_callback_funcs_struct_set_get"
      }"
      end

feature {} -- Low-level queries

   gsource_callback_funcs_struct_get_ref (a_structure: POINTER): POINTER 
         -- Query for ref field of GSOURCE_CALLBACK_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_callback_funcs_struct_get_ref"
      }"
      end

   gsource_callback_funcs_struct_get_unref (a_structure: POINTER): POINTER 
         -- Query for unref field of GSOURCE_CALLBACK_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_callback_funcs_struct_get_unref"
      }"
      end

   gsource_callback_funcs_struct_get_get (a_structure: POINTER): POINTER 
         -- Query for get field of GSOURCE_CALLBACK_FUNCS_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gsource_callback_funcs_struct_get_get"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GSourceCallbackFuncs"
               }"
               end

end -- class GSOURCE_CALLBACK_FUNCS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
