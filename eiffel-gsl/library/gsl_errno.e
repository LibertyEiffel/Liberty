indexing
	description: "handling of the GSL returned error code"
	copyright: "(C) 2005 Jose Bollo <jose.bollo@laposte.net>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class GSL_ERRNO
	-- wrapper for returned error codes, see also the known error codes GSL_ERROR_CODES
insert
	GSL_ERROR_CODES
	EXCEPTIONS export {} all end
feature
	code: INTEGER
		-- error code

	clear is
			-- clear any error and reset to success
		do
			code := success
		ensure
			is_success
		end

	set_code(new_code: like code) is
			-- Set 'code' to 'new_code'
		do
			code := new_code
		ensure
			code = new_code
		end

	add_code(added_code: like code) is
			-- If is_success then set 'code' to 'added' code 
			-- otherwise do nothing
		do
			if is_success then
				set_code(added_code)
			end
		ensure
			(old is_success) implies (code = added_code)
			(not old is_success) implies (code = old code)
		end

	is_success: BOOLEAN is
			-- Is a code of success?
		do
			Result := code = success
		ensure
			Result = (code = success)
		end
	
	is_error: BOOLEAN is
			-- Is a code of error?
		do
			Result := code /= success
		ensure
			Result = (code /= success)
		end
	
	explanation: STRING is
			-- A string explaining the error
		do
			create Result.from_external_copy(gsl_strerror(code))
		end

	crash_if_error is
			-- Crash if there is an error
		do
			if is_error then
				crash
			end
		ensure
			is_success
		end

	raise_if_error is
			-- Raise an exception if there is an error
		do
			if is_error then
				raise(explanation)
			end
		ensure
			is_success
		end

feature {}

	gsl_strerror(errno: INTEGER): POINTER is
			-- The external string pointer corresponding to the code 'errno'
		external "C use <gsl/gsl_errno.h>"
		end

end

