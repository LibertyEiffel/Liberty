-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class SYSMACROS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gnu_dev_minor (a_dev: NATURAL_64): NATURAL_32 is
 		-- gnu_dev_minor (node at line 864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gnu_dev_minor"
		}"
		end

	gnu_dev_major (a_dev: NATURAL_64): NATURAL_32 is
 		-- gnu_dev_major (node at line 1036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gnu_dev_major"
		}"
		end

	gnu_dev_makedev (a_major: NATURAL_32; a_minor: NATURAL_32): NATURAL_64 is
 		-- gnu_dev_makedev (node at line 2685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gnu_dev_makedev"
		}"
		end


end -- class SYSMACROS_EXTERNALS
