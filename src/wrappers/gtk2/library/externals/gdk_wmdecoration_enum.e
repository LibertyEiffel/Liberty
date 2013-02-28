-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WMDECORATION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (all_low_level | 
				resizeh_low_level | 
				title_low_level | 
				menu_low_level | 
				minimize_low_level | 
				maximize_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_all is
		do
			value := value.bit_or(all_low_level)
		end

	unset_all is
		do
			value := value.bit_xor(all_low_level)
		end

	set_resizeh is
		do
			value := value.bit_or(resizeh_low_level)
		end

	unset_resizeh is
		do
			value := value.bit_xor(resizeh_low_level)
		end

	set_title is
		do
			value := value.bit_or(title_low_level)
		end

	unset_title is
		do
			value := value.bit_xor(title_low_level)
		end

	set_menu is
		do
			value := value.bit_or(menu_low_level)
		end

	unset_menu is
		do
			value := value.bit_xor(menu_low_level)
		end

	set_minimize is
		do
			value := value.bit_or(minimize_low_level)
		end

	unset_minimize is
		do
			value := value.bit_xor(minimize_low_level)
		end

	set_maximize is
		do
			value := value.bit_or(maximize_low_level)
		end

	unset_maximize is
		do
			value := value.bit_xor(maximize_low_level)
		end

feature -- Queries
	is_all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	is_resizeh: BOOLEAN is
		do
			Result := (value=resizeh_low_level)
		end

	is_title: BOOLEAN is
		do
			Result := (value=title_low_level)
		end

	is_menu: BOOLEAN is
		do
			Result := (value=menu_low_level)
		end

	is_minimize: BOOLEAN is
		do
			Result := (value=minimize_low_level)
		end

	is_maximize: BOOLEAN is
		do
			Result := (value=maximize_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_ALL"
 			}"
 		end

	resizeh_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_RESIZEH"
 			}"
 		end

	title_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_TITLE"
 			}"
 		end

	menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_MENU"
 			}"
 		end

	minimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_MINIMIZE"
 			}"
 		end

	maximize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_DECOR_MAXIMIZE"
 			}"
 		end


end -- class GDK_WMDECORATION_ENUM
