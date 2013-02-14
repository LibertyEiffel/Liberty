-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class KEYMAPS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	emacs_meta_keymap: POINTER is
 		-- emacs_meta_keymap (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emacs_meta_keymap"
		}"
		end

	address_of_emacs_meta_keymap: POINTER is
 		-- Address of emacs_meta_keymap (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emacs_meta_keymap"
		}"
		end

	emacs_standard_keymap: POINTER is
 		-- emacs_standard_keymap (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emacs_standard_keymap"
		}"
		end

	address_of_emacs_standard_keymap: POINTER is
 		-- Address of emacs_standard_keymap (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emacs_standard_keymap"
		}"
		end

	vi_movement_keymap: POINTER is
 		-- vi_movement_keymap (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vi_movement_keymap"
		}"
		end

	address_of_vi_movement_keymap: POINTER is
 		-- Address of vi_movement_keymap (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&vi_movement_keymap"
		}"
		end

	vi_insertion_keymap: POINTER is
 		-- vi_insertion_keymap (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "vi_insertion_keymap"
		}"
		end

	address_of_vi_insertion_keymap: POINTER is
 		-- Address of vi_insertion_keymap (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&vi_insertion_keymap"
		}"
		end

	emacs_ctlx_keymap: POINTER is
 		-- emacs_ctlx_keymap (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "emacs_ctlx_keymap"
		}"
		end

	address_of_emacs_ctlx_keymap: POINTER is
 		-- Address of emacs_ctlx_keymap (node at line 63)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&emacs_ctlx_keymap"
		}"
		end


end -- class KEYMAPS_EXTERNALS
