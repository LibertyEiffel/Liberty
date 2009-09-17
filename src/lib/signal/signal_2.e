class SIGNAL_2[E, F]
	--
	-- See tutorial/signal/signals.txt for usage
	--

creation {ANY}
	make

feature {}
	callbacks: FAST_ARRAY[PROCEDURE[TUPLE[E, F]]]

	index, last: INTEGER
			-- work to do while emit is between index and last.

	make is
			-- Initialize new signal object
		do
			create callbacks.make(0)
		ensure
			callbacks.is_empty
		end

feature {ANY}
	connect (p: PROCEDURE[TUPLE[E, F]]) is
			-- Connect procedure to be called when signal is emitted
			-- See also last_connect_id
		require
			p /= Void
		do
			callbacks.add_last(p)
		ensure
			not callbacks.is_empty
			last_connect_id = p
		end

	emit (val1: E; val2: F) is
			-- Emit signal, ie. already registred procedure will be called
			-- in registration order except if removed by another before.
		do
			from
				index := callbacks.lower
				last := callbacks.upper
			until
				index > last
			loop
				callbacks.item(index).call([val1, val2])
				index := index + 1
			end
		end

	last_connect_id: PROCEDURE[TUPLE[E, F]] is
			-- return identifier on the last connect which may be used
			-- for disconnect (unregister procedure)
		require
			not is_empty
		do
			Result := callbacks.last
		ensure
			Result /= Void
		end

	disconnect (connect_identifier: PROCEDURE[TUPLE[E, F]]) is
			-- Unregister procedure for this signal. If the same
			-- procedure was registred many times, only first is removed.
		local
			i: INTEGER
		do
			i := callbacks.fast_first_index_of(connect_identifier)
			if callbacks.valid_index(i) then
				callbacks.remove(i)
				last := last - 1
				if i <= index then
					index := index - 1
				end
			end
		ensure
			old callbacks.fast_has(connect_identifier) implies callbacks.count = old callbacks.count - 1
			old (not callbacks.fast_has(connect_identifier)) implies callbacks.count = old callbacks.count
		end

	is_empty: BOOLEAN is
			-- return True if no callback is registred for this signal
		do
			Result := callbacks.is_empty
		end

invariant
	callbacks /= Void

end -- class SIGNAL_2
