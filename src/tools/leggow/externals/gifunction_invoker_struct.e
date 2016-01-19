-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIFUNCTION_INVOKER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_INTROSPECTION_TYPES
feature {} -- Low-level setters

   gifunction_invoker_struct_set_native_address (a_structure: POINTER; a_value: POINTER) 
         -- Setter for native_address field of GIFUNCTION_INVOKER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gifunction_invoker_struct_set_native_address"
      }"
      end

   gifunction_invoker_struct_set_padding (a_structure: POINTER; a_value: POINTER) 
         -- Setter for padding field of GIFUNCTION_INVOKER_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gifunction_invoker_struct_set_padding"
      }"
      end

feature {} -- Low-level queries

	-- Unwrappable field cif.
   gifunction_invoker_struct_get_native_address (a_structure: POINTER): POINTER 
         -- Query for native_address field of GIFUNCTION_INVOKER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gifunction_invoker_struct_get_native_address"
      }"
      end

   gifunction_invoker_struct_get_padding (a_structure: POINTER): POINTER 
         -- Query for padding field of GIFUNCTION_INVOKER_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gifunction_invoker_struct_get_padding"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GIFunctionInvoker"
               }"
               end

end -- class GIFUNCTION_INVOKER_STRUCT
-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
