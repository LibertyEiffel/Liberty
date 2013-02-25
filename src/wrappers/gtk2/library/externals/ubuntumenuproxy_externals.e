-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class UBUNTUMENUPROXY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	ubuntu_menu_proxy_activate_menu (a_proxy: POINTER; a_widget: POINTER) is
 		-- ubuntu_menu_proxy_activate_menu (node at line 13827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_activate_menu"
		}"
		end

	ubuntu_menu_proxy_show_local (a_proxy: POINTER): INTEGER_32 is
 		-- ubuntu_menu_proxy_show_local (node at line 22338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_show_local"
		}"
		end

	ubuntu_menu_proxy_insert (a_proxy: POINTER; a_parent: POINTER; a_child: POINTER; a_position: NATURAL_32) is
 		-- ubuntu_menu_proxy_insert (node at line 23380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_insert"
		}"
		end

	ubuntu_menu_proxy_get: POINTER is
 		-- ubuntu_menu_proxy_get (node at line 33880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_get()"
		}"
		end

	ubuntu_menu_proxy_get_type: NATURAL_64 is
 		-- ubuntu_menu_proxy_get_type (node at line 39895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ubuntu_menu_proxy_get_type()"
		}"
		end


end -- class UBUNTUMENUPROXY_EXTERNALS
