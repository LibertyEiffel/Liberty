-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class KEYMAPS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	emacs_ctlx_keymap: POINTER is
 		-- emacs_ctlx_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emacs_ctlx_keymap"
		}"
		end

	address_of_emacs_ctlx_keymap: POINTER is
 		-- Address of emacs_ctlx_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emacs_ctlx_keymap"
		}"
		end

	set_emacs_ctlx_keymap (a_value: POINTER) is
		-- Set variable emacs_ctlx_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_emacs_ctlx_keymap"
		}"
		end

	emacs_meta_keymap: POINTER is
 		-- emacs_meta_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emacs_meta_keymap"
		}"
		end

	address_of_emacs_meta_keymap: POINTER is
 		-- Address of emacs_meta_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emacs_meta_keymap"
		}"
		end

	set_emacs_meta_keymap (a_value: POINTER) is
		-- Set variable emacs_meta_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_emacs_meta_keymap"
		}"
		end

	emacs_standard_keymap: POINTER is
 		-- emacs_standard_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emacs_standard_keymap"
		}"
		end

	address_of_emacs_standard_keymap: POINTER is
 		-- Address of emacs_standard_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emacs_standard_keymap"
		}"
		end

	set_emacs_standard_keymap (a_value: POINTER) is
		-- Set variable emacs_standard_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_emacs_standard_keymap"
		}"
		end

	vi_insertion_keymap: POINTER is
 		-- vi_insertion_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vi_insertion_keymap"
		}"
		end

	address_of_vi_insertion_keymap: POINTER is
 		-- Address of vi_insertion_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&vi_insertion_keymap"
		}"
		end

	set_vi_insertion_keymap (a_value: POINTER) is
		-- Set variable vi_insertion_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_vi_insertion_keymap"
		}"
		end

	vi_movement_keymap: POINTER is
 		-- vi_movement_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vi_movement_keymap"
		}"
		end

	address_of_vi_movement_keymap: POINTER is
 		-- Address of vi_movement_keymap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&vi_movement_keymap"
		}"
		end

	set_vi_movement_keymap (a_value: POINTER) is
		-- Set variable vi_movement_keymap value
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "set_vi_movement_keymap"
		}"
		end


end -- class KEYMAPS_EXTERNALS
