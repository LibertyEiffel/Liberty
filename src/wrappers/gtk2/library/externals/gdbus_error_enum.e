-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUS_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = failed_low_level)  or else
				(a_value = no_memory_low_level)  or else
				(a_value = service_unknown_low_level)  or else
				(a_value = name_has_no_owner_low_level)  or else
				(a_value = no_reply_low_level)  or else
				(a_value = io_error_low_level)  or else
				(a_value = bad_address_low_level)  or else
				(a_value = not_supported_low_level)  or else
				(a_value = limits_exceeded_low_level)  or else
				(a_value = access_denied_low_level)  or else
				(a_value = auth_failed_low_level)  or else
				(a_value = no_server_low_level)  or else
				(a_value = timeout_low_level)  or else
				(a_value = no_network_low_level)  or else
				(a_value = address_in_use_low_level)  or else
				(a_value = disconnected_low_level)  or else
				(a_value = invalid_args_low_level)  or else
				(a_value = file_not_found_low_level)  or else
				(a_value = file_exists_low_level)  or else
				(a_value = unknown_method_low_level)  or else
				(a_value = timed_out_low_level)  or else
				(a_value = match_rule_not_found_low_level)  or else
				(a_value = match_rule_invalid_low_level)  or else
				(a_value = spawn_exec_failed_low_level)  or else
				(a_value = spawn_fork_failed_low_level)  or else
				(a_value = spawn_child_exited_low_level)  or else
				(a_value = spawn_child_signaled_low_level)  or else
				(a_value = spawn_failed_low_level)  or else
				(a_value = spawn_setup_failed_low_level)  or else
				(a_value = spawn_config_invalid_low_level)  or else
				(a_value = spawn_service_invalid_low_level)  or else
				(a_value = spawn_service_not_found_low_level)  or else
				(a_value = spawn_permissions_invalid_low_level)  or else
				(a_value = spawn_file_invalid_low_level)  or else
				(a_value = spawn_no_memory_low_level)  or else
				(a_value = unix_process_id_unknown_low_level)  or else
				(a_value = invalid_signature_low_level)  or else
				(a_value = invalid_file_content_low_level)  or else
				(a_value = selinux_security_context_unknown_low_level)  or else
				(a_value = adt_audit_data_unknown_low_level)  or else
				(a_value = object_path_in_use_low_level) )
		end

feature -- Setters
	default_create,
	set_failed is
		do
			value := failed_low_level
		end

	set_no_memory is
		do
			value := no_memory_low_level
		end

	set_service_unknown is
		do
			value := service_unknown_low_level
		end

	set_name_has_no_owner is
		do
			value := name_has_no_owner_low_level
		end

	set_no_reply is
		do
			value := no_reply_low_level
		end

	set_io_error is
		do
			value := io_error_low_level
		end

	set_bad_address is
		do
			value := bad_address_low_level
		end

	set_not_supported is
		do
			value := not_supported_low_level
		end

	set_limits_exceeded is
		do
			value := limits_exceeded_low_level
		end

	set_access_denied is
		do
			value := access_denied_low_level
		end

	set_auth_failed is
		do
			value := auth_failed_low_level
		end

	set_no_server is
		do
			value := no_server_low_level
		end

	set_timeout is
		do
			value := timeout_low_level
		end

	set_no_network is
		do
			value := no_network_low_level
		end

	set_address_in_use is
		do
			value := address_in_use_low_level
		end

	set_disconnected is
		do
			value := disconnected_low_level
		end

	set_invalid_args is
		do
			value := invalid_args_low_level
		end

	set_file_not_found is
		do
			value := file_not_found_low_level
		end

	set_file_exists is
		do
			value := file_exists_low_level
		end

	set_unknown_method is
		do
			value := unknown_method_low_level
		end

	set_timed_out is
		do
			value := timed_out_low_level
		end

	set_match_rule_not_found is
		do
			value := match_rule_not_found_low_level
		end

	set_match_rule_invalid is
		do
			value := match_rule_invalid_low_level
		end

	set_spawn_exec_failed is
		do
			value := spawn_exec_failed_low_level
		end

	set_spawn_fork_failed is
		do
			value := spawn_fork_failed_low_level
		end

	set_spawn_child_exited is
		do
			value := spawn_child_exited_low_level
		end

	set_spawn_child_signaled is
		do
			value := spawn_child_signaled_low_level
		end

	set_spawn_failed is
		do
			value := spawn_failed_low_level
		end

	set_spawn_setup_failed is
		do
			value := spawn_setup_failed_low_level
		end

	set_spawn_config_invalid is
		do
			value := spawn_config_invalid_low_level
		end

	set_spawn_service_invalid is
		do
			value := spawn_service_invalid_low_level
		end

	set_spawn_service_not_found is
		do
			value := spawn_service_not_found_low_level
		end

	set_spawn_permissions_invalid is
		do
			value := spawn_permissions_invalid_low_level
		end

	set_spawn_file_invalid is
		do
			value := spawn_file_invalid_low_level
		end

	set_spawn_no_memory is
		do
			value := spawn_no_memory_low_level
		end

	set_unix_process_id_unknown is
		do
			value := unix_process_id_unknown_low_level
		end

	set_invalid_signature is
		do
			value := invalid_signature_low_level
		end

	set_invalid_file_content is
		do
			value := invalid_file_content_low_level
		end

	set_selinux_security_context_unknown is
		do
			value := selinux_security_context_unknown_low_level
		end

	set_adt_audit_data_unknown is
		do
			value := adt_audit_data_unknown_low_level
		end

	set_object_path_in_use is
		do
			value := object_path_in_use_low_level
		end

