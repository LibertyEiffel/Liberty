-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GPRIMES_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_spaced_primes_closest (a_num: NATURAL_32): NATURAL_32 is
 		-- g_spaced_primes_closest
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spaced_primes_closest"
		}"
		end

end
