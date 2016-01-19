indexing
	description: "handling of the GSL returned error code"
	copyright: "(C) 2005 Jose Bollo <jose.bollo@laposte.net>%
              %    2006 Raphael Mack<mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date$"
	revision "$Revision$"

deferred class GSL_ERRNO
	-- wrapper for returned error codes, see also the known error codes GSL_ERROR_CODES
insert
	GSL_ERROR_CODES
	EXCEPTIONS export {} all end

feature {ANY}
	err_code: INTEGER_32
		-- error code

	err_clear is
			-- clear any error and reset to success
		do
			err_code := Success
		ensure
			cleared: not has_error
		end

	has_error: BOOLEAN is
			-- Is err_code a code of error?
		do
			Result := err_code /= Success
		ensure
			Result = (err_code /= Success)
		end
	
	err_explanation: STRING is
			-- A string explaining the error
		do
			create Result.from_external_copy(gsl_strerror(err_code))
		end

   raise_on_error: BOOLEAN

   set_raise_on_error is
      do
         raise_on_error := True
      ensure
         set: raise_on_error
      end
   
   unset_raise_on_error is
      do
         raise_on_error := False
      ensure
         set: not raise_on_error
      end

   
feature {} -- internal error handling
   handle_code(added_code: INTEGER_32) is
			-- If not has_error then set 'code' to 'added_code' and raise 
			-- an exception if raise_on_error is set
			-- otherwise do nothing
         -- call this with the result of every external call to gsl functions
		do
			if not has_error then
				err_code := added_code
            if has_error and then raise_on_error then
               raise(err_explanation)
            end
			end
		ensure
			(not old has_error) implies (err_code = added_code)
			(old has_error) implies (err_code = old err_code)
		end
   
feature {}
	gsl_strerror(errno: INTEGER_32): POINTER is
			-- The external string pointer corresponding to the code 
			-- 'errno'
		external "plug_in"
      alias "{
         location: "externals"
         module_name: "plugin"
         feature_name: "(char*)gsl_strerror"
         }"         
		end

end

