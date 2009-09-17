class HTTP_PROTOCOL
	--
	-- To access to "http://..." URLs
	--

inherit
	TCP_PROTOCOL
		redefine
			connect_to
		end

creation {PROTOCOLS}
	make

feature {ANY}
	name: STRING

	is_connected: BOOLEAN is
		do
			Result := sockinout /= Void and then sockinout.is_connected
		end

feature {URL}
	standard_port: INTEGER

	input: INPUT_STREAM

	output: OUTPUT_STREAM

	disconnect is
		do
			sockinout.detach
			sockinout.disconnect
		end

	connect_to (url: URL; read, write: BOOLEAN) is
		local
			proxy: HTTP_PROXY
		do
			if proxy_url /= Void then
				Precursor(proxy_url, read, write)
			elseif proxy.url = Void then
				Precursor(url, read, write)
			else
				proxy_url := proxy.url
				Precursor(proxy_url, read, write)
			end
		end

feature {}
	make (a_name: like name; a_standard_port: like standard_port) is
		do
			name := a_name
			standard_port := a_standard_port
		end

	sockinout: SOCKET_INPUT_OUTPUT_STREAM

	proxy_url: URL

	tcp_connect_to (ios: SOCKET_INPUT_OUTPUT_STREAM; url: URL; read, write: BOOLEAN) is
		local
			nrl: NETWORK_RESOURCE_LOCATOR
			hin: HTTP_CLIENT_INPUT_STREAM; hout: HTTP_CLIENT_OUTPUT_STREAM
		do
			if hin = Void then
				create hin.connect_to(ios)
				create hout.connect_to(ios)
			else
				hin.connect_to(ios)
				hout.connect_to(ios)
			end
			if read then
				input := hin
			end
			if write then
				output := hout
			end
			sockinout := ios
			if proxy_url /= Void then
				-- we are talking to a proxy
				not_yet_implemented
			else
				-- direct connection to Internet: just issue the simple request
				nrl ::= url.uri
				hout.put_request(nrl)
			end
			hin.start
			inspect hin.return_code
			when "200" then
				-- hurray!
			when "305" then
				-- use proxy with the given location
				if proxy_url /= Void then
					-- strange!!
				else
					create proxy_url.absolute(hin.header.at(once "location"))
					connect_to(url, read, write)
				end
			end
		end

end -- class HTTP_PROTOCOL
