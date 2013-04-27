-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOERROR_ENUM_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_io_error_address_in_use_low_level)  or else
				(a_value = g_io_error_already_mounted_low_level)  or else
				(a_value = g_io_error_busy_low_level)  or else
				(a_value = g_io_error_cancelled_low_level)  or else
				(a_value = g_io_error_cant_create_backup_low_level)  or else
				(a_value = g_io_error_closed_low_level)  or else
				(a_value = g_io_error_connection_refused_low_level)  or else
				(a_value = g_io_error_dbus_error_low_level)  or else
				(a_value = g_io_error_exists_low_level)  or else
				(a_value = g_io_error_failed_low_level)  or else
				(a_value = g_io_error_failed_handled_low_level)  or else
				(a_value = g_io_error_filename_too_long_low_level)  or else
				(a_value = g_io_error_host_not_found_low_level)  or else
				(a_value = g_io_error_host_unreachable_low_level)  or else
				(a_value = g_io_error_invalid_argument_low_level)  or else
				(a_value = g_io_error_invalid_data_low_level)  or else
				(a_value = g_io_error_invalid_filename_low_level)  or else
				(a_value = g_io_error_is_directory_low_level)  or else
				(a_value = g_io_error_network_unreachable_low_level)  or else
				(a_value = g_io_error_no_space_low_level)  or else
				(a_value = g_io_error_not_directory_low_level)  or else
				(a_value = g_io_error_not_empty_low_level)  or else
				(a_value = g_io_error_not_found_low_level)  or else
				(a_value = g_io_error_not_initialized_low_level)  or else
				(a_value = g_io_error_not_mountable_file_low_level)  or else
				(a_value = g_io_error_not_mounted_low_level)  or else
				(a_value = g_io_error_not_regular_file_low_level)  or else
				(a_value = g_io_error_not_supported_low_level)  or else
				(a_value = g_io_error_not_symbolic_link_low_level)  or else
				(a_value = g_io_error_partial_input_low_level)  or else
				(a_value = g_io_error_pending_low_level)  or else
				(a_value = g_io_error_permission_denied_low_level)  or else
				(a_value = g_io_error_proxy_auth_failed_low_level)  or else
				(a_value = g_io_error_proxy_failed_low_level)  or else
				(a_value = g_io_error_proxy_need_auth_low_level)  or else
				(a_value = g_io_error_proxy_not_allowed_low_level)  or else
				(a_value = g_io_error_read_only_low_level)  or else
				(a_value = g_io_error_timed_out_low_level)  or else
				(a_value = g_io_error_too_many_links_low_level)  or else
				(a_value = g_io_error_too_many_open_files_low_level)  or else
				(a_value = g_io_error_would_block_low_level)  or else
				(a_value = g_io_error_would_merge_low_level)  or else
				(a_value = g_io_error_would_recurse_low_level)  or else
				(a_value = g_io_error_wrong_etag_low_level) )
		end

