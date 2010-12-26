deferred class ANY_COROUTINE_ITERATOR

feature {} -- called by the plugin using CECIL
   invoke is
      deferred
      end

feature {COROUTINE}
   fix_dumb_cecil is
         -- Because there is a bug somewhere in SmartEiffel, ensures that the CECIL code is correctly
         -- generated.
      do
      end

end -- class ANY_COROUTINE_ITERATOR
