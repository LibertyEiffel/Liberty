class AUX_JSON_DATA

inherit
   JSON_TYPED_DATA[JSON_VALUE]

create {AUX_JSON_CODEC}
   make

feature {ANY}
   item: JSON_VALUE

feature {}
   make (a_item: like item)
      require
         a_item /= Void
      do
         item := a_item
      ensure
         item = a_item
      end

invariant
   item /= Void

end -- class AUX_JSON_DATA
