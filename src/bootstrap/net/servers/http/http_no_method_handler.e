class HTTP_NO_METHOD_HANDLER
	--
	-- Default method handler when no handler is returned by the factory.
	-- Just answers 501 (Not Implemented).
	--

inherit
	HTTP_METHOD_HANDLER

create {HTTP_CONNECTION}
	make

feature {HTTP_CONNECTION}
	prepare_ok: BOOLEAN is True

	method: STRING is "UNKNOWN"

	add_header (header: STRING) is
		do
			-- forget it
		end

	add_body (body: STRING) is
		do
			-- forget it
		end

	make (a_uri, a_version: STRING) is
		do
			uri := a_uri
			version := a_version
			if response_header = Void then
				create response_header.with_capacity(2)
				response_body := once ""
			end
		end

	prepare_answer is
		do
			code := 501
		end

	expect (events: EVENTS_SET) is
		local
			t: TIME_EVENTS
		do
			events.expect(t.timeout(0))
		end

	is_ready (events: EVENTS_SET): BOOLEAN is
		do
			Result := True
		end

end -- class HTTP_NO_METHOD_HANDLER
