-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class LOG_LEVELS
--
-- The logging levels
--

feature {ANY}
	trace: LOG_LEVEL is
		once
			create Result.make(2, "TRACE")
		end

	info: LOG_LEVEL is
		once
			create Result.make(1, "INFO ")
		end

	warning: LOG_LEVEL is
		once
			create Result.make(0, "WARN ")
		end

	error: LOG_LEVEL is
		once
			create Result.make(-1, "ERROR")
		end

end -- class LOG_LEVELS
