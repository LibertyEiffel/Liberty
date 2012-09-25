class SIMPLE_UI

create {}
   make

feature {}
   make is
      local
         stack: LOOP_STACK
      do
         create stack.make
         stack.add_job(ui.web(window, agent stack.add_job))
         stack.run
      end

   window: UI_WINDOW is
      once
         create Result.make("index")
         window.panel.add(create {UI_BUTTON}.make("ok"))
         window.panel.add(create {UI_BUTTON}.make("cancel"))
         window.panel.add(create {UI_TEXT_FIELD}.make("name"))
         window.set_title(U"hello")
      end

   ui: USER_INTERFACE

end
