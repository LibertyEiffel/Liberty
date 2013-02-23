-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class XLINK_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	xlink_get_default_detect: POINTER is
 		-- xlinkGetDefaultDetect (node at line 456)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkGetDefaultDetect()"
		}"
		end

	xlink_set_default_handler (a_handler: POINTER) is
 		-- xlinkSetDefaultHandler (node at line 2233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkSetDefaultHandler"
		}"
		end

	xlink_set_default_detect (a_func: POINTER) is
 		-- xlinkSetDefaultDetect (node at line 4171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkSetDefaultDetect"
		}"
		end

	xlink_get_default_handler: POINTER is
 		-- xlinkGetDefaultHandler (node at line 4321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkGetDefaultHandler()"
		}"
		end

	xlink_is_link (a_doc: POINTER; a_node: POINTER): INTEGER is
 		-- xlinkIsLink (node at line 5554)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "xlinkIsLink"
		}"
		end


end -- class XLINK_EXTERNALS
