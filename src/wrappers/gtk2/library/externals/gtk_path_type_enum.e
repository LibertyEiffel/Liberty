-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PATH_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_path_class_low_level)  or else
				(a_value = gtk_path_widget_low_level)  or else
				(a_value = gtk_path_widget_class_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_path_class is
		do
			value := gtk_path_class_low_level
		end

	set_gtk_path_widget is
		do
			value := gtk_path_widget_low_level
		end

	set_gtk_path_widget_class is
		do
			value := gtk_path_widget_class_low_level
		end

feature -- Queries
	is_gtk_path_class: BOOLEAN is
		do
			Result := (value=gtk_path_class_low_level)
		end

	is_gtk_path_widget: BOOLEAN is
		do
			Result := (value=gtk_path_widget_low_level)
		end

	is_gtk_path_widget_class: BOOLEAN is
		do
			Result := (value=gtk_path_widget_class_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_path_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_CLASS"
 			}"
 		end

	gtk_path_widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_WIDGET"
 			}"
 		end

	gtk_path_widget_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PATH_WIDGET_CLASS"
 			}"
 		end


end -- class GTK_PATH_TYPE_ENUM
