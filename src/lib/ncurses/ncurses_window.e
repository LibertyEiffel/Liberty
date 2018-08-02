-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class NCURSES_WINDOW
   --
   -- One window in the NCURSES world.
   --
   -- The current position of the cursor is given by `cursor_x' and `cursor_y'.
   --

inherit
   NCURSES_WIDGET
      redefine delete
      end

create {ANY}
   make

create {NCURSES_WINDOW}
   make_sub_window

create {NCURSES}
   make_root_window

feature {ANY} -- Writing:
   put_character_at (character: CHARACTER; x, y: INTEGER)
         -- Put `character' at cursor position `x', `y'.
         -- The cursor is left, just after the `character'.
         --
         -- See also `put_character', `cursor_x', `cursor_y'.
      require
         ncurses.is_enabled
         valid_cursor(x, y)
      do
         ncurses.check_for_error(mvwaddch(widget, y, x, character.code) = ncurses.ok)
      end

   put_character (character: CHARACTER)
         -- Put `character' at `cursor_x', `cursor_y'.
         -- The cursor is left, just after the `character'.
         --
         -- See also `put_character_at'.
      require
         ncurses.is_enabled
      do
         put_character_at(character, cursor_x, cursor_y)
      end

   put_string_at (string: STRING; x, y: INTEGER)
         -- Put the `string' at cursor position `x', `y'.
         -- The cursor is left, just after the `string'.
         --
         -- See also `put_string', `cursor_x', `cursor_y'.
      require
         ncurses.is_enabled
         string /= Void
         valid_cursor(x, y)
      do
         ncurses.check_for_error(mvwaddstr(widget, y, x, string.to_external) = ncurses.ok)
      end

   put_string (string: STRING)
         -- Put the `string' at  `cursor_x', `cursor_y'.
         -- The cursor is left, just after the `string'.
         --
         -- See also `put_string_at'.
      require
         ncurses.is_enabled
         string /= Void
      do
         put_string_at(string, cursor_x, cursor_y)
      end

   put_integer_at (integer: INTEGER_64; x, y: INTEGER)
         -- Put the `integer' at cursor position `x', `y'.
         -- The cursor is left, just after the `integer'.
         --
         -- See also `put_integer', `cursor_x', `cursor_y'.
      require
         ncurses.is_enabled
         valid_cursor(x, y)
      local
         buffer: STRING
      do
         buffer := once "........ unique local buffer ...................."
         buffer.clear_count
         integer.append_in(buffer)
         put_string_at(buffer, cursor_x, cursor_y)
      end

   put_integer (integer: INTEGER_64)
         -- Put the `integer' at `cursor_x', `cursor_y'.
         -- The cursor is left, just after the `integer'.
         --
         -- See also `put_integer_at'.
      require
         ncurses.is_enabled
      do
         put_integer_at(integer, cursor_x, cursor_y)
      end

feature {ANY} -- Cursor:
   cursor_x: INTEGER
         -- X coordinate of the cursor (left-most column is 0).
         --
         -- See also `cursor_y'.
      require
         ncurses.is_enabled
      do
         Result := wgetcursorx(widget)
      ensure
         valid_cursor_x(Result)
      end

   valid_cursor_x (x: INTEGER): BOOLEAN
         -- Is `y' a valid line for the cursor position?
         --
         -- See also `cursor_x', `valid_cursor_y'.
      do
         Result := x.in_range(0, width - 1)
      ensure
         definition: Result = x.in_range(0, width - 1)
      end

   cursor_y: INTEGER
         -- Y coordinate of the cursor (upper-most line is 0).
         --
         -- See also `cursor_x'.
      require
         ncurses.is_enabled
      do
         Result := wgetcursory(widget)
      ensure
         Result >= 0
      end

   valid_cursor_y (y: INTEGER): BOOLEAN
         -- Is `y' a valid line for the cursor position?
         --
         -- See also `cursor_y', `valid_cursor_x'.
      do
         Result := y.in_range(0, height - 1)
      ensure
         definition: Result = y.in_range(0, height - 1)
      end

   set_cursor (x, y: INTEGER)
      require
         ncurses.is_enabled
         valid_cursor(x, y)
      do
         ncurses.check_for_error(wmove(widget, y, x) = ncurses.ok)
      ensure
         cursor_x = x
         cursor_y = y
      end

   valid_cursor (x, y: INTEGER): BOOLEAN
         -- Is `x' and `y' a valid cursor position?
      do
         Result := valid_cursor_x(x) and then valid_cursor_y(y)
      ensure
         definition: Result = valid_cursor_x(x) and valid_cursor_y(y)
      end

