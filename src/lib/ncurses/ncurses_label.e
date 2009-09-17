class NCURSES_LABEL
	-- This class adds a label widget.

inherit
	NCURSES_WINDOW
		rename make as make_window
		redefine left, top, width, height, refresh_later
		end

creation{ANY}
	make

feature{ANY}
	left: INTEGER

	top: INTEGER

	width: INTEGER

	height: INTEGER

	text: STRING

	refresh_later is
		do
			put_string_at(text, (width - text.count) // 2, (height - 1) // 2)
			Precursor
		end

	set_text (t: like text) is
		do
			if t.count + 1 > width then
				text := t.substring(1, width - 1)
			else
				text := t
			end
		end

feature{}
	make (p: like parent; t: like text; x, y, w, h: INTEGER) is
		require
			p /= Void
			t /= Void
		do
			left := x
			top := y
			width := w
			height := h
			set_text(t)
			set_parent(p)
			make_sub_window(p.get_window, left, top, width, height)
		end

invariant
	parent /= Void

end -- class NCURSES_LABEL
