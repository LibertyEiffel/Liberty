-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class LOG_CONFIGURATION
--
-- To configure the logging framework.
--

feature {ANY}
	load (a_stream: INPUT_STREAM) is
		require
			a_stream.is_connected
		do
			internal.load(a_stream)
		end

feature {LOGGING}
	logger (a_tag: FIXED_STRING) is
		require
			a_tag /= Void
		do
			Result := internal.logger(a_tag)
		ensure
			Result /= Void
		end

feature {LOGGER}
	internal: LOG_INTERNAL_CONF is
		once
			create Result.make
		end

end