feature -- Setters
	default_create,
	set_g_io_error_address_in_use is
		do
			value := g_io_error_address_in_use_low_level
		end

	set_g_io_error_already_mounted is
		do
			value := g_io_error_already_mounted_low_level
		end

	set_g_io_error_busy is
		do
			value := g_io_error_busy_low_level
		end

	set_g_io_error_cancelled is
		do
			value := g_io_error_cancelled_low_level
		end

	set_g_io_error_cant_create_backup is
		do
			value := g_io_error_cant_create_backup_low_level
		end

	set_g_io_error_closed is
		do
			value := g_io_error_closed_low_level
		end

	set_g_io_error_connection_refused is
		do
			value := g_io_error_connection_refused_low_level
		end

	set_g_io_error_dbus_error is
		do
			value := g_io_error_dbus_error_low_level
		end

	set_g_io_error_exists is
		do
			value := g_io_error_exists_low_level
		end

	set_g_io_error_failed is
		do
			value := g_io_error_failed_low_level
		end

	set_g_io_error_failed_handled is
		do
			value := g_io_error_failed_handled_low_level
		end

	set_g_io_error_filename_too_long is
		do
			value := g_io_error_filename_too_long_low_level
		end

	set_g_io_error_host_not_found is
		do
			value := g_io_error_host_not_found_low_level
		end

	set_g_io_error_host_unreachable is
		do
			value := g_io_error_host_unreachable_low_level
		end

	set_g_io_error_invalid_argument is
		do
			value := g_io_error_invalid_argument_low_level
		end

	set_g_io_error_invalid_data is
		do
			value := g_io_error_invalid_data_low_level
		end

	set_g_io_error_invalid_filename is
		do
			value := g_io_error_invalid_filename_low_level
		end

	set_g_io_error_is_directory is
		do
			value := g_io_error_is_directory_low_level
		end

	set_g_io_error_network_unreachable is
		do
			value := g_io_error_network_unreachable_low_level
		end

	set_g_io_error_no_space is
		do
			value := g_io_error_no_space_low_level
		end

	set_g_io_error_not_directory is
		do
			value := g_io_error_not_directory_low_level
		end

	set_g_io_error_not_empty is
		do
			value := g_io_error_not_empty_low_level
		end

	set_g_io_error_not_found is
		do
			value := g_io_error_not_found_low_level
		end

	set_g_io_error_not_initialized is
		do
			value := g_io_error_not_initialized_low_level
		end

	set_g_io_error_not_mountable_file is
		do
			value := g_io_error_not_mountable_file_low_level
		end

	set_g_io_error_not_mounted is
		do
			value := g_io_error_not_mounted_low_level
		end

	set_g_io_error_not_regular_file is
		do
			value := g_io_error_not_regular_file_low_level
		end

	set_g_io_error_not_supported is
		do
			value := g_io_error_not_supported_low_level
		end

	set_g_io_error_not_symbolic_link is
		do
			value := g_io_error_not_symbolic_link_low_level
		end

	set_g_io_error_partial_input is
		do
			value := g_io_error_partial_input_low_level
		end

	set_g_io_error_pending is
		do
			value := g_io_error_pending_low_level
		end

	set_g_io_error_permission_denied is
		do
			value := g_io_error_permission_denied_low_level
		end

	set_g_io_error_proxy_auth_failed is
		do
			value := g_io_error_proxy_auth_failed_low_level
		end

	set_g_io_error_proxy_failed is
		do
			value := g_io_error_proxy_failed_low_level
		end

	set_g_io_error_proxy_need_auth is
		do
			value := g_io_error_proxy_need_auth_low_level
		end

	set_g_io_error_proxy_not_allowed is
		do
			value := g_io_error_proxy_not_allowed_low_level
		end

	set_g_io_error_read_only is
		do
			value := g_io_error_read_only_low_level
		end

	set_g_io_error_timed_out is
		do
			value := g_io_error_timed_out_low_level
		end

	set_g_io_error_too_many_links is
		do
			value := g_io_error_too_many_links_low_level
		end

	set_g_io_error_too_many_open_files is
		do
			value := g_io_error_too_many_open_files_low_level
		end

	set_g_io_error_would_block is
		do
			value := g_io_error_would_block_low_level
		end

	set_g_io_error_would_merge is
		do
			value := g_io_error_would_merge_low_level
		end

	set_g_io_error_would_recurse is
		do
			value := g_io_error_would_recurse_low_level
		end

	set_g_io_error_wrong_etag is
		do
			value := g_io_error_wrong_etag_low_level
		end

