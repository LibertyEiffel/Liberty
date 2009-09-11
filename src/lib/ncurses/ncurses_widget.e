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
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN, Pierre-Nicolas CLAUSS
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
