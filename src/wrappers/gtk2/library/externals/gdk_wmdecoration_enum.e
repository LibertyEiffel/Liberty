-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WMDECORATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_decor_all_low_level | 
				gdk_decor_maximize_low_level | 
				gdk_decor_menu_low_level | 
				gdk_decor_minimize_low_level | 
				gdk_decor_resizeh_low_level | 
				gdk_decor_title_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gdk_decor_all is
		do
			value := value.bit_or(gdk_decor_all_low_level)
		end

	unset_gdk_decor_all is
		do
			value := value.bit_xor(gdk_decor_all_low_level)
		end

	set_gdk_decor_maximize is
		do
			value := value.bit_or(gdk_decor_maximize_low_level)
		end

	unset_gdk_decor_maximize is
		do
			value := value.bit_xor(gdk_decor_maximize_low_level)
		end

	set_gdk_decor_menu is
		do
			value := value.bit_or(gdk_decor_menu_low_level)
		end

	unset_gdk_decor_menu is
		do
			value := value.bit_xor(gdk_decor_menu_low_level)
		end

	set_gdk_decor_minimize is
		do
			value := value.bit_or(gdk_decor_minimize_low_level)
		end

	unset_gdk_decor_minimize is
		do
			value := value.bit_xor(gdk_decor_minimize_low_level)
		end

	set_gdk_decor_resizeh is
		do
			value := value.bit_or(gdk_decor_resizeh_low_level)
		end

	unset_gdk_decor_resizeh is
		do
			value := value.bit_xor(gdk_decor_resizeh_low_level)
		end

	set_gdk_decor_title is
		do
			value := value.bit_or(gdk_decor_title_low_level)
		end

	unset_gdk_decor_title is
		do
			value := value.bit_xor(gdk_decor_title_low_level)
		end

feature -- Queries
	is_gdk_decor_all: BOOLEAN is
		do
			Result := (value=gdk_decor_all_low_level)
		end

	is_gdk_decor_maximize: BOOLEAN is
		do
			Result := (value=gdk_decor_maximize_low_level)
		end

	is_gdk_decor_menu: BOOLEAN is
		do
			Result := (value=gdk_decor_menu_low_level)
		end

	is_gdk_decor_minimize: BOOLEAN is
		do
			Result := (value=gdk_decor_minimize_low_level)
		end

	is_gdk_decor_resizeh: BOOLEAN is
		do
			Result := (value=gdk_decor_resizeh_low_level)
		end

	is_gdk_decor_title: BOOLEAN is
		do
			Result := (value=gdk_decor_title_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_decor_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_ALL"
 			}"
 		end

	gdk_decor_maximize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_MAXIMIZE"
 			}"
 		end

	gdk_decor_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_MENU"
 			}"
 		end

	gdk_decor_minimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_MINIMIZE"
 			}"
 		end

	gdk_decor_resizeh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_RESIZEH"
 			}"
 		end

	gdk_decor_title_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_TITLE"
 			}"
 		end


end -- class GDK_WMDECORATION_ENUM
