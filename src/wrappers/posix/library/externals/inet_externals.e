-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class INET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	inet_ntop (an_af: INTEGER_32; a_cp: POINTER; a_buf: POINTER; a_len: NATURAL_32): POINTER is
 		-- inet_ntop (node at line 558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_ntop"
		}"
		end

	inet_nsap_ntoa (a_len: INTEGER_32; a_cp: POINTER; a_buf: POINTER): POINTER is
 		-- inet_nsap_ntoa (node at line 2331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_nsap_ntoa"
		}"
		end

	inet_net_pton (an_af: INTEGER_32; a_cp: POINTER; a_buf: POINTER; a_len: NATURAL_64): INTEGER_32 is
 		-- inet_net_pton (node at line 2694)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_net_pton"
		}"
		end

	-- function inet_lnaof (at line 38 in file /usr/include/arpa/inet.h is not wrappable
	inet_network (a_cp: POINTER): NATURAL_32 is
 		-- inet_network (node at line 3526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_network"
		}"
		end

	inet_aton (a_cp: POINTER; an_inp: POINTER): INTEGER_32 is
 		-- inet_aton (node at line 4076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_aton"
		}"
		end

	-- function inet_ntoa (at line 54 in file /usr/include/arpa/inet.h is not wrappable
	-- function inet_netof (at line 46 in file /usr/include/arpa/inet.h is not wrappable
	inet_nsap_addr (a_cp: POINTER; a_buf: POINTER; a_len: INTEGER_32): NATURAL_32 is
 		-- inet_nsap_addr (node at line 6664)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_nsap_addr"
		}"
		end

	inet_pton (an_af: INTEGER_32; a_cp: POINTER; a_buf: POINTER): INTEGER_32 is
 		-- inet_pton (node at line 6993)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_pton"
		}"
		end

	-- function inet_makeaddr (at line 43 in file /usr/include/arpa/inet.h is not wrappable
	inet_net_ntop (an_af: INTEGER_32; a_cp: POINTER; a_bits: INTEGER_32; a_buf: POINTER; a_len: NATURAL_64): POINTER is
 		-- inet_net_ntop (node at line 8800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_net_ntop"
		}"
		end

	inet_neta (a_net: NATURAL_32; a_buf: POINTER; a_len: NATURAL_64): POINTER is
 		-- inet_neta (node at line 8903)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_neta"
		}"
		end

	inet_addr (a_cp: POINTER): NATURAL_32 is
 		-- inet_addr (node at line 9052)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "inet_addr"
		}"
		end


end -- class INET_EXTERNALS
