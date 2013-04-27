-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DEST_DEFAULTS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_dest_default_all_low_level)  or else
				(a_value = gtk_dest_default_drop_low_level)  or else
				(a_value = gtk_dest_default_highlight_low_level)  or else
				(a_value = gtk_dest_default_motion_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_dest_default_all is
		do
			value := gtk_dest_default_all_low_level
		end

	set_gtk_dest_default_drop is
		do
			value := gtk_dest_default_drop_low_level
		end

	set_gtk_dest_default_highlight is
		do
			value := gtk_dest_default_highlight_low_level
		end

	set_gtk_dest_default_motion is
		do
			value := gtk_dest_default_motion_low_level
		end

feature -- Queries
	is_gtk_dest_default_all: BOOLEAN is
		do
			Result := (value=gtk_dest_default_all_low_level)
		end

	is_gtk_dest_default_drop: BOOLEAN is
		do
			Result := (value=gtk_dest_default_drop_low_level)
		end

	is_gtk_dest_default_highlight: BOOLEAN is
		do
			Result := (value=gtk_dest_default_highlight_low_level)
		end

	is_gtk_dest_default_motion: BOOLEAN is
		do
			Result := (value=gtk_dest_default_motion_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_dest_default_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_ALL"
 			}"
 		end

	gtk_dest_default_drop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_DROP"
 			}"
 		end

	gtk_dest_default_highlight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_HIGHLIGHT"
 			}"
 		end

	gtk_dest_default_motion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DEST_DEFAULT_MOTION"
 			}"
 		end


end -- class GTK_DEST_DEFAULTS_ENUM
