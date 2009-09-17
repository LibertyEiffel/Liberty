expanded class URL_VALIDITY

feature {ANY}
	valid_url (a_url: STRING): BOOLEAN is
		-- True if the STRING represents a real URL (i.e. with a known protocol and a valid URI for that
		-- protocol)
		local
			i: INTEGER; protocol_name, protocol_uri: STRING
			p: PROTOCOL; protocols: PROTOCOLS
		do
			i := a_url.first_index_of(':')
			if a_url.valid_index(i) and then a_url.count > i then
				protocol_name := once ""
				protocol_name.copy_substring(a_url, 1, i-1)
				if protocols.known_protocol(protocol_name) then
					p := protocols.protocol(protocol_name)
					protocol_uri := once ""
					protocol_uri.copy_substring(a_url, i+1, a_url.upper)
					Result := p.valid_uri(protocol_uri)
					protocols.recycle(p)
				end
			end
		end

end -- class URL_VALIDITY
