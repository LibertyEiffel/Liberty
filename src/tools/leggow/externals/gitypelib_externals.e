-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GITYPELIB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_typelib_free (a_typelib: POINTER) 

		-- function g_typelib_free (in `/usr/include/gobject-introspection-1.0/gitypelib.h')
               -- g_typelib_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_typelib_free"
               }"
               end

	g_typelib_get_namespace (a_typelib: POINTER): POINTER 

		-- function g_typelib_get_namespace (in `/usr/include/gobject-introspection-1.0/gitypelib.h')
               -- g_typelib_get_namespace
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_typelib_get_namespace"
               }"
               end

	g_typelib_new_from_const_memory (a_memory: POINTER; a_len: like long_unsigned; an_error: POINTER): POINTER 

		-- function g_typelib_new_from_const_memory (in `/usr/include/gobject-introspection-1.0/gitypelib.h')
               -- g_typelib_new_from_const_memory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_typelib_new_from_const_memory"
               }"
               end

	g_typelib_new_from_mapped_file (a_mfile: POINTER; an_error: POINTER): POINTER 

		-- function g_typelib_new_from_mapped_file (in `/usr/include/gobject-introspection-1.0/gitypelib.h')
               -- g_typelib_new_from_mapped_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_typelib_new_from_mapped_file"
               }"
               end

	g_typelib_new_from_memory (a_memory: POINTER; a_len: like long_unsigned; an_error: POINTER): POINTER 

		-- function g_typelib_new_from_memory (in `/usr/include/gobject-introspection-1.0/gitypelib.h')
               -- g_typelib_new_from_memory
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_typelib_new_from_memory"
               }"
               end

	g_typelib_symbol (a_typelib: POINTER; a_symbol_name: POINTER; a_symbol: POINTER): INTEGER 

		-- function g_typelib_symbol (in `/usr/include/gobject-introspection-1.0/gitypelib.h')
               -- g_typelib_symbol
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_typelib_symbol"
               }"
               end


end -- class GITYPELIB_EXTERNALS
