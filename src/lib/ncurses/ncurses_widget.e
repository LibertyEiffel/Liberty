deferred class NCURSES_WIDGET

inherit
	DISPOSABLE

insert
	NCURSES_TOOLS
	NCURSES_KEYS
	NCURSES_COLORS
	NCURSES_CHARACTERS

	
feature{ANY}
	left: INTEGER is
		require
			ncurses.is_enabled
		deferred
		end

	top: INTEGER is
		require
			ncurses.is_enabled
		deferred
		end

	width: INTEGER is
		require
			ncurses.is_enabled
		deferred
		end

	height: INTEGER is
		require
			ncurses.is_enabled
		deferred
		end

	redraw_later is
		local
			i: INTEGER
		do
			if not hidden then
				refresh_later
				if children /= Void and then not is_children_drawing_disable then
					from
						i := children.lower
					variant
						children.upper - i
					until
						i > children.upper
					loop
						children.item(i).redraw_later
						i := i + 1
					end
				end
			end
		end

	redraw_now is
		do
			redraw_later
			ncurses.refresh_pending
		end

	refresh_later is
		deferred
		end

	hidden: BOOLEAN

	show is
		do
			hidden := False
		end

	hide is
		do
			hidden := True
		end

	is_children_drawing_disable: BOOLEAN

	draw_children (b: like is_children_drawing_disable) is
		do
			is_children_drawing_disable := not b
		end

	set_foreground_color (color: INTEGER) is
		do
			get_window.set_fg_color(color)
		end

	set_background_color (color: INTEGER) is
		do
			get_window.set_bg_color(color)
		end

	set_colors (foreground, background: INTEGER) is
		do
			get_window.set_both_colors(foreground, background)
		end

	get_foreground_color: INTEGER is
		do
			Result := get_window.get_fg_color
		end

	get_background_color: INTEGER is
		do
			Result := get_window.get_bg_color
		end

feature{NCURSES_WIDGET}
	set_parent (p: like parent) is
		do
			parent := p
			parent.add_child(Current)
		end

	get_window: NCURSES_WINDOW is
		deferred
		end

	add_child (child: NCURSES_WIDGET) is
		do
			if children = Void then
				create children.with_capacity(2)
			end
			children.add_last(child)
		end

	delete is
		do
			dispose_children
		end

	parent_resized is
		require
			ncurses.is_enabled
		deferred
		end

	propagate_resize is
		require
			ncurses.is_enabled
		local
			i: INTEGER
		do
			parent_resized
			if children /= Void then
				from
					i := children.lower
				variant
					children.upper - i
				until
					i > children.upper
				loop
					children.item(i).propagate_resize
					i := i + 1
				end
			end
		end

	parent: NCURSES_WIDGET

	children: FAST_ARRAY[NCURSES_WIDGET]

feature{}
	dispose is
		do
			delete
		end

	dispose_children is
		local
			i: INTEGER
		do
			if children /= Void then
				from
					i := children.lower
				variant
					children.upper - i
				until
					i > children.upper
				loop
					children.item(i).delete
					i := i + 1
				end
			end
		end

end -- class NCURSES_WIDGET