feature {ANY} -- Size and position:
   width: INTEGER
         -- The number of columns.
      do
         Result := wgetwidth(widget)
      ensure
         Result > 0
      end

   height: INTEGER
         -- The number of lines.
      do
         Result := wgetheight(widget)
      ensure
         Result > 0
      end

   left: INTEGER
         -- ???
         --
         -- See also `top', `move_to'.
      do
         Result := wgetleft(widget)
      end

   top: INTEGER
         -- ???
         --
         -- See also `left', `move_to'.
      do
         Result := wgettop(widget)
      end

   move_to_and_resize (x, y, w, h: INTEGER)
      require
         ncurses.is_enabled
      do
         if x /= left or else y /= top then
            move_to(0, 0)
            if width /= 1 or else height /= 1 then
               ncurses.check_for_error(wresize(widget, 1, 1) = ncurses.ok)
            end
            move_to(x, y)
         end
         if w /= width or else h /= height then
            resize(w, h)
         end
      ensure
         left = x
         top = y
         width = w
         height = h
      end

   resize (w, h: INTEGER)
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wresize(widget, h, w) = ncurses.ok)
         propagate_resize
         clear
         redraw_now
      ensure
         width = w
         height = h
      end

   move_to (x, y: INTEGER)
         -- Moves the window relatively to its parent
         --
         -- See also `left', `top'.
      require
         ncurses.is_enabled
      do
         if parent = Void then
            ncurses.check_for_error(mvwin(widget, y, x) = ncurses.ok)
         else
            ncurses.check_for_error(mvwin(widget, parent.screen_top + y, parent.screen_left + x) = ncurses.ok)
         end
      ensure
         left = x
         top = y
         screen_left = old (screen_left - left) + x
         screen_top = old (screen_top - top) + y
      end

