-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GISTRUCTINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_struct_info_find_field (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_struct_info_find_field (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_find_field
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_find_field"
               }"
               end

	g_struct_info_find_method (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_struct_info_find_method (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_find_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_find_method"
               }"
               end

	g_struct_info_get_alignment (an_info: POINTER): like long_unsigned 

		-- function g_struct_info_get_alignment (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_get_alignment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_get_alignment"
               }"
               end

	g_struct_info_get_field (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_struct_info_get_field (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_get_field
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_get_field"
               }"
               end

	g_struct_info_get_method (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_struct_info_get_method (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_get_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_get_method"
               }"
               end

	g_struct_info_get_n_fields (an_info: POINTER): INTEGER 

		-- function g_struct_info_get_n_fields (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_get_n_fields
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_get_n_fields"
               }"
               end

	g_struct_info_get_n_methods (an_info: POINTER): INTEGER 

		-- function g_struct_info_get_n_methods (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_get_n_methods
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_get_n_methods"
               }"
               end

	g_struct_info_get_size (an_info: POINTER): like long_unsigned 

		-- function g_struct_info_get_size (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_get_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_get_size"
               }"
               end

	g_struct_info_is_foreign (an_info: POINTER): INTEGER 

		-- function g_struct_info_is_foreign (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_is_foreign
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_is_foreign"
               }"
               end

	g_struct_info_is_gtype_struct (an_info: POINTER): INTEGER 

		-- function g_struct_info_is_gtype_struct (in `/usr/include/gobject-introspection-1.0/gistructinfo.h')
               -- g_struct_info_is_gtype_struct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_struct_info_is_gtype_struct"
               }"
               end


end -- class GISTRUCTINFO_EXTERNALS
