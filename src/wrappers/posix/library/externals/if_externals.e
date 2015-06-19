-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class IF_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	if_freenameindex (a_ptr: POINTER) 
               -- if_freenameindex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	if_indextoname (an_ifindex: NATURAL; an_ifname: POINTER): POINTER 
               -- if_indextoname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	if_nameindex (): POINTER 
               -- if_nameindex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	if_nametoindex (an_ifname: POINTER): NATURAL 
               -- if_nametoindex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class IF_EXTERNALS
