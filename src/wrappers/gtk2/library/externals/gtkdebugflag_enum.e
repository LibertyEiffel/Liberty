-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKDEBUGFLAG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_debug_builder_low_level | 
				gtk_debug_icontheme_low_level | 
				gtk_debug_keybindings_low_level | 
				gtk_debug_misc_low_level | 
				gtk_debug_modules_low_level | 
				gtk_debug_multihead_low_level | 
				gtk_debug_plugsocket_low_level | 
				gtk_debug_printing_low_level | 
				gtk_debug_text_low_level | 
				gtk_debug_tree_low_level | 
				gtk_debug_updates_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_debug_builder is
		do
			value := value.bit_or(gtk_debug_builder_low_level)
		end

	unset_gtk_debug_builder is
		do
			value := value.bit_xor(gtk_debug_builder_low_level)
		end

	set_gtk_debug_icontheme is
		do
			value := value.bit_or(gtk_debug_icontheme_low_level)
		end

	unset_gtk_debug_icontheme is
		do
			value := value.bit_xor(gtk_debug_icontheme_low_level)
		end

	set_gtk_debug_keybindings is
		do
			value := value.bit_or(gtk_debug_keybindings_low_level)
		end

	unset_gtk_debug_keybindings is
		do
			value := value.bit_xor(gtk_debug_keybindings_low_level)
		end

	set_gtk_debug_misc is
		do
			value := value.bit_or(gtk_debug_misc_low_level)
		end

	unset_gtk_debug_misc is
		do
			value := value.bit_xor(gtk_debug_misc_low_level)
		end

	set_gtk_debug_modules is
		do
			value := value.bit_or(gtk_debug_modules_low_level)
		end

	unset_gtk_debug_modules is
		do
			value := value.bit_xor(gtk_debug_modules_low_level)
		end

	set_gtk_debug_multihead is
		do
			value := value.bit_or(gtk_debug_multihead_low_level)
		end

	unset_gtk_debug_multihead is
		do
			value := value.bit_xor(gtk_debug_multihead_low_level)
		end

	set_gtk_debug_plugsocket is
		do
			value := value.bit_or(gtk_debug_plugsocket_low_level)
		end

	unset_gtk_debug_plugsocket is
		do
			value := value.bit_xor(gtk_debug_plugsocket_low_level)
		end

	set_gtk_debug_printing is
		do
			value := value.bit_or(gtk_debug_printing_low_level)
		end

	unset_gtk_debug_printing is
		do
			value := value.bit_xor(gtk_debug_printing_low_level)
		end

	set_gtk_debug_text is
		do
			value := value.bit_or(gtk_debug_text_low_level)
		end

	unset_gtk_debug_text is
		do
			value := value.bit_xor(gtk_debug_text_low_level)
		end

	set_gtk_debug_tree is
		do
			value := value.bit_or(gtk_debug_tree_low_level)
		end

	unset_gtk_debug_tree is
		do
			value := value.bit_xor(gtk_debug_tree_low_level)
		end

	set_gtk_debug_updates is
		do
			value := value.bit_or(gtk_debug_updates_low_level)
		end

	unset_gtk_debug_updates is
		do
			value := value.bit_xor(gtk_debug_updates_low_level)
		end

feature {ANY} -- Queries
	is_gtk_debug_builder: BOOLEAN is
		do
			Result := (value=gtk_debug_builder_low_level)
		end

	is_gtk_debug_icontheme: BOOLEAN is
		do
			Result := (value=gtk_debug_icontheme_low_level)
		end

	is_gtk_debug_keybindings: BOOLEAN is
		do
			Result := (value=gtk_debug_keybindings_low_level)
		end

	is_gtk_debug_misc: BOOLEAN is
		do
			Result := (value=gtk_debug_misc_low_level)
		end

	is_gtk_debug_modules: BOOLEAN is
		do
			Result := (value=gtk_debug_modules_low_level)
		end

	is_gtk_debug_multihead: BOOLEAN is
		do
			Result := (value=gtk_debug_multihead_low_level)
		end

	is_gtk_debug_plugsocket: BOOLEAN is
		do
			Result := (value=gtk_debug_plugsocket_low_level)
		end

	is_gtk_debug_printing: BOOLEAN is
		do
			Result := (value=gtk_debug_printing_low_level)
		end

	is_gtk_debug_text: BOOLEAN is
		do
			Result := (value=gtk_debug_text_low_level)
		end

	is_gtk_debug_tree: BOOLEAN is
		do
			Result := (value=gtk_debug_tree_low_level)
		end

	is_gtk_debug_updates: BOOLEAN is
		do
			Result := (value=gtk_debug_updates_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_debug_builder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_BUILDER"
 			}"
 		end

	gtk_debug_icontheme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_ICONTHEME"
 			}"
 		end

	gtk_debug_keybindings_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_KEYBINDINGS"
 			}"
 		end

	gtk_debug_misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_MISC"
 			}"
 		end

	gtk_debug_modules_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_MODULES"
 			}"
 		end

	gtk_debug_multihead_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_MULTIHEAD"
 			}"
 		end

	gtk_debug_plugsocket_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_PLUGSOCKET"
 			}"
 		end

	gtk_debug_printing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_PRINTING"
 			}"
 		end

	gtk_debug_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_TEXT"
 			}"
 		end

	gtk_debug_tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_TREE"
 			}"
 		end

	gtk_debug_updates_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_UPDATES"
 			}"
 		end


end -- class GTKDEBUGFLAG_ENUM