feature -- Queries
	is_g_io_error_address_in_use: BOOLEAN is
		do
			Result := (value=g_io_error_address_in_use_low_level)
		end

	is_g_io_error_already_mounted: BOOLEAN is
		do
			Result := (value=g_io_error_already_mounted_low_level)
		end

	is_g_io_error_busy: BOOLEAN is
		do
			Result := (value=g_io_error_busy_low_level)
		end

	is_g_io_error_cancelled: BOOLEAN is
		do
			Result := (value=g_io_error_cancelled_low_level)
		end

	is_g_io_error_cant_create_backup: BOOLEAN is
		do
			Result := (value=g_io_error_cant_create_backup_low_level)
		end

	is_g_io_error_closed: BOOLEAN is
		do
			Result := (value=g_io_error_closed_low_level)
		end

	is_g_io_error_connection_refused: BOOLEAN is
		do
			Result := (value=g_io_error_connection_refused_low_level)
		end

	is_g_io_error_dbus_error: BOOLEAN is
		do
			Result := (value=g_io_error_dbus_error_low_level)
		end

	is_g_io_error_exists: BOOLEAN is
		do
			Result := (value=g_io_error_exists_low_level)
		end

	is_g_io_error_failed: BOOLEAN is
		do
			Result := (value=g_io_error_failed_low_level)
		end

	is_g_io_error_failed_handled: BOOLEAN is
		do
			Result := (value=g_io_error_failed_handled_low_level)
		end

	is_g_io_error_filename_too_long: BOOLEAN is
		do
			Result := (value=g_io_error_filename_too_long_low_level)
		end

	is_g_io_error_host_not_found: BOOLEAN is
		do
			Result := (value=g_io_error_host_not_found_low_level)
		end

	is_g_io_error_host_unreachable: BOOLEAN is
		do
			Result := (value=g_io_error_host_unreachable_low_level)
		end

	is_g_io_error_invalid_argument: BOOLEAN is
		do
			Result := (value=g_io_error_invalid_argument_low_level)
		end

	is_g_io_error_invalid_data: BOOLEAN is
		do
			Result := (value=g_io_error_invalid_data_low_level)
		end

	is_g_io_error_invalid_filename: BOOLEAN is
		do
			Result := (value=g_io_error_invalid_filename_low_level)
		end

	is_g_io_error_is_directory: BOOLEAN is
		do
			Result := (value=g_io_error_is_directory_low_level)
		end

	is_g_io_error_network_unreachable: BOOLEAN is
		do
			Result := (value=g_io_error_network_unreachable_low_level)
		end

	is_g_io_error_no_space: BOOLEAN is
		do
			Result := (value=g_io_error_no_space_low_level)
		end

	is_g_io_error_not_directory: BOOLEAN is
		do
			Result := (value=g_io_error_not_directory_low_level)
		end

	is_g_io_error_not_empty: BOOLEAN is
		do
			Result := (value=g_io_error_not_empty_low_level)
		end

	is_g_io_error_not_found: BOOLEAN is
		do
			Result := (value=g_io_error_not_found_low_level)
		end

	is_g_io_error_not_initialized: BOOLEAN is
		do
			Result := (value=g_io_error_not_initialized_low_level)
		end

	is_g_io_error_not_mountable_file: BOOLEAN is
		do
			Result := (value=g_io_error_not_mountable_file_low_level)
		end

	is_g_io_error_not_mounted: BOOLEAN is
		do
			Result := (value=g_io_error_not_mounted_low_level)
		end

	is_g_io_error_not_regular_file: BOOLEAN is
		do
			Result := (value=g_io_error_not_regular_file_low_level)
		end

	is_g_io_error_not_supported: BOOLEAN is
		do
			Result := (value=g_io_error_not_supported_low_level)
		end

	is_g_io_error_not_symbolic_link: BOOLEAN is
		do
			Result := (value=g_io_error_not_symbolic_link_low_level)
		end

	is_g_io_error_partial_input: BOOLEAN is
		do
			Result := (value=g_io_error_partial_input_low_level)
		end

	is_g_io_error_pending: BOOLEAN is
		do
			Result := (value=g_io_error_pending_low_level)
		end

	is_g_io_error_permission_denied: BOOLEAN is
		do
			Result := (value=g_io_error_permission_denied_low_level)
		end

	is_g_io_error_proxy_auth_failed: BOOLEAN is
		do
			Result := (value=g_io_error_proxy_auth_failed_low_level)
		end

	is_g_io_error_proxy_failed: BOOLEAN is
		do
			Result := (value=g_io_error_proxy_failed_low_level)
		end

	is_g_io_error_proxy_need_auth: BOOLEAN is
		do
			Result := (value=g_io_error_proxy_need_auth_low_level)
		end

	is_g_io_error_proxy_not_allowed: BOOLEAN is
		do
			Result := (value=g_io_error_proxy_not_allowed_low_level)
		end

	is_g_io_error_read_only: BOOLEAN is
		do
			Result := (value=g_io_error_read_only_low_level)
		end

	is_g_io_error_timed_out: BOOLEAN is
		do
			Result := (value=g_io_error_timed_out_low_level)
		end

	is_g_io_error_too_many_links: BOOLEAN is
		do
			Result := (value=g_io_error_too_many_links_low_level)
		end

	is_g_io_error_too_many_open_files: BOOLEAN is
		do
			Result := (value=g_io_error_too_many_open_files_low_level)
		end

	is_g_io_error_would_block: BOOLEAN is
		do
			Result := (value=g_io_error_would_block_low_level)
		end

	is_g_io_error_would_merge: BOOLEAN is
		do
			Result := (value=g_io_error_would_merge_low_level)
		end

	is_g_io_error_would_recurse: BOOLEAN is
		do
			Result := (value=g_io_error_would_recurse_low_level)
		end

	is_g_io_error_wrong_etag: BOOLEAN is
		do
			Result := (value=g_io_error_wrong_etag_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_error_address_in_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_ADDRESS_IN_USE"
 			}"
 		end

	g_io_error_already_mounted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_ALREADY_MOUNTED"
 			}"
 		end

	g_io_error_busy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_BUSY"
 			}"
 		end

	g_io_error_cancelled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CANCELLED"
 			}"
 		end

	g_io_error_cant_create_backup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CANT_CREATE_BACKUP"
 			}"
 		end

	g_io_error_closed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CLOSED"
 			}"
 		end

	g_io_error_connection_refused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CONNECTION_REFUSED"
 			}"
 		end

	g_io_error_dbus_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_DBUS_ERROR"
 			}"
 		end

	g_io_error_exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_EXISTS"
 			}"
 		end

	g_io_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_FAILED"
 			}"
 		end

	g_io_error_failed_handled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_FAILED_HANDLED"
 			}"
 		end

	g_io_error_filename_too_long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_FILENAME_TOO_LONG"
 			}"
 		end

	g_io_error_host_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_HOST_NOT_FOUND"
 			}"
 		end

	g_io_error_host_unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_HOST_UNREACHABLE"
 			}"
 		end

	g_io_error_invalid_argument_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVALID_ARGUMENT"
 			}"
 		end

	g_io_error_invalid_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVALID_DATA"
 			}"
 		end

	g_io_error_invalid_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVALID_FILENAME"
 			}"
 		end

	g_io_error_is_directory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_IS_DIRECTORY"
 			}"
 		end

	g_io_error_network_unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NETWORK_UNREACHABLE"
 			}"
 		end

	g_io_error_no_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NO_SPACE"
 			}"
 		end

	g_io_error_not_directory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_DIRECTORY"
 			}"
 		end

	g_io_error_not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_EMPTY"
 			}"
 		end

	g_io_error_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_FOUND"
 			}"
 		end

	g_io_error_not_initialized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_INITIALIZED"
 			}"
 		end

	g_io_error_not_mountable_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_MOUNTABLE_FILE"
 			}"
 		end

	g_io_error_not_mounted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_MOUNTED"
 			}"
 		end

	g_io_error_not_regular_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_REGULAR_FILE"
 			}"
 		end

	g_io_error_not_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_SUPPORTED"
 			}"
 		end

	g_io_error_not_symbolic_link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_SYMBOLIC_LINK"
 			}"
 		end

	g_io_error_partial_input_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PARTIAL_INPUT"
 			}"
 		end

	g_io_error_pending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PENDING"
 			}"
 		end

	g_io_error_permission_denied_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PERMISSION_DENIED"
 			}"
 		end

	g_io_error_proxy_auth_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_AUTH_FAILED"
 			}"
 		end

	g_io_error_proxy_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_FAILED"
 			}"
 		end

	g_io_error_proxy_need_auth_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_NEED_AUTH"
 			}"
 		end

	g_io_error_proxy_not_allowed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_NOT_ALLOWED"
 			}"
 		end

	g_io_error_read_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_READ_ONLY"
 			}"
 		end

	g_io_error_timed_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_TIMED_OUT"
 			}"
 		end

	g_io_error_too_many_links_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_TOO_MANY_LINKS"
 			}"
 		end

	g_io_error_too_many_open_files_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_TOO_MANY_OPEN_FILES"
 			}"
 		end

	g_io_error_would_block_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WOULD_BLOCK"
 			}"
 		end

	g_io_error_would_merge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WOULD_MERGE"
 			}"
 		end

	g_io_error_would_recurse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WOULD_RECURSE"
 			}"
 		end

	g_io_error_wrong_etag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WRONG_ETAG"
 			}"
 		end


end -- class GIOERROR_ENUM_ENUM
