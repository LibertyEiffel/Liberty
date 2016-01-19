-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TEXT_WINDOW_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_text_window_bottom_low_level)  or else
				(a_value = gtk_text_window_left_low_level)  or else
				(a_value = gtk_text_window_private_low_level)  or else
				(a_value = gtk_text_window_right_low_level)  or else
				(a_value = gtk_text_window_text_low_level)  or else
				(a_value = gtk_text_window_top_low_level)  or else
				(a_value = gtk_text_window_widget_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_text_window_bottom is
		do
			value := gtk_text_window_bottom_low_level
		end

	set_gtk_text_window_left is
		do
			value := gtk_text_window_left_low_level
		end

	set_gtk_text_window_private is
		do
			value := gtk_text_window_private_low_level
		end

	set_gtk_text_window_right is
		do
			value := gtk_text_window_right_low_level
		end

	set_gtk_text_window_text is
		do
			value := gtk_text_window_text_low_level
		end

	set_gtk_text_window_top is
		do
			value := gtk_text_window_top_low_level
		end

	set_gtk_text_window_widget is
		do
			value := gtk_text_window_widget_low_level
		end

feature -- Queries
	is_gtk_text_window_bottom: BOOLEAN is
		do
			Result := (value=gtk_text_window_bottom_low_level)
		end

	is_gtk_text_window_left: BOOLEAN is
		do
			Result := (value=gtk_text_window_left_low_level)
		end

	is_gtk_text_window_private: BOOLEAN is
		do
			Result := (value=gtk_text_window_private_low_level)
		end

	is_gtk_text_window_right: BOOLEAN is
		do
			Result := (value=gtk_text_window_right_low_level)
		end

	is_gtk_text_window_text: BOOLEAN is
		do
			Result := (value=gtk_text_window_text_low_level)
		end

	is_gtk_text_window_top: BOOLEAN is
		do
			Result := (value=gtk_text_window_top_low_level)
		end

	is_gtk_text_window_widget: BOOLEAN is
		do
			Result := (value=gtk_text_window_widget_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_text_window_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_BOTTOM"
 			}"
 		end

	gtk_text_window_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_LEFT"
 			}"
 		end

	gtk_text_window_private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_PRIVATE"
 			}"
 		end

	gtk_text_window_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_RIGHT"
 			}"
 		end

	gtk_text_window_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_TEXT"
 			}"
 		end

	gtk_text_window_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_TOP"
 			}"
 		end

	gtk_text_window_widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_WINDOW_WIDGET"
 			}"
 		end


end -- class GTK_TEXT_WINDOW_TYPE_ENUM
