expanded class GTK_AGENT_LAUNCHER

create {} -- for Cecil
   make

feature {}
   make
      do
      end

   launch_routine (routine: ROUTINE[TUPLE])
      do
         routine.call([])
      end

   callback_agent: POINTER
      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "G_CALLBACK(callback_agent)"
         }"
      end

end -- class GTK_AGENT_LAUNCHER
