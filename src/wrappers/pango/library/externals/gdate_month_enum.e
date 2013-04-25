-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDATE_MONTH_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = bad_month_low_level)  or else
				(a_value = january_low_level)  or else
				(a_value = february_low_level)  or else
				(a_value = march_low_level)  or else
				(a_value = april_low_level)  or else
				(a_value = may_low_level)  or else
				(a_value = june_low_level)  or else
				(a_value = july_low_level)  or else
				(a_value = august_low_level)  or else
				(a_value = september_low_level)  or else
				(a_value = october_low_level)  or else
				(a_value = november_low_level)  or else
				(a_value = december_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_month is
		do
			value := bad_month_low_level
		end

	set_january is
		do
			value := january_low_level
		end

	set_february is
		do
			value := february_low_level
		end

	set_march is
		do
			value := march_low_level
		end

	set_april is
		do
			value := april_low_level
		end

	set_may is
		do
			value := may_low_level
		end

	set_june is
		do
			value := june_low_level
		end

	set_july is
		do
			value := july_low_level
		end

	set_august is
		do
			value := august_low_level
		end

	set_september is
		do
			value := september_low_level
		end

	set_october is
		do
			value := october_low_level
		end

	set_november is
		do
			value := november_low_level
		end

	set_december is
		do
			value := december_low_level
		end

feature {ANY} -- Queries
	is_bad_month: BOOLEAN is
		do
			Result := (value=bad_month_low_level)
		end

	is_january: BOOLEAN is
		do
			Result := (value=january_low_level)
		end

	is_february: BOOLEAN is
		do
			Result := (value=february_low_level)
		end

	is_march: BOOLEAN is
		do
			Result := (value=march_low_level)
		end

	is_april: BOOLEAN is
		do
			Result := (value=april_low_level)
		end

	is_may: BOOLEAN is
		do
			Result := (value=may_low_level)
		end

	is_june: BOOLEAN is
		do
			Result := (value=june_low_level)
		end

	is_july: BOOLEAN is
		do
			Result := (value=july_low_level)
		end

	is_august: BOOLEAN is
		do
			Result := (value=august_low_level)
		end

	is_september: BOOLEAN is
		do
			Result := (value=september_low_level)
		end

	is_october: BOOLEAN is
		do
			Result := (value=october_low_level)
		end

	is_november: BOOLEAN is
		do
			Result := (value=november_low_level)
		end

	is_december: BOOLEAN is
		do
			Result := (value=december_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bad_month_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_BAD_MONTH"
 			}"
 		end

	january_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JANUARY"
 			}"
 		end

	february_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_FEBRUARY"
 			}"
 		end

	march_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MARCH"
 			}"
 		end

	april_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_APRIL"
 			}"
 		end

	may_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_MAY"
 			}"
 		end

	june_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JUNE"
 			}"
 		end

	july_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_JULY"
 			}"
 		end

	august_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_AUGUST"
 			}"
 		end

	september_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_SEPTEMBER"
 			}"
 		end

	october_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_OCTOBER"
 			}"
 		end

	november_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_NOVEMBER"
 			}"
 		end

	december_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DATE_DECEMBER"
 			}"
 		end


end -- class GDATE_MONTH_ENUM
