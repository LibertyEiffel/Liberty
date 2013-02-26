-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IF_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	if_nametoindex (an_ifname: POINTER): NATURAL_32 is
 		-- if_nametoindex (node at line 4763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_nametoindex"
		}"
		end

	if_nameindex: POINTER is
 		-- if_nameindex (node at line 5278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_nameindex()"
		}"
		end

	if_indextoname (an_ifindex: NATURAL_32; an_ifname: POINTER): POINTER is
 		-- if_indextoname (node at line 5706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_indextoname"
		}"
		end

	if_freenameindex (a_ptr: POINTER) is
 		-- if_freenameindex (node at line 7123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_freenameindex"
		}"
		end


end -- class IF_EXTERNALS
