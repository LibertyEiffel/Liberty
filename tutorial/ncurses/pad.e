class PAD

insert
   NCURSES_TOOLS
   NCURSES_KEYS
   NCURSES_COLORS

create {}
   make

feature {ANY}
   pad: NCURSES_PAD

   make
      local
         root_window: NCURSES_WINDOW
      do
         ncurses.enable
         ncurses.set_cursor_visibility(ncurses.invisible_cursor_mode)
         ncurses.set_echoing_policy(False)

         root_window := ncurses.get_root_window
         root_window.put_string_at("Press 'q' or 'Q' to quit", 0, 0)
         root_window.put_string_at("Use arrows to scroll the pad", 0, 1)
         root_window.put_string_at("The pad: ", 0, 4)

         create pad.make_pad(25, 7)
         pad.put_string_at("Man, this is a really", 0, 0)
         pad.put_string_at("interesting pad, also", 0, 1)
         pad.put_string_at("it's not really as", 0, 2)
         pad.put_string_at("big as it could be,", 0, 3)
         pad.put_string_at("which is more than", 0, 4)
         pad.put_string_at("what is actually drawable", 0, 5)
         pad.set_viewport(9, 4, 8, 3)
         update(0, 0)

         ncurses.when_key_pressed(agent key_press(?))
         ncurses.start
      end

   update (x, y: INTEGER)
      do
         pad.set_visible(x, y)
         pad.redraw_now
      end

   key_press (key_code: INTEGER)
      do
         if key_code = key_left and then pad.visible_left > 0 then
            update(pad.visible_left - 1, pad.visible_top)
         elseif key_code = key_right and then pad.visible_left < pad.width - pad.viewport_width - 1 then
            update(pad.visible_left + 1, pad.visible_top)
         elseif key_code = key_up and then pad.visible_top > 0 then
            update(pad.visible_left, pad.visible_top - 1)
         elseif key_code = key_down and then pad.visible_top < pad.height - pad.viewport_height - 1 then
            update(pad.visible_left, pad.visible_top + 1)
         elseif key_code.to_character.to_upper = 'Q' then
            ncurses.disable
         end
         if ncurses.is_enabled then
            ncurses.get_root_window.redraw_now
         end
      end

end -- class PAD
