class SIMPLE_UI

insert
   ARGUMENTS
   LOGGING

create {}
   make, web, readline

feature {}
   make is
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

   curses is
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack.add_job(ui.curses(app, agent stack.add_job))
         stack.run
      end

   readline is
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack.add_job(ui.readline(app, agent stack.add_job))
         stack.run
      end

   web is
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack.add_job(ui.web(app, agent stack.add_job))
         stack.run
      end

   app: UI_APPLICATION is
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

   click (action: STRING; text: UI_TEXT_FIELD) is
      do
         log.info.put_line("Received action '#(1)' on text %"#(2)%"" # action # text.value)
      end

   ui: USER_INTERFACE

end
