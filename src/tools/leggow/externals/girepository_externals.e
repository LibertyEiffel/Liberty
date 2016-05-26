-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIREPOSITORY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_irepository_dump (an_arg: POINTER; an_error: POINTER): INTEGER 

		-- function g_irepository_dump (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_dump
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_dump"
               }"
               end

	g_irepository_enumerate_versions (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_enumerate_versions (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_enumerate_versions
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_enumerate_versions"
               }"
               end

	g_irepository_error_quark: NATURAL 

		-- function g_irepository_error_quark (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_error_quark()"
               }"
               end

	g_irepository_find_by_error_domain (a_repository: POINTER; a_domain: NATURAL): POINTER 

		-- function g_irepository_find_by_error_domain (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_find_by_error_domain
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_find_by_error_domain"
               }"
               end

	g_irepository_find_by_gtype (a_repository: POINTER; a_gtype: like long_unsigned): POINTER 

		-- function g_irepository_find_by_gtype (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_find_by_gtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_find_by_gtype"
               }"
               end

	g_irepository_find_by_name (a_repository: POINTER; a_namespace: POINTER; a_name: POINTER): POINTER 

		-- function g_irepository_find_by_name (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_find_by_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_find_by_name"
               }"
               end

	g_irepository_get_c_prefix (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_get_c_prefix (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_c_prefix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_c_prefix"
               }"
               end

	g_irepository_get_default: POINTER 

		-- function g_irepository_get_default (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_default()"
               }"
               end

	g_irepository_get_dependencies (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_get_dependencies (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_dependencies
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_dependencies"
               }"
               end

	g_irepository_get_immediate_dependencies (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_get_immediate_dependencies (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_immediate_dependencies
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_immediate_dependencies"
               }"
               end

	g_irepository_get_info (a_repository: POINTER; a_namespace: POINTER; an_index: INTEGER): POINTER 

		-- function g_irepository_get_info (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_info"
               }"
               end

	g_irepository_get_loaded_namespaces (a_repository: POINTER): POINTER 

		-- function g_irepository_get_loaded_namespaces (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_loaded_namespaces
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_loaded_namespaces"
               }"
               end

	g_irepository_get_n_infos (a_repository: POINTER; a_namespace: POINTER): INTEGER 

		-- function g_irepository_get_n_infos (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_n_infos
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_n_infos"
               }"
               end

	g_irepository_get_option_group: POINTER 

		-- function g_irepository_get_option_group (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_option_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_option_group()"
               }"
               end

	g_irepository_get_search_path: POINTER 

		-- function g_irepository_get_search_path (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_search_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_search_path()"
               }"
               end

	g_irepository_get_shared_library (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_get_shared_library (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_shared_library
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_shared_library"
               }"
               end

	g_irepository_get_type: like long_unsigned 

		-- function g_irepository_get_type (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_type()"
               }"
               end

	g_irepository_get_typelib_path (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_get_typelib_path (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_typelib_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_typelib_path"
               }"
               end

	g_irepository_get_version (a_repository: POINTER; a_namespace: POINTER): POINTER 

		-- function g_irepository_get_version (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_get_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_get_version"
               }"
               end

	g_irepository_is_registered (a_repository: POINTER; a_namespace: POINTER; a_version: POINTER): INTEGER 

		-- function g_irepository_is_registered (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_is_registered
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_is_registered"
               }"
               end

	g_irepository_load_typelib (a_repository: POINTER; a_typelib: POINTER; a_flags: INTEGER; an_error: POINTER): POINTER 

		-- function g_irepository_load_typelib (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_load_typelib
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_load_typelib"
               }"
               end

	g_irepository_prepend_library_path (a_directory: POINTER) 

		-- function g_irepository_prepend_library_path (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_prepend_library_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_prepend_library_path"
               }"
               end

	g_irepository_prepend_search_path (a_directory: POINTER) 

		-- function g_irepository_prepend_search_path (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_prepend_search_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_prepend_search_path"
               }"
               end

	g_irepository_require (a_repository: POINTER; a_namespace: POINTER; a_version: POINTER; a_flags: INTEGER; an_error: POINTER): POINTER 

		-- function g_irepository_require (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_require
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_require"
               }"
               end

	g_irepository_require_private (a_repository: POINTER; a_typelib_dir: POINTER; a_namespace: POINTER; a_version: POINTER; a_flags: INTEGER; an_error: POINTER): POINTER 

		-- function g_irepository_require_private (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- g_irepository_require_private
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_irepository_require_private"
               }"
               end

	gi_cclosure_marshal_generic (a_closure: POINTER; a_return_gvalue: POINTER; a_n_param_values: NATURAL; a_param_values: POINTER; an_invocation_hint: POINTER; a_marshal_data: POINTER) 

		-- function gi_cclosure_marshal_generic (in `/usr/include/gobject-introspection-1.0/girepository.h')
               -- gi_cclosure_marshal_generic
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gi_cclosure_marshal_generic"
               }"
               end


end -- class GIREPOSITORY_EXTERNALS
