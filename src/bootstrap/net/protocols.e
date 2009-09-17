expanded class PROTOCOLS

feature {ANY}
	register_protocol_factory (a_protocol_name: STRING; a_factory: FUNCTION[TUPLE, PROTOCOL]) is
		require
			a_protocol_name.count > 0
			not known_protocol(a_protocol_name)
		do
			factories.add(a_factory, a_protocol_name.twin)
		ensure
			known_protocol(a_protocol_name)
		end

	known_protocol (a_protocol_name: STRING): BOOLEAN is
		require
			a_protocol_name.count > 0
		do
			init
			Result := factories.has(a_protocol_name)
		end

feature {URL_VALIDITY}
	protocol (a_protocol_name: STRING): PROTOCOL is
		require
			a_protocol_name.count > 0
			known_protocol(a_protocol_name)
		local
			u: RECYCLING_POOL[PROTOCOL]
		do
			init
			u := unused_protocols(a_protocol_name)
			if u.is_empty then
				Result := factories.at(a_protocol_name).item([])
			else
				Result := u.item
			end
		ensure
			not Result.is_connected
		end

feature {}
	factories: DICTIONARY[FUNCTION[TUPLE, PROTOCOL], STRING] is
		once
			create {HASHED_DICTIONARY[FUNCTION[TUPLE, PROTOCOL], STRING]} Result.make
		end

	init is
		once
			register_protocol_factory(once "http", agent new_http(once "http", 80))
			register_protocol_factory(once "https", agent new_http(once "https", 443)) -- that's wrong of course (where is the SSL layer?)
			register_protocol_factory(once "file", agent new_file)
		end

	new_http (name: STRING; port: INTEGER): HTTP_PROTOCOL is
		do
			create Result.make(name, port)
		end

	new_file: FILE_PROTOCOL is
		do
			create Result.make
		end

feature {} -- Protocol reuse
	unused: HASHED_DICTIONARY[RECYCLING_POOL[PROTOCOL], STRING] is
		once
			create Result.make
		end

	unused_protocols (a_protocol_name: STRING): RECYCLING_POOL[PROTOCOL] is
		do
			Result := unused.reference_at(a_protocol_name)
			if Result = Void then
				create Result.make
				unused.add(Result, a_protocol_name.twin)
			end
		ensure
			Result /= Void
		end

feature {URL_VALIDITY}
	recycle (a_protocol: PROTOCOL) is
		require
			not a_protocol.is_connected
		do
			unused_protocols(a_protocol.name).recycle(a_protocol)
		end

end -- class PROTOCOLS
