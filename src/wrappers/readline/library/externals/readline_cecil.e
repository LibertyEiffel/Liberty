deferred class READLINE_CECIL

insert
   ANY
      undefine
         is_equal, copy
      end

feature {ANY}
   is_busy: BOOLEAN is
      deferred
      end

feature {} -- The CECIL completion functions
   completion_start (text: POINTER; start_index, end_index: INTEGER) is
      require
         not is_busy
         not text.is_default
      deferred
      ensure
         is_busy
         same_text(text)
      end

   completion_more (text: POINTER; state: INTEGER): POINTER is
      require
         is_busy
         same_text(text)
      deferred
      ensure
         is_busy
      end

   completion_done (text: POINTER) is
      require
         is_busy
         same_text(text)
      deferred
      ensure
         not is_busy
      end

   same_text (text: POINTER): BOOLEAN is
      require
         is_busy
      deferred
      end

end
