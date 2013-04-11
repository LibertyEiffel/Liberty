-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_STATUS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = initial_low_level)  or else
				(a_value = preparing_low_level)  or else
				(a_value = generating_data_low_level)  or else
				(a_value = sending_data_low_level)  or else
				(a_value = pending_low_level)  or else
				(a_value = pending_issue_low_level)  or else
				(a_value = printing_low_level)  or else
				(a_value = finished_low_level)  or else
				(a_value = finished_aborted_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_initial is
		do
			value := initial_low_level
		end

	set_preparing is
		do
			value := preparing_low_level
		end

	set_generating_data is
		do
			value := generating_data_low_level
		end

	set_sending_data is
		do
			value := sending_data_low_level
		end

	set_pending is
		do
			value := pending_low_level
		end

	set_pending_issue is
		do
			value := pending_issue_low_level
		end

	set_printing is
		do
			value := printing_low_level
		end

	set_finished is
		do
			value := finished_low_level
		end

	set_finished_aborted is
		do
			value := finished_aborted_low_level
		end

feature {ANY} -- Queries
	initial: BOOLEAN is
		do
			Result := (value=initial_low_level)
		end

	preparing: BOOLEAN is
		do
			Result := (value=preparing_low_level)
		end

	generating_data: BOOLEAN is
		do
			Result := (value=generating_data_low_level)
		end

	sending_data: BOOLEAN is
		do
			Result := (value=sending_data_low_level)
		end

	pending: BOOLEAN is
		do
			Result := (value=pending_low_level)
		end

	pending_issue: BOOLEAN is
		do
			Result := (value=pending_issue_low_level)
		end

	printing: BOOLEAN is
		do
			Result := (value=printing_low_level)
		end

	finished: BOOLEAN is
		do
			Result := (value=finished_low_level)
		end

	finished_aborted: BOOLEAN is
		do
			Result := (value=finished_aborted_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	initial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_INITIAL"
 			}"
 		end

	preparing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PREPARING"
 			}"
 		end

	generating_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_GENERATING_DATA"
 			}"
 		end

	sending_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_SENDING_DATA"
 			}"
 		end

	pending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PENDING"
 			}"
 		end

	pending_issue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PENDING_ISSUE"
 			}"
 		end

	printing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PRINTING"
 			}"
 		end

	finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_FINISHED"
 			}"
 		end

	finished_aborted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_FINISHED_ABORTED"
 			}"
 		end


end -- class GTK_PRINT_STATUS_ENUM
