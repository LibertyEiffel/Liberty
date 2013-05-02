deferred class AUX_ASSIGN03A

feature {ANY}
   item: INTEGER is
      deferred
      end

   set_item (i: like item) assign item is
      deferred
      ensure
         item = i
      end

end
