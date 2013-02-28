-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class IN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- Variable in6addr_loopback (at line 216 in file /usr/include/netinet/in.h does not have a wrapper type
	address_of_in6addr_loopback: POINTER is
 		-- Address of in6addr_loopback (node at line 216)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&in6addr_loopback"
		}"
		end

	-- Variable in6addr_any (at line 215 in file /usr/include/netinet/in.h does not have a wrapper type
	address_of_in6addr_any: POINTER is
 		-- Address of in6addr_any (node at line 215)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "&in6addr_any"
		}"
		end

	bindresvport6 (a_sockfd: INTEGER_32; a_sock_in: POINTER): INTEGER_32 is
 		-- bindresvport6 (node at line 354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bindresvport6"
		}"
		end

	htons (a_hostshort: NATURAL_16): NATURAL_16 is
 		-- htons (node at line 528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "htons"
		}"
		end

	htonl (a_hostlong: NATURAL_32): NATURAL_32 is
 		-- htonl (node at line 1810)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "htonl"
		}"
		end

	inet6_opt_get_val (a_databuf: POINTER; an_offset: INTEGER_32; a_val: POINTER; a_vallen: NATURAL_32): INTEGER_32 is
 		-- inet6_opt_get_val (node at line 2742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_get_val"
		}"
		end

	inet6_rth_getaddr (a_bp: POINTER; an_index: INTEGER_32): POINTER is
 		-- inet6_rth_getaddr (node at line 2834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_getaddr"
		}"
		end

	inet6_option_find (a_cmsg: POINTER; a_tptrp: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- inet6_option_find (node at line 2966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_find"
		}"
		end

	inet6_rth_add (a_bp: POINTER; an_addr: POINTER): INTEGER_32 is
 		-- inet6_rth_add (node at line 3723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_add"
		}"
		end

	-- function setipv4sourcefilter (at line 599 in file /usr/include/netinet/in.h is not wrappable
	setsourcefilter (a_s: INTEGER_32; an_interface_addr: NATURAL_32; a_group: POINTER; a_grouplen: NATURAL_32; a_fmode: NATURAL_32; a_numsrc: NATURAL_32; a_slist: POINTER): INTEGER_32 is
 		-- setsourcefilter (node at line 5219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "setsourcefilter"
		}"
		end

	inet6_rth_segments (a_bp: POINTER): INTEGER_32 is
 		-- inet6_rth_segments (node at line 5339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_segments"
		}"
		end

	inet6_rth_init (a_bp: POINTER; a_bp_len: NATURAL_32; a_type: INTEGER_32; a_segments: INTEGER_32): POINTER is
 		-- inet6_rth_init (node at line 5444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_init"
		}"
		end

	inet6_option_alloc (a_cmsg: POINTER; a_datalen: INTEGER_32; a_multx: INTEGER_32; a_plusy: INTEGER_32): POINTER is
 		-- inet6_option_alloc (node at line 6075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_alloc"
		}"
		end

	inet6_opt_set_val (a_databuf: POINTER; an_offset: INTEGER_32; a_val: POINTER; a_vallen: NATURAL_32): INTEGER_32 is
 		-- inet6_opt_set_val (node at line 6081)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_set_val"
		}"
		end

	inet6_rth_space (a_type: INTEGER_32; a_segments: INTEGER_32): NATURAL_32 is
 		-- inet6_rth_space (node at line 6312)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_space"
		}"
		end

	inet6_option_init (a_bp: POINTER; a_cmsgp: POINTER; a_type: INTEGER_32): INTEGER_32 is
 		-- inet6_option_init (node at line 6394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_init"
		}"
		end

	inet6_opt_init (an_extbuf: POINTER; an_extlen: NATURAL_32): INTEGER_32 is
 		-- inet6_opt_init (node at line 6405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_init"
		}"
		end

	ntohl (a_netlong: NATURAL_32): NATURAL_32 is
 		-- ntohl (node at line 6419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ntohl"
		}"
		end

	ntohs (a_netshort: NATURAL_16): NATURAL_16 is
 		-- ntohs (node at line 6422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ntohs"
		}"
		end

	inet6_opt_next (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32; a_typep: POINTER; a_lenp: POINTER; a_databufp: POINTER): INTEGER_32 is
 		-- inet6_opt_next (node at line 6504)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_next"
		}"
		end

	-- function getipv4sourcefilter (at line 592 in file /usr/include/netinet/in.h is not wrappable
	inet6_opt_finish (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32): INTEGER_32 is
 		-- inet6_opt_finish (node at line 6954)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_finish"
		}"
		end

	inet6_opt_append (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32; a_type: CHARACTER; a_len: NATURAL_32; an_align: CHARACTER; a_databufp: POINTER): INTEGER_32 is
 		-- inet6_opt_append (node at line 7105)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_append"
		}"
		end

	inet6_option_append (a_cmsg: POINTER; a_typep: POINTER; a_multx: INTEGER_32; a_plusy: INTEGER_32): INTEGER_32 is
 		-- inet6_option_append (node at line 7327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_append"
		}"
		end

	inet6_rth_reverse (an_in: POINTER; an_out_external: POINTER): INTEGER_32 is
 		-- inet6_rth_reverse (node at line 7398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_rth_reverse"
		}"
		end

	inet6_option_space (a_nbytes: INTEGER_32): INTEGER_32 is
 		-- inet6_option_space (node at line 8078)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_space"
		}"
		end

	inet6_opt_find (an_extbuf: POINTER; an_extlen: NATURAL_32; an_offset: INTEGER_32; a_type: CHARACTER; a_lenp: POINTER; a_databufp: POINTER): INTEGER_32 is
 		-- inet6_opt_find (node at line 8370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_opt_find"
		}"
		end

	inet6_option_next (a_cmsg: POINTER; a_tptrp: POINTER): INTEGER_32 is
 		-- inet6_option_next (node at line 8464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet6_option_next"
		}"
		end

	getsourcefilter (a_s: INTEGER_32; an_interface_addr: NATURAL_32; a_group: POINTER; a_grouplen: NATURAL_32; a_fmode: POINTER; a_numsrc: POINTER; a_slist: POINTER): INTEGER_32 is
 		-- getsourcefilter (node at line 8552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "getsourcefilter"
		}"
		end

	bindresvport (a_sockfd: INTEGER_32; a_sock_in: POINTER): INTEGER_32 is
 		-- bindresvport (node at line 8928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "bindresvport"
		}"
		end


end -- class IN_EXTERNALS
