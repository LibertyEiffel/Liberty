class LIST

insert
   NCURSES_TOOLS
   NCURSES_KEYS
   NCURSES_COLORS
   NCURSES_CHARACTERS

create {}
   make

feature {ANY}
   ncurses_list: NCURSES_LIST[ANY]

   make
      local
         root_window, sub_window: NCURSES_WINDOW
      do
         ncurses.enable
         ncurses.set_cursor_visibility(ncurses.invisible_cursor_mode)
         ncurses.set_echoing_policy(False)

         root_window := ncurses.get_root_window
         root_window.put_string("Press <down> and <up> to move in the list.")
         root_window.put_string_at("Press <space> to (de)select the item", 0, 1)
         root_window.put_string_at("Press 't' or 'T' to enable/disable multiple selection", 0, 2)
         root_window.put_string_at("Press 'q' or 'Q' to quit", 0, 3)

         sub_window := root_window.create_sub_window(4, 4, 22, 12)
         sub_window.draw_border

         create ncurses_list.make(sub_window, 1, 1, 20, 5)
         ncurses_list.add_last("item 1", Void)
         ncurses_list.add_last("item 2", Void)
         ncurses_list.add_last("item 3", Void)
         ncurses_list.add_last("item 4", Void)
         ncurses_list.add_last("item 5", Void)

         ncurses.when_key_pressed(agent key_press(?))
         ncurses.start
      end

   key_press (key_code: INTEGER)
      do
         if key_code = key_down then
            ncurses_list.set_focus_on((ncurses_list.focused + 1).min(ncurses_list.upper))
         elseif key_code = key_up then
            ncurses_list.set_focus_on((ncurses_list.focused - 1).max(ncurses_list.lower))
         elseif key_code.to_character.to_upper = 'T' then
            ncurses_list.allow_multiple_selection(not ncurses_list.is_multiple_selection_allowed)
         elseif key_code = space then
            if ncurses_list.is_selected(ncurses_list.focused) then
               ncurses_list.deselect_item(ncurses_list.focused)
            else
               ncurses_list.select_item(ncurses_list.focused)
            end
         elseif key_code.to_character.to_upper = 'Q' then
            ncurses.disable
         end
         if ncurses.is_enabled then
            ncurses.get_root_window.redraw_now
         end
      end

end -- class LIST
