class NCURSES_PAD
	--
	-- One window in the NCURSES world.
	--
	-- The current position of the cursor is given by `cursor_x' and `cursor_y'. 
	--
	
inherit
	NCURSES_WINDOW
		redefine refresh_later
		end

creation {ANY}
	make_pad

creation {NCURSES_PAD}
	make_sub_pad

feature {ANY}
	create_sub_pad (x, y, columns, lines: INTEGER): NCURSES_PAD is
		require
			ncurses.is_enabled
		do
			create Result.make_sub_pad(Current, x, y, columns, lines)
		end

	set_visible (vl, vt: INTEGER) is
		-- Convenience only
		do
			set_visible_left(vl)
			set_visible_top(vt)
		end

	set_visible_left (vl: like visible_left) is
		require
			vl >= 0
		do
			visible_left := vl
		ensure
			visible_left = vl
		end

	visible_left: INTEGER

	set_visible_top (vt: like visible_top) is
		require
			vt >= 0
		do
			visible_top := vt
		ensure
			visible_top = vt
		end

	visible_top: INTEGER

	set_viewport (x, y, w, h: INTEGER) is
		require
			x.in_range(0, parent.width - 2)
			y.in_range(0, parent.height - 2)
			w >= 1
			h >= 1
			(x + w).in_range(1, parent.width - 1)
			(y + h).in_range(1, parent.height - 1)
		do
			viewport_left := x
			viewport_top := y
			viewport_width := w
			viewport_height := h
		ensure
			viewport_left = x
			viewport_top = y
			viewport_width = w
			viewport_height = h
		end

	viewport_left, viewport_top, viewport_width, viewport_height: INTEGER

	refresh_later is
		local
			ok: INTEGER
		do
			ok := pnoutrefresh(widget, visible_top, visible_left, viewport_top, viewport_left, viewport_top + viewport_height, viewport_left + viewport_width)
			ncurses.check_for_error(ok = ncurses.ok)
		end

feature {}
	make_pad (columns, lines: INTEGER) is
		do
			set_widget(newpad(lines, columns))
			set_parent(ncurses.get_root_window)
			init
		end

	make_sub_pad (p: NCURSES_PAD; x, y, columns, lines: INTEGER) is
		require
			ncurses.is_enabled
		do
			set_widget(subpad(p.widget, lines, columns, y, x))
			set_parent(p)
			init
		end

	newpad (h, w: INTEGER): POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "newpad"
			}"
		end

	subpad (orig: POINTER; h, w, y, x: INTEGER): POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "subpad"
			}"
		end

	pnoutrefresh (pad: POINTER; pminrow, pmincol, sminrow, smincol, smaxrow, smaxcol: INTEGER): INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "ncurses"
			feature_name: "pnoutrefresh"
			}"
		end

end -- class NCURSES_PAD
