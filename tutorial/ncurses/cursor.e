class CURSOR
   --
   -- Playing with the CURSOR position in the NCURSES window.
   --

insert
   NCURSES_TOOLS
   NCURSES_KEYS
   CHARACTER_CONSTANTS

create {}
   main

feature {}
   main
      do
         ncurses.enable
         root_window := ncurses.get_root_window
         -- No more echo while keyboard keys are typed:

         ncurses.set_echoing_policy(False)

         root_window.put_string("You can move the cursor using arrows of your keyboard...%N")
         root_window.put_string("or Ctrl-F Ctrl-B Ctrl-N Ctrl-P%N")
         root_window.put_string("Q for quit.")

         ncurses.when_key_pressed(agent key_press(?))
         ncurses.start
      end

   key_press (key_code: INTEGER)
      local
         cursor_x, cursor_y: INTEGER
      do
         cursor_x := root_window.cursor_x
         cursor_y := root_window.cursor_y
         integer_info_at_line(4, once "cursor X = ", cursor_x)
         integer_info_at_line(5, once "cursor Y = ", cursor_y)

         root_window.set_cursor(cursor_x, cursor_y)

         integer_info_at_line(6, once "key code = ", key_code)

         if key_code = key_resize then
            cursor_x := cursor_x.min(root_window.width - 1)
            cursor_y := cursor_y.min(root_window.height - 1)
         end
         -- Back to the cursor position:
         root_window.set_cursor(cursor_x, cursor_y)

         inspect
            translate_to_unique_character_code(key_code)
         when Ctrl_b then
            -- Backward:
            if root_window.valid_cursor_x(cursor_x - 1) then
               cursor_x := cursor_x - 1
            end

            root_window.set_cursor(cursor_x, cursor_y)
         when Ctrl_f then
            -- Forward:
            if root_window.valid_cursor_x(cursor_x + 1) then
               cursor_x := cursor_x + 1
            end

            root_window.set_cursor(cursor_x, cursor_y)
         when Ctrl_n then
            -- Next line:
            if root_window.valid_cursor_y(cursor_y + 1) then
               cursor_y := cursor_y + 1
            end

            root_window.set_cursor(cursor_x, cursor_y)
         when Ctrl_p then
            -- Previous line:
            if root_window.valid_cursor_y(cursor_y - 1) then
               cursor_y := cursor_y - 1
            end

            root_window.set_cursor(cursor_x, cursor_y)
         when Ctrl_a then
            -- Beginning of line:
            cursor_x := 0
            root_window.set_cursor(cursor_x, cursor_y)
         when Ctrl_e then
            -- End of line:
            cursor_x := root_window.width - 1
            root_window.set_cursor(cursor_x, cursor_y)
         else -- No move.
         end
         if key_code.to_character.to_upper = 'Q' then
            ncurses.disable
         end
      end

   root_window: NCURSES_WINDOW

   integer_info_at_line (line_number: INTEGER; label: STRING; value: INTEGER)
      do
         root_window.put_string_at(label, 0, line_number)
         root_window.clear_to_end_of_line
         root_window.put_integer(value)
      end

   translate_to_unique_character_code (key_code: INTEGER): CHARACTER
      do
         if key_code = key_left then
            Result := Ctrl_b
         elseif key_code = key_right then
            Result := Ctrl_f
         elseif key_code = key_up then
            Result := Ctrl_p
         elseif key_code = key_down then
            Result := Ctrl_n
         else
            Result := key_code.to_character
         end
      end

end -- class CURSOR
