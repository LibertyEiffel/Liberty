-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GBITLOCK_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_bit_lock (an_address: POINTER; a_lock_bit: INTEGER) 
               -- g_bit_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bit_lock"
               }"
               end

	g_bit_trylock (an_address: POINTER; a_lock_bit: INTEGER): INTEGER 
               -- g_bit_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bit_trylock"
               }"
               end

	g_bit_unlock (an_address: POINTER; a_lock_bit: INTEGER) 
               -- g_bit_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_bit_unlock"
               }"
               end

	g_pointer_bit_lock (an_address: POINTER; a_lock_bit: INTEGER) 
               -- g_pointer_bit_lock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pointer_bit_lock"
               }"
               end

	g_pointer_bit_trylock (an_address: POINTER; a_lock_bit: INTEGER): INTEGER 
               -- g_pointer_bit_trylock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pointer_bit_trylock"
               }"
               end

	g_pointer_bit_unlock (an_address: POINTER; a_lock_bit: INTEGER) 
               -- g_pointer_bit_unlock
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pointer_bit_unlock"
               }"
               end


end -- class GBITLOCK_EXTERNALS
