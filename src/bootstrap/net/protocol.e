deferred class PROTOCOL

insert
	RECYCLABLE
	DISPOSABLE

feature {ANY}
	name: STRING is
		deferred
		end

	is_connected: BOOLEAN is
		deferred
		end

	error: STRING is
		deferred
		end

feature {URL_VALIDITY}
	valid_uri (a_uri: STRING): BOOLEAN is
		deferred
		end

feature {URL}
	connect_to (url: URL; read, write: BOOLEAN) is
		require
			url.uri /= Void
			not is_connected
			read or write
		deferred
		end

	disconnect is
		require
			is_connected
		deferred
		ensure
			not is_connected
		end

	input: INPUT_STREAM is
		require
			is_connected
		deferred
		end

	output: OUTPUT_STREAM is
		require
			is_connected
		deferred
		end

	locator (a_uri: STRING): RESOURCE_LOCATOR is
			-- PROTOCOL is a factory of RESOURCE_LOCATOR
		require
			valid_uri(a_uri)
		deferred
		ensure
			Result.uri.is_equal(a_uri)
		end

	recycle_locator (a_locator: RESOURCE_LOCATOR) is
		require
			a_locator /= Void
		deferred
		end

feature {RECYCLING_POOL}
	recycle is
		do
			if is_connected then
				disconnect
				check
					-- Because the previous code is just here to catch
					-- non-clean usage of PROCOTOLs:
					disconnect_after_use: False
				end
			end
		end

feature {}
	dispose is
		do
			if is_connected then
				disconnect
				check
					-- Because the previous code is just here to catch
					-- non-clean usage of PROCOTOLs:
					disconnect_after_use: False
				end
			end
		end

invariant
	error /= Void implies not is_connected

end -- class PROTOCOL
