-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class SOCKET_TYPE_ENUM

-- Wrapper of enum __socket_type defined in file /usr/include/x86_64-linux-gnu/bits/socket_type.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = cloexec_low_level)  or else
				(a_value = dccp_low_level)  or else
				(a_value = dgram_low_level)  or else
				(a_value = nonblock_low_level)  or else
				(a_value = packet_low_level)  or else
				(a_value = raw_low_level)  or else
				(a_value = rdm_low_level)  or else
				(a_value = seqpacket_low_level)  or else
				(a_value = stream_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cloexec
               do
                       value := cloexec_low_level
               end

	set_dccp
               do
                       value := dccp_low_level
               end

	set_dgram
               do
                       value := dgram_low_level
               end

	set_nonblock
               do
                       value := nonblock_low_level
               end

	set_packet
               do
                       value := packet_low_level
               end

	set_raw
               do
                       value := raw_low_level
               end

	set_rdm
               do
                       value := rdm_low_level
               end

	set_seqpacket
               do
                       value := seqpacket_low_level
               end

	set_stream
               do
                       value := stream_low_level
               end

feature {ANY} -- Queries
       is_cloexec: BOOLEAN
               do
                       Result := (value=cloexec_low_level)
               end

       is_dccp: BOOLEAN
               do
                       Result := (value=dccp_low_level)
               end

       is_dgram: BOOLEAN
               do
                       Result := (value=dgram_low_level)
               end

       is_nonblock: BOOLEAN
               do
                       Result := (value=nonblock_low_level)
               end

       is_packet: BOOLEAN
               do
                       Result := (value=packet_low_level)
               end

       is_raw: BOOLEAN
               do
                       Result := (value=raw_low_level)
               end

       is_rdm: BOOLEAN
               do
                       Result := (value=rdm_low_level)
               end

       is_seqpacket: BOOLEAN
               do
                       Result := (value=seqpacket_low_level)
               end

       is_stream: BOOLEAN
               do
                       Result := (value=stream_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     cloexec_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_CLOEXEC"
                       }"
               end

     dccp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_DCCP"
                       }"
               end

     dgram_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_DGRAM"
                       }"
               end

     nonblock_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_NONBLOCK"
                       }"
               end

     packet_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_PACKET"
                       }"
               end

     raw_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_RAW"
                       }"
               end

     rdm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_RDM"
                       }"
               end

     seqpacket_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_SEQPACKET"
                       }"
               end

     stream_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "SOCK_STREAM"
                       }"
               end


end -- class SOCKET_TYPE_ENUM
