deferred class LIBERTY_POSITION

feature {}
	index: INTEGER
	source: STRING is
		deferred
		end

	line, column: INTEGER

	set_error_position is
		require
			source /= Void
			index.in_range(source.lower, source.upper)
		local
			i, n, l, c: INTEGER
		do
			n := index
			from
				l := 1
				c := 1
			until
				i = n
			loop
				if source.item(i) = '%N' then
					l := l + 1
					c := 1
				else
					c := c + 1
				end
				i := i + 1
			end
			line := l
			column := c
		end

feature {LIBERTY_ERROR}
	emit is
		local
			l, c, i, a: INTEGER
			arrow: STRING
		do
			set_error_position

			i := 1
			from
				l := 1
			until
				l = line
			loop
				if source.item(i) = '%N' then
					l := l + 1
				end
				i := i + 1
			end
			from
				c := 1
				arrow := ""
			until
				c = column
			loop
				if source.item(i) = '%T' then
					arrow.extend('%T')
				else
					arrow.extend(' ')
				end
				std_error.put_character(source.item(i))
				i := i + 1
			end
			from
			until
				i > source.count or else source.item(i) = '%N'
			loop
				std_error.put_character(source.item(i))
				i := i + 1
			end
			std_error.put_new_line
			from
				a := 1
			until
				a > arrow.count
			loop
				std_error.put_character(arrow.item(a))
				a := a + 1
			end
			std_error.put_character('^')
			std_error.put_new_line
		end

end
