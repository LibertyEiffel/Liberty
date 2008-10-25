deferred class C_OWNED 
	-- A wrapper for a C object whose memory is handled by the underlying C library

inherit DISPOSABLE undefine copy, is_equal end

feature
	dispose is
		do
			debug 
				print("Disposing a "+generating_type+"; since it is a SHARED object the underlying memory is handled by the C library and not freed%N")
			end
		end
end
