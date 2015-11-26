/*
** This file have been created by wrapper-generator.
** Any change will be lost by the next execution of the tool.
*/
#define in_addr_struct_get_s_addr(a_structure) ((( in_addr*) (a_structure))->s_addr)

#define in_addr_struct_set_s_addr(a_structure,a_value) do {((( in_addr*)(a_structure)))->s_addr = (a_value);}while(0)

#define sizeof_in_addr (sizeof( in_addr))
#define sizeof_in6_addr (sizeof( in6_addr))
#define sockaddr_in_struct_get_sin_family(a_structure) ((( sockaddr_in*) (a_structure))->sin_family)

#define sockaddr_in_struct_set_sin_family(a_structure,a_value) do {((( sockaddr_in*)(a_structure)))->sin_family = (a_value);}while(0)

#define sockaddr_in_struct_get_sin_port(a_structure) ((( sockaddr_in*) (a_structure))->sin_port)

#define sockaddr_in_struct_set_sin_port(a_structure,a_value) do {((( sockaddr_in*)(a_structure)))->sin_port = (a_value);}while(0)

#define sockaddr_in_struct_get_sin_zero(a_structure) ((( sockaddr_in*) (a_structure))->sin_zero)

#define sockaddr_in_struct_set_sin_zero(a_structure,a_value) do {((( sockaddr_in*)(a_structure)))->sin_zero = (a_value);}while(0)

#define sizeof_sockaddr_in (sizeof( sockaddr_in))
#define sockaddr_in6_struct_get_sin6_family(a_structure) ((( sockaddr_in6*) (a_structure))->sin6_family)

#define sockaddr_in6_struct_set_sin6_family(a_structure,a_value) do {((( sockaddr_in6*)(a_structure)))->sin6_family = (a_value);}while(0)

#define sockaddr_in6_struct_get_sin6_port(a_structure) ((( sockaddr_in6*) (a_structure))->sin6_port)

#define sockaddr_in6_struct_set_sin6_port(a_structure,a_value) do {((( sockaddr_in6*)(a_structure)))->sin6_port = (a_value);}while(0)

#define sockaddr_in6_struct_get_sin6_flowinfo(a_structure) ((( sockaddr_in6*) (a_structure))->sin6_flowinfo)

#define sockaddr_in6_struct_set_sin6_flowinfo(a_structure,a_value) do {((( sockaddr_in6*)(a_structure)))->sin6_flowinfo = (a_value);}while(0)

#define sockaddr_in6_struct_get_sin6_scope_id(a_structure) ((( sockaddr_in6*) (a_structure))->sin6_scope_id)

#define sockaddr_in6_struct_set_sin6_scope_id(a_structure,a_value) do {((( sockaddr_in6*)(a_structure)))->sin6_scope_id = (a_value);}while(0)

#define sizeof_sockaddr_in6 (sizeof( sockaddr_in6))
#define sizeof_ip_mreq (sizeof( ip_mreq))
#define sizeof_ip_mreq_source (sizeof( ip_mreq_source))
#define ipv6_mreq_struct_get_ipv6mr_interface(a_structure) ((( ipv6_mreq*) (a_structure))->ipv6mr_interface)

#define ipv6_mreq_struct_set_ipv6mr_interface(a_structure,a_value) do {((( ipv6_mreq*)(a_structure)))->ipv6mr_interface = (a_value);}while(0)

#define sizeof_ipv6_mreq (sizeof( ipv6_mreq))
#define group_req_struct_get_gr_interface(a_structure) ((( group_req*) (a_structure))->gr_interface)

#define group_req_struct_set_gr_interface(a_structure,a_value) do {((( group_req*)(a_structure)))->gr_interface = (a_value);}while(0)

#define sizeof_group_req (sizeof( group_req))
#define group_source_req_struct_get_gsr_interface(a_structure) ((( group_source_req*) (a_structure))->gsr_interface)

#define group_source_req_struct_set_gsr_interface(a_structure,a_value) do {((( group_source_req*)(a_structure)))->gsr_interface = (a_value);}while(0)

#define sizeof_group_source_req (sizeof( group_source_req))
#define ip_msfilter_struct_get_imsf_fmode(a_structure) ((( ip_msfilter*) (a_structure))->imsf_fmode)

