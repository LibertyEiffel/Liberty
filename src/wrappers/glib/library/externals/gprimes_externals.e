-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPRIMES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_spaced_primes_closest (a_num: NATURAL): NATURAL 
               -- g_spaced_primes_closest
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_spaced_primes_closest"
               }"
               end


end -- class GPRIMES_EXTERNALS
