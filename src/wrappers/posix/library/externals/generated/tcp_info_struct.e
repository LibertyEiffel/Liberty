-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TCP_INFO_STRUCT
-- Wrapper of struct tcp_info defined in file /usr/include/netinet/tcp.h

insert STANDARD_C_LIBRARY_TYPES

	POSIX_TYPES
feature {} -- Low-level setters

   tcp_info_struct_set_tcpi_state (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_state field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_state"
      }"
      end

   tcp_info_struct_set_tcpi_ca_state (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_ca_state field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_ca_state"
      }"
      end

   tcp_info_struct_set_tcpi_retransmits (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_retransmits field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_retransmits"
      }"
      end

   tcp_info_struct_set_tcpi_probes (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_probes field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_probes"
      }"
      end

   tcp_info_struct_set_tcpi_backoff (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_backoff field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_backoff"
      }"
      end

   tcp_info_struct_set_tcpi_options (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_options field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_options"
      }"
      end

   tcp_info_struct_set_tcpi_snd_wscale (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_snd_wscale field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_snd_wscale"
      }"
      end

   tcp_info_struct_set_tcpi_rcv_wscale (a_structure: POINTER; a_value: CHARACTER) 
         -- Setter for tcpi_rcv_wscale field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rcv_wscale"
      }"
      end

   tcp_info_struct_set_tcpi_rto (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rto field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rto"
      }"
      end

   tcp_info_struct_set_tcpi_ato (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_ato field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_ato"
      }"
      end

   tcp_info_struct_set_tcpi_snd_mss (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_snd_mss field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_snd_mss"
      }"
      end

   tcp_info_struct_set_tcpi_rcv_mss (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rcv_mss field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rcv_mss"
      }"
      end

   tcp_info_struct_set_tcpi_unacked (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_unacked field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_unacked"
      }"
      end

   tcp_info_struct_set_tcpi_sacked (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_sacked field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_sacked"
      }"
      end

   tcp_info_struct_set_tcpi_lost (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_lost field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_lost"
      }"
      end

   tcp_info_struct_set_tcpi_retrans (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_retrans field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_retrans"
      }"
      end

   tcp_info_struct_set_tcpi_fackets (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_fackets field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_fackets"
      }"
      end

   tcp_info_struct_set_tcpi_last_data_sent (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_last_data_sent field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_last_data_sent"
      }"
      end

   tcp_info_struct_set_tcpi_last_ack_sent (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_last_ack_sent field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_last_ack_sent"
      }"
      end

   tcp_info_struct_set_tcpi_last_data_recv (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_last_data_recv field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_last_data_recv"
      }"
      end

   tcp_info_struct_set_tcpi_last_ack_recv (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_last_ack_recv field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_last_ack_recv"
      }"
      end

   tcp_info_struct_set_tcpi_pmtu (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_pmtu field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_pmtu"
      }"
      end

   tcp_info_struct_set_tcpi_rcv_ssthresh (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rcv_ssthresh field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rcv_ssthresh"
      }"
      end

   tcp_info_struct_set_tcpi_rtt (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rtt field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rtt"
      }"
      end

   tcp_info_struct_set_tcpi_rttvar (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rttvar field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rttvar"
      }"
      end

   tcp_info_struct_set_tcpi_snd_ssthresh (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_snd_ssthresh field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_snd_ssthresh"
      }"
      end

   tcp_info_struct_set_tcpi_snd_cwnd (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_snd_cwnd field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_snd_cwnd"
      }"
      end

   tcp_info_struct_set_tcpi_advmss (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_advmss field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_advmss"
      }"
      end

   tcp_info_struct_set_tcpi_reordering (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_reordering field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_reordering"
      }"
      end

   tcp_info_struct_set_tcpi_rcv_rtt (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rcv_rtt field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rcv_rtt"
      }"
      end

   tcp_info_struct_set_tcpi_rcv_space (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_rcv_space field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_rcv_space"
      }"
      end

   tcp_info_struct_set_tcpi_total_retrans (a_structure: POINTER; a_value: NATURAL) 
         -- Setter for tcpi_total_retrans field of TCP_INFO_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_set_tcpi_total_retrans"
      }"
      end