#define ip_msfilter_struct_set_imsf_fmode(a_structure,a_value) do {((( ip_msfilter*)(a_structure)))->imsf_fmode = (a_value);}while(0)

#define ip_msfilter_struct_get_imsf_numsrc(a_structure) ((( ip_msfilter*) (a_structure))->imsf_numsrc)

#define ip_msfilter_struct_set_imsf_numsrc(a_structure,a_value) do {((( ip_msfilter*)(a_structure)))->imsf_numsrc = (a_value);}while(0)

#define ip_msfilter_struct_get_imsf_slist(a_structure) ((( ip_msfilter*) (a_structure))->imsf_slist)

#define ip_msfilter_struct_set_imsf_slist(a_structure,a_value) do {((( ip_msfilter*)(a_structure)))->imsf_slist = (a_value);}while(0)

#define sizeof_ip_msfilter (sizeof( ip_msfilter))
#define group_filter_struct_get_gf_interface(a_structure) ((( group_filter*) (a_structure))->gf_interface)

#define group_filter_struct_set_gf_interface(a_structure,a_value) do {((( group_filter*)(a_structure)))->gf_interface = (a_value);}while(0)

#define group_filter_struct_get_gf_fmode(a_structure) ((( group_filter*) (a_structure))->gf_fmode)

#define group_filter_struct_set_gf_fmode(a_structure,a_value) do {((( group_filter*)(a_structure)))->gf_fmode = (a_value);}while(0)

#define group_filter_struct_get_gf_numsrc(a_structure) ((( group_filter*) (a_structure))->gf_numsrc)

#define group_filter_struct_set_gf_numsrc(a_structure,a_value) do {((( group_filter*)(a_structure)))->gf_numsrc = (a_value);}while(0)

#define group_filter_struct_get_gf_slist(a_structure) ((( group_filter*) (a_structure))->gf_slist)

#define group_filter_struct_set_gf_slist(a_structure,a_value) do {((( group_filter*)(a_structure)))->gf_slist = (a_value);}while(0)

#define sizeof_group_filter (sizeof( group_filter))
#define in6_pktinfo_struct_get_ipi6_ifindex(a_structure) ((( in6_pktinfo*) (a_structure))->ipi6_ifindex)

#define in6_pktinfo_struct_set_ipi6_ifindex(a_structure,a_value) do {((( in6_pktinfo*)(a_structure)))->ipi6_ifindex = (a_value);}while(0)

#define sizeof_in6_pktinfo (sizeof( in6_pktinfo))
#define ip6_mtuinfo_struct_get_ip6m_mtu(a_structure) ((( ip6_mtuinfo*) (a_structure))->ip6m_mtu)

#define ip6_mtuinfo_struct_set_ip6m_mtu(a_structure,a_value) do {((( ip6_mtuinfo*)(a_structure)))->ip6m_mtu = (a_value);}while(0)

#define sizeof_ip6_mtuinfo (sizeof( ip6_mtuinfo))
#define if_nameindex_struct_get_if_index(a_structure) ((( if_nameindex*) (a_structure))->if_index)

#define if_nameindex_struct_set_if_index(a_structure,a_value) do {((( if_nameindex*)(a_structure)))->if_index = (a_value);}while(0)

#define if_nameindex_struct_get_if_name(a_structure) ((( if_nameindex*) (a_structure))->if_name)

#define if_nameindex_struct_set_if_name(a_structure,a_value) do {((( if_nameindex*)(a_structure)))->if_name = (a_value);}while(0)

#define sizeof_if_nameindex (sizeof( if_nameindex))
#define ifaddr_struct_get_ifa_ifp(a_structure) ((( ifaddr*) (a_structure))->ifa_ifp)

#define ifaddr_struct_set_ifa_ifp(a_structure,a_value) do {((( ifaddr*)(a_structure)))->ifa_ifp = (a_value);}while(0)

#define ifaddr_struct_get_ifa_next(a_structure) ((( ifaddr*) (a_structure))->ifa_next)

#define ifaddr_struct_set_ifa_next(a_structure,a_value) do {((( ifaddr*)(a_structure)))->ifa_next = (a_value);}while(0)

