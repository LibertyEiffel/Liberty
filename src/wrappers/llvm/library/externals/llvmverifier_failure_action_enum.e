-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMVERIFIER_FAILURE_ACTION_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = abort_process_action_low_level)  or else
				(a_value = print_message_action_low_level)  or else
				(a_value = return_status_action_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_abort_process_action is
		do
			value := abort_process_action_low_level
		end

	set_print_message_action is
		do
			value := print_message_action_low_level
		end

	set_return_status_action is
		do
			value := return_status_action_low_level
		end

feature {ANY} -- Queries
	is_abort_process_action: BOOLEAN is
		do
			Result := (value=abort_process_action_low_level)
		end

	is_print_message_action: BOOLEAN is
		do
			Result := (value=print_message_action_low_level)
		end

	is_return_status_action: BOOLEAN is
		do
			Result := (value=return_status_action_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	abort_process_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMAbortProcessAction"
 			}"
 		end

	print_message_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMPrintMessageAction"
 			}"
 		end

	return_status_action_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMReturnStatusAction"
 			}"
 		end


end -- class LLVMVERIFIER_FAILURE_ACTION_ENUM
