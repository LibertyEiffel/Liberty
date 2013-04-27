-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IF_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	if_freenameindex (a_ptr: POINTER) is
 		-- if_freenameindex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_freenameindex"
		}"
		end

	if_indextoname (an_ifindex: NATURAL; an_ifname: POINTER): POINTER is
 		-- if_indextoname
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_indextoname"
		}"
		end

	if_nameindex: POINTER is
 		-- if_nameindex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_nameindex()"
		}"
		end

	if_nametoindex (an_ifname: POINTER): NATURAL is
 		-- if_nametoindex
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "if_nametoindex"
		}"
		end


end -- class IF_EXTERNALS
