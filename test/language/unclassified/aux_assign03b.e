class AUX_ASSIGN03B

inherit
   AUX_ASSIGN03A

feature {ANY}
   item: INTEGER

   set_item (i: like item) is
      do
         item := i
      end

end
