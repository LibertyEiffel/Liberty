-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PROGRESS_BAR_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_progress_continuous_low_level)  or else
				(a_value = gtk_progress_discrete_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_progress_continuous is
		do
			value := gtk_progress_continuous_low_level
		end

	set_gtk_progress_discrete is
		do
			value := gtk_progress_discrete_low_level
		end

feature -- Queries
	is_gtk_progress_continuous: BOOLEAN is
		do
			Result := (value=gtk_progress_continuous_low_level)
		end

	is_gtk_progress_discrete: BOOLEAN is
		do
			Result := (value=gtk_progress_discrete_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_progress_continuous_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_CONTINUOUS"
 			}"
 		end

	gtk_progress_discrete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_DISCRETE"
 			}"
 		end


end -- class GTK_PROGRESS_BAR_STYLE_ENUM
