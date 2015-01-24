class TEST_ECURL_SIMPLE
-- http://curl.haxx.se/libcurl/c/simple.html

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         create handle.make
         assert(handle /= Void)
         assert(handle.is_useable)
         assert(not handle.in_use)
         assert(handle.input /= Void)
         assert(handle.in_use) -- because of the previous test, `input' is now used
         handle.input.set_url_string(once "http://www.gnu.org/software/liberty-eiffel/")
         handle.input.set_follow_location(True)
         handle.input.perform(agent on_error(?))
         if not handle.input.end_of_input then
            from
               handle.input.read_line
            until
               handle.input.end_of_input
            loop
               std_output.put_line(handle.input.last_string)
               handle.input.read_line
            end
         end
         handle.cleanup
      end

   on_error (error_code: INTEGER)
      local
         codes: ECURL_ERRORS
      do
         assert(codes.valid_error(error_code))
         std_error.put_line(codes.error_string(error_code))
      end

   handle: ECURL_EASY_HANDLE

end
