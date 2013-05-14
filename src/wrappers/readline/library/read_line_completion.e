class READ_LINE_COMPLETION
--
-- For line completion.
--

inherit
   READLINE_CECIL
      undefine
         is_equal, copy
      end

insert
   SINGLETON
   READLINE_EXTERNALS
   READLINE_EXTERNALS_EXTRA
   STRING_HANDLER
      undefine
         is_equal, copy
      end

create {READ_LINE}
   make

feature {ANY}
   set_completion_agent (a_completion_agent: like completion_agent) is
      require
         not is_busy
      do
         completion_agent := a_completion_agent
      ensure
         completion_agent = a_completion_agent
      end

   is_busy: BOOLEAN is
      do
         Result := rl_text /= Void
      ensure
         completions /= Void implies Result
      end

feature {} -- The CECIL completion functions
   completion_start (text: POINTER; start_index, end_index: INTEGER) is
      local
         completions_list: ITERABLE[ABSTRACT_STRING]
      do
         create rl_text.from_external(text)

         if completion_agent /= Void then
            completions_list := completion_agent.item([rl_text, start_index, end_index])
            if completions_list /= Void then
               completions := completions_list.new_iterator
            end
         end
      end

   completion_more (text: POINTER; state: INTEGER): POINTER is
      do
         if completions /= Void then
            if state = 0 then
               completions.start
            end
            if not completions.is_off then
               Result := completions.item.to_external
               completions.next
            end
         end
      end

   completion_done (text: POINTER) is
      do
         completions := Void
         rl_text := Void
      end

   same_text (text: POINTER): BOOLEAN is
      do
         Result := text = rl_text.storage.to_pointer
      ensure
         definition: Result = (text = rl_text.storage.to_pointer)
      end

feature {}
   make is
      do
         set_rl_attempted_completion_object(Current)
      end

   completion_agent: FUNCTION[TUPLE[FIXED_STRING, INTEGER, INTEGER], ITERABLE[ABSTRACT_STRING]]

   rl_text: FIXED_STRING

   completions: ITERATOR[ABSTRACT_STRING]

end
