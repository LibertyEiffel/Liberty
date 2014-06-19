class AUX_ASSIGN03B

inherit
   AUX_ASSIGN03A

feature {ANY}
   item: INTEGER

   set_item (i: like item)
      do
         item := i
      end

end
