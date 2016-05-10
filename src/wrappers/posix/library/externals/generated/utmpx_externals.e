-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class UTMPX_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	endutxent 

		-- function endutxent (in `/usr/include/utmpx.h')
               -- endutxent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endutxent()"
               }"
               end

	getutmp (an_utmpx: POINTER; an_utmp: POINTER) 

		-- function getutmp (in `/usr/include/utmpx.h')
               -- getutmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getutmp"
               }"
               end

	getutmpx (an_utmp: POINTER; an_utmpx: POINTER) 

		-- function getutmpx (in `/usr/include/utmpx.h')
               -- getutmpx
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getutmpx"
               }"
               end

	getutxent: POINTER 

		-- function getutxent (in `/usr/include/utmpx.h')
               -- getutxent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getutxent()"
               }"
               end

	getutxid (an_id: POINTER): POINTER 

		-- function getutxid (in `/usr/include/utmpx.h')
               -- getutxid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getutxid"
               }"
               end

	getutxline (a_line: POINTER): POINTER 

		-- function getutxline (in `/usr/include/utmpx.h')
               -- getutxline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getutxline"
               }"
               end

	pututxline (an_utmpx: POINTER): POINTER 

		-- function pututxline (in `/usr/include/utmpx.h')
               -- pututxline
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "pututxline"
               }"
               end

	setutxent 

		-- function setutxent (in `/usr/include/utmpx.h')
               -- setutxent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setutxent()"
               }"
               end

	updwtmpx (a_wtmpx_file: POINTER; an_utmpx: POINTER) 

		-- function updwtmpx (in `/usr/include/utmpx.h')
               -- updwtmpx
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "updwtmpx"
               }"
               end

	utmpxname (a_file: POINTER): INTEGER 

		-- function utmpxname (in `/usr/include/utmpx.h')
               -- utmpxname
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "utmpxname"
               }"
               end


end -- class UTMPX_EXTERNALS
