-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	bindresvport (a_sockfd: INTEGER_32; a_sock_in: POINTER): INTEGER_32 is
 		-- bindresvport
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bindresvport"
		}"
		end

	bindresvport6 (a_sockfd: INTEGER_32; a_sock_in: POINTER): INTEGER_32 is
 		-- bindresvport6
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bindresvport6"
		}"
		end

	-- function getipv4sourcefilter (at line 592 in file /usr/include/netinet/in.h is not wrappable
	getsourcefilter (a_s: INTEGER_32; an_interface_addr: NATURAL_32; a_group: POINTER; a_grouplen: NATURAL_32; a_fmode: POINTER; a_numsrc: POINTER; a_slist: POINTER): INTEGER_32 is
 		-- getsourcefilter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getsourcefilter"
		}"
		end

	htonl (a_hostlong: NATURAL_32): NATURAL_32 is
 		-- htonl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "htonl"
		}"
		end

	htons (a_hostshort: NATURAL_16): NATURAL_16 is
 		-- htons
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "htons"
		}"
		end

	-- Variable in6addr_any (at line 215 in file /usr/include/netinet/in.h does not have a wrapper type
	address_of_in6addr_any: POINTER is
 		-- Address of in6addr_any
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&in6addr_any"
		}"
		end

	-- Variable in6addr_loopback (at line 216 in file /usr/include/netinet/in.h does not have a wrapper type
	address_of_in6addr_loopback: POINTER is
 		-- Address of in6addr_loopback
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&in6addr_loopback"
		}"
		end

	inet6_opt_append (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32; a_type: CHARACTER; a_len: NATURAL_32; an_align: CHARACTER; a_databufp: POINTER): INTEGER_32 is
 		-- inet6_opt_append
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_append"
		}"
		end

	inet6_opt_find (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32; a_type: CHARACTER; a_lenp: POINTER; a_databufp: POINTER): INTEGER_32 is
 		-- inet6_opt_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_find"
		}"
		end

	inet6_opt_finish (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32): INTEGER_32 is
 		-- inet6_opt_finish
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_finish"
		}"
		end

	inet6_opt_get_val (a_databuf: POINTER; an_offset: INTEGER_32; a_val: POINTER; a_vallen: NATURAL_32): INTEGER_32 is
 		-- inet6_opt_get_val
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_get_val"
		}"
		end

	inet6_opt_init (an_extbuf: POINTER; an_extlen: NATURAL_32): INTEGER_32 is
 		-- inet6_opt_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_init"
		}"
		end

	inet6_opt_next (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32; a_typep: POINTER; a_lenp: POINTER; a_databufp: POINTER): INTEGER_32 is
 		-- inet6_opt_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_next"
		}"
		end

	inet6_opt_set_val (a_databuf: POINTER; an_offset: INTEGER_32; a_val: POINTER; a_vallen: NATURAL_32): INTEGER_32 is
 		-- inet6_opt_set_val
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_set_val"
		}"
		end

	inet6_option_alloc (a_cmsg: POINTER; a_datalen: INTEGER_32; a_multx: INTEGER_32; a_plusy: INTEGER_32): POINTER is
 		-- inet6_option_alloc
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_alloc"
		}"
		end

	inet6_option_append (a_cmsg: POINTER; a_typep: POINTER; a_multx: INTEGER_32; a_plusy: INTEGER_32): INTEGER_32 is
 		-- inet6_option_append
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_append"
		}"
		end

	inet6_option_find (a_cmsg: POINTER; a_tptrp: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- inet6_option_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_find"
		}"
		end

	inet6_option_init (a_bp: POINTER; a_cmsgp: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- inet6_option_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_init"
		}"
		end

	inet6_option_next (a_cmsg: POINTER; a_tptrp: POINTER): INTEGER_32 is
 		-- inet6_option_next
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_next"
		}"
		end

	inet6_option_space (a_nbytes: INTEGER_32): INTEGER_32 is
 		-- inet6_option_space
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_space"
		}"
		end

	inet6_rth_add (a_bp: POINTER; an_addr: POINTER): INTEGER_32 is
 		-- inet6_rth_add
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_add"
		}"
		end

	inet6_rth_getaddr (a_bp: POINTER; an_index: INTEGER_32): POINTER is
 		-- inet6_rth_getaddr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_getaddr"
		}"
		end

	inet6_rth_init (a_bp: POINTER; a_bp_len: NATURAL_32; a_type: INTEGER_32; a_segments: INTEGER_32): POINTER is
 		-- inet6_rth_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_init"
		}"
		end

	inet6_rth_reverse (an_in: POINTER; an_out_external: POINTER): INTEGER_32 is
 		-- inet6_rth_reverse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_reverse"
		}"
		end

	inet6_rth_segments (a_bp: POINTER): INTEGER_32 is
 		-- inet6_rth_segments
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_segments"
		}"
		end

	inet6_rth_space (a_type: INTEGER_32; a_segments: INTEGER_32): NATURAL_32 is
 		-- inet6_rth_space
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_space"
		}"
		end

	ntohl (a_netlong: NATURAL_32): NATURAL_32 is
 		-- ntohl
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ntohl"
		}"
		end

	ntohs (a_netshort: NATURAL_16): NATURAL_16 is
 		-- ntohs
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ntohs"
		}"
		end

	-- function setipv4sourcefilter (at line 599 in file /usr/include/netinet/in.h is not wrappable
	setsourcefilter (a_s: INTEGER_32; an_interface_addr: NATURAL_32; a_group: POINTER; a_grouplen: NATURAL_32; a_fmode: NATURAL_32; a_numsrc: NATURAL_32; a_slist: POINTER): INTEGER_32 is
 		-- setsourcefilter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setsourcefilter"
		}"
		end


end -- class IN_EXTERNALS
