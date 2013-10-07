class GTK_WINDOW

insert
   GTK_AGENT_LAUNCHER
      redefine make
      end

create {ANY}
   make

feature {}
   make is
      do
         window := new(toplevel)
      end

   window: POINTER

feature {ANY}
   signal_connect (signal: STRING; callback: ROUTINE[TUPLE]) is
      do
         g_signal_connect(window, signal.to_external, callback_agent, callback.to_pointer)
      end

   show is
      do
         gtk_widget_show(window)
      end

feature {}
   toplevel: INTEGER is
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "GTK_WINDOW_TOPLEVEL"
         }"
      end

   new (type: INTEGER): POINTER is
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtk_window_new"
         }"
      end

   g_signal_connect (object, signal, callback, data: POINTER) is
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "g_signal_connect"
         }"
      end

   gtk_widget_show (widget: POINTER) is
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtk_widget_show"
         }"
      end

end -- class GTK_WINDOW
