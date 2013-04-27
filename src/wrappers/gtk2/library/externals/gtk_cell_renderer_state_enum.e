-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CELL_RENDERER_STATE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_cell_renderer_focused_low_level | 
				gtk_cell_renderer_prelit_low_level | 
				gtk_cell_renderer_selected_low_level | 
				gtk_cell_renderer_sorted_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_cell_renderer_focused is
		do
			value := value.bit_or(gtk_cell_renderer_focused_low_level)
		end

	unset_gtk_cell_renderer_focused is
		do
			value := value.bit_xor(gtk_cell_renderer_focused_low_level)
		end

	set_gtk_cell_renderer_prelit is
		do
			value := value.bit_or(gtk_cell_renderer_prelit_low_level)
		end

	unset_gtk_cell_renderer_prelit is
		do
			value := value.bit_xor(gtk_cell_renderer_prelit_low_level)
		end

	set_gtk_cell_renderer_selected is
		do
			value := value.bit_or(gtk_cell_renderer_selected_low_level)
		end

	unset_gtk_cell_renderer_selected is
		do
			value := value.bit_xor(gtk_cell_renderer_selected_low_level)
		end

	set_gtk_cell_renderer_sorted is
		do
			value := value.bit_or(gtk_cell_renderer_sorted_low_level)
		end

	unset_gtk_cell_renderer_sorted is
		do
			value := value.bit_xor(gtk_cell_renderer_sorted_low_level)
		end

feature -- Queries
	is_gtk_cell_renderer_focused: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_focused_low_level)
		end

	is_gtk_cell_renderer_prelit: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_prelit_low_level)
		end

	is_gtk_cell_renderer_selected: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_selected_low_level)
		end

	is_gtk_cell_renderer_sorted: BOOLEAN is
		do
			Result := (value=gtk_cell_renderer_sorted_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_cell_renderer_focused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_FOCUSED"
 			}"
 		end

	gtk_cell_renderer_prelit_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_PRELIT"
 			}"
 		end

	gtk_cell_renderer_selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_SELECTED"
 			}"
 		end

	gtk_cell_renderer_sorted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CELL_RENDERER_SORTED"
 			}"
 		end


end -- class GTK_CELL_RENDERER_STATE_ENUM
