deferred class READLINE_CECIL

feature {} -- The CECIL completion functions
   completion_start (text: POINTER; start, end_: INTEGER) is
      deferred
      end

   completion_more (text: POINTER; state: INTEGER): POINTER is
      deferred
      end

   completion_done (text: POINTER) is
      deferred
      end

end
