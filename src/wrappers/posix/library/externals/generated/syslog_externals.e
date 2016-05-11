-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SYSLOG_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	closelog 

		-- function closelog (in `/usr/include/x86_64-linux-gnu/sys/syslog.h')
               -- closelog
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "closelog"
               }"
               end

	openlog (an_ident: POINTER; an_option: INTEGER; a_facility: INTEGER) 

		-- function openlog (in `/usr/include/x86_64-linux-gnu/sys/syslog.h')
               -- openlog
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "openlog"
               }"
               end

	setlogmask (a_mask: INTEGER): INTEGER 

		-- function setlogmask (in `/usr/include/x86_64-linux-gnu/sys/syslog.h')
               -- setlogmask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setlogmask"
               }"
               end

	syslog (a_pri: INTEGER; a_fmt: POINTER) 

		-- function syslog (in `/usr/include/x86_64-linux-gnu/sys/syslog.h')
               -- syslog (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "syslog"
               }"
               end

	vsyslog (a_pri: INTEGER; a_fmt: POINTER; an_ap: POINTER) 

		-- function vsyslog (in `/usr/include/x86_64-linux-gnu/sys/syslog.h')
               -- vsyslog
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "vsyslog"
               }"
               end


end -- class SYSLOG_EXTERNALS
