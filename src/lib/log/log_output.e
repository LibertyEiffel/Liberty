-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_OUTPUT

inherit
	OUTPUT_STREAM

insert
	STRING_FORMATTER

create {LOG_INTERNAL_CONF}
	make

feature {ANY}
	is_connected: BOOLEAN is
		do
			Result := output.is_connected
		end

	can_disconnect: BOOLEAN is False

	disconnect is
		do
			check False end
		end

	can_put_character (c: CHARACTER): BOOLEAN is
		do
			Result := output.can_put_character(c)
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			if c = '%N' then
				format_and_print_message
			else
				message.extend(c)
			end
		end

	filtered_flush is
		do
			-- no, thanks
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			check False end
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
			-- Find the pointer of the terminal stream... Filters do not have pointers of their own
		do
			check False end
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {LOG_LEVEL}
	level_tag: FIXED_STRING
	logger_tag: FIXED_STRING

	set (a_level_tag, a_logger_tag: FIXED_STRING) is
		do
			level_tag := a_level_tag
			logger_tag := a_logger_tag
		ensure
			level_tag = a_level_tag
			logger_tag = a_logger_tag
		end

feature {LOGGER}
	output: OUTPUT_STREAM

	set_output (a_output: like output) is
		require
			a_output /= Void
		do
			output := a_output
		ensure
			output = a_output
		end

	tag: FIXED_STRING

	format: FIXED_STRING

	set_format (a_format: ABSTRACT_STRING) is
		require
			a_format /= Void
		do
			format := a_format.intern
		ensure
			format.is_equal(a_format)
		end

feature {}
	put (c: CHARACTER) is
		do
			message.extend(c)
		end

	put_item (item: ABSTRACT_STRING) is
		do
			message.append(item)
		end

feature {}
	make (a_output: like output; a_tag: like tag) is
		require
			a_output /= Void
			a_tag /= Void
		do
			set_output(a_output)
			tag := a_tag
			format := default_format
			message := ""
		ensure
			output = a_output
			tag = a_tag
		end

	message: STRING

	default_format: FIXED_STRING is
		once
			Result := ("@C [@t] - @m%N").intern
		end

	format_and_print_message is
		local
			i: INTEGER; i18n: I18N
		do
			time.update
			from
				i := format.lower
			variant
				format.upper - i
			until
				i > format.upper
			loop
				if format.item(i) = '@' then
					if i = format.upper then
						output.put_character('@')
					else
						inspect format.item(i + 1)
						when 'C' then
							output.put_string(level_tag)
						when 'L' then
							output.put_string(logger_tag)
						when 'T' then
							output.put_string(tag)
						when 't' then
							output.put_string(i18n.locale.localized_time_and_date(time))
						when 'm' then
							output.put_string(message)
						when '@' then
							output.put_character('@')
						else
							output.put_character('@')
							output.put_character(format.item(i + 1))
						end
						i := i + 2
					end
				else
					output.put_character(format.item(i))
					i := i + 1
				end
			end
			output.flush
			message.clear_count
		end

	put_two_figure_integer (int: INTEGER) is
		require
			int.in_range(0, 99)
		do
			if int < 10 then
				output.put_character('0')
			end
			output.put_integer(int)
		end

	time: TIME

invariant
	output /= Void
	format /= Void
	message /= Void
	tag /= Void

end -- class LOG_OUTPUT
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
