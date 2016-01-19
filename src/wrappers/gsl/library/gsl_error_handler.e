indexing
	description: "activation and desactivation of the default error handling"
	copyright: "(C) 2005 Jose Bollo <jose.bollo@laposte.net>%
              %    2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

expanded class GSL_ERROR_HANDLER
	-- management of the error behaviour
feature {ANY}
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

   ieee_explanation: STRING is
      do
         create Result.make(16)
         if has_ieee_overflow then
            Result.append(once "IEEE overflow")
         end
         if has_ieee_underflow then
            if Result.count > 0 then Result.append(once ", ") end
            Result.append(once "IEEE underflow")
         end
         if has_ieee_div_by_zero then
            if Result.count > 0 then Result.append(once ", ") end
            Result.append(once "IEEE division by zero")
         end
      end
   
feature {ANY} -- directly usable externals
   has_ieee_exception: BOOLEAN is
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "has_ieee_exception()"
         }"
		end

   has_ieee_overflow: BOOLEAN is
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "has_ieee_overflow()"
         }"
      ensure
         res: Result implies has_ieee_exception
		end

   has_ieee_underflow: BOOLEAN is
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "has_ieee_underflow()"
         }"
      ensure
         res: Result implies has_ieee_exception
		end
   
   has_ieee_div_by_zero: BOOLEAN is
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "has_ieee_div_by_zero()"
         }"
      ensure
         res: Result implies has_ieee_exception
      end
   
   reset_ieee_exceptions is
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "reset_ieee_exceptions()"
         }"
      ensure
         reset_done: not has_ieee_exception
		end   
   
feature {}
	is_off_buffer: REFERENCE[BOOLEAN] is
			-- record the state of the error handler
		once
			create Result.set_item(False)
		end

feature {} -- externals
   -- TODO: remove
   gsl_init is
      obsolete "Do not use this..."
      external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_init()"
         }"
      end

	gsl_set_error_handler_off is
			-- disable the GSL default error handler.
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_set_error_handler_off()"
         }"
		end

	gsl_set_error_handler_on is
			-- enable the GSL default error handler.
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "gsl_set_default_err_handler()"
         }"
		end

end
	