#define sizeof_ifaddr (sizeof( ifaddr))
#define ifmap_struct_get_mem_start(a_structure) ((( ifmap*) (a_structure))->mem_start)

#define ifmap_struct_set_mem_start(a_structure,a_value) do {((( ifmap*)(a_structure)))->mem_start = (a_value);}while(0)

#define ifmap_struct_get_mem_end(a_structure) ((( ifmap*) (a_structure))->mem_end)

#define ifmap_struct_set_mem_end(a_structure,a_value) do {((( ifmap*)(a_structure)))->mem_end = (a_value);}while(0)

#define ifmap_struct_get_base_addr(a_structure) ((( ifmap*) (a_structure))->base_addr)

#define ifmap_struct_set_base_addr(a_structure,a_value) do {((( ifmap*)(a_structure)))->base_addr = (a_value);}while(0)

#define ifmap_struct_get_irq(a_structure) ((( ifmap*) (a_structure))->irq)

#define ifmap_struct_set_irq(a_structure,a_value) do {((( ifmap*)(a_structure)))->irq = (a_value);}while(0)

#define ifmap_struct_get_dma(a_structure) ((( ifmap*) (a_structure))->dma)

#define ifmap_struct_set_dma(a_structure,a_value) do {((( ifmap*)(a_structure)))->dma = (a_value);}while(0)

#define ifmap_struct_get_port(a_structure) ((( ifmap*) (a_structure))->port)

#define ifmap_struct_set_port(a_structure,a_value) do {((( ifmap*)(a_structure)))->port = (a_value);}while(0)

#define sizeof_ifmap (sizeof( ifmap))
#define sizeof_ifreq (sizeof( ifreq))
#define ifconf_struct_get_ifc_len(a_structure) ((( ifconf*) (a_structure))->ifc_len)

#define ifconf_struct_set_ifc_len(a_structure,a_value) do {((( ifconf*)(a_structure)))->ifc_len = (a_value);}while(0)

#define sizeof_ifconf (sizeof( ifconf))
#define rpcent_struct_get_r_name(a_structure) ((( rpcent*) (a_structure))->r_name)

#define rpcent_struct_set_r_name(a_structure,a_value) do {((( rpcent*)(a_structure)))->r_name = (a_value);}while(0)

#define rpcent_struct_get_r_aliases(a_structure) ((( rpcent*) (a_structure))->r_aliases)

#define rpcent_struct_set_r_aliases(a_structure,a_value) do {((( rpcent*)(a_structure)))->r_aliases = (a_value);}while(0)

#define rpcent_struct_get_r_number(a_structure) ((( rpcent*) (a_structure))->r_number)

#define rpcent_struct_set_r_number(a_structure,a_value) do {((( rpcent*)(a_structure)))->r_number = (a_value);}while(0)

#define sizeof_rpcent (sizeof( rpcent))
#define sizeof_tcphdr (sizeof( tcphdr))
#define tcp_info_struct_get_tcpi_state(a_structure) ((( tcp_info*) (a_structure))->tcpi_state)

#define tcp_info_struct_set_tcpi_state(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_state = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_ca_state(a_structure) ((( tcp_info*) (a_structure))->tcpi_ca_state)

#define tcp_info_struct_set_tcpi_ca_state(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_ca_state = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_retransmits(a_structure) ((( tcp_info*) (a_structure))->tcpi_retransmits)

#define tcp_info_struct_set_tcpi_retransmits(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_retransmits = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_probes(a_structure) ((( tcp_info*) (a_structure))->tcpi_probes)

#define tcp_info_struct_set_tcpi_probes(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_probes = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_backoff(a_structure) ((( tcp_info*) (a_structure))->tcpi_backoff)

#define tcp_info_struct_set_tcpi_backoff(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_backoff = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_options(a_structure) ((( tcp_info*) (a_structure))->tcpi_options)

#define tcp_info_struct_set_tcpi_options(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_options = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_snd_wscale(a_structure) ((( tcp_info*) (a_structure))->tcpi_snd_wscale)

