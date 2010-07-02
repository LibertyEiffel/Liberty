-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class LOGGING
	--
	-- This class is meant to be inserted.
	--

feature {}
	log: LOGGER is
			-- There is one logger per concrete type.
		local
			conf: LOG_CONFIGURATION
		do
			Result := conf.logger(generating_type.intern)
		ensure
			Result /= Void
		end

end -- class LOGGING
