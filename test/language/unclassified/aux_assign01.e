class AUX_ASSIGN01

feature {ANY}
   item: INTEGER

   set_item (i: like item) assign item
      do
         item := i
      ensure
         item = i
      end

end