feature {} -- Low-level queries

   tcp_info_struct_get_tcpi_state (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_state field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_state"
      }"
      end

   tcp_info_struct_get_tcpi_ca_state (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_ca_state field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_ca_state"
      }"
      end

   tcp_info_struct_get_tcpi_retransmits (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_retransmits field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_retransmits"
      }"
      end

   tcp_info_struct_get_tcpi_probes (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_probes field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_probes"
      }"
      end

   tcp_info_struct_get_tcpi_backoff (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_backoff field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_backoff"
      }"
      end

   tcp_info_struct_get_tcpi_options (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_options field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_options"
      }"
      end

   tcp_info_struct_get_tcpi_snd_wscale (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_snd_wscale field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_snd_wscale"
      }"
      end

   tcp_info_struct_get_tcpi_rcv_wscale (a_structure: POINTER): CHARACTER 
         -- Query for tcpi_rcv_wscale field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rcv_wscale"
      }"
      end

   tcp_info_struct_get_tcpi_rto (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rto field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rto"
      }"
      end

   tcp_info_struct_get_tcpi_ato (a_structure: POINTER): NATURAL 
         -- Query for tcpi_ato field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_ato"
      }"
      end

   tcp_info_struct_get_tcpi_snd_mss (a_structure: POINTER): NATURAL 
         -- Query for tcpi_snd_mss field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_snd_mss"
      }"
      end

   tcp_info_struct_get_tcpi_rcv_mss (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rcv_mss field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rcv_mss"
      }"
      end

   tcp_info_struct_get_tcpi_unacked (a_structure: POINTER): NATURAL 
         -- Query for tcpi_unacked field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_unacked"
      }"
      end

   tcp_info_struct_get_tcpi_sacked (a_structure: POINTER): NATURAL 
         -- Query for tcpi_sacked field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_sacked"
      }"
      end

   tcp_info_struct_get_tcpi_lost (a_structure: POINTER): NATURAL 
         -- Query for tcpi_lost field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_lost"
      }"
      end

   tcp_info_struct_get_tcpi_retrans (a_structure: POINTER): NATURAL 
         -- Query for tcpi_retrans field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_retrans"
      }"
      end

   tcp_info_struct_get_tcpi_fackets (a_structure: POINTER): NATURAL 
         -- Query for tcpi_fackets field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_fackets"
      }"
      end

   tcp_info_struct_get_tcpi_last_data_sent (a_structure: POINTER): NATURAL 
         -- Query for tcpi_last_data_sent field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_last_data_sent"
      }"
      end

   tcp_info_struct_get_tcpi_last_ack_sent (a_structure: POINTER): NATURAL 
         -- Query for tcpi_last_ack_sent field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_last_ack_sent"
      }"
      end

   tcp_info_struct_get_tcpi_last_data_recv (a_structure: POINTER): NATURAL 
         -- Query for tcpi_last_data_recv field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_last_data_recv"
      }"
      end

   tcp_info_struct_get_tcpi_last_ack_recv (a_structure: POINTER): NATURAL 
         -- Query for tcpi_last_ack_recv field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_last_ack_recv"
      }"
      end

   tcp_info_struct_get_tcpi_pmtu (a_structure: POINTER): NATURAL 
         -- Query for tcpi_pmtu field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_pmtu"
      }"
      end

   tcp_info_struct_get_tcpi_rcv_ssthresh (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rcv_ssthresh field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rcv_ssthresh"
      }"
      end

   tcp_info_struct_get_tcpi_rtt (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rtt field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rtt"
      }"
      end

   tcp_info_struct_get_tcpi_rttvar (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rttvar field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rttvar"
      }"
      end

   tcp_info_struct_get_tcpi_snd_ssthresh (a_structure: POINTER): NATURAL 
         -- Query for tcpi_snd_ssthresh field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_snd_ssthresh"
      }"
      end

   tcp_info_struct_get_tcpi_snd_cwnd (a_structure: POINTER): NATURAL 
         -- Query for tcpi_snd_cwnd field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_snd_cwnd"
      }"
      end

   tcp_info_struct_get_tcpi_advmss (a_structure: POINTER): NATURAL 
         -- Query for tcpi_advmss field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_advmss"
      }"
      end

   tcp_info_struct_get_tcpi_reordering (a_structure: POINTER): NATURAL 
         -- Query for tcpi_reordering field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_reordering"
      }"
      end

   tcp_info_struct_get_tcpi_rcv_rtt (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rcv_rtt field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rcv_rtt"
      }"
      end

   tcp_info_struct_get_tcpi_rcv_space (a_structure: POINTER): NATURAL 
         -- Query for tcpi_rcv_space field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_rcv_space"
      }"
      end

   tcp_info_struct_get_tcpi_total_retrans (a_structure: POINTER): NATURAL 
         -- Query for tcpi_total_retrans field of TCP_INFO_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "tcp_info_struct_get_tcpi_total_retrans"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof_tcp_info"
               }"
               end

end -- class TCP_INFO_STRUCT
-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
