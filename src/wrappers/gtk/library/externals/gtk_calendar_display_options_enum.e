-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CALENDAR_DISPLAY_OPTIONS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (show_heading_low_level | 
				no_month_change_low_level | 
				show_week_numbers_low_level | 
				week_start_monday_low_level | 
				show_details_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_show_heading is
		do
			value := value.bit_or(show_heading_low_level)
		end

	unset_show_heading is
		do
			value := value.bit_xor(show_heading_low_level)
		end

	set_no_month_change is
		do
			value := value.bit_or(no_month_change_low_level)
		end

	unset_no_month_change is
		do
			value := value.bit_xor(no_month_change_low_level)
		end

	set_show_week_numbers is
		do
			value := value.bit_or(show_week_numbers_low_level)
		end

	unset_show_week_numbers is
		do
			value := value.bit_xor(show_week_numbers_low_level)
		end

	set_week_start_monday is
		do
			value := value.bit_or(week_start_monday_low_level)
		end

	unset_week_start_monday is
		do
			value := value.bit_xor(week_start_monday_low_level)
		end

	set_show_details is
		do
			value := value.bit_or(show_details_low_level)
		end

	unset_show_details is
		do
			value := value.bit_xor(show_details_low_level)
		end

feature -- Queries
	is_show_heading: BOOLEAN is
		do
			Result := (value=show_heading_low_level)
		end

	is_no_month_change: BOOLEAN is
		do
			Result := (value=no_month_change_low_level)
		end

	is_show_week_numbers: BOOLEAN is
		do
			Result := (value=show_week_numbers_low_level)
		end

	is_week_start_monday: BOOLEAN is
		do
			Result := (value=week_start_monday_low_level)
		end

	is_show_details: BOOLEAN is
		do
			Result := (value=show_details_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	show_heading_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_SHOW_HEADING"
 			}"
 		end

	no_month_change_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_NO_MONTH_CHANGE"
 			}"
 		end

	show_week_numbers_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_SHOW_WEEK_NUMBERS"
 			}"
 		end

	week_start_monday_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_WEEK_START_MONDAY"
 			}"
 		end

	show_details_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CALENDAR_SHOW_DETAILS"
 			}"
 		end


end -- class GTK_CALENDAR_DISPLAY_OPTIONS_ENUM
