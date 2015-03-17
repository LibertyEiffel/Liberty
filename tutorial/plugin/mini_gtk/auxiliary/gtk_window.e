class GTK_WINDOW

insert
   GTK_AGENT_LAUNCHER
      redefine make
      end

create {ANY}
   make

feature {}
   make
      do
         window := new(toplevel)
      end

   window: POINTER

feature {ANY}
   signal_connect (signal: STRING; callback: ROUTINE[TUPLE])
      do
         g_signal_connect(window, signal.to_external, callback_agent, callback.to_pointer)
      end

   show
      do
         gtk_widget_show(window)
      end

feature {}
   toplevel: INTEGER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "GTK_WINDOW_TOPLEVEL"
         }"
      end

   new (type: INTEGER): POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtk_window_new"
         }"
      end

   g_signal_connect (object, signal, callback, data: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "g_signal_connect"
         }"
      end

   gtk_widget_show (widget: POINTER)
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtk_widget_show"
         }"
      end

end -- class GTK_WINDOW
