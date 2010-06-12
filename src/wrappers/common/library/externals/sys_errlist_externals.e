-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class SYS_ERRLIST_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

feature {} -- Variables
	sys_errlist: POINTER is
 		-- sys_errlist (node at line 28)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sys_errlist"
		}"
		end

	-- `hidden' variable _sys_nerr skipped.
	-- `hidden' variable _sys_errlist skipped.
	sys_nerr: INTEGER_32 is
 		-- sys_nerr (node at line 27)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sys_nerr"
		}"
		end


end -- class SYS_ERRLIST_EXTERNALS
