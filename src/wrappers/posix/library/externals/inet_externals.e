-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class INET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	inet_addr (a_cp: POINTER): like uint32_t is
 		-- inet_addr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_addr"
		}"
		end

	inet_aton (a_cp: POINTER; an_inp: POINTER): INTEGER is
 		-- inet_aton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_aton"
		}"
		end

	-- function inet_lnaof (at line 38 in file /usr/include/arpa/inet.h is not wrappable
	-- function inet_makeaddr (at line 43 in file /usr/include/arpa/inet.h is not wrappable
	inet_net_ntop (an_af: INTEGER; a_cp: POINTER; a_bits: INTEGER; a_buf: POINTER; a_len: like size_t): POINTER is
 		-- inet_net_ntop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_net_ntop"
		}"
		end

	inet_net_pton (an_af: INTEGER; a_cp: POINTER; a_buf: POINTER; a_len: like size_t): INTEGER is
 		-- inet_net_pton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_net_pton"
		}"
		end

	inet_neta (a_net: like uint32_t; a_buf: POINTER; a_len: like size_t): POINTER is
 		-- inet_neta
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_neta"
		}"
		end

	-- function inet_netof (at line 46 in file /usr/include/arpa/inet.h is not wrappable
	inet_network (a_cp: POINTER): like uint32_t is
 		-- inet_network
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_network"
		}"
		end

	inet_nsap_addr (a_cp: POINTER; a_buf: POINTER; a_len: INTEGER): NATURAL is
 		-- inet_nsap_addr
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_nsap_addr"
		}"
		end

	inet_nsap_ntoa (a_len: INTEGER; a_cp: POINTER; a_buf: POINTER): POINTER is
 		-- inet_nsap_ntoa
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_nsap_ntoa"
		}"
		end

	-- function inet_ntoa (at line 54 in file /usr/include/arpa/inet.h is not wrappable
	inet_ntop (an_af: INTEGER; a_cp: POINTER; a_buf: POINTER; a_len: NATURAL): POINTER is
 		-- inet_ntop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_ntop"
		}"
		end

	inet_pton (an_af: INTEGER; a_cp: POINTER; a_buf: POINTER): INTEGER is
 		-- inet_pton
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_pton"
		}"
		end


end -- class INET_EXTERNALS
