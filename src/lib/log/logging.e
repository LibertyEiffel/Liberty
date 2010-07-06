-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class LOGGING
	--
	-- This class is meant to be inserted.
	--

feature {}
	log: LOGGER is
			-- There is one logger per concrete type; for performance reasons it is cached in each instance.
		local
			conf: LOG_CONFIGURATION
		do
			Result := log_memory
			if Result = Void or else not Result.is_valid then
				Result := conf.logger(generating_type.intern)
				log_memory := Result
			end
		ensure
			Result /= Void
		end

	log_memory: LOGGER
			-- The cached logger. Don't use directly.

end -- class LOGGING
