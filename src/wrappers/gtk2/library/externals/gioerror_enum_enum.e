-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOERROR_ENUM_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = failed_low_level)  or else
				(a_value = not_found_low_level)  or else
				(a_value = exists_low_level)  or else
				(a_value = is_directory_low_level)  or else
				(a_value = not_directory_low_level)  or else
				(a_value = not_empty_low_level)  or else
				(a_value = not_regular_file_low_level)  or else
				(a_value = not_symbolic_link_low_level)  or else
				(a_value = not_mountable_file_low_level)  or else
				(a_value = filename_too_long_low_level)  or else
				(a_value = invalid_filename_low_level)  or else
				(a_value = too_many_links_low_level)  or else
				(a_value = no_space_low_level)  or else
				(a_value = invalid_argument_low_level)  or else
				(a_value = permission_denied_low_level)  or else
				(a_value = not_supported_low_level)  or else
				(a_value = not_mounted_low_level)  or else
				(a_value = already_mounted_low_level)  or else
				(a_value = closed_low_level)  or else
				(a_value = cancelled_low_level)  or else
				(a_value = pending_low_level)  or else
				(a_value = read_only_low_level)  or else
				(a_value = cant_create_backup_low_level)  or else
				(a_value = wrong_etag_low_level)  or else
				(a_value = timed_out_low_level)  or else
				(a_value = would_recurse_low_level)  or else
				(a_value = busy_low_level)  or else
				(a_value = would_block_low_level)  or else
				(a_value = host_not_found_low_level)  or else
				(a_value = would_merge_low_level)  or else
				(a_value = failed_handled_low_level)  or else
				(a_value = too_many_open_files_low_level)  or else
				(a_value = not_initialized_low_level)  or else
				(a_value = address_in_use_low_level)  or else
				(a_value = partial_input_low_level)  or else
				(a_value = invalid_data_low_level)  or else
				(a_value = dbus_error_low_level)  or else
				(a_value = host_unreachable_low_level)  or else
				(a_value = network_unreachable_low_level)  or else
				(a_value = connection_refused_low_level)  or else
				(a_value = proxy_failed_low_level)  or else
				(a_value = proxy_auth_failed_low_level)  or else
				(a_value = proxy_need_auth_low_level)  or else
				(a_value = proxy_not_allowed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_failed is
		do
			value := failed_low_level
		end

	set_not_found is
		do
			value := not_found_low_level
		end

	set_exists is
		do
			value := exists_low_level
		end

	set_is_directory is
		do
			value := is_directory_low_level
		end

	set_not_directory is
		do
			value := not_directory_low_level
		end

	set_not_empty is
		do
			value := not_empty_low_level
		end

	set_not_regular_file is
		do
			value := not_regular_file_low_level
		end

	set_not_symbolic_link is
		do
			value := not_symbolic_link_low_level
		end

	set_not_mountable_file is
		do
			value := not_mountable_file_low_level
		end

	set_filename_too_long is
		do
			value := filename_too_long_low_level
		end

	set_invalid_filename is
		do
			value := invalid_filename_low_level
		end

	set_too_many_links is
		do
			value := too_many_links_low_level
		end

	set_no_space is
		do
			value := no_space_low_level
		end

	set_invalid_argument is
		do
			value := invalid_argument_low_level
		end

	set_permission_denied is
		do
			value := permission_denied_low_level
		end

	set_not_supported is
		do
			value := not_supported_low_level
		end

	set_not_mounted is
		do
			value := not_mounted_low_level
		end

	set_already_mounted is
		do
			value := already_mounted_low_level
		end

	set_closed is
		do
			value := closed_low_level
		end

	set_cancelled is
		do
			value := cancelled_low_level
		end

	set_pending is
		do
			value := pending_low_level
		end

	set_read_only is
		do
			value := read_only_low_level
		end

	set_cant_create_backup is
		do
			value := cant_create_backup_low_level
		end

	set_wrong_etag is
		do
			value := wrong_etag_low_level
		end

	set_timed_out is
		do
			value := timed_out_low_level
		end

	set_would_recurse is
		do
			value := would_recurse_low_level
		end

	set_busy is
		do
			value := busy_low_level
		end

	set_would_block is
		do
			value := would_block_low_level
		end

	set_host_not_found is
		do
			value := host_not_found_low_level
		end

	set_would_merge is
		do
			value := would_merge_low_level
		end

	set_failed_handled is
		do
			value := failed_handled_low_level
		end

	set_too_many_open_files is
		do
			value := too_many_open_files_low_level
		end

	set_not_initialized is
		do
			value := not_initialized_low_level
		end

	set_address_in_use is
		do
			value := address_in_use_low_level
		end

	set_partial_input is
		do
			value := partial_input_low_level
		end

	set_invalid_data is
		do
			value := invalid_data_low_level
		end

	set_dbus_error is
		do
			value := dbus_error_low_level
		end

	set_host_unreachable is
		do
			value := host_unreachable_low_level
		end

	set_network_unreachable is
		do
			value := network_unreachable_low_level
		end

	set_connection_refused is
		do
			value := connection_refused_low_level
		end

	set_proxy_failed is
		do
			value := proxy_failed_low_level
		end

	set_proxy_auth_failed is
		do
			value := proxy_auth_failed_low_level
		end

	set_proxy_need_auth is
		do
			value := proxy_need_auth_low_level
		end

	set_proxy_not_allowed is
		do
			value := proxy_not_allowed_low_level
		end

feature {ANY} -- Queries
	failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

	not_found: BOOLEAN is
		do
			Result := (value=not_found_low_level)
		end

	exists: BOOLEAN is
		do
			Result := (value=exists_low_level)
		end

	is_directory: BOOLEAN is
		do
			Result := (value=is_directory_low_level)
		end

	not_directory: BOOLEAN is
		do
			Result := (value=not_directory_low_level)
		end

	not_empty: BOOLEAN is
		do
			Result := (value=not_empty_low_level)
		end

	not_regular_file: BOOLEAN is
		do
			Result := (value=not_regular_file_low_level)
		end

	not_symbolic_link: BOOLEAN is
		do
			Result := (value=not_symbolic_link_low_level)
		end

	not_mountable_file: BOOLEAN is
		do
			Result := (value=not_mountable_file_low_level)
		end

	filename_too_long: BOOLEAN is
		do
			Result := (value=filename_too_long_low_level)
		end

	invalid_filename: BOOLEAN is
		do
			Result := (value=invalid_filename_low_level)
		end

	too_many_links: BOOLEAN is
		do
			Result := (value=too_many_links_low_level)
		end

	no_space: BOOLEAN is
		do
			Result := (value=no_space_low_level)
		end

	invalid_argument: BOOLEAN is
		do
			Result := (value=invalid_argument_low_level)
		end

	permission_denied: BOOLEAN is
		do
			Result := (value=permission_denied_low_level)
		end

	not_supported: BOOLEAN is
		do
			Result := (value=not_supported_low_level)
		end

	not_mounted: BOOLEAN is
		do
			Result := (value=not_mounted_low_level)
		end

	already_mounted: BOOLEAN is
		do
			Result := (value=already_mounted_low_level)
		end

	closed: BOOLEAN is
		do
			Result := (value=closed_low_level)
		end

	cancelled: BOOLEAN is
		do
			Result := (value=cancelled_low_level)
		end

	pending: BOOLEAN is
		do
			Result := (value=pending_low_level)
		end

	read_only: BOOLEAN is
		do
			Result := (value=read_only_low_level)
		end

	cant_create_backup: BOOLEAN is
		do
			Result := (value=cant_create_backup_low_level)
		end

	wrong_etag: BOOLEAN is
		do
			Result := (value=wrong_etag_low_level)
		end

	timed_out: BOOLEAN is
		do
			Result := (value=timed_out_low_level)
		end

	would_recurse: BOOLEAN is
		do
			Result := (value=would_recurse_low_level)
		end

	busy: BOOLEAN is
		do
			Result := (value=busy_low_level)
		end

	would_block: BOOLEAN is
		do
			Result := (value=would_block_low_level)
		end

	host_not_found: BOOLEAN is
		do
			Result := (value=host_not_found_low_level)
		end

	would_merge: BOOLEAN is
		do
			Result := (value=would_merge_low_level)
		end

	failed_handled: BOOLEAN is
		do
			Result := (value=failed_handled_low_level)
		end

	too_many_open_files: BOOLEAN is
		do
			Result := (value=too_many_open_files_low_level)
		end

	not_initialized: BOOLEAN is
		do
			Result := (value=not_initialized_low_level)
		end

	address_in_use: BOOLEAN is
		do
			Result := (value=address_in_use_low_level)
		end

	partial_input: BOOLEAN is
		do
			Result := (value=partial_input_low_level)
		end

	invalid_data: BOOLEAN is
		do
			Result := (value=invalid_data_low_level)
		end

	dbus_error: BOOLEAN is
		do
			Result := (value=dbus_error_low_level)
		end

	host_unreachable: BOOLEAN is
		do
			Result := (value=host_unreachable_low_level)
		end

	network_unreachable: BOOLEAN is
		do
			Result := (value=network_unreachable_low_level)
		end

	connection_refused: BOOLEAN is
		do
			Result := (value=connection_refused_low_level)
		end

	proxy_failed: BOOLEAN is
		do
			Result := (value=proxy_failed_low_level)
		end

	proxy_auth_failed: BOOLEAN is
		do
			Result := (value=proxy_auth_failed_low_level)
		end

	proxy_need_auth: BOOLEAN is
		do
			Result := (value=proxy_need_auth_low_level)
		end

	proxy_not_allowed: BOOLEAN is
		do
			Result := (value=proxy_not_allowed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_FAILED"
 			}"
 		end

	not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_FOUND"
 			}"
 		end

	exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_EXISTS"
 			}"
 		end

	is_directory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_IS_DIRECTORY"
 			}"
 		end

	not_directory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_DIRECTORY"
 			}"
 		end

	not_empty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_EMPTY"
 			}"
 		end

	not_regular_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_REGULAR_FILE"
 			}"
 		end

	not_symbolic_link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_SYMBOLIC_LINK"
 			}"
 		end

	not_mountable_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_MOUNTABLE_FILE"
 			}"
 		end

	filename_too_long_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_FILENAME_TOO_LONG"
 			}"
 		end

	invalid_filename_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVALID_FILENAME"
 			}"
 		end

	too_many_links_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_TOO_MANY_LINKS"
 			}"
 		end

	no_space_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NO_SPACE"
 			}"
 		end

	invalid_argument_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVALID_ARGUMENT"
 			}"
 		end

	permission_denied_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PERMISSION_DENIED"
 			}"
 		end

	not_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_SUPPORTED"
 			}"
 		end

	not_mounted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_MOUNTED"
 			}"
 		end

	already_mounted_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_ALREADY_MOUNTED"
 			}"
 		end

	closed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CLOSED"
 			}"
 		end

	cancelled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CANCELLED"
 			}"
 		end

	pending_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PENDING"
 			}"
 		end

	read_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_READ_ONLY"
 			}"
 		end

	cant_create_backup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CANT_CREATE_BACKUP"
 			}"
 		end

	wrong_etag_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WRONG_ETAG"
 			}"
 		end

	timed_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_TIMED_OUT"
 			}"
 		end

	would_recurse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WOULD_RECURSE"
 			}"
 		end

	busy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_BUSY"
 			}"
 		end

	would_block_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WOULD_BLOCK"
 			}"
 		end

	host_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_HOST_NOT_FOUND"
 			}"
 		end

	would_merge_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_WOULD_MERGE"
 			}"
 		end

	failed_handled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_FAILED_HANDLED"
 			}"
 		end

	too_many_open_files_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_TOO_MANY_OPEN_FILES"
 			}"
 		end

	not_initialized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NOT_INITIALIZED"
 			}"
 		end

	address_in_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_ADDRESS_IN_USE"
 			}"
 		end

	partial_input_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PARTIAL_INPUT"
 			}"
 		end

	invalid_data_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVALID_DATA"
 			}"
 		end

	dbus_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_DBUS_ERROR"
 			}"
 		end

	host_unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_HOST_UNREACHABLE"
 			}"
 		end

	network_unreachable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NETWORK_UNREACHABLE"
 			}"
 		end

	connection_refused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_CONNECTION_REFUSED"
 			}"
 		end

	proxy_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_FAILED"
 			}"
 		end

	proxy_auth_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_AUTH_FAILED"
 			}"
 		end

	proxy_need_auth_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_NEED_AUTH"
 			}"
 		end

	proxy_not_allowed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_PROXY_NOT_ALLOWED"
 			}"
 		end


end -- class GIOERROR_ENUM_ENUM
