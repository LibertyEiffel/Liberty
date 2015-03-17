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
   redisplay
      do
         rl_redisplay
      end

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      do
         events.expect(std_input.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         Result := events.event_occurred(std_input.event_can_read)
      end

   continue
      do
         rl_callback_read_char
      end

   done: BOOLEAN

   restart
      do
         done := False
         install
      end

feature {ANY}
   connect_to (a_prompt: ABSTRACT_STRING; a_handler: like handler)
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

   stop
      do
         if not done then
            done := True
            restore
         end
      ensure
         done
      end

feature {}
   make
      do
         rl_register_job(Current)
      end

   install
      local
         p: POINTER
      do
         if prompt /= Void then
            p := prompt.intern.to_external
         end
         rl_callback_handler_install(p, rl_handler)
      end

   restore
      do
         rl_callback_handler_remove
      end

   prompt: FIXED_STRING
   handler: PROCEDURE[TUPLE[STRING]]

   call_handler (line: POINTER)
         -- called by CECIL
      local
         s: STRING
      do
         if handler /= Void then
            if line.is_not_null then
               s := once ""
               s.from_external_copy(line)
            end
            handler.call([s])
         end
      end

end -- class READ_LINE_JOB
