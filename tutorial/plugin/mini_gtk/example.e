class EXAMPLE

insert
   GTK

create {ANY}
   make

feature {}
   make
      local
         w: GTK_WINDOW
      do
         create w.make
         w.signal_connect("destroy", agent gtk_main_quit)
         w.show
         gtk_main
      end

end -- class EXAMPLE