#define tcp_info_struct_set_tcpi_snd_wscale(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_snd_wscale = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rcv_wscale(a_structure) ((( tcp_info*) (a_structure))->tcpi_rcv_wscale)

#define tcp_info_struct_set_tcpi_rcv_wscale(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rcv_wscale = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rto(a_structure) ((( tcp_info*) (a_structure))->tcpi_rto)

#define tcp_info_struct_set_tcpi_rto(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rto = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_ato(a_structure) ((( tcp_info*) (a_structure))->tcpi_ato)

#define tcp_info_struct_set_tcpi_ato(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_ato = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_snd_mss(a_structure) ((( tcp_info*) (a_structure))->tcpi_snd_mss)

#define tcp_info_struct_set_tcpi_snd_mss(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_snd_mss = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rcv_mss(a_structure) ((( tcp_info*) (a_structure))->tcpi_rcv_mss)

#define tcp_info_struct_set_tcpi_rcv_mss(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rcv_mss = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_unacked(a_structure) ((( tcp_info*) (a_structure))->tcpi_unacked)

#define tcp_info_struct_set_tcpi_unacked(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_unacked = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_sacked(a_structure) ((( tcp_info*) (a_structure))->tcpi_sacked)

#define tcp_info_struct_set_tcpi_sacked(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_sacked = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_lost(a_structure) ((( tcp_info*) (a_structure))->tcpi_lost)

#define tcp_info_struct_set_tcpi_lost(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_lost = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_retrans(a_structure) ((( tcp_info*) (a_structure))->tcpi_retrans)

#define tcp_info_struct_set_tcpi_retrans(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_retrans = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_fackets(a_structure) ((( tcp_info*) (a_structure))->tcpi_fackets)

#define tcp_info_struct_set_tcpi_fackets(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_fackets = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_last_data_sent(a_structure) ((( tcp_info*) (a_structure))->tcpi_last_data_sent)

#define tcp_info_struct_set_tcpi_last_data_sent(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_last_data_sent = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_last_ack_sent(a_structure) ((( tcp_info*) (a_structure))->tcpi_last_ack_sent)

#define tcp_info_struct_set_tcpi_last_ack_sent(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_last_ack_sent = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_last_data_recv(a_structure) ((( tcp_info*) (a_structure))->tcpi_last_data_recv)

#define tcp_info_struct_set_tcpi_last_data_recv(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_last_data_recv = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_last_ack_recv(a_structure) ((( tcp_info*) (a_structure))->tcpi_last_ack_recv)

#define tcp_info_struct_set_tcpi_last_ack_recv(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_last_ack_recv = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_pmtu(a_structure) ((( tcp_info*) (a_structure))->tcpi_pmtu)

#define tcp_info_struct_set_tcpi_pmtu(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_pmtu = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rcv_ssthresh(a_structure) ((( tcp_info*) (a_structure))->tcpi_rcv_ssthresh)

#define tcp_info_struct_set_tcpi_rcv_ssthresh(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rcv_ssthresh = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rtt(a_structure) ((( tcp_info*) (a_structure))->tcpi_rtt)

#define tcp_info_struct_set_tcpi_rtt(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rtt = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rttvar(a_structure) ((( tcp_info*) (a_structure))->tcpi_rttvar)

#define tcp_info_struct_set_tcpi_rttvar(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rttvar = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_snd_ssthresh(a_structure) ((( tcp_info*) (a_structure))->tcpi_snd_ssthresh)

#define tcp_info_struct_set_tcpi_snd_ssthresh(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_snd_ssthresh = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_snd_cwnd(a_structure) ((( tcp_info*) (a_structure))->tcpi_snd_cwnd)

#define tcp_info_struct_set_tcpi_snd_cwnd(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_snd_cwnd = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_advmss(a_structure) ((( tcp_info*) (a_structure))->tcpi_advmss)

#define tcp_info_struct_set_tcpi_advmss(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_advmss = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_reordering(a_structure) ((( tcp_info*) (a_structure))->tcpi_reordering)

#define tcp_info_struct_set_tcpi_reordering(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_reordering = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rcv_rtt(a_structure) ((( tcp_info*) (a_structure))->tcpi_rcv_rtt)

