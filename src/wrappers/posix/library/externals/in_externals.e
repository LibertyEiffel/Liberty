-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class IN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	bindresvport (a_sockfd: INTEGER; a_sock_in: POINTER): INTEGER 
               -- bindresvport
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	bindresvport6 (a_sockfd: INTEGER; a_sock_in: POINTER): INTEGER 
               -- bindresvport6
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

       -- function getipv4sourcefilter (at line 603 in file /usr/include/netinet/in.h is not wrappable
	getsourcefilter (a_s: INTEGER; an_interface_addr: like uint32_t; a_group: POINTER; a_grouplen: NATURAL; a_fmode: POINTER; a_numsrc: POINTER; a_slist: POINTER): INTEGER 
               -- getsourcefilter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htonl (a_hostlong: like uint32_t): like uint32_t 
               -- htonl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	htons (a_hostshort: like uint16_t): like uint16_t 
               -- htons
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

       -- Variable in6addr_any (at line 227 in file /usr/include/netinet/in.h does not have a wrapper type
       address_of_in6addr_any: POINTER
               -- Address of in6addr_any
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&in6addr_any"
               }"
               end

       -- Variable in6addr_loopback (at line 228 in file /usr/include/netinet/in.h does not have a wrapper type
       address_of_in6addr_loopback: POINTER
               -- Address of in6addr_loopback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&in6addr_loopback"
               }"
               end

	inet6_opt_append (an_extbuf: POINTER; an_extlen: NATURAL; an_offset: INTEGER; a_type: like uint8_t; a_len: NATURAL; an_align: like uint8_t; a_databufp: POINTER): INTEGER 
               -- inet6_opt_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_opt_find (an_extbuf: POINTER; an_extlen: NATURAL; an_offset: INTEGER; a_type: like uint8_t; a_lenp: POINTER; a_databufp: POINTER): INTEGER 
               -- inet6_opt_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_opt_finish (an_extbuf: POINTER; an_extlen: NATURAL; an_offset: INTEGER): INTEGER 
               -- inet6_opt_finish
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_opt_get_val (a_databuf: POINTER; an_offset: INTEGER; a_val: POINTER; a_vallen: NATURAL): INTEGER 
               -- inet6_opt_get_val
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_opt_init (an_extbuf: POINTER; an_extlen: NATURAL): INTEGER 
               -- inet6_opt_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_opt_next (an_extbuf: POINTER; an_extlen: NATURAL; an_offset: INTEGER; a_typep: POINTER; a_lenp: POINTER; a_databufp: POINTER): INTEGER 
               -- inet6_opt_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_opt_set_val (a_databuf: POINTER; an_offset: INTEGER; a_val: POINTER; a_vallen: NATURAL): INTEGER 
               -- inet6_opt_set_val
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_option_alloc (a_cmsg: POINTER; a_datalen: INTEGER; a_multx: INTEGER; a_plusy: INTEGER): POINTER 
               -- inet6_option_alloc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_option_append (a_cmsg: POINTER; a_typep: POINTER; a_multx: INTEGER; a_plusy: INTEGER): INTEGER 
               -- inet6_option_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_option_find (a_cmsg: POINTER; a_tptrp: POINTER; a_type: INTEGER): INTEGER 
               -- inet6_option_find
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_option_init (a_bp: POINTER; a_cmsgp: POINTER; a_type: INTEGER): INTEGER 
               -- inet6_option_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_option_next (a_cmsg: POINTER; a_tptrp: POINTER): INTEGER 
               -- inet6_option_next
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_option_space (a_nbytes: INTEGER): INTEGER 
               -- inet6_option_space
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_rth_add (a_bp: POINTER; an_addr: POINTER): INTEGER 
               -- inet6_rth_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_rth_getaddr (a_bp: POINTER; an_index: INTEGER): POINTER 
               -- inet6_rth_getaddr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_rth_init (a_bp: POINTER; a_bp_len: NATURAL; a_type: INTEGER; a_segments: INTEGER): POINTER 
               -- inet6_rth_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_rth_reverse (an_in: POINTER; an_out_external: POINTER): INTEGER 
               -- inet6_rth_reverse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_rth_segments (a_bp: POINTER): INTEGER 
               -- inet6_rth_segments
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	inet6_rth_space (a_type: INTEGER; a_segments: INTEGER): NATURAL 
               -- inet6_rth_space
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ntohl (a_netlong: like uint32_t): like uint32_t 
               -- ntohl
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	ntohs (a_netshort: like uint16_t): like uint16_t 
               -- ntohs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

       -- function setipv4sourcefilter (at line 610 in file /usr/include/netinet/in.h is not wrappable
	setsourcefilter (a_s: INTEGER; an_interface_addr: like uint32_t; a_group: POINTER; a_grouplen: NATURAL; a_fmode: like uint32_t; a_numsrc: like uint32_t; a_slist: POINTER): INTEGER 
               -- setsourcefilter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class IN_EXTERNALS
