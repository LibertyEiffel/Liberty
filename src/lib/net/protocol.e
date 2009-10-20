-- See the Copyright notice at the end of this file.
--
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
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