feature {ANY}
   create_sub_window (x, y, columns, lines: INTEGER): NCURSES_WINDOW
         -- Creates a child window
      require
         ncurses.is_enabled
      do
         create Result.make_sub_window(Current, x, y, columns, lines)
      end

   set_attribute (an_attribute: INTEGER)
         --|*** ??? C'EST QUOI UN ATTRIBUTE ???
         -- This attribute will be set for further writes.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wattron(widget, an_attribute) = ncurses.ok)
      end

   unset_attribute (an_attribute: INTEGER)
         -- This attribute will be unset for further writes.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wattroff(widget, an_attribute) = ncurses.ok)
      end

   set_background_character (character: INTEGER)
      require
         ncurses.is_enabled
      do
         get_background_character := character
         ncurses.check_for_error(wbkgd(widget, get_background_character | get_background_attribute) = ncurses.ok)
      end

   set_background_attribute (an_attribute: INTEGER)
         -- This attribute affects the current background.
      require
         ncurses.is_enabled
      do
         get_background_attribute := an_attribute
         ncurses.check_for_error(wbkgd(widget, get_background_character | get_background_attribute) = ncurses.ok)
      end

   get_background_character: INTEGER
   get_background_attribute: INTEGER

   draw_any_border (left_border, right_border, top_border, bottom_border, upper_left_border, upper_right_border, lower_left_border, lower_right_border: INTEGER)
         -- Draws any kind of border.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wborder(widget, left_border, right_border, top_border, bottom_border, upper_left_border, upper_right_border, lower_left_border, lower_right_border) = ncurses.ok)
      end

   draw_border
         -- Draws common single-line border.
      do
         draw_any_border(vertical_line, vertical_line, horizontal_line, horizontal_line, upper_left_corner, upper_right_corner, lower_left_corner, lower_right_corner)
      end

   draw_horizontal_line (x, y, character, size: INTEGER)
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(mvwhline(widget, y, x, character, size) = ncurses.ok)
      end

   draw_vertical_line (x, y, character, size: INTEGER)
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(mvwvline(widget, y, x, character, size) = ncurses.ok)
      end

   clear
         -- Clear the whole window and reset the cursor at 0 0 (upper-left corner).
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wclear(widget) = ncurses.ok)
      end

   clear_to_bottom
         -- Clears from cursor to the bottom of the window.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wclrtobot(widget) = ncurses.ok)
      end

   clear_to_end_of_line
         -- Clears from cursor to the end of the line.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wclrtoeol(widget) = ncurses.ok)
      end

   delete_character
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wdelch(widget) = ncurses.ok)
      end

   delete_character_at (x, y: INTEGER)
         -- All characters to the right of the position are moved one position to the left.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(mvwdelch(widget, y, x) = ncurses.ok)
      end

   delete_lines_below (lines: INTEGER)
         -- Inserts lines below the cursor's line.
         -- The `lines' bottom lines are clears.
      require
         ncurses.is_enabled
         lines >= 0
      do
         ncurses.check_for_error(winsdelln(widget, -lines) = ncurses.ok)
      end

   insert_lines_above (lines: INTEGER)
         -- Inserts lines above the cursor's line.
         -- The `lines' bottom lines are lost.
      require
         ncurses.is_enabled
         lines >= 0
      do
         ncurses.check_for_error(winsdelln(widget, lines) = ncurses.ok)
      end

   wait_keypress_and_echo_at (x, y: INTEGER): INTEGER
      require
         ncurses.is_enabled
      do
         wtimeout(widget, -1)
         Result := mvwgetch(widget, y, x)
      end

   wait_keypress: INTEGER
      do
         Result := wait_keypress_and_echo_at(cursor_x, cursor_y)
      end

   last_keypress: INTEGER

   poll_keypress_for_and_echo_at (delay, x, y: INTEGER): BOOLEAN
      require
         ncurses.is_enabled
         delay >= 0
      local
         ch: INTEGER
      do
         wtimeout(widget, delay)
         ch := mvwgetch(widget, y, x)
         if ch = ncurses.err then
            last_keypress := 0
         else
            last_keypress := ch
            Result := True
         end
         debug
            std_error.put_line(once "poll_keypress_for_and_echo_at(#(1), #(2), #(3)) >> #(4) (#(5))" # &delay # &x # &y # &last_keypress # &Result)
         end
      end

   poll_keypress_for (delay: INTEGER): BOOLEAN
      do
         Result := poll_keypress_for_and_echo_at(delay, cursor_x, cursor_y)
      end

   poll_keypress: BOOLEAN
      do
         Result := poll_keypress_for(0)
      end

   poll_keypress_and_echo_at (x, y: INTEGER): BOOLEAN
      do
         Result := poll_keypress_for_and_echo_at(0, x, y)
      end

   read_string_and_echo_at (size, x, y: INTEGER): STRING
         -- Reads size-specific string from keyboard.
      require
         ncurses.is_enabled
      local
         p: POINTER
      do
         p := mvwreadstring(widget, size, x, y)
         if p.is_not_null then
            create Result.from_external(p)
         end
      end

   read_string (size: INTEGER): STRING
         -- Reads size-specific string from keyboard.
      do
         Result := read_string_and_echo_at(size, cursor_x, cursor_y)
      end

   auto_refresh (enable: BOOLEAN)
         -- Automatically refreshes the window at every write.
         -- This *really* slows things down.
         --
         -- See also `refresh_later', `refresh_now'.
      require
         ncurses.is_enabled
      do
         immedok(widget, enable.to_integer)
      end

   refresh_later
         -- Defers the refreshing until NCURSES.`refresh_pending' or `refresh_now' is called.
         --
         -- See also `auto_refresh', `refresh_now'.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wnoutrefresh(widget) = ncurses.ok)
      end

   get_character_at (x, y: INTEGER): INTEGER
         -- Reads window content.
      require
         ncurses.is_enabled
      do
         Result := mvwinch(widget, y, x) & ncurses.a_chartext
      end

   get_character: INTEGER
      do
         Result := get_character_at(cursor_x, cursor_y)
      end

   get_attributes_at (x, y: INTEGER): INTEGER
         -- Reads window content.
      require
         ncurses.is_enabled
      do
         Result := mvwinch(widget, y, x) & ncurses.a_attributes
      end

   get_attributes: INTEGER
      do
         Result := get_attributes_at(cursor_x, cursor_y)
      end

   get_color_at (x, y: INTEGER): INTEGER
         -- Reads window content.
      require
         ncurses.is_enabled
      do
         Result := mvwinch(widget, y, x) & ncurses.a_color
      end

   get_color: INTEGER
      do
         Result := get_color_at(cursor_x, cursor_y)
      end

   change_character_at (ch, x, y: INTEGER)
         -- Change `ch' at cursor position `x', `y'.
         -- The cursor is left, just after the `ch'.
         --
         -- See also `put_character', `cursor_x', `cursor_y'.
      require
         ncurses.is_enabled
         valid_cursor(x, y)
      do
         if x = width - 1 and then y = height - 1 then
            -- The last character cannot be set with `addch' because the cursor cannot be updated.
            insert_character_at(ch, x, y)
         else
            ncurses.check_for_error(mvwaddch(widget, y, x, ch) = ncurses.ok)
         end
      end

   change_character (ch: INTEGER)
         -- Put `ch' at `cursor_x', `cursor_y'.
         -- The cursor is left, just after the `ch'.
         --
         -- See also `change_character_at'.
      require
         ncurses.is_enabled
      do
         change_character_at(ch, cursor_x, cursor_y)
      end

   insert_character_at (ch, x, y: INTEGER)
         -- All characters to the right are moved one position to the right.
         -- The rightmost character is lost.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(mvwinsch(widget, y, x, ch) = ncurses.ok)
      end

   insert_character (ch: INTEGER)
      do
         insert_character_at(ch, cursor_x, cursor_y)
      end

   insert_string_at (string: STRING; x, y: INTEGER)
         -- All characters to the right are shifted right.
         -- Rightmost characters are lost.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(mvwinsstr(widget, y, x, string.to_external) = ncurses.ok)
      end

   insert_string (string: STRING)
      do
         insert_string_at(string, cursor_x, cursor_y)
      end

   get_string_at (size, x, y: INTEGER): STRING
         -- Reads string content.
      require
         ncurses.is_enabled
      local
         p: POINTER
      do
         p := mvwgetstring(widget, size, x, y)
         if p.is_not_null then
            create Result.from_external(p)
         end
      end

   get_string (size: INTEGER): STRING
      do
         Result := get_string_at(size, cursor_x, cursor_x)
      end

   set_autoscroll_policy (enable: BOOLEAN)
         -- Enables/disables automatic scrolling.
      require
         ncurses.is_enabled
      do
         get_autoscroll_policy := enable
         ncurses.check_for_error(idlok(widget, get_autoscroll_policy.to_integer) = ncurses.ok)
         ncurses.check_for_error(scrollok(widget, get_autoscroll_policy.to_integer) = ncurses.ok)
      end

   get_autoscroll_policy: BOOLEAN

   scroll_up (lines: INTEGER)
      require
         ncurses.is_enabled
         lines >= 0
      do
         ncurses.check_for_error(wscrl(widget, lines) = ncurses.ok)
      end

   scroll_down (lines: INTEGER)
      require
         ncurses.is_enabled
         lines >= 0
      do
         ncurses.check_for_error(wscrl(widget, -lines) = ncurses.ok)
      end

   set_scrolling_region (s, e: INTEGER)
         -- Select the scrolling region.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(wsetscrreg(widget, s, e) = ncurses.ok)
      end

   set_synchronize_policy (enable: BOOLEAN)
         -- Enables/disables automatic synchronizing.
         -- See `synchronize_parents_window'.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(syncok(widget, enable.to_integer) = ncurses.ok)
      end

   synchronize_parents_window
         -- Touches all locations in ancestors that are changed in the current window
      require
         ncurses.is_enabled
      do
         wsyncup(widget)
      end

   synchronize_parents_cursor
         -- Updates the cursor position of all ancestors to the current cursor position.
      require
         ncurses.is_enabled
      do
         wcursyncup(widget)
      end

feature {NCURSES_WIDGET}
   get_window: NCURSES_WINDOW
      do
         Result := Current
      end

   parent_resized
      do
      end

   delete
      do
         Precursor
         if not disposed then
            ncurses.check_for_error(delwin(widget) = ncurses.ok)
            disposed := True
         end
      end

feature {ANY}
   set_default_colors
      do
         set_both_colors(white_color, black_color)
      end

   set_both_colors (fg: like get_fg_color; bg: like get_bg_color)
      do
         get_fg_color := fg
         get_bg_color := bg
         set_attribute(ncurses.get_color_pair(get_fg_color, get_bg_color))
      end

   set_fg_color (fg: like get_fg_color)
      do
         get_fg_color := fg
         set_attribute(ncurses.get_color_pair(get_fg_color, get_bg_color))
      end

   set_bg_color (bg: like get_bg_color)
      do
         get_bg_color := bg
         set_attribute(ncurses.get_color_pair(get_fg_color, get_bg_color))
      end

   get_fg_color: INTEGER
   get_bg_color: INTEGER

feature {NCURSES_WINDOW}
   set_widget (w: like widget)
      require
         w.is_not_null
      do
         widget := w
      ensure
         widget = w
      end

feature {NCURSES_WINDOW, NCURSES_PAD}
   widget: POINTER

feature {}
   disposed: BOOLEAN

   make (x, y, columns, lines: INTEGER)
      require
         ncurses.is_enabled
      do
         set_widget(newwin(lines, columns, y, x))
         set_parent(ncurses.get_root_window)
         init
      end

   make_sub_window (w: NCURSES_WINDOW; x, y, columns, lines: INTEGER)
      require
         ncurses.is_enabled
      do
         set_widget(derwin(w.widget, lines, columns, y, x))
         touchwin(w.widget)
         set_parent(w)
         init
      end

   make_root_window (w: like widget)
         -- This constructor is meant to be called once by NCURSE.`start_ncurses'.
      require
         ncurses.is_enabled
      do
         set_widget(w)
         init
      end

   init
      do
         set_keypad
         set_cursor(0, 0)
         set_default_colors
         ncurses.check_for_error(leaveok(widget, cursor_can_move) = ncurses.ok)
      end

   set_keypad
         -- Activates special "function" keys detection.
      require
         ncurses.is_enabled
      do
         ncurses.check_for_error(keypad(widget, 1) = ncurses.ok)
      end

   cursor_can_move: BOOLEAN False -- will be True for text entry widgets

feature {} -- Below are plug_in connections to the curses library.
   newwin (lines, columns, y, x: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "newwin"
         }"
      end

   delwin (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "delwin"
         }"
      end

   mvwin (win: POINTER; y, x: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwin"
         }"
      end

   mvderwin (win: POINTER; y, x: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvderwin"
         }"
      end

   derwin (win: POINTER; lines, columns, y, x: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "derwin"
         }"
      end

   touchwin (win: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "touchwin_"
         }"
      end

   mvwaddch (win: POINTER; y, x, ch: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwaddch"
         }"
      end

   mvwaddstr (win: POINTER; y, x: INTEGER; str: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwaddstr"
         }"
      end

   wattron (win: POINTER; attrs: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wattron"
         }"
      end

   wattroff (win: POINTER; attrs: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wattroff"
         }"
      end

   wbkgd (win: POINTER; ch: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wbkgd"
         }"
      end

   wgetwidth (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wgetwidth"
         }"
      end

   wgetheight (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wgetheight"
         }"
      end

   wclear (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wclear"
         }"
      end

   wclrtobot (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wclrtobot"
         }"
      end

   wclrtoeol (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wclrtoeol"
         }"
      end

   wdelch (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wdelch"
         }"
      end

   mvwdelch (win: POINTER; y, x: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwdelch"
         }"
      end

   winsdelln (win: POINTER; n: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "winsdelln"
         }"
      end

   wgetleft (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wgetleft"
         }"
      end

   wgettop (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wgettop"
         }"
      end

   wtimeout (win: POINTER; delay: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wtimeout"
         }"
      end

   mvwgetch (win: POINTER; y, x: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwgetch"
         }"
      end

   keypad (win: POINTER; bf: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "keypad"
         }"
      end

   mvwreadstring (win: POINTER; size, x, y: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwreadstring"
         }"
      end

   wgetcursorx (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wgetcursorx"
         }"
      end

   wgetcursory (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wgetcursory"
         }"
      end

   immedok (win: POINTER; bf: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "immedok"
         }"
      end

   wnoutrefresh (win: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wnoutrefresh"
         }"
      end

   mvwinch (win: POINTER; y, x: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwinch"
         }"
      end

   mvwinsch (win: POINTER; y, x, ch: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwinsch"
         }"
      end

   mvwinsstr (win: POINTER; y, x: INTEGER; str: POINTER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwinsstr"
         }"
      end

   mvwgetstring (win: POINTER; size, x, y: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwgetstring"
         }"
      end

   wmove (win: POINTER; y, x: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wmove"
         }"
      end

   idlok (win: POINTER; bf: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "idlok"
         }"
      end

   scrollok (win: POINTER; bf: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "scrollok"
         }"
      end

   leaveok (win: POINTER; bf: BOOLEAN): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "scrollok"
         }"
      end

   wscrl (win: POINTER; n: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wscrl"
         }"
      end

   wsetscrreg (win: POINTER; t, b: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wsetscrreg"
         }"
      end

   wsyncup (win: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wsyncup"
         }"
      end

   wcursyncup (win: POINTER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wcursyncup"
         }"
      end

   syncok (win: POINTER; bf: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "syncok"
         }"
      end

   wresize (win: POINTER; lines, columns: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wresize"
         }"
      end

   wborder (win: POINTER; ls, rs, ts, bs, tl, tr, bl, br: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "wborder"
         }"
      end

   mvwhline (win: POINTER; y, x, ch, n: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwhline"
         }"
      end

   mvwvline (win: POINTER; y, x, ch, n: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "ncurses"
         feature_name: "mvwvline"
         }"
      end

invariant
   widget.is_not_null

end -- class NCURSES_WINDOW
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
