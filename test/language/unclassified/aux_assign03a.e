deferred class AUX_ASSIGN03A

feature {ANY}
   item: INTEGER
      deferred
      end

   set_item (i: like item) assign item
      deferred
      ensure
         item = i
      end

end
