class READ_LINE_JOB

inherit
   JOB
      undefine is_equal
      end

insert
   READLINE_EXTERNALS
   READLINE_EXTERNALS_EXTRA
   SINGLETON

create {READ_LINE_JOB_HOLDER}
   make

feature {ANY}
   redisplay is
      do
         rl_redisplay
      end

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         events.expect(std_input.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := events.event_occurred(std_input.event_can_read)
      end

   continue is
      do
         rl_callback_read_char
      end

   done: BOOLEAN

   restart is
      do
         done := False
         install
      end

feature {ANY}
   connect_to (a_prompt: ABSTRACT_STRING; a_handler: like handler) is
      require
         a_handler /= Void
      do
         if a_prompt /= Void then
            prompt := a_prompt.intern
         end
         if handler /= Void then
            restore
         end
         handler := a_handler
         install
      end

   stop is
      do
         if not done then
            done := True
            restore
         end
      ensure
         done
      end

feature {}
   make is
      do
         rl_register_job(Current)
      end

   install is
      local
         p: POINTER
      do
         if prompt /= Void then
            p := prompt.intern.to_external
         end
         rl_callback_handler_install(p, rl_handler)
      end

   restore is
      do
         rl_callback_handler_remove
      end

   prompt: FIXED_STRING
   handler: PROCEDURE[TUPLE[STRING]]

   call_handler (line: POINTER) is
         -- called by CECIL
      local
         s: STRING
      do
         if handler /= Void then
            if line.is_not_null then
               s := once ""
               s.from_external(line)
            end
            handler.call([s])
         end
      end

end -- class READ_LINE_JOB
