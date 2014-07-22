class PANEL
   --
   -- Playing with the PANEL widget.
   --

insert
   NCURSES_TOOLS
   NCURSES_KEYS

create {}
   main

feature {ANY}
   ncurses_panel: NCURSES_PANEL

   tabs: FAST_ARRAY[NCURSES_PANELTAB]

   active_tab: INTEGER

   main
      local
         root_window, sub_window: NCURSES_WINDOW; labels: FAST_ARRAY[NCURSES_LABEL]
      do
         ncurses.enable
         ncurses.set_cursor_visibility(invisible_cursor_mode)

         root_window := ncurses.get_root_window
         root_window.put_string("Press <left> and <right> to change the active tab.%NQ or q to Quit")

         sub_window := root_window.create_sub_window(4, 2, 40, 6)
         sub_window.draw_border
         -- We create a NCURSES_PANEL that fits inside the `sub_window' (beware of the border):
         create ncurses_panel.make(sub_window, 1, 1, sub_window.width - 2, sub_window.height - 2)
         --create ncurses_panel.no_tabs(sub_window, 1, 1, sub_window.width - 2, sub_window.height - 2)
         -- We create three tabs in this ncurses_panel:

         create tabs.with_capacity(3)
         tabs.add_last(ncurses_panel.add_tab("Tic"))
         tabs.add_last(ncurses_panel.add_tab("Tac"))
         tabs.add_last(ncurses_panel.add_tab("Toe"))
         if tabs.exists(agent (t: NCURSES_PANELTAB): BOOLEAN then t = Void end (?)) then
            ncurses.disable
            std_error.put_line("Could not create tabs!!")
            die_with_code(0)
         end
         -- In each tab, we create a label:
         create labels.with_capacity(3)
         labels.add_last(create {NCURSES_LABEL}.make(tabs.item(0), "Tic Panel 0 (first)", 2, 3, 25, 1))
         labels.add_last(create {NCURSES_LABEL}.make(tabs.item(1), "Tac Panel 1 (middle)", 2, 3, 25, 1))
         labels.add_last(create {NCURSES_LABEL}.make(tabs.item(2), "Toe Panel 2 (last)", 2, 3, 25, 1))

         activate_tab(tabs.lower)

         ncurses.when_key_pressed(agent key_press(?))
         ncurses.start
      end

   key_press (key: INTEGER)
      do
         if key = key_left and then active_tab > tabs.lower then
            activate_tab(active_tab - 1)
         elseif key = key_right and then active_tab < tabs.upper then
            activate_tab(active_tab + 1)
         elseif key.to_character.to_upper = 'Q' then
            ncurses.disable
         end
      end

   activate_tab (tab: like active_tab)
      do
         if active_tab /= tab then
            active_tab := tab
            tabs.item(active_tab).raise
            ncurses.get_root_window.redraw_now
         end
      end

end -- class PANEL
