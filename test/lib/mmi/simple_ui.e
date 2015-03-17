class SIMPLE_UI

insert
   NCURSES_TOOLS
   ARGUMENTS
   LOGGING

create {}
   make, web, readline

feature {}
   make
      do
         if argument_count < 1 then
            std_error.put_line(once "Not enough arguments")
            die_with_code(1)
         elseif argument_count > 1 then
            std_error.put_line(once "Ignoring extra arguments")
         end
         inspect
            argument(1)
         when "web" then
            web
         when "readline" then
            readline
         when "curses" then
            curses
         else
            std_error.put_line(once "Unknown argument #(1)" # argument(1))
            die_with_code(1)
         end
      end

   curses
      do
         ncurses.when_idle(agent curses_idle)
         ui.run_curses(app)
      rescue
         ncurses.disable_and_exit
      end

   curses_idle
      do
         -- don't put the agent directly in the when_idle call
         -- because the log target (@L) would not be calculated at the right time
         log.info.put_line(once "idle")
      end

   readline
      do
         ui.run_readline(app)
      end

   web
      do
         ui.run_web(app)
      end

   app: UI_APPLICATION
      local
         index: UI_WINDOW; ok, cancel: UI_BUTTON; text: UI_TEXT_FIELD
      once
         create Result.make("hello")
         create index.make("index")

         create text.make("text")

         create ok.make("ok")
         ok.set_label(U"OK")
         ok.on_click(agent click("ok", text))

         create cancel.make("cancel")
         cancel.set_label(U"Cancel")
         cancel.on_click(agent click("cancel", text))

         index.panel.add(ok)
         index.panel.add(cancel)
         index.panel.add(text)
         index.set_title(U"Home")
         Result.add(index)
      end

   click (action: STRING; text: UI_TEXT_FIELD)
      do
         log.info.put_line("Received action '#(1)' on text %"#(2)%"" # action # text.value)
      end

   ui: USER_INTERFACE

end
