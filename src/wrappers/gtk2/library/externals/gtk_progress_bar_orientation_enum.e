-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PROGRESS_BAR_ORIENTATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_progress_bottom_to_top_low_level)  or else
				(a_value = gtk_progress_left_to_right_low_level)  or else
				(a_value = gtk_progress_right_to_left_low_level)  or else
				(a_value = gtk_progress_top_to_bottom_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_progress_bottom_to_top is
		do
			value := gtk_progress_bottom_to_top_low_level
		end

	set_gtk_progress_left_to_right is
		do
			value := gtk_progress_left_to_right_low_level
		end

	set_gtk_progress_right_to_left is
		do
			value := gtk_progress_right_to_left_low_level
		end

	set_gtk_progress_top_to_bottom is
		do
			value := gtk_progress_top_to_bottom_low_level
		end

feature -- Queries
	is_gtk_progress_bottom_to_top: BOOLEAN is
		do
			Result := (value=gtk_progress_bottom_to_top_low_level)
		end

	is_gtk_progress_left_to_right: BOOLEAN is
		do
			Result := (value=gtk_progress_left_to_right_low_level)
		end

	is_gtk_progress_right_to_left: BOOLEAN is
		do
			Result := (value=gtk_progress_right_to_left_low_level)
		end

	is_gtk_progress_top_to_bottom: BOOLEAN is
		do
			Result := (value=gtk_progress_top_to_bottom_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_progress_bottom_to_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_BOTTOM_TO_TOP"
 			}"
 		end

	gtk_progress_left_to_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_LEFT_TO_RIGHT"
 			}"
 		end

	gtk_progress_right_to_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_RIGHT_TO_LEFT"
 			}"
 		end

	gtk_progress_top_to_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_TOP_TO_BOTTOM"
 			}"
 		end


end -- class GTK_PROGRESS_BAR_ORIENTATION_ENUM
