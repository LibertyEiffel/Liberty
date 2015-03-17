deferred class READLINE_CECIL

feature {} -- The CECIL completion functions
   completion_start (text: POINTER; start, end_: INTEGER)
      deferred
      end

   completion_more (text: POINTER; state: INTEGER): POINTER
      deferred
      end

   completion_done (text: POINTER)
      deferred
      end

end
