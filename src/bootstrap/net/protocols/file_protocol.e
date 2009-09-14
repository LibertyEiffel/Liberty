-- See the Copyright notice at the end of this file.
--
class FILE_PROTOCOL
	--
	-- To access to "file://..." URLs
	--

inherit
	PROTOCOL

create {PROTOCOLS}
	make

feature {ANY}
	name: STRING is "file"

	is_connected: BOOLEAN is
		do
			if stream /= Void then
				Result := stream.is_connected
			elseif instream /= Void then
				Result := instream.is_connected
			elseif outstream /= Void then
				Result := outstream.is_connected
			end
		end

	error: STRING

feature {URL_VALIDITY}
	valid_uri (a_uri: STRING): BOOLEAN is
		do
			Result := notation.is_valid_path(a_uri)
		end

feature {URL}
	connect_to (url: URL; read, write: BOOLEAN) is
		local
			frl: FILE_RESOURCE_LOCATOR
		do
			if stream /= Void then
				check
					not stream.is_connected
				end
				rw.recycle(stream)
				stream := Void
			elseif instream /= Void then
				check
					not instream.is_connected
				end
				r.recycle(instream)
				instream := Void
			elseif outstream /= Void then
				check
					not outstream.is_connected
				end
				w.recycle(outstream)
				outstream := Void
			end
			frl ::= url.uri
			if read and write then
				stream := rwstream
				stream.connect_to(frl.path)
				if not stream.is_connected then
					rw.recycle(stream)
					stream := Void
				end
			elseif read then
				instream := rstream
				instream.connect_to(frl.path)
				if not instream.is_connected then
					r.recycle(instream)
					instream := Void
				end
			else
				check write end
				outstream := wstream
				outstream.connect_to(frl.path)
				if not outstream.is_connected then
					w.recycle(outstream)
					outstream := Void
				end
			end
			if not is_connected then
				error := once ""
				error.copy(once "Cannot read file: ")
				error.append(frl.path)
			end
		end

	disconnect is
		do
			if stream /= Void then
				stream.disconnect
				rw.recycle(stream)
				stream := Void
			elseif instream /= Void then
				instream.disconnect
				r.recycle(instream)
				instream := Void
			else
				check outstream /= Void end
				outstream.disconnect
				w.recycle(outstream)
				outstream := Void
			end
		ensure then
			stream = Void
			instream = Void
			outstream = Void
		end

	input: INPUT_STREAM is
		do
			if instream /= Void then
				Result := instream
			else
				Result := stream
			end
		end

	output: OUTPUT_STREAM is
		do
			if outstream /= Void then
				Result := outstream
			else
				Result := stream
			end
		end

	locator (a_uri: STRING): FILE_RESOURCE_LOCATOR is
		do
			if locators.is_empty then
				create Result.set_uri(a_uri)
			else
				Result := locators.item
				Result.set_uri(a_uri)
			end
		end

	recycle_locator (a_locator: RESOURCE_LOCATOR) is
		local
			frl: FILE_RESOURCE_LOCATOR
		do
			frl ::= a_locator
			locators.recycle(frl)
		end

feature {}
	stream: TEXT_FILE_READ_WRITE
	instream: TEXT_FILE_READ
	outstream: TEXT_FILE_WRITE

	make is
		do
		end

feature {} -- Recycling
	locators: RECYCLING_POOL[FILE_RESOURCE_LOCATOR] is
		once
			create Result.make
		end

	notation: UNIX_DIRECTORY_NOTATION is
		once
			create Result
		end

	rw: RECYCLING_POOL[TEXT_FILE_READ_WRITE] is
		once
			create Result.make
		end

	r: RECYCLING_POOL[TEXT_FILE_READ] is
		once
			create Result.make
		end

	w: RECYCLING_POOL[TEXT_FILE_WRITE] is
		once
			create Result.make
		end

	rwstream: TEXT_FILE_READ_WRITE is
		do
			if rw.is_empty then
				create Result.make
			else
				Result := rw.item
			end
		end

	rstream: TEXT_FILE_READ is
		do
			if r.is_empty then
				create Result.make
			else
				Result := r.item
			end
		end

	wstream: TEXT_FILE_WRITE is
		do
			if w.is_empty then
				create Result.make
			else
				Result := w.item
			end
		end

invariant
	stream /= Void implies instream = Void and then outstream = Void
	instream /= Void implies stream = Void and then outstream = Void
	outstream /= Void implies stream = Void and then instream = Void

end -- class FILE_PROTOCOL
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
