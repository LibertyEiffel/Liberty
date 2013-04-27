-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TARGET_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_target_other_app_low_level | 
				gtk_target_same_app_low_level | 
				gtk_target_same_widget_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_target_other_app is
		do
			value := value.bit_or(gtk_target_other_app_low_level)
		end

	unset_gtk_target_other_app is
		do
			value := value.bit_xor(gtk_target_other_app_low_level)
		end

	set_gtk_target_same_app is
		do
			value := value.bit_or(gtk_target_same_app_low_level)
		end

	unset_gtk_target_same_app is
		do
			value := value.bit_xor(gtk_target_same_app_low_level)
		end

	set_gtk_target_same_widget is
		do
			value := value.bit_or(gtk_target_same_widget_low_level)
		end

	unset_gtk_target_same_widget is
		do
			value := value.bit_xor(gtk_target_same_widget_low_level)
		end

feature -- Queries
	is_gtk_target_other_app: BOOLEAN is
		do
			Result := (value=gtk_target_other_app_low_level)
		end

	is_gtk_target_same_app: BOOLEAN is
		do
			Result := (value=gtk_target_same_app_low_level)
		end

	is_gtk_target_same_widget: BOOLEAN is
		do
			Result := (value=gtk_target_same_widget_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_target_other_app_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TARGET_OTHER_APP"
 			}"
 		end

	gtk_target_same_app_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TARGET_SAME_APP"
 			}"
 		end

	gtk_target_same_widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TARGET_SAME_WIDGET"
 			}"
 		end


end -- class GTK_TARGET_FLAGS_ENUM
