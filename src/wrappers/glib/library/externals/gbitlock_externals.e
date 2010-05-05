-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBITLOCK_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_bit_lock (an_address: POINTER; a_lock_bit: INTEGER_32) is
 		-- g_bit_lock (node at line 213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_lock"
		}"
		end

	g_bit_trylock (an_address: POINTER; a_lock_bit: INTEGER_32): INTEGER_32 is
 		-- g_bit_trylock (node at line 3870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_trylock"
		}"
		end

	g_bit_unlock (an_address: POINTER; a_lock_bit: INTEGER_32) is
 		-- g_bit_unlock (node at line 5139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_bit_unlock"
		}"
		end


end -- class GBITLOCK_EXTERNALS