#define tcp_info_struct_set_tcpi_rcv_rtt(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rcv_rtt = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_rcv_space(a_structure) ((( tcp_info*) (a_structure))->tcpi_rcv_space)

#define tcp_info_struct_set_tcpi_rcv_space(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_rcv_space = (a_value);}while(0)

#define tcp_info_struct_get_tcpi_total_retrans(a_structure) ((( tcp_info*) (a_structure))->tcpi_total_retrans)

#define tcp_info_struct_set_tcpi_total_retrans(a_structure,a_value) do {((( tcp_info*)(a_structure)))->tcpi_total_retrans = (a_value);}while(0)

#define sizeof_tcp_info (sizeof( tcp_info))
#define tcp_md5sig_struct_get_tcpm_keylen(a_structure) ((( tcp_md5sig*) (a_structure))->tcpm_keylen)

#define tcp_md5sig_struct_set_tcpm_keylen(a_structure,a_value) do {((( tcp_md5sig*)(a_structure)))->tcpm_keylen = (a_value);}while(0)

#define tcp_md5sig_struct_get_tcpm_key(a_structure) ((( tcp_md5sig*) (a_structure))->tcpm_key)

#define tcp_md5sig_struct_set_tcpm_key(a_structure,a_value) do {((( tcp_md5sig*)(a_structure)))->tcpm_key = (a_value);}while(0)

#define sizeof_tcp_md5sig (sizeof( tcp_md5sig))
#define tcp_repair_opt_struct_get_opt_code(a_structure) ((( tcp_repair_opt*) (a_structure))->opt_code)

#define tcp_repair_opt_struct_set_opt_code(a_structure,a_value) do {((( tcp_repair_opt*)(a_structure)))->opt_code = (a_value);}while(0)

#define tcp_repair_opt_struct_get_opt_val(a_structure) ((( tcp_repair_opt*) (a_structure))->opt_val)

#define tcp_repair_opt_struct_set_opt_val(a_structure,a_value) do {((( tcp_repair_opt*)(a_structure)))->opt_val = (a_value);}while(0)

#define sizeof_tcp_repair_opt (sizeof( tcp_repair_opt))
#define tcp_cookie_transactions_struct_get_tcpct_flags(a_structure) ((( tcp_cookie_transactions*) (a_structure))->tcpct_flags)

#define tcp_cookie_transactions_struct_set_tcpct_flags(a_structure,a_value) do {((( tcp_cookie_transactions*)(a_structure)))->tcpct_flags = (a_value);}while(0)

#define tcp_cookie_transactions_struct_get_tcpct_cookie_desired(a_structure) ((( tcp_cookie_transactions*) (a_structure))->tcpct_cookie_desired)

#define tcp_cookie_transactions_struct_set_tcpct_cookie_desired(a_structure,a_value) do {((( tcp_cookie_transactions*)(a_structure)))->tcpct_cookie_desired = (a_value);}while(0)

#define tcp_cookie_transactions_struct_get_tcpct_s_data_desired(a_structure) ((( tcp_cookie_transactions*) (a_structure))->tcpct_s_data_desired)

#define tcp_cookie_transactions_struct_set_tcpct_s_data_desired(a_structure,a_value) do {((( tcp_cookie_transactions*)(a_structure)))->tcpct_s_data_desired = (a_value);}while(0)

#define tcp_cookie_transactions_struct_get_tcpct_used(a_structure) ((( tcp_cookie_transactions*) (a_structure))->tcpct_used)

#define tcp_cookie_transactions_struct_set_tcpct_used(a_structure,a_value) do {((( tcp_cookie_transactions*)(a_structure)))->tcpct_used = (a_value);}while(0)

#define tcp_cookie_transactions_struct_get_tcpct_value(a_structure) ((( tcp_cookie_transactions*) (a_structure))->tcpct_value)

#define tcp_cookie_transactions_struct_set_tcpct_value(a_structure,a_value) do {((( tcp_cookie_transactions*)(a_structure)))->tcpct_value = (a_value);}while(0)

#define sizeof_tcp_cookie_transactions (sizeof( tcp_cookie_transactions))
#define sizeof_iface (sizeof( iface))
#define set_environ(a_value) environ = (a_value);
