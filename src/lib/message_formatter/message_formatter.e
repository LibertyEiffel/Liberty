deferred class MESSAGE_FORMATTER[E_]

feature {ANY}
	put_message (message: TRAVERSABLE[E_]; arguments: TRAVERSABLE[ANY]) is
		local
			i, backtrack_i: INTEGER
			index: INTEGER
			state: INTEGER
			ch: E_
		do
			from
				i := message.lower
			until
				i > message.upper
			loop
				from
				until
					i > message.upper
				loop
					ch := message.item(i)
					inspect
						state
					when -1 then -- Always print
						put(ch)
						state := 0
					when 0 then -- Normal state
						if ch.is_equal(delimiter) then
							backtrack_i := i - 1
							state := 1
						else
							put(ch)
						end
					when 1 then -- After @
						if ch.is_equal(delimiter) then
							put(ch)
							state := 0
						elseif ch.is_equal(opening_brace) then
							index := 0
							state := 2
						else
							i := backtrack_i
							state := -1
						end
					when 2 then -- After @(
						if is_digit(ch) then
							index := index * 10 + value(ch)
						elseif ch.is_equal(closing_brace) and then arguments.valid_index(index) then
							put_item(arguments.item(index))
							state := 0
						else
							i := backtrack_i
							state := -1
						end
					end
					i := i + 1
				end
				check
					i >= 0
				end
				if state > 0 then
					i := backtrack_i + 1
					state := -1
				end
			end
		end

feature {}
	put (e: E_) is
		deferred
		end

	put_item (item: ANY) is
		deferred
		end

feature {}
	delimiter: E_ is
		deferred
		end

	opening_brace: E_ is
		deferred
		end

	closing_brace: E_ is
		deferred
		end

	is_digit (e: E_): BOOLEAN is
		deferred
		end

	value (e: E_): INTEGER is
		require
			is_digit(e)
		deferred
		end

end -- class MESSAGE_FORMATTER
