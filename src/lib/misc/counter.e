class COUNTER
	--
	-- Simple counter object (useful as a once function).
	--

feature {ANY}
	value: INTEGER
			-- The `value' of the counter.

	increment is
			-- Increment the `value' of `Current' counter.
		do
			value := value + 1
		ensure
			value = 1 + old value
		end

	decrement is
			-- Decrement the `value' of `Current' counter.
		do
			value := value - 1
		ensure
			value + 1 = old value
		end

	reset is
			-- Reset the `value' of `Current' counter.
		do
			value := 0
		ensure
			value = 0
		end

	append_in (buffer: STRING) is
			-- Append the `value' of the `Current' counter in the `buffer'.
		do
			value.append_in(buffer)
		end

end -- class COUNTER
