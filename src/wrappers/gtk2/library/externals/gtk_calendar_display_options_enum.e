-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CALENDAR_DISPLAY_OPTIONS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_calendar_no_month_change_low_level | 
				gtk_calendar_show_details_low_level | 
				gtk_calendar_show_heading_low_level | 
				gtk_calendar_show_week_numbers_low_level | 
				gtk_calendar_week_start_monday_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_calendar_no_month_change is
		do
			value := value.bit_or(gtk_calendar_no_month_change_low_level)
		end

	unset_gtk_calendar_no_month_change is
		do
			value := value.bit_xor(gtk_calendar_no_month_change_low_level)
		end

	set_gtk_calendar_show_details is
		do
			value := value.bit_or(gtk_calendar_show_details_low_level)
		end

	unset_gtk_calendar_show_details is
		do
			value := value.bit_xor(gtk_calendar_show_details_low_level)
		end

	set_gtk_calendar_show_heading is
		do
			value := value.bit_or(gtk_calendar_show_heading_low_level)
		end

	unset_gtk_calendar_show_heading is
		do
			value := value.bit_xor(gtk_calendar_show_heading_low_level)
		end

	set_gtk_calendar_show_week_numbers is
		do
			value := value.bit_or(gtk_calendar_show_week_numbers_low_level)
		end

	unset_gtk_calendar_show_week_numbers is
		do
			value := value.bit_xor(gtk_calendar_show_week_numbers_low_level)
		end

	set_gtk_calendar_week_start_monday is
		do
			value := value.bit_or(gtk_calendar_week_start_monday_low_level)
		end

	unset_gtk_calendar_week_start_monday is
		do
			value := value.bit_xor(gtk_calendar_week_start_monday_low_level)
		end

feature -- Queries
	is_gtk_calendar_no_month_change: BOOLEAN is
		do
			Result := (value=gtk_calendar_no_month_change_low_level)
		end

	is_gtk_calendar_show_details: BOOLEAN is
		do
			Result := (value=gtk_calendar_show_details_low_level)
		end

	is_gtk_calendar_show_heading: BOOLEAN is
		do
			Result := (value=gtk_calendar_show_heading_low_level)
		end

	is_gtk_calendar_show_week_numbers: BOOLEAN is
		do
			Result := (value=gtk_calendar_show_week_numbers_low_level)
		end

	is_gtk_calendar_week_start_monday: BOOLEAN is
		do
			Result := (value=gtk_calendar_week_start_monday_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_calendar_no_month_change_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_NO_MONTH_CHANGE"
 			}"
 		end

	gtk_calendar_show_details_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_SHOW_DETAILS"
 			}"
 		end

	gtk_calendar_show_heading_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_SHOW_HEADING"
 			}"
 		end

	gtk_calendar_show_week_numbers_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_SHOW_WEEK_NUMBERS"
 			}"
 		end

	gtk_calendar_week_start_monday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_WEEK_START_MONDAY"
 			}"
 		end


end -- class GTK_CALENDAR_DISPLAY_OPTIONS_ENUM
