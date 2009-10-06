class LIBERTY_ERROR

insert
	EIFFEL_NODE_HANDLER

create {LIBERTY_ERROR, LIBERTY_ERRORS}
	from_parse_error, error, warning

feature {LIBERTY_ERROR, LIBERTY_ERRORS}
	index: INTEGER
	message: STRING
	next: LIBERTY_ERROR
	is_warning: BOOLEAN

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

	is_fatal: BOOLEAN is
		do
			if is_warning then
				if next /= Void then
					Result := next.is_fatal
				end
			else
				Result := True
			end
		end

feature {LIBERTY_ERRORS}
	emit_semantics (ast: LIBERTY_AST_CLASS) is
			-- Emit a semantics error; expect the faulty `ast'.
			-- May not return.
		do
			if last_ast_in_code_buffer /= ast then
				code_buffer.clear
				ast.generate(code_buffer)
				last_ast_in_code_buffer := ast
			end

			do_emit(code_buffer.to_string)

			if is_fatal then
				die_with_code(1)
			end
		ensure
			is_fatal = old is_fatal
			warning_or_die: not is_fatal
		end

	emit_syntax (code: STRING) is
			-- Emit a syntax error; expect the `code' buffer.
			-- May not return.
		do
			do_emit(code)

			if is_fatal then
				die_with_code(1)
			end
		ensure
			is_fatal = old is_fatal
			warning_or_die: not is_fatal
		end

feature {LIBERTY_ERROR}
	do_emit (code: STRING) is
		local
			l, c, i, a: INTEGER
			arrow: STRING
		do
			if next /= Void then
				next.do_emit(code)
			end

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

	error (a_index: like index; a_message: like message; a_previous: like Current) is
		require
			a_index >= 0
			a_message /= Void
		do
			index := a_index
			message := a_message
			if a_previous /= Void then
				a_previous.set_next(Current)
			end
			is_warning := False
		ensure
			index = a_index
			message = a_message
			a_previous /= Void implies a_previous.last = Current
			is_fatal
		end

	warning (a_index: like index; a_message: like message; a_previous: like Current) is
		require
			a_index >= 0
			a_message /= Void
		do
			index := a_index
			message := a_message
			if a_previous /= Void then
				a_previous.set_next(Current)
			end
			is_warning := True
		ensure
			index = a_index
			message = a_message
			a_previous /= Void implies a_previous.last = Current
			not is_fatal
		end

	from_parse_error (p: PARSE_ERROR) is
		require
			p /= Void
		do
			index := p.index
			message := p.message
			if p.next /= Void then
				create next.error(p.next.index, p.next.message, Current)
			end
		ensure
			(p.next /= Void) = (next /= Void)
			index = p.index
			message = p.message
		end

	code_buffer: STRING_OUTPUT_STREAM is
		once
			create Result.connect_to("")
		end

	last_ast_in_code_buffer: EIFFEL_NODE

end
