deferred class SHARED_EIFFEL_KEY
feature
	eiffel_key: G_QUARK is
		once
			create Result.from_string (eiffel_key_label)
		end
	
feature {NONE} -- Implementation
	eiffel_key_label: STRING is
			-- The key used to store a pointer to Current into the
			-- underlying gobject.
		"eiffel-wrapper"
end
