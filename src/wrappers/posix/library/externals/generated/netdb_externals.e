-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class NETDB_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	endhostent 

		-- function endhostent (in `/usr/include/netdb.h')
               -- endhostent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endhostent()"
               }"
               end

	endnetent 

		-- function endnetent (in `/usr/include/netdb.h')
               -- endnetent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endnetent()"
               }"
               end

	endnetgrent 

		-- function endnetgrent (in `/usr/include/netdb.h')
               -- endnetgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endnetgrent()"
               }"
               end

	endprotoent 

		-- function endprotoent (in `/usr/include/netdb.h')
               -- endprotoent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endprotoent()"
               }"
               end

	endservent 

		-- function endservent (in `/usr/include/netdb.h')
               -- endservent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endservent()"
               }"
               end

	freeaddrinfo (an_ai: POINTER) 

		-- function freeaddrinfo (in `/usr/include/netdb.h')
               -- freeaddrinfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "freeaddrinfo"
               }"
               end

	gai_cancel (a_gaicbp: POINTER): INTEGER 

		-- function gai_cancel (in `/usr/include/netdb.h')
               -- gai_cancel
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gai_cancel"
               }"
               end

	gai_error (a_req: POINTER): INTEGER 

		-- function gai_error (in `/usr/include/netdb.h')
               -- gai_error
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gai_error"
               }"
               end

	gai_strerror (an_ecode: INTEGER): POINTER 

		-- function gai_strerror (in `/usr/include/netdb.h')
               -- gai_strerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gai_strerror"
               }"
               end

	gai_suspend (a_list: POINTER; an_ent: INTEGER; a_timeout: POINTER): INTEGER 

		-- function gai_suspend (in `/usr/include/netdb.h')
               -- gai_suspend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gai_suspend"
               }"
               end

	getaddrinfo (a_name: POINTER; a_service: POINTER; a_req: POINTER; a_pai: POINTER): INTEGER 

		-- function getaddrinfo (in `/usr/include/netdb.h')
               -- getaddrinfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getaddrinfo"
               }"
               end

	getaddrinfo_a (a_mode: INTEGER; a_list: POINTER; an_ent: INTEGER; a_sig: POINTER): INTEGER 

		-- function getaddrinfo_a (in `/usr/include/netdb.h')
               -- getaddrinfo_a
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getaddrinfo_a"
               }"
               end

	gethostbyaddr (an_addr: POINTER; a_len: NATURAL; a_type: INTEGER): POINTER 

		-- function gethostbyaddr (in `/usr/include/netdb.h')
               -- gethostbyaddr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostbyaddr"
               }"
               end

	gethostbyaddr_r (an_addr: POINTER; a_len: NATURAL; a_type: INTEGER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function gethostbyaddr_r (in `/usr/include/netdb.h')
               -- gethostbyaddr_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostbyaddr_r"
               }"
               end

	gethostbyname (a_name: POINTER): POINTER 

		-- function gethostbyname (in `/usr/include/netdb.h')
               -- gethostbyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostbyname"
               }"
               end

	gethostbyname2 (a_name: POINTER; an_af: INTEGER): POINTER 

		-- function gethostbyname2 (in `/usr/include/netdb.h')
               -- gethostbyname2
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostbyname2"
               }"
               end

	gethostbyname2_r (a_name: POINTER; an_af: INTEGER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function gethostbyname2_r (in `/usr/include/netdb.h')
               -- gethostbyname2_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostbyname2_r"
               }"
               end

	gethostbyname_r (a_name: POINTER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function gethostbyname_r (in `/usr/include/netdb.h')
               -- gethostbyname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostbyname_r"
               }"
               end

	gethostent: POINTER 

		-- function gethostent (in `/usr/include/netdb.h')
               -- gethostent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostent()"
               }"
               end

	gethostent_r (a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function gethostent_r (in `/usr/include/netdb.h')
               -- gethostent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gethostent_r"
               }"
               end

	getnameinfo (a_sa: POINTER; a_salen: NATURAL; a_host: POINTER; a_hostlen: NATURAL; a_serv: POINTER; a_servlen: NATURAL; a_flags: INTEGER): INTEGER 

		-- function getnameinfo (in `/usr/include/netdb.h')
               -- getnameinfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnameinfo"
               }"
               end

	getnetbyaddr (a_net: like uint32_t; a_type: INTEGER): POINTER 

		-- function getnetbyaddr (in `/usr/include/netdb.h')
               -- getnetbyaddr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetbyaddr"
               }"
               end

	getnetbyaddr_r (a_net: like uint32_t; a_type: INTEGER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function getnetbyaddr_r (in `/usr/include/netdb.h')
               -- getnetbyaddr_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetbyaddr_r"
               }"
               end

	getnetbyname (a_name: POINTER): POINTER 

		-- function getnetbyname (in `/usr/include/netdb.h')
               -- getnetbyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetbyname"
               }"
               end

	getnetbyname_r (a_name: POINTER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function getnetbyname_r (in `/usr/include/netdb.h')
               -- getnetbyname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetbyname_r"
               }"
               end

	getnetent: POINTER 

		-- function getnetent (in `/usr/include/netdb.h')
               -- getnetent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetent()"
               }"
               end

	getnetent_r (a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER; a_h_errnop: POINTER): INTEGER 

		-- function getnetent_r (in `/usr/include/netdb.h')
               -- getnetent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetent_r"
               }"
               end

	getnetgrent (a_hostp: POINTER; an_userp: POINTER; a_domainp: POINTER): INTEGER 

		-- function getnetgrent (in `/usr/include/netdb.h')
               -- getnetgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetgrent"
               }"
               end

	getnetgrent_r (a_hostp: POINTER; an_userp: POINTER; a_domainp: POINTER; a_buffer: POINTER; a_buflen: like size_t): INTEGER 

		-- function getnetgrent_r (in `/usr/include/netdb.h')
               -- getnetgrent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getnetgrent_r"
               }"
               end

	getprotobyname (a_name: POINTER): POINTER 

		-- function getprotobyname (in `/usr/include/netdb.h')
               -- getprotobyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getprotobyname"
               }"
               end

	getprotobyname_r (a_name: POINTER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getprotobyname_r (in `/usr/include/netdb.h')
               -- getprotobyname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getprotobyname_r"
               }"
               end

	getprotobynumber (a_proto: INTEGER): POINTER 

		-- function getprotobynumber (in `/usr/include/netdb.h')
               -- getprotobynumber
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getprotobynumber"
               }"
               end

	getprotobynumber_r (a_proto: INTEGER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getprotobynumber_r (in `/usr/include/netdb.h')
               -- getprotobynumber_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getprotobynumber_r"
               }"
               end

	getprotoent: POINTER 

		-- function getprotoent (in `/usr/include/netdb.h')
               -- getprotoent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getprotoent()"
               }"
               end

	getprotoent_r (a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getprotoent_r (in `/usr/include/netdb.h')
               -- getprotoent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getprotoent_r"
               }"
               end

	getservbyname (a_name: POINTER; a_proto: POINTER): POINTER 

		-- function getservbyname (in `/usr/include/netdb.h')
               -- getservbyname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getservbyname"
               }"
               end

	getservbyname_r (a_name: POINTER; a_proto: POINTER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getservbyname_r (in `/usr/include/netdb.h')
               -- getservbyname_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getservbyname_r"
               }"
               end

	getservbyport (a_port: INTEGER; a_proto: POINTER): POINTER 

		-- function getservbyport (in `/usr/include/netdb.h')
               -- getservbyport
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getservbyport"
               }"
               end

	getservbyport_r (a_port: INTEGER; a_proto: POINTER; a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getservbyport_r (in `/usr/include/netdb.h')
               -- getservbyport_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getservbyport_r"
               }"
               end

	getservent: POINTER 

		-- function getservent (in `/usr/include/netdb.h')
               -- getservent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getservent()"
               }"
               end

	getservent_r (a_result_buf: POINTER; a_buf: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getservent_r (in `/usr/include/netdb.h')
               -- getservent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getservent_r"
               }"
               end

	-- `hidden' function __h_errno_location skipped.
	herror (a_str: POINTER) 

		-- function herror (in `/usr/include/netdb.h')
               -- herror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "herror"
               }"
               end

	hstrerror (an_err_num: INTEGER): POINTER 

		-- function hstrerror (in `/usr/include/netdb.h')
               -- hstrerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "hstrerror"
               }"
               end

	innetgr (a_netgroup: POINTER; a_host: POINTER; an_user: POINTER; a_domain: POINTER): INTEGER 

		-- function innetgr (in `/usr/include/netdb.h')
               -- innetgr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "innetgr"
               }"
               end

	iruserok (a_raddr: like uint32_t; a_suser: INTEGER; a_remuser: POINTER; a_locuser: POINTER): INTEGER 

		-- function iruserok (in `/usr/include/netdb.h')
               -- iruserok
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iruserok"
               }"
               end

	iruserok_af (a_raddr: POINTER; a_suser: INTEGER; a_remuser: POINTER; a_locuser: POINTER; an_af: NATURAL_16): INTEGER 

		-- function iruserok_af (in `/usr/include/netdb.h')
               -- iruserok_af
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "iruserok_af"
               }"
               end

	rcmd (an_ahost: POINTER; a_rport: NATURAL_16; a_locuser: POINTER; a_remuser: POINTER; a_cmd: POINTER; a_fd2p: POINTER): INTEGER 

		-- function rcmd (in `/usr/include/netdb.h')
               -- rcmd
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rcmd"
               }"
               end

	rcmd_af (an_ahost: POINTER; a_rport: NATURAL_16; a_locuser: POINTER; a_remuser: POINTER; a_cmd: POINTER; a_fd2p: POINTER; an_af: NATURAL_16): INTEGER 

		-- function rcmd_af (in `/usr/include/netdb.h')
               -- rcmd_af
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rcmd_af"
               }"
               end

	rexec (an_ahost: POINTER; a_rport: INTEGER; a_name: POINTER; a_pass: POINTER; a_cmd: POINTER; a_fd2p: POINTER): INTEGER 

		-- function rexec (in `/usr/include/netdb.h')
               -- rexec
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rexec"
               }"
               end

	rexec_af (an_ahost: POINTER; a_rport: INTEGER; a_name: POINTER; a_pass: POINTER; a_cmd: POINTER; a_fd2p: POINTER; an_af: NATURAL_16): INTEGER 

		-- function rexec_af (in `/usr/include/netdb.h')
               -- rexec_af
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rexec_af"
               }"
               end

	rresvport (an_alport: POINTER): INTEGER 

		-- function rresvport (in `/usr/include/netdb.h')
               -- rresvport
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rresvport"
               }"
               end

	rresvport_af (an_alport: POINTER; an_af: NATURAL_16): INTEGER 

		-- function rresvport_af (in `/usr/include/netdb.h')
               -- rresvport_af
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "rresvport_af"
               }"
               end

	ruserok (a_rhost: POINTER; a_suser: INTEGER; a_remuser: POINTER; a_locuser: POINTER): INTEGER 

		-- function ruserok (in `/usr/include/netdb.h')
               -- ruserok
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ruserok"
               }"
               end

	ruserok_af (a_rhost: POINTER; a_suser: INTEGER; a_remuser: POINTER; a_locuser: POINTER; an_af: NATURAL_16): INTEGER 

		-- function ruserok_af (in `/usr/include/netdb.h')
               -- ruserok_af
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ruserok_af"
               }"
               end

	sethostent (a_stay_open: INTEGER) 

		-- function sethostent (in `/usr/include/netdb.h')
               -- sethostent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sethostent"
               }"
               end

	setnetent (a_stay_open: INTEGER) 

		-- function setnetent (in `/usr/include/netdb.h')
               -- setnetent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setnetent"
               }"
               end

	setnetgrent (a_netgroup: POINTER): INTEGER 

		-- function setnetgrent (in `/usr/include/netdb.h')
               -- setnetgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setnetgrent"
               }"
               end

	setprotoent (a_stay_open: INTEGER) 

		-- function setprotoent (in `/usr/include/netdb.h')
               -- setprotoent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setprotoent"
               }"
               end

	setservent (a_stay_open: INTEGER) 

		-- function setservent (in `/usr/include/netdb.h')
               -- setservent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setservent"
               }"
               end


end -- class NETDB_EXTERNALS
