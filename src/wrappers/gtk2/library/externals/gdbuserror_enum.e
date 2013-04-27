-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDBUSERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_dbus_error_access_denied_low_level)  or else
				(a_value = g_dbus_error_address_in_use_low_level)  or else
				(a_value = g_dbus_error_adt_audit_data_unknown_low_level)  or else
				(a_value = g_dbus_error_auth_failed_low_level)  or else
				(a_value = g_dbus_error_bad_address_low_level)  or else
				(a_value = g_dbus_error_disconnected_low_level)  or else
				(a_value = g_dbus_error_failed_low_level)  or else
				(a_value = g_dbus_error_file_exists_low_level)  or else
				(a_value = g_dbus_error_file_not_found_low_level)  or else
				(a_value = g_dbus_error_invalid_args_low_level)  or else
				(a_value = g_dbus_error_invalid_file_content_low_level)  or else
				(a_value = g_dbus_error_invalid_signature_low_level)  or else
				(a_value = g_dbus_error_io_error_low_level)  or else
				(a_value = g_dbus_error_limits_exceeded_low_level)  or else
				(a_value = g_dbus_error_match_rule_invalid_low_level)  or else
				(a_value = g_dbus_error_match_rule_not_found_low_level)  or else
				(a_value = g_dbus_error_name_has_no_owner_low_level)  or else
				(a_value = g_dbus_error_no_memory_low_level)  or else
				(a_value = g_dbus_error_no_network_low_level)  or else
				(a_value = g_dbus_error_no_reply_low_level)  or else
				(a_value = g_dbus_error_no_server_low_level)  or else
				(a_value = g_dbus_error_not_supported_low_level)  or else
				(a_value = g_dbus_error_object_path_in_use_low_level)  or else
				(a_value = g_dbus_error_selinux_security_context_unknown_low_level)  or else
				(a_value = g_dbus_error_service_unknown_low_level)  or else
				(a_value = g_dbus_error_spawn_child_exited_low_level)  or else
				(a_value = g_dbus_error_spawn_child_signaled_low_level)  or else
				(a_value = g_dbus_error_spawn_config_invalid_low_level)  or else
				(a_value = g_dbus_error_spawn_exec_failed_low_level)  or else
				(a_value = g_dbus_error_spawn_failed_low_level)  or else
				(a_value = g_dbus_error_spawn_file_invalid_low_level)  or else
				(a_value = g_dbus_error_spawn_fork_failed_low_level)  or else
				(a_value = g_dbus_error_spawn_no_memory_low_level)  or else
				(a_value = g_dbus_error_spawn_permissions_invalid_low_level)  or else
				(a_value = g_dbus_error_spawn_service_invalid_low_level)  or else
				(a_value = g_dbus_error_spawn_service_not_found_low_level)  or else
				(a_value = g_dbus_error_spawn_setup_failed_low_level)  or else
				(a_value = g_dbus_error_timed_out_low_level)  or else
				(a_value = g_dbus_error_timeout_low_level)  or else
				(a_value = g_dbus_error_unix_process_id_unknown_low_level)  or else
				(a_value = g_dbus_error_unknown_method_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_dbus_error_access_denied is
		do
			value := g_dbus_error_access_denied_low_level
		end

	set_g_dbus_error_address_in_use is
		do
			value := g_dbus_error_address_in_use_low_level
		end

	set_g_dbus_error_adt_audit_data_unknown is
		do
			value := g_dbus_error_adt_audit_data_unknown_low_level
		end

	set_g_dbus_error_auth_failed is
		do
			value := g_dbus_error_auth_failed_low_level
		end

	set_g_dbus_error_bad_address is
		do
			value := g_dbus_error_bad_address_low_level
		end

	set_g_dbus_error_disconnected is
		do
			value := g_dbus_error_disconnected_low_level
		end

	set_g_dbus_error_failed is
		do
			value := g_dbus_error_failed_low_level
		end

	set_g_dbus_error_file_exists is
		do
			value := g_dbus_error_file_exists_low_level
		end

	set_g_dbus_error_file_not_found is
		do
			value := g_dbus_error_file_not_found_low_level
		end

	set_g_dbus_error_invalid_args is
		do
			value := g_dbus_error_invalid_args_low_level
		end

	set_g_dbus_error_invalid_file_content is
		do
			value := g_dbus_error_invalid_file_content_low_level
		end

	set_g_dbus_error_invalid_signature is
		do
			value := g_dbus_error_invalid_signature_low_level
		end

	set_g_dbus_error_io_error is
		do
			value := g_dbus_error_io_error_low_level
		end

	set_g_dbus_error_limits_exceeded is
		do
			value := g_dbus_error_limits_exceeded_low_level
		end

	set_g_dbus_error_match_rule_invalid is
		do
			value := g_dbus_error_match_rule_invalid_low_level
		end

	set_g_dbus_error_match_rule_not_found is
		do
			value := g_dbus_error_match_rule_not_found_low_level
		end

	set_g_dbus_error_name_has_no_owner is
		do
			value := g_dbus_error_name_has_no_owner_low_level
		end

	set_g_dbus_error_no_memory is
		do
			value := g_dbus_error_no_memory_low_level
		end

	set_g_dbus_error_no_network is
		do
			value := g_dbus_error_no_network_low_level
		end

	set_g_dbus_error_no_reply is
		do
			value := g_dbus_error_no_reply_low_level
		end

	set_g_dbus_error_no_server is
		do
			value := g_dbus_error_no_server_low_level
		end

	set_g_dbus_error_not_supported is
		do
			value := g_dbus_error_not_supported_low_level
		end

	set_g_dbus_error_object_path_in_use is
		do
			value := g_dbus_error_object_path_in_use_low_level
		end

	set_g_dbus_error_selinux_security_context_unknown is
		do
			value := g_dbus_error_selinux_security_context_unknown_low_level
		end

	set_g_dbus_error_service_unknown is
		do
			value := g_dbus_error_service_unknown_low_level
		end

	set_g_dbus_error_spawn_child_exited is
		do
			value := g_dbus_error_spawn_child_exited_low_level
		end

	set_g_dbus_error_spawn_child_signaled is
		do
			value := g_dbus_error_spawn_child_signaled_low_level
		end

	set_g_dbus_error_spawn_config_invalid is
		do
			value := g_dbus_error_spawn_config_invalid_low_level
		end

	set_g_dbus_error_spawn_exec_failed is
		do
			value := g_dbus_error_spawn_exec_failed_low_level
		end

	set_g_dbus_error_spawn_failed is
		do
			value := g_dbus_error_spawn_failed_low_level
		end

	set_g_dbus_error_spawn_file_invalid is
		do
			value := g_dbus_error_spawn_file_invalid_low_level
		end

	set_g_dbus_error_spawn_fork_failed is
		do
			value := g_dbus_error_spawn_fork_failed_low_level
		end

	set_g_dbus_error_spawn_no_memory is
		do
			value := g_dbus_error_spawn_no_memory_low_level
		end

	set_g_dbus_error_spawn_permissions_invalid is
		do
			value := g_dbus_error_spawn_permissions_invalid_low_level
		end

	set_g_dbus_error_spawn_service_invalid is
		do
			value := g_dbus_error_spawn_service_invalid_low_level
		end

	set_g_dbus_error_spawn_service_not_found is
		do
			value := g_dbus_error_spawn_service_not_found_low_level
		end

	set_g_dbus_error_spawn_setup_failed is
		do
			value := g_dbus_error_spawn_setup_failed_low_level
		end

	set_g_dbus_error_timed_out is
		do
			value := g_dbus_error_timed_out_low_level
		end

	set_g_dbus_error_timeout is
		do
			value := g_dbus_error_timeout_low_level
		end

	set_g_dbus_error_unix_process_id_unknown is
		do
			value := g_dbus_error_unix_process_id_unknown_low_level
		end

	set_g_dbus_error_unknown_method is
		do
			value := g_dbus_error_unknown_method_low_level
		end

feature {ANY} -- Queries
	is_g_dbus_error_access_denied: BOOLEAN is
		do
			Result := (value=g_dbus_error_access_denied_low_level)
		end

	is_g_dbus_error_address_in_use: BOOLEAN is
		do
			Result := (value=g_dbus_error_address_in_use_low_level)
		end

	is_g_dbus_error_adt_audit_data_unknown: BOOLEAN is
		do
			Result := (value=g_dbus_error_adt_audit_data_unknown_low_level)
		end

	is_g_dbus_error_auth_failed: BOOLEAN is
		do
			Result := (value=g_dbus_error_auth_failed_low_level)
		end

	is_g_dbus_error_bad_address: BOOLEAN is
		do
			Result := (value=g_dbus_error_bad_address_low_level)
		end

	is_g_dbus_error_disconnected: BOOLEAN is
		do
			Result := (value=g_dbus_error_disconnected_low_level)
		end

	is_g_dbus_error_failed: BOOLEAN is
		do
			Result := (value=g_dbus_error_failed_low_level)
		end

	is_g_dbus_error_file_exists: BOOLEAN is
		do
			Result := (value=g_dbus_error_file_exists_low_level)
		end

	is_g_dbus_error_file_not_found: BOOLEAN is
		do
			Result := (value=g_dbus_error_file_not_found_low_level)
		end

	is_g_dbus_error_invalid_args: BOOLEAN is
		do
			Result := (value=g_dbus_error_invalid_args_low_level)
		end

	is_g_dbus_error_invalid_file_content: BOOLEAN is
		do
			Result := (value=g_dbus_error_invalid_file_content_low_level)
		end

	is_g_dbus_error_invalid_signature: BOOLEAN is
		do
			Result := (value=g_dbus_error_invalid_signature_low_level)
		end

	is_g_dbus_error_io_error: BOOLEAN is
		do
			Result := (value=g_dbus_error_io_error_low_level)
		end

	is_g_dbus_error_limits_exceeded: BOOLEAN is
		do
			Result := (value=g_dbus_error_limits_exceeded_low_level)
		end

	is_g_dbus_error_match_rule_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_error_match_rule_invalid_low_level)
		end

	is_g_dbus_error_match_rule_not_found: BOOLEAN is
		do
			Result := (value=g_dbus_error_match_rule_not_found_low_level)
		end

	is_g_dbus_error_name_has_no_owner: BOOLEAN is
		do
			Result := (value=g_dbus_error_name_has_no_owner_low_level)
		end

	is_g_dbus_error_no_memory: BOOLEAN is
		do
			Result := (value=g_dbus_error_no_memory_low_level)
		end

	is_g_dbus_error_no_network: BOOLEAN is
		do
			Result := (value=g_dbus_error_no_network_low_level)
		end

	is_g_dbus_error_no_reply: BOOLEAN is
		do
			Result := (value=g_dbus_error_no_reply_low_level)
		end

	is_g_dbus_error_no_server: BOOLEAN is
		do
			Result := (value=g_dbus_error_no_server_low_level)
		end

	is_g_dbus_error_not_supported: BOOLEAN is
		do
			Result := (value=g_dbus_error_not_supported_low_level)
		end

	is_g_dbus_error_object_path_in_use: BOOLEAN is
		do
			Result := (value=g_dbus_error_object_path_in_use_low_level)
		end

	is_g_dbus_error_selinux_security_context_unknown: BOOLEAN is
		do
			Result := (value=g_dbus_error_selinux_security_context_unknown_low_level)
		end

	is_g_dbus_error_service_unknown: BOOLEAN is
		do
			Result := (value=g_dbus_error_service_unknown_low_level)
		end

	is_g_dbus_error_spawn_child_exited: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_child_exited_low_level)
		end

	is_g_dbus_error_spawn_child_signaled: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_child_signaled_low_level)
		end

	is_g_dbus_error_spawn_config_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_config_invalid_low_level)
		end

	is_g_dbus_error_spawn_exec_failed: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_exec_failed_low_level)
		end

	is_g_dbus_error_spawn_failed: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_failed_low_level)
		end

	is_g_dbus_error_spawn_file_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_file_invalid_low_level)
		end

	is_g_dbus_error_spawn_fork_failed: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_fork_failed_low_level)
		end

	is_g_dbus_error_spawn_no_memory: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_no_memory_low_level)
		end

	is_g_dbus_error_spawn_permissions_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_permissions_invalid_low_level)
		end

	is_g_dbus_error_spawn_service_invalid: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_service_invalid_low_level)
		end

	is_g_dbus_error_spawn_service_not_found: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_service_not_found_low_level)
		end

	is_g_dbus_error_spawn_setup_failed: BOOLEAN is
		do
			Result := (value=g_dbus_error_spawn_setup_failed_low_level)
		end

	is_g_dbus_error_timed_out: BOOLEAN is
		do
			Result := (value=g_dbus_error_timed_out_low_level)
		end

	is_g_dbus_error_timeout: BOOLEAN is
		do
			Result := (value=g_dbus_error_timeout_low_level)
		end

	is_g_dbus_error_unix_process_id_unknown: BOOLEAN is
		do
			Result := (value=g_dbus_error_unix_process_id_unknown_low_level)
		end

	is_g_dbus_error_unknown_method: BOOLEAN is
		do
			Result := (value=g_dbus_error_unknown_method_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_dbus_error_access_denied_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_ACCESS_DENIED"
 			}"
 		end

	g_dbus_error_address_in_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_ADDRESS_IN_USE"
 			}"
 		end

	g_dbus_error_adt_audit_data_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_ADT_AUDIT_DATA_UNKNOWN"
 			}"
 		end

	g_dbus_error_auth_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_AUTH_FAILED"
 			}"
 		end

	g_dbus_error_bad_address_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_BAD_ADDRESS"
 			}"
 		end

	g_dbus_error_disconnected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_DISCONNECTED"
 			}"
 		end

	g_dbus_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_FAILED"
 			}"
 		end

	g_dbus_error_file_exists_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_FILE_EXISTS"
 			}"
 		end

	g_dbus_error_file_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_FILE_NOT_FOUND"
 			}"
 		end

	g_dbus_error_invalid_args_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_INVALID_ARGS"
 			}"
 		end

	g_dbus_error_invalid_file_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_INVALID_FILE_CONTENT"
 			}"
 		end

	g_dbus_error_invalid_signature_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_INVALID_SIGNATURE"
 			}"
 		end

	g_dbus_error_io_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_IO_ERROR"
 			}"
 		end

	g_dbus_error_limits_exceeded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_LIMITS_EXCEEDED"
 			}"
 		end

	g_dbus_error_match_rule_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_MATCH_RULE_INVALID"
 			}"
 		end

	g_dbus_error_match_rule_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_MATCH_RULE_NOT_FOUND"
 			}"
 		end

	g_dbus_error_name_has_no_owner_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NAME_HAS_NO_OWNER"
 			}"
 		end

	g_dbus_error_no_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_MEMORY"
 			}"
 		end

	g_dbus_error_no_network_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_NETWORK"
 			}"
 		end

	g_dbus_error_no_reply_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_REPLY"
 			}"
 		end

	g_dbus_error_no_server_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NO_SERVER"
 			}"
 		end

	g_dbus_error_not_supported_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_NOT_SUPPORTED"
 			}"
 		end

	g_dbus_error_object_path_in_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_OBJECT_PATH_IN_USE"
 			}"
 		end

	g_dbus_error_selinux_security_context_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SELINUX_SECURITY_CONTEXT_UNKNOWN"
 			}"
 		end

	g_dbus_error_service_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SERVICE_UNKNOWN"
 			}"
 		end

	g_dbus_error_spawn_child_exited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_CHILD_EXITED"
 			}"
 		end

	g_dbus_error_spawn_child_signaled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_CHILD_SIGNALED"
 			}"
 		end

	g_dbus_error_spawn_config_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_CONFIG_INVALID"
 			}"
 		end

	g_dbus_error_spawn_exec_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_EXEC_FAILED"
 			}"
 		end

	g_dbus_error_spawn_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_FAILED"
 			}"
 		end

	g_dbus_error_spawn_file_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_FILE_INVALID"
 			}"
 		end

	g_dbus_error_spawn_fork_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_FORK_FAILED"
 			}"
 		end

	g_dbus_error_spawn_no_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_NO_MEMORY"
 			}"
 		end

	g_dbus_error_spawn_permissions_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_PERMISSIONS_INVALID"
 			}"
 		end

	g_dbus_error_spawn_service_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_SERVICE_INVALID"
 			}"
 		end

	g_dbus_error_spawn_service_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_SERVICE_NOT_FOUND"
 			}"
 		end

	g_dbus_error_spawn_setup_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_SPAWN_SETUP_FAILED"
 			}"
 		end

	g_dbus_error_timed_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_TIMED_OUT"
 			}"
 		end

	g_dbus_error_timeout_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_TIMEOUT"
 			}"
 		end

	g_dbus_error_unix_process_id_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_UNIX_PROCESS_ID_UNKNOWN"
 			}"
 		end

	g_dbus_error_unknown_method_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_DBUS_ERROR_UNKNOWN_METHOD"
 			}"
 		end


end -- class GDBUSERROR_ENUM
