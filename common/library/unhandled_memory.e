indexing
	description: "[
					  Wrapper for a generic C structure, whose memory is always
					  handled by the underlying C code.
					  ]"
	copyright: "(C) 2008 Paolo Redaelli"
	license: "LGPL v2 or later"

deferred class UNHANDLED_MEMORY
	-- Wrapper for a generic C structure, whose memory is always
	-- handled by the underlying C code.

inherit C_STRUCT undefine allocate, copy, is_equal end

feature
	dispose is
			-- Action to be executed just before garbage collection
			-- reclaims an object
		do
			handle := default_pointer
			-- Everything else is handled by the C library
		end
end
