-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class TCP_CA_STATE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = tcp_ca_cwr_low_level)  or else
				(a_value = tcp_ca_disorder_low_level)  or else
				(a_value = tcp_ca_loss_low_level)  or else
				(a_value = tcp_ca_open_low_level)  or else
				(a_value = tcp_ca_recovery_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_tcp_ca_cwr is
		do
			value := tcp_ca_cwr_low_level
		end

	set_tcp_ca_disorder is
		do
			value := tcp_ca_disorder_low_level
		end

	set_tcp_ca_loss is
		do
			value := tcp_ca_loss_low_level
		end

	set_tcp_ca_open is
		do
			value := tcp_ca_open_low_level
		end

	set_tcp_ca_recovery is
		do
			value := tcp_ca_recovery_low_level
		end

feature {ANY} -- Queries
	is_tcp_ca_cwr: BOOLEAN is
		do
			Result := (value=tcp_ca_cwr_low_level)
		end

	is_tcp_ca_disorder: BOOLEAN is
		do
			Result := (value=tcp_ca_disorder_low_level)
		end

	is_tcp_ca_loss: BOOLEAN is
		do
			Result := (value=tcp_ca_loss_low_level)
		end

	is_tcp_ca_open: BOOLEAN is
		do
			Result := (value=tcp_ca_open_low_level)
		end

	is_tcp_ca_recovery: BOOLEAN is
		do
			Result := (value=tcp_ca_recovery_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	tcp_ca_cwr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TCP_CA_CWR"
 			}"
 		end

	tcp_ca_disorder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TCP_CA_Disorder"
 			}"
 		end

	tcp_ca_loss_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TCP_CA_Loss"
 			}"
 		end

	tcp_ca_open_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TCP_CA_Open"
 			}"
 		end

	tcp_ca_recovery_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "TCP_CA_Recovery"
 			}"
 		end


end -- class TCP_CA_STATE_ENUM
