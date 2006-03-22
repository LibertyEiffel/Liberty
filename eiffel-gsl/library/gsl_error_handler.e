indexing
	description: "activation and desactivation of the default error handling"
	copyright: "(C) 2005 Jose Bollo <jose.bollo@laposte.net>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class GSL_ERROR_HANDLER
	-- management of the error behaviour
feature
	is_off: BOOLEAN is
			-- is the GSL default error handler off?
		do
			Result := is_off_buffer.item
		end
	
	is_on: BOOLEAN is
			-- is the GSL default error handler on?
		do
			Result := not is_off
		end

	set_off is
			-- disable the GSL default error handler.
		do
			if is_on then
				gsl_set_error_handler_off
				is_off_buffer.set_item(True)
			end
		ensure
			is_off
		end

	set_on is
			-- enable the GSL default error handler.
		do
			if is_off then
				gsl_set_error_handler_on
				is_off_buffer.set_item(False)
			end
		ensure
			is_on
		end

feature {}
	is_off_buffer: REFERENCE[BOOLEAN] is
			-- record the state of the error handler
		once
			create Result.set_item(False)
		end

	gsl_set_error_handler_off is
			-- disable the GSL default error handler.
		external "C inline use <gsl/gsl_errno.h>"
		alias "gsl_set_error_handler_off()"
		end

	gsl_set_error_handler_on is
			-- enable the GSL default error handler.
		external "C inline use <gsl/gsl_errno.h>"
		alias "gsl_set_error_handler(NULL)"
		end

end
	
