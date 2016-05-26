-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIVFUNCINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_vfunc_info_get_address (an_info: POINTER; an_implementor_gtype: like long_unsigned; an_error: POINTER): POINTER 

		-- function g_vfunc_info_get_address (in `/usr/include/gobject-introspection-1.0/givfuncinfo.h')
               -- g_vfunc_info_get_address
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vfunc_info_get_address"
               }"
               end

	g_vfunc_info_get_flags (an_info: POINTER): INTEGER 

		-- function g_vfunc_info_get_flags (in `/usr/include/gobject-introspection-1.0/givfuncinfo.h')
               -- g_vfunc_info_get_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vfunc_info_get_flags"
               }"
               end

	g_vfunc_info_get_invoker (an_info: POINTER): POINTER 

		-- function g_vfunc_info_get_invoker (in `/usr/include/gobject-introspection-1.0/givfuncinfo.h')
               -- g_vfunc_info_get_invoker
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vfunc_info_get_invoker"
               }"
               end

	g_vfunc_info_get_offset (an_info: POINTER): INTEGER 

		-- function g_vfunc_info_get_offset (in `/usr/include/gobject-introspection-1.0/givfuncinfo.h')
               -- g_vfunc_info_get_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vfunc_info_get_offset"
               }"
               end

	g_vfunc_info_get_signal (an_info: POINTER): POINTER 

		-- function g_vfunc_info_get_signal (in `/usr/include/gobject-introspection-1.0/givfuncinfo.h')
               -- g_vfunc_info_get_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vfunc_info_get_signal"
               }"
               end

	g_vfunc_info_invoke (an_info: POINTER; an_implementor: like long_unsigned; an_in_args: POINTER; a_n_in_args: INTEGER; an_out_args: POINTER; a_n_out_args: INTEGER; a_return_value: POINTER; an_error: POINTER): INTEGER 

		-- function g_vfunc_info_invoke (in `/usr/include/gobject-introspection-1.0/givfuncinfo.h')
               -- g_vfunc_info_invoke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_vfunc_info_invoke"
               }"
               end


end -- class GIVFUNCINFO_EXTERNALS
