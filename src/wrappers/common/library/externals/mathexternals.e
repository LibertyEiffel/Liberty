-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class MATHEXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	matherr (an_exc: POINTER): INTEGER_32 is
 		-- matherr (node at line 2800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "matherr"
		}"
		end


end -- class MATHEXTERNALS
