deferred class EIFFEL_OWNED
	-- A wrapper for a C object whose memory is handled by the Eiffel library

inherit
   WRAPPER
      undefine
         from_external_pointer
      end

feature
	dispose is
		do
			debug 
				print("Disposing an Eiffel owned " + generating_type + " and freeing handle.%N")
			end
			free (handle) -- Note: free(NULL) is a NOP and has no side-effects
			handle := default_pointer -- make sure the C object is not used anymore
		end
end
