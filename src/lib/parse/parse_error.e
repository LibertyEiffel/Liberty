class PARSE_ERROR

create {ANY}
	make

feature {ANY}
	index: INTEGER
	message: STRING
	next: PARSE_ERROR

feature {PARSE_ERROR}
	set_next (a_next: like next) is
		require
			a_next /= Void
			a_next /= Current
		do
			if next = Void then
				next := a_next
			else
				next.set_next(a_next)
			end
		ensure
			last = a_next
		end

	last: PARSE_ERROR is
		do
			if next = Void then
				Result := Current
			else
				Result := next.last
			end
		ensure
			Result /= Void
		end

feature {}
	make (a_index: like index; a_message: like message; a_previous: PARSE_ERROR) is
		require
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

end
