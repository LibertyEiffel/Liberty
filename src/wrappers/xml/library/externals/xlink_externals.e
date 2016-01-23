-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class XLINK_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	xlink_get_default_detect: POINTER 
               -- xlinkGetDefaultDetect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xlinkGetDefaultDetect"
               }"
               end

	xlink_get_default_handler: POINTER 
               -- xlinkGetDefaultHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xlinkGetDefaultHandler"
               }"
               end

	xlink_is_link (a_doc: POINTER; a_node: POINTER): INTEGER 
               -- xlinkIsLink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xlinkIsLink"
               }"
               end

	xlink_set_default_detect (a_func: POINTER) 
               -- xlinkSetDefaultDetect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xlinkSetDefaultDetect"
               }"
               end

	xlink_set_default_handler (a_handler: POINTER) 
               -- xlinkSetDefaultHandler
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "xlinkSetDefaultHandler"
               }"
               end


end -- class XLINK_EXTERNALS
