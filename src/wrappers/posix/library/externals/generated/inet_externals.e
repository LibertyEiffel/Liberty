-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class INET_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	inet_addr (a_cp: POINTER): like uint32_t 

		-- function inet_addr (in `/usr/include/arpa/inet.h')
               -- inet_addr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_addr"
               }"
               end

	inet_aton (a_cp: POINTER; an_inp: POINTER): INTEGER 

		-- function inet_aton (in `/usr/include/arpa/inet.h')
               -- inet_aton
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_aton"
               }"
               end

       -- unwrappable function inet_lnaof in file `/usr/include/arpa/inet.h'
       -- unwrappable function inet_makeaddr in file `/usr/include/arpa/inet.h'
	inet_net_ntop (an_af: INTEGER; a_cp: POINTER; a_bits: INTEGER; a_buf: POINTER; a_len: like size_t): POINTER 

		-- function inet_net_ntop (in `/usr/include/arpa/inet.h')
               -- inet_net_ntop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_net_ntop"
               }"
               end

	inet_net_pton (an_af: INTEGER; a_cp: POINTER; a_buf: POINTER; a_len: like size_t): INTEGER 

		-- function inet_net_pton (in `/usr/include/arpa/inet.h')
               -- inet_net_pton
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_net_pton"
               }"
               end

	inet_neta (a_net: like uint32_t; a_buf: POINTER; a_len: like size_t): POINTER 

		-- function inet_neta (in `/usr/include/arpa/inet.h')
               -- inet_neta
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_neta"
               }"
               end

       -- unwrappable function inet_netof in file `/usr/include/arpa/inet.h'
	inet_network (a_cp: POINTER): like uint32_t 

		-- function inet_network (in `/usr/include/arpa/inet.h')
               -- inet_network
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_network"
               }"
               end

	inet_nsap_addr (a_cp: POINTER; a_buf: POINTER; a_len: INTEGER): NATURAL 

		-- function inet_nsap_addr (in `/usr/include/arpa/inet.h')
               -- inet_nsap_addr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_nsap_addr"
               }"
               end

	inet_nsap_ntoa (a_len: INTEGER; a_cp: POINTER; a_buf: POINTER): POINTER 

		-- function inet_nsap_ntoa (in `/usr/include/arpa/inet.h')
               -- inet_nsap_ntoa
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_nsap_ntoa"
               }"
               end

       -- unwrappable function inet_ntoa in file `/usr/include/arpa/inet.h'
	inet_ntop (an_af: INTEGER; a_cp: POINTER; a_buf: POINTER; a_len: NATURAL): POINTER 

		-- function inet_ntop (in `/usr/include/arpa/inet.h')
               -- inet_ntop
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_ntop"
               }"
               end

	inet_pton (an_af: INTEGER; a_cp: POINTER; a_buf: POINTER): INTEGER 

		-- function inet_pton (in `/usr/include/arpa/inet.h')
               -- inet_pton
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "inet_pton"
               }"
               end


end -- class INET_EXTERNALS
