-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class TERMIOS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	cfgetispeed (a_termios_p: POINTER): NATURAL 

		-- function cfgetispeed (in `/usr/include/termios.h')
               -- cfgetispeed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfgetispeed"
               }"
               end

	cfgetospeed (a_termios_p: POINTER): NATURAL 

		-- function cfgetospeed (in `/usr/include/termios.h')
               -- cfgetospeed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfgetospeed"
               }"
               end

	cfmakeraw (a_termios_p: POINTER) 

		-- function cfmakeraw (in `/usr/include/termios.h')
               -- cfmakeraw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfmakeraw"
               }"
               end

	cfsetispeed (a_termios_p: POINTER; a_speed: NATURAL): INTEGER 

		-- function cfsetispeed (in `/usr/include/termios.h')
               -- cfsetispeed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfsetispeed"
               }"
               end

	cfsetospeed (a_termios_p: POINTER; a_speed: NATURAL): INTEGER 

		-- function cfsetospeed (in `/usr/include/termios.h')
               -- cfsetospeed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfsetospeed"
               }"
               end

	cfsetspeed (a_termios_p: POINTER; a_speed: NATURAL): INTEGER 

		-- function cfsetspeed (in `/usr/include/termios.h')
               -- cfsetspeed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cfsetspeed"
               }"
               end

	tcdrain (a_fd: INTEGER): INTEGER 

		-- function tcdrain (in `/usr/include/termios.h')
               -- tcdrain
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcdrain"
               }"
               end

	tcflow (a_fd: INTEGER; an_action: INTEGER): INTEGER 

		-- function tcflow (in `/usr/include/termios.h')
               -- tcflow
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcflow"
               }"
               end

	tcflush (a_fd: INTEGER; a_queue_selector: INTEGER): INTEGER 

		-- function tcflush (in `/usr/include/termios.h')
               -- tcflush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcflush"
               }"
               end

	tcgetattr (a_fd: INTEGER; a_termios_p: POINTER): INTEGER 

		-- function tcgetattr (in `/usr/include/termios.h')
               -- tcgetattr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcgetattr"
               }"
               end

	tcgetsid (a_fd: INTEGER): INTEGER 

		-- function tcgetsid (in `/usr/include/termios.h')
               -- tcgetsid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcgetsid"
               }"
               end

	tcsendbreak (a_fd: INTEGER; a_duration: INTEGER): INTEGER 

		-- function tcsendbreak (in `/usr/include/termios.h')
               -- tcsendbreak
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcsendbreak"
               }"
               end

	tcsetattr (a_fd: INTEGER; an_optional_actions: INTEGER; a_termios_p: POINTER): INTEGER 

		-- function tcsetattr (in `/usr/include/termios.h')
               -- tcsetattr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "tcsetattr"
               }"
               end


end -- class TERMIOS_EXTERNALS
