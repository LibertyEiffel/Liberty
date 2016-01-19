-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_STATUS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_status_finished_low_level)  or else
				(a_value = gtk_print_status_finished_aborted_low_level)  or else
				(a_value = gtk_print_status_generating_data_low_level)  or else
				(a_value = gtk_print_status_initial_low_level)  or else
				(a_value = gtk_print_status_pending_low_level)  or else
				(a_value = gtk_print_status_pending_issue_low_level)  or else
				(a_value = gtk_print_status_preparing_low_level)  or else
				(a_value = gtk_print_status_printing_low_level)  or else
				(a_value = gtk_print_status_sending_data_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_print_status_finished is
		do
			value := gtk_print_status_finished_low_level
		end

	set_gtk_print_status_finished_aborted is
		do
			value := gtk_print_status_finished_aborted_low_level
		end

	set_gtk_print_status_generating_data is
		do
			value := gtk_print_status_generating_data_low_level
		end

	set_gtk_print_status_initial is
		do
			value := gtk_print_status_initial_low_level
		end

	set_gtk_print_status_pending is
		do
			value := gtk_print_status_pending_low_level
		end

	set_gtk_print_status_pending_issue is
		do
			value := gtk_print_status_pending_issue_low_level
		end

	set_gtk_print_status_preparing is
		do
			value := gtk_print_status_preparing_low_level
		end

	set_gtk_print_status_printing is
		do
			value := gtk_print_status_printing_low_level
		end

	set_gtk_print_status_sending_data is
		do
			value := gtk_print_status_sending_data_low_level
		end

feature -- Queries
	is_gtk_print_status_finished: BOOLEAN is
		do
			Result := (value=gtk_print_status_finished_low_level)
		end

	is_gtk_print_status_finished_aborted: BOOLEAN is
		do
			Result := (value=gtk_print_status_finished_aborted_low_level)
		end

	is_gtk_print_status_generating_data: BOOLEAN is
		do
			Result := (value=gtk_print_status_generating_data_low_level)
		end

	is_gtk_print_status_initial: BOOLEAN is
		do
			Result := (value=gtk_print_status_initial_low_level)
		end

	is_gtk_print_status_pending: BOOLEAN is
		do
			Result := (value=gtk_print_status_pending_low_level)
		end

	is_gtk_print_status_pending_issue: BOOLEAN is
		do
			Result := (value=gtk_print_status_pending_issue_low_level)
		end

	is_gtk_print_status_preparing: BOOLEAN is
		do
			Result := (value=gtk_print_status_preparing_low_level)
		end

	is_gtk_print_status_printing: BOOLEAN is
		do
			Result := (value=gtk_print_status_printing_low_level)
		end

	is_gtk_print_status_sending_data: BOOLEAN is
		do
			Result := (value=gtk_print_status_sending_data_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_status_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_FINISHED"
 			}"
 		end

	gtk_print_status_finished_aborted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_FINISHED_ABORTED"
 			}"
 		end

	gtk_print_status_generating_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_GENERATING_DATA"
 			}"
 		end

	gtk_print_status_initial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_INITIAL"
 			}"
 		end

	gtk_print_status_pending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PENDING"
 			}"
 		end

	gtk_print_status_pending_issue_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PENDING_ISSUE"
 			}"
 		end

	gtk_print_status_preparing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PREPARING"
 			}"
 		end

	gtk_print_status_printing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_PRINTING"
 			}"
 		end

	gtk_print_status_sending_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_STATUS_SENDING_DATA"
 			}"
 		end


end -- class GTK_PRINT_STATUS_ENUM
