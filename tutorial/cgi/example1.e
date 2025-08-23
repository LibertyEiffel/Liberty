class EXAMPLE1
-- Self-contained CGI program.
-- Put the binary in your webserver's cgi-bin directory
-- or try it out with the provided lighttpd configuration.

inherit
   CGI_HANDLER

create {ANY}
   make

feature {}
   cgi: CGI

feature {ANY}
   make
      -- run as a CGI program, handle a request
      do
         create cgi.make (Current)
         cgi.run
      end

feature {CGI_REQUEST_METHOD}
   get
      -- handle a GET request
      local
         form: CGI_FORM
         r: CGI_RESPONSE_DOCUMENT
         key, qs: FIXED_STRING
         stream: STRING_INPUT_STREAM
         addressee: ABSTRACT_STRING
      do
         log ("GET")
         create r.set_status (200)

         -- parsing query string
         qs := cgi.query_string.string
         if qs /= Void then
            create stream.from_string (qs)
            create form.parse (stream)
         end

         key := "name".intern
         if form /= Void and then form.form.has (key) then
            addressee := form.form.at (key)
         else
            addressee := "world"
         end
         r.body.put_string ("Hello, " + addressee + "!%N") -- body must end with newline, otherwise exception is thrown later on
         respond_with (r)
      end

   post
      -- handle a POST request
      local
         form: CGI_FORM
         r: CGI_RESPONSE_DOCUMENT
         key: FIXED_STRING
      do
         log ("POST")
         create r.set_status (200)

         -- parsing request body (encoded as form data)
         create form.parse (std_input)
         key := "name".intern
         if form.form.has (key) then
            r.body.put_string ("Hello, " + form.form.at (key) + "!%N")
         end

         respond_with (r)
      end

   head
      -- handle a HEAD request
      local
         r: CGI_RESPONSE_DOCUMENT
      do
         log ("HEAD")
         create r.set_status (200)
         r.set_field ("X-Greeting", "Hi!") -- response HTTP header
         respond_with (r)
      end

   delete
      -- handle a DELETE request
      do
         log ("DELETE")

         -- Deleting not supported!
         respond_with (create {CGI_RESPONSE_DOCUMENT}.set_status (405))
      end

   put
      -- handle a PUT request
      do
         log ("PUT")
         dummy_response
      end

   invoke_method (a_method: FIXED_STRING)
      -- handle a request of any other HTTP method
      do
         std_error.put_string ("HTTP method '" + a_method +
            "' encountered, handling as GET%N")
         get
      end

feature {}
   log (method: ABSTRACT_STRING)
      do
         std_error.put_string (method)
         std_error.put_new_line
      end

   respond_with (r: CGI_RESPONSE)
      do
         if cgi.need_reply then
            cgi.set_output (create {CRLF_OUTPUT_STREAM}.connect_to (cgi.output))
            cgi.reply (r)
            cgi.output.detach
            cgi.output.disconnect
         end
      end

   dummy_response
      do
         respond_with (create {CGI_RESPONSE_DOCUMENT}.set_status (200))
      end

invariant
   cgi /= Void

end
