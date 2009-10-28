-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class MINI_PARSER_BUFFER
	--
	-- Useful and efficient mini parsing buffer.
	-- From the user point of view, an object of this class can be considered
	-- as the combination of a STRING to be parsed with an extra INTEGER
	-- index to memorize the current position in this STRING.
	-- Beside the fact that this object provides the current position
	-- memorization inside the STRING to be parsed, the implementation is
	-- also more efficient than the one you may get by using the traditional
	-- STRING interface.
	--

insert
	STRING_HANDLER

feature {ANY}
	initialize_with (string: ABSTRACT_STRING) is
			-- Initialize the `Current' buffer using the content of the `string'.
			-- ''Note:'' The storage is shared between the buffer and the given `string'. Don't change the
			-- content of the `string' or the parsing may get corrupted!
			--|*** It looks like a strange design decision to me <CAD 2007.09.25>
			-- Or use a FIXED_STRING...
		require
			string /= Void
		do
			internal_index := 0
			upper := string.count - 1
			capacity := string.capacity
			storage := string.storage
			last_error := Void
		ensure
			count = string.count
			last_error = Void
		end

	count: INTEGER is
			-- The length of the `Current' buffer which is also the maximum valid index.
		do
			Result := upper + 1
		end

	current_index: INTEGER is
			-- Index of the current character.
		do
			Result := internal_index + 1
		end

	current_character: CHARACTER is
			-- The current character (the one at `current_index').
		require
			current_index.in_range(1, count)
		do
			Result := storage.item(internal_index)
		end

	end_reached: BOOLEAN is
			-- Is the end of the buffer reached?
		do
			Result := internal_index > upper
		ensure
			Result = (current_index > count)
		end

	next is
			-- Move the `current_index' forward by one.
		require
			not end_reached
		do
			internal_index := internal_index + 1
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
				if internal_index > upper then
					stop := True
				elseif storage.item(internal_index).is_separator then
					internal_index := internal_index + 1
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
			new_index.in_range(1, count + 1)
		do
			internal_index := new_index - 1
		ensure
			current_index = new_index
		end

feature {}
	storage: NATIVE_ARRAY[CHARACTER]
			-- The `storage' area to be parsed.

	capacity: INTEGER
			-- Of `storage'.

	upper: INTEGER
			-- Maximum valid index in storage.

	internal_index: INTEGER
			-- Of the current character in `storage'.

end
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
