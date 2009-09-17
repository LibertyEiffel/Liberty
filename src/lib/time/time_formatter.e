deferred class TIME_FORMATTER
	--
	-- The polymophic format class for TIME.
	--

insert
	TIME_HANDLER
		redefine out_in_tagged_out_memory
		end

feature {ANY}
	time: TIME
			-- The corresponding information to display.

	set_time (t: TIME) is
		do
			time := t
		ensure
			time = t
		end

	short_mode: BOOLEAN
			-- Is the formatting mode set to the short (abbreviated) mode ?

	set_short_mode (value: BOOLEAN) is
		do
			short_mode := value
		ensure
			short_mode = value
		end

	day_in (buffer: STRING) is
			-- According to the current `short_mode', append in the `buffer'
			-- the name of the day.
		deferred
		end

	month_in (buffer: STRING) is
			-- According to the current `short_mode', append in the `buffer'
			-- the name of the month.
		deferred
		end

	frozen to_string: STRING is
		do
			to_string_buffer.clear_count
			append_in(to_string_buffer)
			Result := to_string_buffer.twin
		end

	append_in (buffer: STRING) is
		deferred
		end

	frozen out_in_tagged_out_memory is
		do
			append_in(tagged_out_memory)
		end

feature {}
	to_string_buffer: STRING is
		once
			create Result.make(128)
		end

end -- class TIME_FORMATTER