feature -- Queries
	failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

	no_memory: BOOLEAN is
		do
			Result := (value=no_memory_low_level)
		end

	service_unknown: BOOLEAN is
		do
			Result := (value=service_unknown_low_level)
		end

	name_has_no_owner: BOOLEAN is
		do
			Result := (value=name_has_no_owner_low_level)
		end

	no_reply: BOOLEAN is
		do
			Result := (value=no_reply_low_level)
		end

	io_error: BOOLEAN is
		do
			Result := (value=io_error_low_level)
		end

	bad_address: BOOLEAN is
		do
			Result := (value=bad_address_low_level)
		end

	not_supported: BOOLEAN is
		do
			Result := (value=not_supported_low_level)
		end

	limits_exceeded: BOOLEAN is
		do
			Result := (value=limits_exceeded_low_level)
		end

	access_denied: BOOLEAN is
		do
			Result := (value=access_denied_low_level)
		end

	auth_failed: BOOLEAN is
		do
			Result := (value=auth_failed_low_level)
		end

	no_server: BOOLEAN is
		do
			Result := (value=no_server_low_level)
		end

	timeout: BOOLEAN is
		do
			Result := (value=timeout_low_level)
		end

	no_network: BOOLEAN is
		do
			Result := (value=no_network_low_level)
		end

	address_in_use: BOOLEAN is
		do
			Result := (value=address_in_use_low_level)
		end

	disconnected: BOOLEAN is
		do
			Result := (value=disconnected_low_level)
		end

	invalid_args: BOOLEAN is
		do
			Result := (value=invalid_args_low_level)
		end

	file_not_found: BOOLEAN is
		do
			Result := (value=file_not_found_low_level)
		end

	file_exists: BOOLEAN is
		do
			Result := (value=file_exists_low_level)
		end

	unknown_method: BOOLEAN is
		do
			Result := (value=unknown_method_low_level)
		end

	timed_out: BOOLEAN is
		do
			Result := (value=timed_out_low_level)
		end

	match_rule_not_found: BOOLEAN is
		do
			Result := (value=match_rule_not_found_low_level)
		end

	match_rule_invalid: BOOLEAN is
		do
			Result := (value=match_rule_invalid_low_level)
		end

	spawn_exec_failed: BOOLEAN is
		do
			Result := (value=spawn_exec_failed_low_level)
		end

	spawn_fork_failed: BOOLEAN is
		do
			Result := (value=spawn_fork_failed_low_level)
		end

	spawn_child_exited: BOOLEAN is
		do
			Result := (value=spawn_child_exited_low_level)
		end

	spawn_child_signaled: BOOLEAN is
		do
			Result := (value=spawn_child_signaled_low_level)
		end

	spawn_failed: BOOLEAN is
		do
			Result := (value=spawn_failed_low_level)
		end

	spawn_setup_failed: BOOLEAN is
		do
			Result := (value=spawn_setup_failed_low_level)
		end

	spawn_config_invalid: BOOLEAN is
		do
			Result := (value=spawn_config_invalid_low_level)
		end

	spawn_service_invalid: BOOLEAN is
		do
			Result := (value=spawn_service_invalid_low_level)
		end

	spawn_service_not_found: BOOLEAN is
		do
			Result := (value=spawn_service_not_found_low_level)
		end

	spawn_permissions_invalid: BOOLEAN is
		do
			Result := (value=spawn_permissions_invalid_low_level)
		end

	spawn_file_invalid: BOOLEAN is
		do
			Result := (value=spawn_file_invalid_low_level)
		end

	spawn_no_memory: BOOLEAN is
		do
			Result := (value=spawn_no_memory_low_level)
		end

	unix_process_id_unknown: BOOLEAN is
		do
			Result := (value=unix_process_id_unknown_low_level)
		end

	invalid_signature: BOOLEAN is
		do
			Result := (value=invalid_signature_low_level)
		end

	invalid_file_content: BOOLEAN is
		do
			Result := (value=invalid_file_content_low_level)
		end

	selinux_security_context_unknown: BOOLEAN is
		do
			Result := (value=selinux_security_context_unknown_low_level)
		end

	adt_audit_data_unknown: BOOLEAN is
		do
			Result := (value=adt_audit_data_unknown_low_level)
		end

	object_path_in_use: BOOLEAN is
		do
			Result := (value=object_path_in_use_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_FAILED"
 			}"
 		end

	no_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_MEMORY"
 			}"
 		end

	service_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SERVICE_UNKNOWN"
 			}"
 		end

	name_has_no_owner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NAME_HAS_NO_OWNER"
 			}"
 		end

	no_reply_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_REPLY"
 			}"
 		end

	io_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_IO_ERROR"
 			}"
 		end

	bad_address_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_BAD_ADDRESS"
 			}"
 		end

	not_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NOT_SUPPORTED"
 			}"
 		end

	limits_exceeded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_LIMITS_EXCEEDED"
 			}"
 		end

	access_denied_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_ACCESS_DENIED"
 			}"
 		end

	auth_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_AUTH_FAILED"
 			}"
 		end

	no_server_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_SERVER"
 			}"
 		end

	timeout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_TIMEOUT"
 			}"
 		end

	no_network_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_NETWORK"
 			}"
 		end

	address_in_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_ADDRESS_IN_USE"
 			}"
 		end

	disconnected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_DISCONNECTED"
 			}"
 		end

	invalid_args_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_INVALID_ARGS"
 			}"
 		end

	file_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_FILE_NOT_FOUND"
 			}"
 		end

	file_exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_FILE_EXISTS"
 			}"
 		end

	unknown_method_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_UNKNOWN_METHOD"
 			}"
 		end

	timed_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_TIMED_OUT"
 			}"
 		end

	match_rule_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_MATCH_RULE_NOT_FOUND"
 			}"
 		end

	match_rule_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_MATCH_RULE_INVALID"
 			}"
 		end

	spawn_exec_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_EXEC_FAILED"
 			}"
 		end

	spawn_fork_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_FORK_FAILED"
 			}"
 		end

	spawn_child_exited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_CHILD_EXITED"
 			}"
 		end

	spawn_child_signaled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_CHILD_SIGNALED"
 			}"
 		end

	spawn_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_FAILED"
 			}"
 		end

	spawn_setup_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_SETUP_FAILED"
 			}"
 		end

	spawn_config_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_CONFIG_INVALID"
 			}"
 		end

	spawn_service_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_SERVICE_INVALID"
 			}"
 		end

	spawn_service_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_SERVICE_NOT_FOUND"
 			}"
 		end

	spawn_permissions_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_PERMISSIONS_INVALID"
 			}"
 		end

	spawn_file_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_FILE_INVALID"
 			}"
 		end

	spawn_no_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_NO_MEMORY"
 			}"
 		end

	unix_process_id_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_UNIX_PROCESS_ID_UNKNOWN"
 			}"
 		end

	invalid_signature_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_INVALID_SIGNATURE"
 			}"
 		end

	invalid_file_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_INVALID_FILE_CONTENT"
 			}"
 		end

	selinux_security_context_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN"
 			}"
 		end

	adt_audit_data_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_ADT_AUDIT_DATA_UNKNOWN"
 			}"
 		end

	object_path_in_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_OBJECT_PATH_IN_USE"
 			}"
 		end


end -- class GDBUS_ERROR_ENUM
