-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBINDING_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_binding_flags_get_type: like long_unsigned 
               -- g_binding_flags_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_flags_get_type"
               }"
               end

	g_binding_get_flags (a_binding: POINTER): INTEGER 
               -- g_binding_get_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_get_flags"
               }"
               end

	g_binding_get_source (a_binding: POINTER): POINTER 
               -- g_binding_get_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_get_source"
               }"
               end

	g_binding_get_source_property (a_binding: POINTER): POINTER 
               -- g_binding_get_source_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_get_source_property"
               }"
               end

	g_binding_get_target (a_binding: POINTER): POINTER 
               -- g_binding_get_target
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_get_target"
               }"
               end

	g_binding_get_target_property (a_binding: POINTER): POINTER 
               -- g_binding_get_target_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_get_target_property"
               }"
               end

	g_binding_get_type: like long_unsigned 
               -- g_binding_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_get_type"
               }"
               end

	g_binding_unbind (a_binding: POINTER) 
               -- g_binding_unbind
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_binding_unbind"
               }"
               end

	g_object_bind_property (a_source: POINTER; a_source_property: POINTER; a_target: POINTER; a_target_property: POINTER; a_flags: INTEGER): POINTER 
               -- g_object_bind_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_bind_property"
               }"
               end

	g_object_bind_property_full (a_source: POINTER; a_source_property: POINTER; a_target: POINTER; a_target_property: POINTER; a_flags: INTEGER; a_transform_to: POINTER; a_transform_from: POINTER; an_user_data: POINTER; a_notify: POINTER): POINTER 
               -- g_object_bind_property_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_bind_property_full"
               }"
               end

	g_object_bind_property_with_closures (a_source: POINTER; a_source_property: POINTER; a_target: POINTER; a_target_property: POINTER; a_flags: INTEGER; a_transform_to: POINTER; a_transform_from: POINTER): POINTER 
               -- g_object_bind_property_with_closures
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_object_bind_property_with_closures"
               }"
               end


end -- class GBINDING_EXTERNALS
