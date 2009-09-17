class NCURSES_LIST_ITEM[E_]

creation
	make

feature {ANY}
	is_selected: BOOLEAN

	set_is_selected (s: like is_selected) is
		do
			is_selected := s
		ensure
			is_selected = s
		end
	
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
	make (s: like is_selected; t: like tag; v: like value) is
		require
			not t.is_empty
		do
			is_selected := s
			tag := t
			value := v
		ensure
			is_selected = s
			tag = t
			value = v
		end
	
end -- class NCURSES_LIST_ITEM
