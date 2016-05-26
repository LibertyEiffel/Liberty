-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIUNIONINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_union_info_find_method (an_info: POINTER; a_name: POINTER): POINTER 

		-- function g_union_info_find_method (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_find_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_find_method"
               }"
               end

	g_union_info_get_alignment (an_info: POINTER): like long_unsigned 

		-- function g_union_info_get_alignment (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_alignment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_alignment"
               }"
               end

	g_union_info_get_discriminator (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_union_info_get_discriminator (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_discriminator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_discriminator"
               }"
               end

	g_union_info_get_discriminator_offset (an_info: POINTER): INTEGER 

		-- function g_union_info_get_discriminator_offset (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_discriminator_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_discriminator_offset"
               }"
               end

	g_union_info_get_discriminator_type (an_info: POINTER): POINTER 

		-- function g_union_info_get_discriminator_type (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_discriminator_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_discriminator_type"
               }"
               end

	g_union_info_get_field (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_union_info_get_field (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_field
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_field"
               }"
               end

	g_union_info_get_method (an_info: POINTER; a_n: INTEGER): POINTER 

		-- function g_union_info_get_method (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_method"
               }"
               end

	g_union_info_get_n_fields (an_info: POINTER): INTEGER 

		-- function g_union_info_get_n_fields (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_n_fields
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_n_fields"
               }"
               end

	g_union_info_get_n_methods (an_info: POINTER): INTEGER 

		-- function g_union_info_get_n_methods (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_n_methods
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_n_methods"
               }"
               end

	g_union_info_get_size (an_info: POINTER): like long_unsigned 

		-- function g_union_info_get_size (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_get_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_get_size"
               }"
               end

	g_union_info_is_discriminated (an_info: POINTER): INTEGER 

		-- function g_union_info_is_discriminated (in `/usr/include/gobject-introspection-1.0/giunioninfo.h')
               -- g_union_info_is_discriminated
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_union_info_is_discriminated"
               }"
               end


end -- class GIUNIONINFO_EXTERNALS
