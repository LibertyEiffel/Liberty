class SIMPLE_UI

create {}
   make

feature {}
   make is
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack.add_job(ui.web(app, agent stack.add_job))
         stack.run
      end

   app: UI_APPLICATION is
      local
         index: UI_WINDOW
      once
         create Result.make("app")
         create index.make("index")
         Result.add(index)
         index.panel.add(create {UI_BUTTON}.make("ok"))
         index.panel.add(create {UI_BUTTON}.make("cancel"))
         index.panel.add(create {UI_TEXT_FIELD}.make("name"))
         index.set_title(U"index")
      end

   ui: USER_INTERFACE

end
