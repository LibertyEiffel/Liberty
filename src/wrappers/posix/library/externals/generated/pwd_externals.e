-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class PWD_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	endpwent 

		-- function endpwent (in `/usr/include/pwd.h')
               -- endpwent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endpwent"
               }"
               end

	fgetpwent (a_stream: POINTER): POINTER 

		-- function fgetpwent (in `/usr/include/pwd.h')
               -- fgetpwent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetpwent"
               }"
               end

	fgetpwent_r (a_stream: POINTER; a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function fgetpwent_r (in `/usr/include/pwd.h')
               -- fgetpwent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetpwent_r"
               }"
               end

	getpw (an_uid: NATURAL; a_buffer: POINTER): INTEGER 

		-- function getpw (in `/usr/include/pwd.h')
               -- getpw
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpw"
               }"
               end

	getpwent: POINTER 

		-- function getpwent (in `/usr/include/pwd.h')
               -- getpwent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpwent"
               }"
               end

	getpwent_r (a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getpwent_r (in `/usr/include/pwd.h')
               -- getpwent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpwent_r"
               }"
               end

	getpwnam (a_name: POINTER): POINTER 

		-- function getpwnam (in `/usr/include/pwd.h')
               -- getpwnam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpwnam"
               }"
               end

	getpwnam_r (a_name: POINTER; a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getpwnam_r (in `/usr/include/pwd.h')
               -- getpwnam_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpwnam_r"
               }"
               end

	getpwuid (an_uid: NATURAL): POINTER 

		-- function getpwuid (in `/usr/include/pwd.h')
               -- getpwuid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpwuid"
               }"
               end

	getpwuid_r (an_uid: NATURAL; a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getpwuid_r (in `/usr/include/pwd.h')
               -- getpwuid_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getpwuid_r"
               }"
               end

	putpwent (a_p: POINTER; a_f: POINTER): INTEGER 

		-- function putpwent (in `/usr/include/pwd.h')
               -- putpwent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putpwent"
               }"
               end

	setpwent 

		-- function setpwent (in `/usr/include/pwd.h')
               -- setpwent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setpwent"
               }"
               end


end -- class PWD_EXTERNALS
