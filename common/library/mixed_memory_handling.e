indexing
	description: "[
					  Wrapper for a generic C structure, that is shared with external
					  code, handle will not be freed on dispose of the
					  Eiffel wrapper object, if is_shared is true
				  ]"
	copyright: "(C) 2006"
	author: "Raphael Mack <mail@raphael-mack.de>, Paolo Redaelli <paolo.redaelli@poste.it>"

deferred class MIXED_MEMORY_HANDLING
	-- Wrapper for a generic C structure, whose memory can either by
	-- handled by the Eiffel library or by the underlying C code. Who
	-- handles memory is decided on a per-object based on the value of
	-- the flag `is_shared': handle will not be freed on dispose of the
	-- Eiffel wrapper object, when `is_shared' is true.

insert
	WRAPPER
      undefine
         from_external_pointer
      end
   
feature {}
	dispose is
			-- Action to be executed just before garbage collection
			-- reclaims an object; if not shared frees the memory pointed
			-- by `handle'
		do
			if is_not_null then
				if is_shared then
					debug 
						print("Disposing a shared " + generating_type + "; handle not freed%N")
					end
				else
					debug 
						print("Disposing an unshared " + generating_type + " and freeing its handle.%N")
					end
					free (handle)
				end
				handle := default_pointer
			end
		end
   
feature {ANY}
	is_shared: BOOLEAN
			-- Does anybody else (Eiffel or non-Eiffel) have a reference 
			-- to `handle'? If False, then the C-object will be 
			-- destroyed when the the Eiffel object will be collected 
			-- (via destroy object). If True the C-object will not be destroyed.

	set_shared is
		do
			is_shared := True
		end

	unset_shared, set_unshared is
		do
			is_shared := False
		end

end
