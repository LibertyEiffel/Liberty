-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTUMENUPROXYMODULE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	ubuntu_menu_proxy_module_get_type: NATURAL_64 is
 		-- ubuntu_menu_proxy_module_get_type (node at line 1115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_get_type()"
		}"
		end

	ubuntu_menu_proxy_module_get: POINTER is
 		-- ubuntu_menu_proxy_module_get (node at line 24747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_get()"
		}"
		end


end -- class UBUNTUMENUPROXYMODULE_EXTERNALS
