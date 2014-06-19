class PROGRESSBAR

insert
   NCURSES_TOOLS
   NCURSES_KEYS
   NCURSES_COLORS

create {}
   main

feature {}
   progress_bar: NCURSES_PROGRESSBAR

   root_window, sub_window: NCURSES_WINDOW

   main
      do
         ncurses.enable
         ncurses.set_cursor_visibility(ncurses.invisible_cursor_mode)
         ncurses.set_echoing_policy(False)

         root_window := ncurses.get_root_window
         sub_window := root_window.create_sub_window(4, 4, root_window.width - 8, 3)

         create progress_bar.make(sub_window, 1, 1, root_window.width - 10, 0, 100)
         progress_bar.set_colors(yellow_color, blue_color)
         progress_bar.set_value(50)

         ncurses.when_resized(agent redraw)
         ncurses.when_key_pressed(agent key_press(?))
         redraw
         ncurses.start
      end

   redraw
      do
         root_window.put_string("Press <left> and <right> for slow changes.")
         root_window.put_string_at("Press <page down> and <page up> for fast changes.", 0, 1)
         root_window.put_string_at("Press 't' or 'T' to toggle value displaying", 0, 2)
         root_window.put_string_at("Press 'q' or 'Q' to quit", 0, 3)
         sub_window.draw_border
         root_window.redraw_now
      end

   key_press (key_code: INTEGER)
      do
         if key_code.to_character.to_upper = 'T' then
            progress_bar.display_value(not progress_bar.is_value_displayed)
         elseif key_code = key_left then
            progress_bar.set_value((progress_bar.current_value - 1).max(progress_bar.min_value))
         elseif key_code = key_right then
            progress_bar.set_value((progress_bar.current_value + 1).min(progress_bar.max_value))
         elseif key_code = key_previous_page then
            progress_bar.set_value((progress_bar.current_value - 10).max(progress_bar.min_value))
         elseif key_code = key_next_page then
            progress_bar.set_value((progress_bar.current_value + 10).min(progress_bar.max_value))
         end
         root_window.redraw_now
         if key_code.to_character.to_upper = 'Q' then
            ncurses.disable
         end
      end

end -- class PROGRESSBAR
