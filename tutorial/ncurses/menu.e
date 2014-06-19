class MENU

insert
   NCURSES_TOOLS
   NCURSES_COLORS

create {ANY}
   make

feature {}
   root_window: NCURSES_WINDOW

   menubar: NCURSES_MENUBAR[STRING]

   make
      local
         items: HASHED_DICTIONARY[HASHED_DICTIONARY[STRING, STRING], STRING]; item: HASHED_DICTIONARY[STRING, STRING]
      do
         ncurses.enable
         root_window := ncurses.get_root_window
         ncurses.set_echoing_policy(False)
         ncurses.set_cursor_visibility(invisible_cursor_mode)

         create items.make
         create item.make
         item.add("1.1", "item 1")
         item.add("1.2", "item 2")
         item.add("1.3", "item 3")
         items.add(item, "menu 1")

         create item.make
         item.add("2.1", "item 1")
         item.add("2.2", "item 2")
         item.add("2.3", "item 3")
         items.add(item, "menu 2")

         create item.make
         item.add("3.1", "item 1")
         item.add("3.2", "item 2")
         item.add("3.3", "item 3")
         items.add(item, "menu 3")

         create menubar.make(root_window, 0, items, True)
         menubar.set_colors(black_color, white_color)

         root_window.put_string_at("Press m to access the menu", 1, menubar.height)
         root_window.put_string_at("In the menu bar, press <left> and <right> to select a menu", 1, menubar.height + 1)
         root_window.put_string_at("In a menu, press <up> and <down> to select an item", 1, menubar.height + 2)
         root_window.put_string_at("At any time, press <enter> to validate your choice or <esc> to go back", 1, menubar.height + 3)
         root_window.redraw_now

         ncurses.when_key_pressed(agent key_press(?))
         ncurses.start
      end

   key_press (key_code: INTEGER)
      local
         selected: STRING
      do
         if key_code.to_character = 'm' then
            menubar.read_choice
            selected := menubar.last_choice
            if selected = Void then
               root_window.put_string_at("No selection             ", 1, menubar.height + 5)
            else
               root_window.put_string_at("You selected the item ", 1, menubar.height + 5)
               root_window.put_string(selected)
            end

            root_window.redraw_now
         elseif key_code.to_character.to_upper = 'Q' then
            ncurses.disable
         end
      end

end -- class MENU
