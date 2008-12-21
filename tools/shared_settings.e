deferred class SHARED_SETTINGS
	-- Insert this class to access the `settings' singleton.
	-- It also provide commodity "proxy" setters, queries and logging facilities


feature {ANY}
	settings: SETTINGS is
			-- The singleton to access all the shared settings
		once
			create Result
		end -- Syntactic sugar

	verbose: BOOLEAN is
		do
			Result := settings.verbose
		end

	global: BOOLEAN is
		do
			Result := settings.global
		end

	directory: STRING is
		do
			Result := settings.directory
		end

	use_naturals is
		do
			settings.use_naturals
		end

	use_integers is
		do
			settings.use_integers
		end

	are_naturals_used: BOOLEAN is
		do
			Result := settings.are_naturals_used
		end

feature {} -- Logging
	logger: STRING_PRINTER is
		-- The formatter used to log messages
	once
		create Result.make(std_error)
	end

	log_string (a_string: STRING) is
			-- If verbose print `a_string' to logger's output
		do
			if verbose then
				std_error.put_string(a_string)
			end
		end

	log (a_message: TRAVERSABLE[CHARACTER]; some_arguments: TRAVERSABLE[ANY]) is
			-- Utility feature to replace "if verbose then logger.put_message(foo,bar) end" with "log(foo,bar)"
		require
			a_message /= Void
			some_arguments /= Void
		do
			if verbose then
				logger.put_message(a_message, some_arguments)
			end
		end


end -- class SHARED_SETTINGS
