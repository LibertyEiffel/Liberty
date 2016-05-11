-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GRP_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	endgrent 

		-- function endgrent (in `/usr/include/grp.h')
               -- endgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "endgrent"
               }"
               end

	fgetgrent (a_stream: POINTER): POINTER 

		-- function fgetgrent (in `/usr/include/grp.h')
               -- fgetgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetgrent"
               }"
               end

	fgetgrent_r (a_stream: POINTER; a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function fgetgrent_r (in `/usr/include/grp.h')
               -- fgetgrent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "fgetgrent_r"
               }"
               end

	getgrent: POINTER 

		-- function getgrent (in `/usr/include/grp.h')
               -- getgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrent"
               }"
               end

	getgrent_r (a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getgrent_r (in `/usr/include/grp.h')
               -- getgrent_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrent_r"
               }"
               end

	getgrgid (a_gid: NATURAL): POINTER 

		-- function getgrgid (in `/usr/include/grp.h')
               -- getgrgid
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrgid"
               }"
               end

	getgrgid_r (a_gid: NATURAL; a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getgrgid_r (in `/usr/include/grp.h')
               -- getgrgid_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrgid_r"
               }"
               end

	getgrnam (a_name: POINTER): POINTER 

		-- function getgrnam (in `/usr/include/grp.h')
               -- getgrnam
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrnam"
               }"
               end

	getgrnam_r (a_name: POINTER; a_resultbuf: POINTER; a_buffer: POINTER; a_buflen: like size_t; a_result: POINTER): INTEGER 

		-- function getgrnam_r (in `/usr/include/grp.h')
               -- getgrnam_r
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrnam_r"
               }"
               end

	getgrouplist (an_user: POINTER; a_group: NATURAL; a_groups: POINTER; a_ngroups: POINTER): INTEGER 

		-- function getgrouplist (in `/usr/include/grp.h')
               -- getgrouplist
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "getgrouplist"
               }"
               end

	initgroups (an_user: POINTER; a_group: NATURAL): INTEGER 

		-- function initgroups (in `/usr/include/grp.h')
               -- initgroups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "initgroups"
               }"
               end

	putgrent (a_p: POINTER; a_f: POINTER): INTEGER 

		-- function putgrent (in `/usr/include/grp.h')
               -- putgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "putgrent"
               }"
               end

	setgrent 

		-- function setgrent (in `/usr/include/grp.h')
               -- setgrent
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setgrent"
               }"
               end

	setgroups (a_n: like size_t; a_groups: POINTER): INTEGER 

		-- function setgroups (in `/usr/include/grp.h')
               -- setgroups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "setgroups"
               }"
               end


end -- class GRP_EXTERNALS
