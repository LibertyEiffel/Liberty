-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class IF_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	if_freenameindex (a_ptr: POINTER) 

		-- function if_freenameindex (in `/usr/include/net/if.h')
               -- if_freenameindex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "if_freenameindex"
               }"
               end

	if_indextoname (an_ifindex: NATURAL; an_ifname: POINTER): POINTER 

		-- function if_indextoname (in `/usr/include/net/if.h')
               -- if_indextoname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "if_indextoname"
               }"
               end

	if_nameindex: POINTER 

		-- function if_nameindex (in `/usr/include/net/if.h')
               -- if_nameindex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "if_nameindex()"
               }"
               end

	if_nametoindex (an_ifname: POINTER): NATURAL 

		-- function if_nametoindex (in `/usr/include/net/if.h')
               -- if_nametoindex
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "if_nametoindex"
               }"
               end


end -- class IF_EXTERNALS
