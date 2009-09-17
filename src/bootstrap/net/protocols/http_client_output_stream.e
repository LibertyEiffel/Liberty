class HTTP_CLIENT_OUTPUT_STREAM
	--
	-- Some ideas and first draft of this class kindly provided by Serge Romanchenko [mailto:se@sir.nensi.net]
	--

inherit
	FILTER_OUTPUT_STREAM

creation {HTTP_PROTOCOL}
	connect_to

feature {HTTP_PROTOCOL}
	put_request (nrl: NETWORK_RESOURCE_LOCATOR) is
		do
			if request_headers = Void then
				create request_headers.make
			else
				request_headers.clear_count
			end
			set_method_get
			set_http_verion_1_1
			set_header(once "Host", nrl.host)
			set_header(once "User-Agent", once "HTTP_CLIENT_OUTPUT_STREAM")
			set_header(once "Connection", once "close")
			set_header(once "Accept", once "text/*")
			filtered_put_string(method)
			filtered_put_character(' ')
			filtered_put_string(nrl.path)
			if nrl.arguments /= Void then
				filtered_put_character('?')
				filtered_put_string(nrl.arguments)
			end
			filtered_put_character(' ')
			filtered_put_string(http_version)
			filtered_put_string(new_line)
			request_headers.do_all(agent add_header(?, ?))
			filtered_put_string(new_line)
			flush
		end

feature {}
	set_header (name, value: STRING) is
		do
			request_headers.add(value, name)
		end

	set_method_get is
		do
			method := once "GET"
		end

	set_method_post is
		do
			method := once "POST"
		end

	set_http_verion_1_1 is
		do
			http_version := once "HTTP/1.1"
		end

	set_http_verion_1_0 is
		do
			http_version := once "HTTP/1.0"
		end

	add_header (value, key: STRING) is
		do
			filtered_put_string(key)
			filtered_put_string(": ")
			filtered_put_string(value)
			filtered_put_string(new_line)
		end

	filtered_put_string (s: STRING) is
		local
			i: INTEGER
		do
			from
				i := s.lower
			until
				i > s.upper
			loop
				stream.filtered_put_character(s @ i)
				i := i + 1
			end
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			stream.filtered_put_character(c)
		end

	filtered_flush is
		do
			stream.filtered_flush
		end

feature {}
	local_can_disconnect: BOOLEAN is True

	request_headers: HASHED_DICTIONARY[STRING, STRING]

	new_line: STRING is "%R%N"

	method: STRING

	http_version: STRING

end -- class HTTP_CLIENT_OUTPUT_STREAM
