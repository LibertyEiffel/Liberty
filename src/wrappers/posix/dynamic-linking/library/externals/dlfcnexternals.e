-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class DLFCNEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	dladdr (an_address: POINTER; an_info: POINTER): INTEGER_32
 		-- dladdr (node at line 14)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dladdr"
		}"
		end

	dlopen (a_file: POINTER; a_mode: INTEGER_32): POINTER
 		-- dlopen (node at line 64)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlopen"
		}"
		end

	dladdr1 (an_address: POINTER; an_info: POINTER; an_extra_info: POINTER; a_flags: INTEGER_32): INTEGER_32
 		-- dladdr1 (node at line 104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dladdr1"
		}"
		end

	dlinfo (a_handle: POINTER; a_request: INTEGER_32; an_arg: POINTER): INTEGER_32
 		-- dlinfo (node at line 256)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlinfo"
		}"
		end

	dlmopen (a_nsid: INTEGER_32; a_file: POINTER; a_mode: INTEGER_32): POINTER
 		-- dlmopen (node at line 262)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlmopen"
		}"
		end

	dlvsym (a_handle: POINTER; a_name: POINTER; a_version: POINTER): POINTER
 		-- dlvsym (node at line 288)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlvsym"
		}"
		end

	dlerror: POINTER
 		-- dlerror (node at line 365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlerror()"
		}"
		end

	dlsym (a_handle: POINTER; a_name: POINTER): POINTER
 		-- dlsym (node at line 375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlsym"
		}"
		end

	dlclose (a_handle: POINTER): INTEGER_32
 		-- dlclose (node at line 410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "dlclose"
		}"
		end


end -- class DLFCNEXTERNALS
