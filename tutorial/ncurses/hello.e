class HELLO
   --
   -- Basic example to start with NCURSES.
   --

insert
   NCURSES_TOOLS

create {}
   main

feature {}
   main
      local
         root_window: NCURSES_WINDOW
      do
         std_output.put_string("Leaving the normal terminal mode...%N")
         ncurses.enable
         ncurses.set_cursor_visibility(default_visible_cursor_mode)

         root_window := ncurses.get_root_window
         root_window.put_string("Hello world!")
         root_window.put_string_at("Q or q to quit.", 0, 2)
         ncurses.when_key_pressed(agent key_press(?))
         ncurses.start
         -- At the end, the terminal is reset in its normal state:
         std_output.put_string("...normal terminal mode restored.%N")
      end

   key_press (key_code: INTEGER)
      local
         root_window: NCURSES_WINDOW
      do
         root_window := ncurses.get_root_window
         root_window.put_string_at("Press any key: ", 0, 1)
         root_window.put_string(once " (key code = " + key_code.to_string + once ")")
         if key_code.to_character.to_upper = 'Q' then
            ask_quit := True
            root_window.put_string_at("Really quit (y/n)?", 0, 3)
         elseif ask_quit = True and then key_code.to_character.to_upper = 'Y' then
            ncurses.disable
         else
            ask_quit := False
         end
      end

   ask_quit: BOOLEAN

end -- class HELLO
