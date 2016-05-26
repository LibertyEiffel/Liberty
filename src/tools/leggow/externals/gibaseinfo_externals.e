-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIBASEINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_base_info_equal (an_info1: POINTER; an_info2: POINTER): INTEGER 

		-- function g_base_info_equal (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_equal"
               }"
               end

	g_base_info_get_attribute (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_base_info_get_attribute (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_get_attribute
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_get_attribute"
               }"
               end

	g_base_info_get_container (an_info: POINTER): POINTER 

		-- function g_base_info_get_container (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_get_container
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_get_container"
               }"
               end

	g_base_info_get_name (an_info: POINTER): POINTER 

		-- function g_base_info_get_name (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_get_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_get_name"
               }"
               end

	g_base_info_get_namespace (an_info: POINTER): POINTER 

		-- function g_base_info_get_namespace (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_get_namespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_get_namespace"
               }"
               end

	g_base_info_get_type (an_info: POINTER): INTEGER 

		-- function g_base_info_get_type (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_get_type"
               }"
               end

	g_base_info_get_typelib (an_info: POINTER): POINTER 

		-- function g_base_info_get_typelib (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_get_typelib
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_get_typelib"
               }"
               end

	g_base_info_gtype_get_type: like long_unsigned 

		-- function g_base_info_gtype_get_type (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_gtype_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_gtype_get_type()"
               }"
               end

	g_base_info_is_deprecated (an_info: POINTER): INTEGER 

		-- function g_base_info_is_deprecated (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_is_deprecated
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_is_deprecated"
               }"
               end

	g_base_info_iterate_attributes (an_info: POINTER; an_iterator: POINTER; a_name: POINTER; a_value: POINTER): INTEGER 

		-- function g_base_info_iterate_attributes (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_iterate_attributes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_iterate_attributes"
               }"
               end

	g_base_info_ref (an_info: POINTER): POINTER 

		-- function g_base_info_ref (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_ref"
               }"
               end

	g_base_info_unref (an_info: POINTER) 

		-- function g_base_info_unref (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_base_info_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_base_info_unref"
               }"
               end

	g_info_new (a_type: INTEGER; a_container: POINTER; a_typelib: POINTER; an_offset: NATURAL): POINTER 

		-- function g_info_new (in `/usr/include/gobject-introspection-1.0/gibaseinfo.h')
               -- g_info_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_info_new"
               }"
               end


end -- class GIBASEINFO_EXTERNALS
