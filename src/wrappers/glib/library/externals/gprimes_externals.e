-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPRIMES_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_spaced_primes_closest (a_num: NATURAL_32): NATURAL_32 is
 		-- g_spaced_primes_closest (node at line 6437)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_spaced_primes_closest"
		}"
		end


end -- class GPRIMES_EXTERNALS
