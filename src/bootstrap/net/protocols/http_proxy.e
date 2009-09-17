expanded class HTTP_PROXY
	--
	-- Allows to set an HTTP proxy.
	--

feature {ANY}
	set_url (a_url: like url) is
		do
			url_memory.set_item(a_url)
		ensure
			url = a_url
		end

	url: URL is
			-- Void if direct connection
		do
			Result := url_memory.item
		end

feature {}
	url_memory: REFERENCE[URL] is
		once
			create Result
		end

end -- class HTTP_PROXY
