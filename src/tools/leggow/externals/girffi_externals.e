-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIRFFI_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_callable_info_free_closure (a_callable_info: POINTER; a_closure: POINTER) 
               -- g_callable_info_free_closure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_free_closure"
               }"
               end

	g_callable_info_prepare_closure (a_callable_info: POINTER; a_cif: POINTER; a_callback: POINTER; an_user_data: POINTER): POINTER 
               -- g_callable_info_prepare_closure
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_callable_info_prepare_closure"
               }"
               end

	g_function_info_prep_invoker (an_info: POINTER; an_invoker: POINTER; an_error: POINTER): INTEGER 
               -- g_function_info_prep_invoker
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_function_info_prep_invoker"
               }"
               end

	g_function_invoker_destroy (an_invoker: POINTER) 
               -- g_function_invoker_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_function_invoker_destroy"
               }"
               end

	g_function_invoker_new_for_address (an_addr: POINTER; an_info: POINTER; an_invoker: POINTER; an_error: POINTER): INTEGER 
               -- g_function_invoker_new_for_address
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_function_invoker_new_for_address"
               }"
               end

	g_type_info_get_ffi_type (an_info: POINTER): POINTER 
               -- g_type_info_get_ffi_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_info_get_ffi_type"
               }"
               end

	gi_type_info_extract_ffi_return_value (a_return_info: POINTER; a_ffi_value: POINTER; an_arg: POINTER) 
               -- gi_type_info_extract_ffi_return_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gi_type_info_extract_ffi_return_value"
               }"
               end

	gi_type_tag_get_ffi_type (a_type_tag: INTEGER; an_is_pointer: INTEGER): POINTER 
               -- gi_type_tag_get_ffi_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gi_type_tag_get_ffi_type"
               }"
               end


end -- class GIRFFI_EXTERNALS
