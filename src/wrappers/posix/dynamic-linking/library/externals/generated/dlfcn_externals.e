-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class DLFCN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	-- `hidden' function __builtin_memcpy skipped.
	dladdr (an_address: POINTER; an_info: POINTER): INTEGER 

		-- function dladdr (in `/usr/include/dlfcn.h')
               -- dladdr
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dladdr"
               }"
               end

	dladdr1 (an_address: POINTER; an_info: POINTER; an_extra_info: POINTER; a_flags: INTEGER): INTEGER 

		-- function dladdr1 (in `/usr/include/dlfcn.h')
               -- dladdr1
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dladdr1"
               }"
               end

	dlclose (a_handle: POINTER): INTEGER 

		-- function dlclose (in `/usr/include/dlfcn.h')
               -- dlclose
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlclose"
               }"
               end

	dlerror: POINTER 

		-- function dlerror (in `/usr/include/dlfcn.h')
               -- dlerror
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlerror"
               }"
               end

	dlinfo (a_handle: POINTER; a_request: INTEGER; an_arg: POINTER): INTEGER 

		-- function dlinfo (in `/usr/include/dlfcn.h')
               -- dlinfo
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlinfo"
               }"
               end

	dlmopen (a_nsid: like long; a_file: POINTER; a_mode: INTEGER): POINTER 

		-- function dlmopen (in `/usr/include/dlfcn.h')
               -- dlmopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlmopen"
               }"
               end

	dlopen (a_file: POINTER; a_mode: INTEGER): POINTER 

		-- function dlopen (in `/usr/include/dlfcn.h')
               -- dlopen
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlopen"
               }"
               end

	dlsym (a_handle: POINTER; a_name: POINTER): POINTER 

		-- function dlsym (in `/usr/include/dlfcn.h')
               -- dlsym
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlsym"
               }"
               end

	dlvsym (a_handle: POINTER; a_name: POINTER; a_version: POINTER): POINTER 

		-- function dlvsym (in `/usr/include/dlfcn.h')
               -- dlvsym
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "dlvsym"
               }"
               end


end -- class DLFCN_EXTERNALS
