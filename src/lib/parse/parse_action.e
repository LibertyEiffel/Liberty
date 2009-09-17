class PARSE_ACTION

creation {PARSE_TERMINAL, PARSE_NT_NODE}
	make

feature {ANY}
	name: STRING
			-- useful for debug

	call is
		do
			action.call([])
		end

feature {PARSE_TERMINAL, PARSE_NT_NODE}
	set_name (a_name: like name) is
		do
			name := a_name
		ensure
			name = a_name
		end

feature {}
	make (a_action: like action) is
		require
			a_action /= Void
		do
			action := a_action
		ensure
			action = a_action
		end

	action: PROCEDURE[TUPLE]

invariant
	action /= Void

end -- PARSE_ACTION
