class TEST_ECURL_SIMPLE
-- http://curl.haxx.se/libcurl/c/simple.html

insert
   EIFFELTEST_TOOLS
   ECURL_HANDLER

create {}
   make

feature {}
   make
      local
         expected: TEXT_FILE_READ
      do
         create handle.make
         assert(handle /= Void)
         assert(handle.is_useable)
         assert(not handle.in_use)
         assert(handle.input /= Void)
         assert(handle.in_use) -- because of the previous test, `input' is now used
         handle.input.set_url_string(once "file://test_ecurl_simple.e")
         handle.input.set_follow_location(True)
         handle.input.on_error := agent on_error(?)
         handle.input.perform
         assert(not handle.input.end_of_input)
         create expected.connect_to("test_ecurl_simple.e")
         assert(expected.is_connected)
         from
            handle.input.read_line
            expected.read_line
         until
            handle.input.end_of_input
         loop
            assert(not expected.end_of_input)
            assert(handle.input.last_string.is_equal(expected.last_string))
            handle.input.read_line
            expected.read_line
         end
         assert(expected.end_of_input)
         handle.cleanup
         expected.disconnect
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
