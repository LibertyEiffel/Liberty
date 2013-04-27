-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTUMENUPROXYMODULE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	ubuntu_menu_proxy_module_get: POINTER is
 		-- ubuntu_menu_proxy_module_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_get()"
		}"
		end

	ubuntu_menu_proxy_module_get_type: like long_unsigned is
 		-- ubuntu_menu_proxy_module_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_module_get_type()"
		}"
		end


end -- class UBUNTUMENUPROXYMODULE_EXTERNALS
