-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class TLS_MODEL_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = emulated_low_level)  or else
				(a_value = global_dynamic_low_level)  or else
				(a_value = initial_exec_low_level)  or else
				(a_value = local_dynamic_low_level)  or else
				(a_value = local_exec_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = real_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_emulated
               do
                       value := emulated_low_level
               end

	set_global_dynamic
               do
                       value := global_dynamic_low_level
               end

	set_initial_exec
               do
                       value := initial_exec_low_level
               end

	set_local_dynamic
               do
                       value := local_dynamic_low_level
               end

	set_local_exec
               do
                       value := local_exec_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_real
               do
                       value := real_low_level
               end

feature {ANY} -- Queries
       is_emulated: BOOLEAN
               do
                       Result := (value=emulated_low_level)
               end

       is_global_dynamic: BOOLEAN
               do
                       Result := (value=global_dynamic_low_level)
               end

       is_initial_exec: BOOLEAN
               do
                       Result := (value=initial_exec_low_level)
               end

       is_local_dynamic: BOOLEAN
               do
                       Result := (value=local_dynamic_low_level)
               end

       is_local_exec: BOOLEAN
               do
                       Result := (value=local_exec_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_real: BOOLEAN
               do
                       Result := (value=real_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     emulated_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_EMULATED"
                       }"
               end

     global_dynamic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_GLOBAL_DYNAMIC"
                       }"
               end

     initial_exec_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_INITIAL_EXEC"
                       }"
               end

     local_dynamic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_LOCAL_DYNAMIC"
                       }"
               end

     local_exec_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_LOCAL_EXEC"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_NONE"
                       }"
               end

     real_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TLS_MODEL_REAL"
                       }"
               end


end -- class TLS_MODEL_ENUM
