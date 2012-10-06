class SIMPLE_UI

insert
   LOGGING

create {}
   web

feature {}
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
