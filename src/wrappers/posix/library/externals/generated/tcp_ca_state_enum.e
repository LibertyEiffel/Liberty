-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class TCP_CA_STATE_ENUM

-- Wrapper of enum tcp_ca_state defined in file /usr/include/netinet/tcp.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = cwr_low_level)  or else
				(a_value = disorder_low_level)  or else
				(a_value = loss_low_level)  or else
				(a_value = open_low_level)  or else
				(a_value = recovery_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cwr
               do
                       value := cwr_low_level
               end

	set_disorder
               do
                       value := disorder_low_level
               end

	set_loss
               do
                       value := loss_low_level
               end

	set_open
               do
                       value := open_low_level
               end

	set_recovery
               do
                       value := recovery_low_level
               end

feature {ANY} -- Queries
       is_cwr: BOOLEAN
               do
                       Result := (value=cwr_low_level)
               end

       is_disorder: BOOLEAN
               do
                       Result := (value=disorder_low_level)
               end

       is_loss: BOOLEAN
               do
                       Result := (value=loss_low_level)
               end

       is_open: BOOLEAN
               do
                       Result := (value=open_low_level)
               end

       is_recovery: BOOLEAN
               do
                       Result := (value=recovery_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     cwr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TCP_CA_CWR"
                       }"
               end

     disorder_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TCP_CA_Disorder"
                       }"
               end

     loss_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TCP_CA_Loss"
                       }"
               end

     open_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TCP_CA_Open"
                       }"
               end

     recovery_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "TCP_CA_Recovery"
                       }"
               end


end -- class TCP_CA_STATE_ENUM
