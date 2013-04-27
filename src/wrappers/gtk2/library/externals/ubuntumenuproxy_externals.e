-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTUMENUPROXY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	ubuntu_menu_proxy_activate_menu (a_proxy: POINTER; a_widget: POINTER) is
 		-- ubuntu_menu_proxy_activate_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_activate_menu"
		}"
		end

	ubuntu_menu_proxy_get: POINTER is
 		-- ubuntu_menu_proxy_get
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_get()"
		}"
		end

	ubuntu_menu_proxy_get_type: like long_unsigned is
 		-- ubuntu_menu_proxy_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_get_type()"
		}"
		end

	ubuntu_menu_proxy_insert (a_proxy: POINTER; a_parent: POINTER; a_child: POINTER; a_position: NATURAL) is
 		-- ubuntu_menu_proxy_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_insert"
		}"
		end

	ubuntu_menu_proxy_show_local (a_proxy: POINTER): INTEGER is
 		-- ubuntu_menu_proxy_show_local
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_show_local"
		}"
		end


end -- class UBUNTUMENUPROXY_EXTERNALS
