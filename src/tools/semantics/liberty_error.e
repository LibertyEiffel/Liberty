class LIBERTY_ERROR

create {ANY}
	from_parse_error, make

feature {LIBERTY_ERROR}
	index: INTEGER
	message: STRING
	next: LIBERTY_ERROR

	set_next (a_next: like next) is
		require
			a_next /= Void
			a_next /= Current
		do
			if next /= Void then
				next.set_next(a_next)
			else
				next := a_next
			end
		ensure
			last = a_next
		end

	last: like next is
		do
			if next = Void then
				Result := Current
			else
				Result := next.last
			end
		ensure
			Result /= Void
		end

feature {ANY}
	emit (code: STRING) is
			-- does not return
		local
			l, c, i, a: INTEGER
			arrow: STRING
		do
			set_error_position(code)

			i := 1
			from
				l := 1
			until
				l = line
			loop
				if code.item(i) = '%N' then
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
				if code.item(i) = '%T' then
					arrow.extend('%T')
				else
					arrow.extend(' ')
				end
				std_error.put_character(code.item(i))
				i := i + 1
			end
			from
			until
				i > code.count or else code.item(i) = '%N'
			loop
				std_error.put_character(code.item(i))
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

			std_error.put_line(message)

			if next /= Void then
				next.emit(code)
			end
		end

feature {}
	line, column: INTEGER

	set_error_position (code: STRING) is
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
				if code.item(i) = '%N' then
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

	make (a_index: like index; a_message: like message; a_previous: like Current) is
		require
			a_index >= 0
			a_message /= Void
		do
			index := a_index
			message := a_message
			if a_previous /= Void then
				a_previous.set_next(Current)
			end
		ensure
			index = a_index
			message = a_message
			a_previous /= Void implies a_previous.last = Current
		end

	from_parse_error (p: PARSE_ERROR) is
		require
			p /= Void
		local
			n: LIBERTY_ERROR
		do
			if p.next /= Void then
				create n.make(p.next.index, p.next.message, Current)
			end
			index := p.index
			message := p.message
			next := n
		ensure
			(p.next /= Void) = (next /= Void)
			index = p.index
			message = p.message
		end

end
