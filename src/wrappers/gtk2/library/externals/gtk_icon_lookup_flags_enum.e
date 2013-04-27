-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ICON_LOOKUP_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_icon_lookup_force_size_low_level | 
				gtk_icon_lookup_generic_fallback_low_level | 
				gtk_icon_lookup_no_svg_low_level | 
				gtk_icon_lookup_use_builtin_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_icon_lookup_force_size is
		do
			value := value.bit_or(gtk_icon_lookup_force_size_low_level)
		end

	unset_gtk_icon_lookup_force_size is
		do
			value := value.bit_xor(gtk_icon_lookup_force_size_low_level)
		end

	set_gtk_icon_lookup_generic_fallback is
		do
			value := value.bit_or(gtk_icon_lookup_generic_fallback_low_level)
		end

	unset_gtk_icon_lookup_generic_fallback is
		do
			value := value.bit_xor(gtk_icon_lookup_generic_fallback_low_level)
		end

	set_gtk_icon_lookup_no_svg is
		do
			value := value.bit_or(gtk_icon_lookup_no_svg_low_level)
		end

	unset_gtk_icon_lookup_no_svg is
		do
			value := value.bit_xor(gtk_icon_lookup_no_svg_low_level)
		end

	set_gtk_icon_lookup_use_builtin is
		do
			value := value.bit_or(gtk_icon_lookup_use_builtin_low_level)
		end

	unset_gtk_icon_lookup_use_builtin is
		do
			value := value.bit_xor(gtk_icon_lookup_use_builtin_low_level)
		end

feature -- Queries
	is_gtk_icon_lookup_force_size: BOOLEAN is
		do
			Result := (value=gtk_icon_lookup_force_size_low_level)
		end

	is_gtk_icon_lookup_generic_fallback: BOOLEAN is
		do
			Result := (value=gtk_icon_lookup_generic_fallback_low_level)
		end

	is_gtk_icon_lookup_no_svg: BOOLEAN is
		do
			Result := (value=gtk_icon_lookup_no_svg_low_level)
		end

	is_gtk_icon_lookup_use_builtin: BOOLEAN is
		do
			Result := (value=gtk_icon_lookup_use_builtin_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_icon_lookup_force_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_FORCE_SIZE"
 			}"
 		end

	gtk_icon_lookup_generic_fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_GENERIC_FALLBACK"
 			}"
 		end

	gtk_icon_lookup_no_svg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_NO_SVG"
 			}"
 		end

	gtk_icon_lookup_use_builtin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_ICON_LOOKUP_USE_BUILTIN"
 			}"
 		end


end -- class GTK_ICON_LOOKUP_FLAGS_ENUM
