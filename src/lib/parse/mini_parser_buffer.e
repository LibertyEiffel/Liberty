-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MINI_PARSER_BUFFER
	--
	-- Useful and efficient mini parsing buffer.
	-- From the user point of view, an object of this class can be considered
	-- as the combination of a STRING to be parsed with an extra INTEGER
	-- index to memorize the current position in this STRING.
	--

insert
	STRING_HANDLER

feature {ANY}
	initialize_with (string: ABSTRACT_STRING) is
			-- Initialize the `Current' buffer interning `string'.
		require
			string /= Void
		do
			storage := string.intern
			current_index := storage.lower
			last_error := Void
		ensure
			count = string.count
			last_error = Void
		end

	next is
			-- Move the `current_index' forward by one.
		require
			not end_reached
		do
			current_index := current_index + 1
		ensure
			current_index = 1 + old current_index
		end

	skip_separators is
			-- Skip all separators by using `is_separator' of class CHARACTER.
		local
			stop: BOOLEAN
		do
			from
			until
				stop
			loop
				if current_index > upper then
					stop := True
				elseif storage.item(current_index).is_separator then
					current_index := current_index + 1
				else
					stop := True
				end
			end
		end

	last_error: PARSE_ERROR
			-- Can be used to memorize an error message.

	set_last_error (error: like last_error) is
		do
			last_error := error
		ensure
			last_error = error
		end

	set_last_error_message (error_message: STRING) is
		do
			create last_error.make(current_index, error_message, last_error)
		ensure
			last_error.message = error_message
		end

	set_current_index (new_index: like current_index) is
			-- To be able to move (usually back) in the buffer
		require
			new_index.in_range(lower, upper)
		do
			current_index := new_index
		ensure
			current_index = new_index
		end

feature {ANY} -- Queries
	lower: INTEGER is
		do
			Result := storage.lower
		end

	upper: INTEGER is
			-- Maximum valid index in storage.
		do
			Result := storage.upper
		end

	count: INTEGER is
			-- The length of the `Current' buffer which is also the maximum valid index.
		do
			Result := storage.count
		end

	capacity: INTEGER is
			-- Of `storage'.
		do
			Result := storage.capacity
		end

	current_index: INTEGER
			-- Index of the current character.

	current_character: CHARACTER is
			-- The current character (the one at `current_index').
		require
			current_index.in_range(1, count)
		do
			Result := storage.item(current_index)
		end

	end_reached: BOOLEAN is
			-- Is the end of the buffer reached?
		do
			Result := current_index > upper
		ensure
			Result = (current_index > count)
		end

feature {}
	storage: FIXED_STRING
			-- The `storage' area to be parsed.

end -- class MINI_PARSER_BUFFER
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
