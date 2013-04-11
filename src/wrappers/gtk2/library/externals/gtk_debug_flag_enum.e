-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DEBUG_FLAG_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (misc_low_level | 
				text_low_level | 
				tree_low_level | 
				updates_low_level | 
				keybindings_low_level | 
				multihead_low_level | 
				modules_low_level | 
				geometry_low_level | 
				icontheme_low_level | 
				printing_low_level | 
				builder_low_level)).to_boolean
		end

feature {ANY} -- Setters
	default_create,
	set_misc is
		do
			value := value.bit_or(misc_low_level)
		end

	unset_misc is
		do
			value := value.bit_xor(misc_low_level)
		end

	set_text is
		do
			value := value.bit_or(text_low_level)
		end

	unset_text is
		do
			value := value.bit_xor(text_low_level)
		end

	set_tree is
		do
			value := value.bit_or(tree_low_level)
		end

	unset_tree is
		do
			value := value.bit_xor(tree_low_level)
		end

	set_updates is
		do
			value := value.bit_or(updates_low_level)
		end

	unset_updates is
		do
			value := value.bit_xor(updates_low_level)
		end

	set_keybindings is
		do
			value := value.bit_or(keybindings_low_level)
		end

	unset_keybindings is
		do
			value := value.bit_xor(keybindings_low_level)
		end

	set_multihead is
		do
			value := value.bit_or(multihead_low_level)
		end

	unset_multihead is
		do
			value := value.bit_xor(multihead_low_level)
		end

	set_modules is
		do
			value := value.bit_or(modules_low_level)
		end

	unset_modules is
		do
			value := value.bit_xor(modules_low_level)
		end

	set_geometry is
		do
			value := value.bit_or(geometry_low_level)
		end

	unset_geometry is
		do
			value := value.bit_xor(geometry_low_level)
		end

	set_icontheme is
		do
			value := value.bit_or(icontheme_low_level)
		end

	unset_icontheme is
		do
			value := value.bit_xor(icontheme_low_level)
		end

	set_printing is
		do
			value := value.bit_or(printing_low_level)
		end

	unset_printing is
		do
			value := value.bit_xor(printing_low_level)
		end

	set_builder is
		do
			value := value.bit_or(builder_low_level)
		end

	unset_builder is
		do
			value := value.bit_xor(builder_low_level)
		end

feature {ANY} -- Queries
	is_misc: BOOLEAN is
		do
			Result := (value=misc_low_level)
		end

	is_text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

	is_tree: BOOLEAN is
		do
			Result := (value=tree_low_level)
		end

	is_updates: BOOLEAN is
		do
			Result := (value=updates_low_level)
		end

	is_keybindings: BOOLEAN is
		do
			Result := (value=keybindings_low_level)
		end

	is_multihead: BOOLEAN is
		do
			Result := (value=multihead_low_level)
		end

	is_modules: BOOLEAN is
		do
			Result := (value=modules_low_level)
		end

	is_geometry: BOOLEAN is
		do
			Result := (value=geometry_low_level)
		end

	is_icontheme: BOOLEAN is
		do
			Result := (value=icontheme_low_level)
		end

	is_printing: BOOLEAN is
		do
			Result := (value=printing_low_level)
		end

	is_builder: BOOLEAN is
		do
			Result := (value=builder_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	misc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_MISC"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_TEXT"
 			}"
 		end

	tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_TREE"
 			}"
 		end

	updates_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_UPDATES"
 			}"
 		end

	keybindings_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_KEYBINDINGS"
 			}"
 		end

	multihead_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_MULTIHEAD"
 			}"
 		end

	modules_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_MODULES"
 			}"
 		end

	geometry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_GEOMETRY"
 			}"
 		end

	icontheme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_ICONTHEME"
 			}"
 		end

	printing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_PRINTING"
 			}"
 		end

	builder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DEBUG_BUILDER"
 			}"
 		end


end -- class GTK_DEBUG_FLAG_ENUM
