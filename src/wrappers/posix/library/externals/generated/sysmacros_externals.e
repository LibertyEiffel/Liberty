-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class SYSMACROS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	gnu_dev_major (a_dev: NATURAL_64): NATURAL 

		-- function gnu_dev_major (in `/usr/include/x86_64-linux-gnu/sys/sysmacros.h')
               -- gnu_dev_major
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gnu_dev_major"
               }"
               end

	gnu_dev_makedev (a_major: NATURAL; a_minor: NATURAL): NATURAL_64 

		-- function gnu_dev_makedev (in `/usr/include/x86_64-linux-gnu/sys/sysmacros.h')
               -- gnu_dev_makedev
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gnu_dev_makedev"
               }"
               end

	gnu_dev_minor (a_dev: NATURAL_64): NATURAL 

		-- function gnu_dev_minor (in `/usr/include/x86_64-linux-gnu/sys/sysmacros.h')
               -- gnu_dev_minor
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "gnu_dev_minor"
               }"
               end


end -- class SYSMACROS_EXTERNALS
