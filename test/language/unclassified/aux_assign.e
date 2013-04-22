class AUX_ASSIGN

feature {ANY}
   item: INTEGER

   set_item (i: like item) assign item is
      do
         item := i
      ensure
         item = i
      end

end
