-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class ALLOCAEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	alloca (a_size: NATURAL_64): POINTER is
 		-- alloca (node at line 1500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "alloca"
		}"
		end


end -- class ALLOCAEXTERNALS
