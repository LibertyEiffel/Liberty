class NCURSES_MENU_ITEM[E_]

creation
	make

feature {ANY}
	tag: STRING

	set_tag (s: like tag) is
		require
			not s.is_empty
		do
			tag := s
		ensure
			tag = s
		end

	value: E_

	set_value (s: like value) is
		do
			value := s
		ensure
			value = s
		end

feature {}
	make (t: like tag; v: like value) is
		require
			not t.is_empty
		do
			tag := t
			value := v
		ensure
			tag = t
			value = v
		end
	
end -- class NCURSES_MENU_ITEM
